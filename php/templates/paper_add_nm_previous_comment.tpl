<div id="modal-form-add-previous-comment" class="modal hide fade">
  	<div class="modal-header">
    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    	<h6 id="modal-formLabel">View comments</h6>
  	</div>
  	<div>

{if $previous_comments|@count}
	
<ul class="chat-box timeline">

  {foreach from=$previous_comments item=row}
  <li class="gray">
    <div class="info">
      <span class="name">
        <span class="label label-green">COMMENT</span> 
				<strong class="indent">{$row.username}</strong> posted a comment
      </span>
      <span class="time"><i class="icon-time"></i>{$row.data}</span>
    </div>
    <div class="content">
      <blockquote>
      	{$row.comments}
			</blockquote>
    </div>
  </li>
{/foreach}
</ul>

{else}
	<h3 style="color: #970000; width: 100%; text-align: center;">No previous comments!</h3>
{/if}

</div>
</div>
