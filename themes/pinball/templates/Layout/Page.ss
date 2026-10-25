
<div class="content">
	<div class="wrap">
		<div class="single-page">
			<div class="single-page-artical">
				<div class="artical-content">
					<% if $Parent %><span><a href="$Parent.Link">$Parent.Title</a></span><% end_if %>
                    <h1>$Title</h1>
                    $EditableField(Content)
					$Form
			    </div>
				<div class="clear"> </div>
			</div>
		</div>
        
        <div>
            $ElementalArea
        </div>
	</div>
</div>
