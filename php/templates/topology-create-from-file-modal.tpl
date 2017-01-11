<div id="modal-form-create-from-file" class="modal hide fade">
  	<div class="modal-header">
    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    	<h6 id="modal-formLabel">Create topology from file</h6>
  	</div>
  	<div class="modal-body">
    <form class="form-horizontal fill-up separate-sections" name="form-create-from-file" id="form-create-from-file">
		<input type="hidden" name="ID_TOPOLOGY" id="ID_TOPOLOGY" value="{$ID_TOPOLOGY}"/>
		<input type="hidden" name="operation" value="createFromFile" />
		<input type="hidden" name="_height" value="" id="_height"/>
		<input type="hidden" name="_width" value="" id="_width"/>
		<div class="row-fluid">
			<div class="span6">
        		<label>Select trace file</label>
      			<select class="chzn-select" name="pcap_file">
                	{html_options options=$pcap_file}
				</select>
			</div>
<!--
			<div class="span6">
          		<label>Enter device IP address</label>
				<input type="text" name="ipaddress" placeholder="IP address"/>		
			</div>
-->
		</div>
		
		<div class="divider"><span></span></div>
<!--
      	<div class="row-fluid">
        	<div class="span6">
          		<div>
            		<input type="checkbox" class="icheck" checked id="icheckModal1">
           			<label for="icheckModal1">The number one option</label>
          		</div>
				<div>
            		<input type="checkbox" class="icheck" id="icheckModal2">
            		<label for="icheckModal2">The number two option</label>
          		</div>
        	</div>

 			<div class="span6">
          		<div>
            		<input type="radio" name="optionsRadios" class="icheck" checked id="iradioModal1">
            		<label for="iradioModal1">The number one option</label>
          		</div>
				<div>
            		<input type="radio" name="optionsRadios" class="icheck" id="iradioModal2">
            		<label for="iradioModal2">The number two option</label>
          		</div>
        	</div>
		</div>
-->
	</form>
  	</div>
  	<div class="modal-footer">
<!--    	<button class="btn btn-default" data-dismiss="modal">Close</button> -->
    	<button class="btn btn-blue" data-dismiss="modal" id="btn-create-from-file">Create topology</button>
  	</div>
</div>
