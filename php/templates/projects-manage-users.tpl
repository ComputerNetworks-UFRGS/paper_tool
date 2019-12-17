<!doctype html>
<html>
<head>

    <meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800">

    <meta charset="utf-8">
    <!-- Always force latest IE rendering engine or request Chrome Frame -->
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">

    <!-- Use title if it's in the page YAML frontmatter -->
    <title>{$SYS_TITLE}</title>

    <link href="{$CSS_LIBS_PATH}application.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="{$CSS_LIBS_PATH}alertify.core.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="{$CSS_LIBS_PATH}alertify.default.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="{$CSS_LIBS_PATH}jstree-style.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="{$CSS_PATH}papers.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="{$CSS_PATH}select2.css" media="screen" rel="stylesheet" type="text/css" />

    <!--[if lt IE 9]>
    <script src="../../javascripts/vendor/html5shiv.js" type="text/javascript"></script>
    <script src="../../javascripts/vendor/excanvas.js" type="text/javascript"></script>
    <![endif]-->
    <script src="{$JS_LIBS_PATH}application.js" type="text/javascript"></script>
    <script src="{$JS_LIBS_PATH}alertify/alertify.min.js" type="text/javascript"></script>
    <script src="{$JS_LIBS_PATH}select2.js" type="text/javascript"></script>
    <script src="{$JS_LIBS_PATH}jstree.js" type="text/javascript"></script>
    <script src="{$JS_PATH}papers.js" type="text/javascript"></script>
    <style type="text/css">
        #UserAddInvite {
            width: 95%;
            margin: auto;
            margin-bottom: 20px;
        }
        #user-email-name {
            margin-bottom: 0;
        }
        .btn-manage-users {
            line-height: 11px;
        }
        .label-role, .edit-role {
            height: 24px;
        }
        .sel-role {
            width: 150px;
            height: 24px;
            margin: 0;
        }
    </style>
    <script language="javascript">
        var mem_role = null;
        function validateUserManage() {
            if ($("#operation") != 91) {
                return true;
            }
            if ($("#user-email-name").val() == '') {
                alertify('E-mail/Username empty');
                return false;
            }
            return true;
        }

        function editUserStart(id) {
            if (mem_role === null) {
                mem_role = $('#sel-role-'+id).val();
                $('#label-role-' + id).hide();
                $('#edit-role-' + id).show();
            }
        }

        function editUserCancel(id) {
            $('#edit-role-'+id).hide();
            $('#label-role-'+id).show();
            mem_role = null;
        }

        function editUserSave(id) {
            if ($('#sel-role-'+id).val() == mem_role) {
                editUserCancel(id);
            } else {
                $('#user-id').val(id);
                $('#role').val($('#sel-role-' + id).val());
                $('#operation').val('92');
                $('#form-manage-users').submit();
            }
        }

        function removeUser(id) {
            $('#user-id').val(id);
            $('#operation').val('93');
            $('#form-manage-users').submit();
        }
    </script>
</head>

<body>

<div class="area-top clearfix">
    <div class="pull-left header">
        <h3 class="title">
            <i class="icon-file"></i>
            {$project_name}
        </h3>
        <h5>
            User management
        </h5>
    </div>
</div>

{if $can_edit_users}
<div id="UserAddInvite">
    <form id="form-manage-users" name="form" method="post" action="projects-con.php">
        <input type="hidden" id="project-id" name="project_id" value="{$project_id}">
        <input type="hidden" id="operation" name="operation" value="91">
        <input type="hidden" id="user-id" name="user_id" value="">
        <input type="hidden" id="role" name="role" value="">
        <label>Add/invite user:</label>
        <input type="text" id="user-email-name" name="user-email-name" placeholder="E-mail or Username" required/>
        <input type="submit" id="add-user" class="btn btn-default"  onsubmit="validateUserManage()" value="Add/invite"/>
    </form>
</div>
{/if}

<hr class="divider"></hr>
<div class="box">
    <div class="box-header"><h4>&nbsp;&nbsp;&nbsp;{$users|@count} users</h4></div>
    <div class="box-content">
        <table cellpadding="0" cellspacing="0" border="0" class="responsive dataTable">
            <thead>
            <tr role="row">
                <th role="columnheader" tabindex="0" rowspan="1" colspan="1">
                    <div>User</div>
                </th>
                <th role="columnheader" tabindex="0" rowspan="1" colspan="1" style="width: 40%">
                    <div>Permission</div>
                </th>
                {if $can_edit_users}
                <th name="Actions" tabindex="0" rowspan="1" colspan="1" style="width: 20%">
                    <div>Actions</div>
                </th>
                {/if}
            </tr>
            </thead>

            <tbody role="alert" aria-live="polite" aria-relevant="all">
            {foreach from=$users item=row}
                <tr id="truser_{$row.id}">
                    <td>{$row.name}</td>
                    <td>
                        <div class="label-role" id="label-role-{$row.id}">{$row.role}</div>
                        <div class="edit-role" id="edit-role-{$row.id}"  style="display: none">
                            <select class="sel-role" id="sel-role-{$row.id}">
                            {html_options options=$roles selected=$row.role_id}
                            </select>
                            <input type="button" class="btn btn-default btn-manage-users" onclick="editUserSave({$row.id})" value="Save"/>
                            <input type="button" class="btn btn-default btn-manage-users" onclick="editUserCancel({$row.id})" value="Cancel"/>
                        </div>
                    </td>
                    {if $can_edit_users}
                        {if not $row.can_edit and not $row.can_delete}
                            <td>-</td>
                        {else}
                            <td>
                            {if $row.can_edit}
                                <input type="button" class="btn btn-default btn-manage-users" onclick="editUserStart('{$row.id}')" value="Edit"/>
                            {/if}
                            {if $row.can_delete}
                                <input type="button" class="btn btn-default btn-manage-users" onclick="removeUser('{$row.id}')" value="Remove"/>
                            {/if}
                            </td>
                        {/if}
                    {/if}
                </tr>
            {/foreach}
            </tbody>
        </table>
    </div>
</div>

</body>
</html>