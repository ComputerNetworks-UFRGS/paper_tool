<?php
// Import PHPMailer classes into the global namespace
// These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
require_once INCLUDE_PHPMAILER;
require_once INCLUDE_PHPMAILER_SMTP;
require_once INCLUDE_PHPMAILER_EXCEPTION;

function send_email($toAddr, $toName = '', $subject = '', $plainBody = '', $htmlBody = '') {
    $mail = new PHPMailer(false);
    $mail->isSMTP();
    $mail->Host = EMAIL_SMTP_HOST;
    $mail->SMTPAuth = EMAIL_SMTP_AUTH;
    $mail->Username = EMAIL_SMTP_USER;
    $mail->Password = EMAIL_SMTP_PASSWORD;
    $mail->SMTPSecure = EMAIL_SMTP_SECURITY;
    $mail->Port = EMAIL_SMTP_PORT;
    $mail->setFrom(EMAIL_SENDER_ADDRESS, EMAIL_SENDER_NAME);
    $mail->addAddress($toAddr, $toName);
    $mail->Subject = $subject;

    $mail->isHTML(true);
    $mail->Body = $htmlBody;
    $mail->AltBody = $plainBody;

    /*$mail->SMTPDebug = 9;
    $r = $mail->send();
    if (!$r) {
        die($mail->ErrorInfo);
    }
    die('OK');*/

    return $mail->send();
}

function generate_ticket($type, $email, $send, $project_id = null) {
    $conexao = ADONewConnection(DATABASE_DRIVER);
    $conexao->Connect(DATABASE_SERVER, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME);
    $sSQL = "SELECT code FROM tickets WHERE type = ? AND email = ? and used = 0 and expiration > NOW()";
    $params = array(
        $type,
        $email
    );
    $code = $conexao->getOne($sSQL, $params);
    $err = false;
    if ($code == '') {
        $code = bin2hex(random_bytes(8));
        $sSQL = "INSERT INTO tickets (code, type, email, expiration) VALUES (?, ?, ?, to_timestamp(?))";
        $params = array(
            $code,
            $type,
            $email,
            time() + NUM_DAYS_TICKET_EXPIRATION * 60 * 60 * 24
        );
        if (!$conexao->execute($sSQL, $params)) {
            $err = true;
        }
    } else {
        $sSQL = "UPDATE tickets SET expiration = to_timestamp(?) WHERE code = ?";
        $params = array(
            time() + NUM_DAYS_TICKET_EXPIRATION * 60 * 60 * 24,
            $code
        );
        if (!$conexao->execute($sSQL, $params)) {
            $err = true;
        }
    }
    if (!$err && ($type == TICKET_TYPE_INVITATION)) {
        $sSQL = "SELECT COUNT(*) FROM tickets_projects WHERE code = ? and project_id = ?";
        $params = array(
            $code,
            $project_id
        );
        $q = $conexao->getOne($sSQL, $params);
        if ($q == 0) {
            $sSQL = "INSERT INTO tickets_projects VALUES (?, ?)";
            $params = array(
                $code,
                $project_id
            );
            if (!$conexao->execute($sSQL, $params)) {
                $err = true;
            }
        }
        if (!$err && $send) {
            if (!send_invitation($code)) {
                $err = true;
            }
        }
    }
    if ($err) {
        $sSQL = "DELETE FROM tickets WHERE code = ?";
        $params = array($code);
        $conexao->execute($sSQL, $params);
        return '';
    }
    return $code;
}

function send_invitation($code) {
    $conexao = ADONewConnection(DATABASE_DRIVER);
    $conexao->Connect(DATABASE_SERVER, DATABASE_USER, DATABASE_PASSWORD, DATABASE_NAME);
    $sSQL = "SELECT code, email, expiration FROM tickets WHERE code = ? AND type = ? AND used = 0 AND expiration > NOW()";
    $params = array(
        $code,
        TICKET_TYPE_INVITATION
    );
    if ($arr = $conexao->getRow($sSQL, $params)) {
        $code = $arr[0];
        $email = $arr[1];
        $expiration = formatSQLDate($arr[2]);

        $project_names = array();
        $sSQL = "SELECT p.name FROM tickets_projects tp LEFT JOIN projects p ON tp.project_id = p.id WHERE tp.code = ?";
        $params = array($code);
        $arr = $conexao->getArray($sSQL, $params);
        if (!empty($arr)) foreach ($arr as $row) {
            $project_names[] = $row[0];
        }

        $subject = 'Invitation to join Paper Tool';

        $plainBody =
            "You have been invited to join one or more projects on Paper Tool.\n".
            "Paper Tool was designed to aid the researcher on conduction Systematic Literature Reviews.\n\n".
            "Upon signing up with Paper Tool, you will be joining these projects automatically:\n\n";
        $htmlBody =
            "You have been invited to join one or more projects on <strong>Paper Tool</strong>.<br>\n".
            "<strong>Paper Tool</strong> was designed to aid the researcher on conduction Systematic Literature Reviews.<br>\n<br>\n".
            "Upon signing up with <strong>Paper Tool</strong>, you will be joining these projects as a collaborator:<br>\n<ul>\n";
        if (!empty($project_names)) foreach ($project_names as $project_name) {
            $plainBody .= ' - '.$project_name."\n";
            $htmlBody .= '<li>'.$project_name."</li>\n";
        }
        $url = SYS_URL.'login.php?invite_code='.$code;
        $plainBody .=
            "\nYou can join by clicking on the link below:\n".
            $url."\n\n".
            "This invitation is valid until ".$expiration.".";
        $htmlBody .=
            "</ul>\nYou can join by clicking on the link below:<br>\n".
            "<a href=\"$url\">$url</a>.<br>\n<br>\n".
            "<em>This invitation is valid until ".$expiration.".</em>";

        return send_email($email, '', $subject, $plainBody, $htmlBody);
    } else {
        return false;
    }
}

function process_invitation($invite_code, $user_id) {
    $conexao = ADONewConnection(DATABASE_DRIVER);
    $conexao->PConnect(DATABASE_SERVER,DATABASE_USER,DATABASE_PASSWORD,DATABASE_NAME);
    $sSQL = "SELECT count(*) FROM users WHERE id = ?";
    $params = array($user_id);
    $q = $conexao->GetOne($sSQL, $params);
    if ($q < 1) {
        return 0;
    }

    $sSQL = "SELECT count(*) FROM tickets WHERE type = ? AND code = ? AND used = 0 AND expiration > NOW()";
    $params = array(TICKET_TYPE_INVITATION, $_REQUEST['invite_code']);
    $q = $conexao->GetOne($sSQL, $params);
    if ($q < 1) {
        return 0;
    }

    $sSQL = "SELECT project_id FROM tickets_projects WHERE code = ?";
    $params = array($invite_code);
    $arr = $conexao->GetArray($sSQL, $params);
    if (empty($arr)) {
        return 0;
    }

    $num_projects = 0;
    foreach ($arr as $row) {
        $sSQL = "SELECT count(*) FROM access_control WHERE user_id = ? AND project_id = ?";
        $params = array(
            $user_id,
            $row[0],
        );
        $q = $conexao->getOne($sSQL, $params);
        if ($q == 0) {
            $sSQL = "INSERT INTO access_control (user_id, project_id, role_id) VALUES (?, ?, ?)";
            $params = array(
                $user_id,
                $row[0],
                PROJECT_ROLE_COLLABORATOR
            );
            if ($conexao->Execute($sSQL, $params)) {
                $num_projects++;
            }
        }
    }

    $sSQL = "UPDATE tickets SET used = 1 WHERE code = ?";
    $params = array($invite_code);
    if (!$conexao->execute($sSQL, $params)) {
        return 0;
    }
    $conexao->close();
    return $num_projects;
}

function send_confirmation($user_id) {
    //for future use
}

function send_password_reset($user_id) {
    //for future use
}