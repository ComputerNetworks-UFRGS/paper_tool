function validateUserAdd() {
    if ($("#name").val() == '') {
        alertify('Name is empty');
        return false;
    }
    if ($("username").val() == '') {
        alertify('Username is empty');
        return false;
    }
    if ($("email").val() == '') {
        alertify('Email is empty');
        return false;
    }
    if ($("password").val() == '') {
        alertify('Password is empty');
        return false;
    } else if ($("password").val() != $("password_confirm").val()) {
        alertify('Password doesn\'t match confirmation');
        return false;
    }
    return true;
}