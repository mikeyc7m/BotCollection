<% include SideBar %>
<div class="content-container unit size3of4 lastUnit">
	<article>
		<h1>$Title</h1>
		<div class="content">$Content</div>
		
		<table width="100%" class="hover"><thead>
		<tr><th>Name</th><th>Faction</th><th>Teams</th><th>Alt</th><th>Gender</th><th>Image</th><th>Mine</th><th>Grouped</th></tr>
		</thead><tbody>
		<% loop AllCharacters %>
		<tr>
			<td>$Title</td>
			<td>$Faction</td>
			<td><% loop $BotTeams %>$Title<% if LeaderID == Up.ID%> =L<% end_if %><% if not last%></br><% end_if %><% end_loop %></td>
			<td>$AltMode <!--<% loop AltModes %><br/>($Name)<% end_loop %>--></td>
			<td><% if $Gender == "Male" %>=M<% else_if $Gender == "Female" %>=F<% else %><% end_if %></td>
			<td>$Image.CMSThumbnail</td>
			<td><% if $Collections.filter('Title','Mikey').Count %>=Y<% else %>=N<% end_if %></td>
			<td><% if BotGroups %><% else %>=G<% end_if %><% loop $BotGroups %>$Title<% if not last%></br><% end_if %><% end_loop %></td>
		</tr>
		<% end_loop %>
		</tbody>
		</table>
				
	</article>
		$Form
		$CommentsForm
</div>

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" />
<style>
.dataTables_wrapper > div { padding: 0 0 0.5rem 0;}
.typography table td, .typography table th { border:0; }
table.dataTable tbody th, table.dataTable tbody td, table.dataTable thead th, table.dataTable thead td{padding:3px 18px}
table.dataTable thead .sorting, table.dataTable thead .sorting_asc, table.dataTable thead .sorting_desc, table.dataTable thead .sorting_asc_disabled, table.dataTable thead .sorting_desc_disabled { background-position: center left;}
input[type]:not([type=submit]), select { height: 26px;}
table.dataTable.hover tbody tr:hover, table.dataTable.display tbody tr:hover{background-color: #8d9bb7}
.dataTables_wrapper .dataTables_info { float: none; clear: none; text-align: center; padding: 2px 0 12px 0; }
.dataTables_wrapper .dataTables_filter { float: left; text-align: left; }
.dataTables_wrapper .dataTables_length { float: right; text-align: right; }
</style>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script>
var table = false;
jQuery(document).ready(function($){
	table = jQuery('table').DataTable({
		"lengthMenu": [[-1, 25, 50, 100], ["All", 25, 50, 100]], 
		"columnDefs": [{
                "targets": [ 5 ],
                "visible": false,
                "searchable": false
        }],
        "dom": "flirtp",
    });
	table.on( 'click', 'tr', function (event) {
        if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
        }
        else {
            /*if( !event.ctrlKey )*/ table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
            $('aside img').prop('src', $(this).find('img').prop('src'));
        }
    } );
});
</script>
