<div id="panel-draggable">
	<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h6 id="modal-formLabel">Topology Information Panel</h6>
    </div>
			
	<div id="panel-center">
		<br/>
		<div class="action-nav-normal">
			<div class="row-fluid">
    			<div class="span2 action-nav-button">
      				<a href="#" title="New comment">
        				<i class="icon-comment-alt"></i>
        				<span>New comment</span>
      				</a>
      				<span class="triangle-button red"><i class="icon-plus"></i></span>
    			</div>
				<div class="span2 action-nav-button">
                    <a href="#" title="New Project">
                        <i class="icon-user"></i>
                        <span>Users shared</span>
                    </a>
					<span class="label label-black">12</span>
                </div>
				<div class="span2 action-nav-button">
      				<a href="#" title="Files">
        				<i class="icon-bar-chart"></i>
        				<span>Statistics charts</span>
      				</a>
   				</div>
				<div class="span2 action-nav-button">
                    <a href="#" title="Files">
                        <i class="icon-sitemap"></i>
                        <span>Infra Info</span>
                    </a>
                </div>
				<div class="span2 action-nav-button">
                    <a href="#" title="Files">
                        <i class="icon-desktop"></i>
                        <span>Devices Info</span>
                    </a>
                </div>
			</div>
		</div>
		<div class="box-content padded" style=" background-color: white; ">
		<button class="btn btn-default"><i class="icon-calendar"></i> Select another interval</button>
		</div>	
		<div class="box">
            <div class="box-header"><span class="title">SNMP Operations - Number of Messages</span></div>
			<div id="chart_div" style="width: 570px; height: 300px;"></div>
        </div> 
		<div class="box" style="height:295px;">
  			<div class="box-header"><span class="title">Others information</span></div>
			<div id="piechart_3d" style="width: 340px; height: 200px; float: left; margin-top:30px;"></div>
					<table class="table table-normal">
					  <thead>
					  <tr>
						<td colspan="3">SNMP elements on topology</td>
					  </tr>
					  <tr>
						<td style="width: 100px">Description</td>
						<td style="width: 60px">Number</td>
						<td style="width: 60px"></td>
					  </tr>
					  </thead>

					  <tbody>
					  <tr class="status-pending">
						<td><a href="#">Manager</a></td>
						<td><b>3</b></td>
						<td>
						  <div class="btn-group">
							<button class="btn btn-mini btn-default dropdown-toggle" data-toggle="dropdown"><i class="icon-cog"></i></button>
							<ul class="dropdown-menu">
							  <li><a href="#">Action</a></li>
							  <li><a href="#">Another action</a></li>
							  <li><a href="#">Something else here</a></li>
							  <li class="divider"></li>
							  <li><a href="#">Separated link</a></li>
							</ul>
						  </div>
						</td>
					  </tr>

					  <tr class="status-info">
						<td><a href="#">Manager/Agent</a></td>
						<td><b>2</b></td>
						<td>
						  <div class="btn-group">
							<button class="btn btn-mini btn-default dropdown-toggle" data-toggle="dropdown"><i class="icon-cog"></i></button>
							<ul class="dropdown-menu">
							  <li><a href="#">Action</a></li>
							  <li><a href="#">Another action</a></li>
							  <li><a href="#">Something else here</a></li>
							  <li class="divider"></li>
							  <li><a href="#">Separated link</a></li>
							</ul>
						  </div>
						</td>
					  </tr>

					  <tr class="status-pending">
                        <td><a href="#">Agent</a></td>
                        <td><b>21</b></td>
                        <td>
                          <div class="btn-group">
                            <button class="btn btn-mini btn-default dropdown-toggle" data-toggle="dropdown"><i class="icon-cog"></i></button>
                            <ul class="dropdown-menu">
                              <li><a href="#">Action</a></li>
                              <li><a href="#">Another action</a></li>
                              <li><a href="#">Something else here</a></li>
                              <li class="divider"></li>
                              <li><a href="#">Separated link</a></li>
                            </ul>
                          </div>
                        </td>
                      </tr>

					  <tr class="status-info">
                        <td><a href="#">Agent/Trap</a></td>
                        <td><b>3</b></td>
                        <td>
                          <div class="btn-group">
                            <button class="btn btn-mini btn-default dropdown-toggle" data-toggle="dropdown"><i class="icon-cog"></i></button>
                            <ul class="dropdown-menu">
                              <li><a href="#">Action</a></li>
                              <li><a href="#">Another action</a></li>
                              <li><a href="#">Something else here</a></li>
                              <li class="divider"></li>
                              <li><a href="#">Separated link</a></li>
                            </ul>
                          </div>
                        </td>
                      </tr>

					  <tr class="status-pending">
                        <td><a href="#">Trap</a></td>
                        <td><b>2</b></td>
                        <td>
                          <div class="btn-group">
                            <button class="btn btn-mini btn-default dropdown-toggle" data-toggle="dropdown"><i class="icon-cog"></i></button>
                            <ul class="dropdown-menu">
                              <li><a href="#">Action</a></li>
                              <li><a href="#">Another action</a></li>
                              <li><a href="#">Something else here</a></li>
                              <li class="divider"></li>
                              <li><a href="#">Separated link</a></li>
                            </ul>
                          </div>
                        </td>
                      </tr>

				   </table>
			</div>
	</div>
</div>
