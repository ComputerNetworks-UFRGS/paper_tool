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
        #QuestionAdd {
            width: 95%;
            margin: auto;
            margin-bottom: 20px;
        }
        #question-text {
            height: 26px;
            margin: 0;
            width: 670px;
        }
        .btn-manage-questions {
            line-height: 11px;
        }
        .label-question, .edit-question {
            min-height: 28px;
        }
        .txt-question {
            width: 70%;
            height: 26px;
            margin: 0;
        }
    </style>
    <script language="javascript">
        var mem_question = '';
        function validateQuestionManage() {
            if ($("#operation") != 91) {
                return true;
            }
            if ($("#question-text").val() == '') {
                alertify('Question empty');
                return false;
            }
            return true;
        }

        function editQuestionStart(id) {
            if (mem_question === '') {
                mem_question = $('#txt-question-'+id).val();
                $('#label-question-' + id).hide();
                $('#edit-question-' + id).show();
            }
        }

        function editQuestionCancel(id) {
            $('#edit-question-'+id).hide();
            $('#label-question-'+id).show();
            mem_question = '';
        }

        function editQuestionSave(id) {
            if ($('#txt-question-'+id).val() == mem_question) {
                editQuestionCancel(id);
            } else {
                if ($('#txt-question-' + id).val() == '') {
                    alert('#txt-question-' + id);
                    return;
                }
                $('#question-id').val(id);
                $('#question-text').val($('#txt-question-' + id).val());
                $('#operation').val('82');
                $('#form-manage-questions').submit();
            }
        }

        function removeQuestion(id,confirmRemoveAnswers) {
            if (!confirmRemoveAnswers || confirm('This question has answers. Confirm deletion?')) {
                $('#question-id').val(id);
                $('#operation').val('83');
                $('#form-manage-questions').submit();
            }
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
            Question management
        </h5>
    </div>
</div>

{if $can_edit_questions}
<div id="QuestionAdd">
    <form id="form-manage-questions" name="form" method="post" action="projects-con.php">
        <input type="hidden" id="project-id" name="project_id" value="{$project_id}">
        <input type="hidden" id="operation" name="operation" value="81">
        <input type="hidden" id="question-id" name="question_id" value="">
        <label>Add question:</label>
        <textarea placeholder="Question"  id="question-text" name="question_text" required></textarea>
        <input type="submit" id="add-question" class="btn btn-default"  onsubmit="validateQuestionManage()" value="Add"/>
    </form>
</div>
{/if}

<hr class="divider"></hr>
<div class="box">
    <div class="box-header"><h4>&nbsp;&nbsp;&nbsp;{$questions|@count} questions</h4></div>
    <div class="box-content">
        <table cellpadding="0" cellspacing="0" border="0" class="responsive dataTable">
            <thead>
            <tr role="row">
                <th role="columnheader" tabindex="0" rowspan="1" colspan="1" style="width: 10%">
                    <div>#</div>
                </th>
                <th role="columnheader" tabindex="0" rowspan="1" colspan="1" >
                    <div>Question</div>
                </th>
                <th role="columnheader" tabindex="0" rowspan="1" colspan="1" style="width: 10%">
                    <div># Answers</div>
                </th>
                {if $can_edit_questions}
                <th name="Actions" tabindex="0" rowspan="1" colspan="1" style="width: 20%">
                    <div>Actions</div>
                </th>
                {/if}
            </tr>
            </thead>

            <tbody role="alert" aria-live="polite" aria-relevant="all">
            {foreach from=$questions item=row}
                <tr id="trquestion_{$row.id}">
                    <td>{$row.seq}</td>
                    <td>
                        <div class="label-question" id="label-question-{$row.id}">{$row.question}</div>
                        <div class="edit-question" id="edit-question-{$row.id}"  style="display: none">
                            <textarea class="txt-question" id="txt-question-{$row.id}">{$row.question}</textarea>
                            <input type="button" class="btn btn-default btn-manage-questions" onclick="editQuestionSave('{$row.id}')" value="Save"/>
                            <input type="button" class="btn btn-default btn-manage-questions" onclick="editQuestionCancel('{$row.id}')" value="Cancel"/>
                        </div>
                    </td>
                    <td>{(int)$row.num_answers}</td>
                    {if $can_edit_questions}
                    <td>
                        <input type="button" class="btn btn-default btn-manage-questions" onclick="editQuestionStart('{$row.id}')" value="Edit"/>
                        <input type="button" class="btn btn-default btn-manage-questions" onclick="removeQuestion('{$row.id}',{if $row.num_answers > 0}true{else}false{/if})" value="Remove"/>
                    </td>
                    {/if}
                </tr>
            {/foreach}
            </tbody>
        </table>
    </div>
</div>

</body>
</html>