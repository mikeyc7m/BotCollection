<div class="artical-content">
    <div class="post-share">
        <span style="background-image:url('BotCollection/images/logo_{$Faction}.png');">$Faction</span>
    </div>
    <div style="margin-left: 6.5em">
        <h1><a id="$ID-title">$Title</a></h1>
        <p style="padding-top:8px;padding-bottom:14px;line-height:14px;">$Characters.Count {$Faction}s
            <% if $Gestalt %> | $Gestalt<% end_if %>
        </p>
    </div>
    <% with $PageTop %>
        <% if $prevTeam || $nextTeam %>
            <div class="float-rt" style="margin-top:-3rem;margin-right:-0.5rem;">
                <% if $prevTeam %><a class="button"
                                     href="$Link('team/')$prevTeam">&laquo; Prev</a><% end_if %>
                <a href="$Link('team')" class="button">All Teams</a>
                <% if $nextTeam %><a class="button"
                                     href="$Link('team/')$nextTeam">Next &raquo;</a><% end_if %>
            </div>
        <% end_if %>
    <% end_with %>
</div>
<div class="artical-contents artical-img">
    <div id="bigBoy"><% with $TeamImages.first %><img src="$Image.FocusFill(600,450).URL"/><% end_with %></div>
    <% if $Gestalt %>$Gestalt / <% end_if %><strong>$Title</strong><br/>
    <div class="artical-img-list">
        <% loop $TeamImages %><a
                onclick="$('#bigBoy img').prop('src', $(this).prop('href')); return false;"
                href="$Image.FocusFill(600,450).URL">$Image.FocusFill(100,100)</a>
        <% end_loop %>
        <% loop $Characters %><% with $BotImages.first %><a
                onclick="$('#bigBoy img').prop('src', $(this).prop('href')); return false;"
                href="$Image.FocusFill(600,450).URL">$Image.FocusFill(100,100)</a><% end_with %>
        <% end_loop %>

    </div>
</div>
<div class="artical-content">

    <h2>Members:</h2>
    <ol>
        <% loop $Characters.sort('Title') %>
            <li>
                <% if $Collections.Count %>
                    <a href="$Top.PageTop.Link('character/')$ID">$KnownAs</a><% if $Top.PageTop.theTeam.LeaderID == $ID %>
                    (Leader)<% end_if %>
                <% else %>
                    $KnownAs <% if $Top.PageTop.theTeam.LeaderID == $ID %>
                    (Leader)<% end_if %>
                <% end_if %>
            </li>
        <% end_loop %>
    </ol>

    <% if $Gestalt %>
        <p>$Title combine to form <strong>$Gestalt</strong>.</p>
    <% end_if %>

    $Content

    <a href="/admin/bots/BotTeam/EditForm/field/BotTeam/item/$ID">Edit</a>
</div>
