<div id="modal-form-add-device" class="modal hide fade">
  	<div class="modal-header">
    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    	<h6 id="modal-formLabel">Add new device</h6>
  	</div>
  	<div class="modal-body">
    <form class="form-horizontal fill-up separate-sections" name="form-add-device" id="form-add-device">
		<input type="hidden" name="ID_TOPOLOGY" id="ID_TOPOLOGY" value="{$ID_TOPOLOGY}"/>
		<input type="hidden" name="operation" value="addDevice" />
		<div class="row-fluid">
			<div class="span6">
        		<label>Enter device alias</label>
        		<input type="text" name="alias" placeholder="Device alias" />
      		</div>
			<div class="span6">
          		<label>Enter device IP address</label>
				<input type="text" name="ipaddress" placeholder="IP address"/>		
			</div>
		</div>
		
		<div class="divider"><span></span></div>

      	<div class="row-fluid">
        	<div class="span6">
          		<label>Device type</label>
          		<select class="chzn-select" name="device_type">
					{html_options options=$device_type}
				</select>
        	</div>
        	<div class="span6">
          		<label>SNMP Version</label>
          		<select class="chzn-select" name="snmp_version">
					<option value="0">No manageable</option>
					<option value="1">Version 1</option>
					<option value="2">Version 2c</option>
					<option value="3">Version 3</option>
				</select>
        	</div>
      	</div>
		
		<div class="divider"><span></span></div>

		<div>
        	<textarea rows="4" name="description" placeholder="Enter your comments here"></textarea>
      	</div>
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
    	<button class="btn btn-blue" data-dismiss="modal" id="btn-add-device">Add device</button>
  	</div>
</div>
