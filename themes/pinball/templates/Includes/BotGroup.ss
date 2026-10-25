<div class="artical-content">
    <div class="post-share">
        <div style="display:inline-block;width:2.5rem;overflow: hidden"><span
                style="background-image:url('/BotCollection/images/logo_autobot.png');">Autobots</span></div>
        <div style="display:inline-block;width:2.5rem;overflow: hidden;"><span
                style="background-image:url('/BotCollection/images/logo_decepticon.png');margin-left:-2.5rem">Decepticons</span>
        </div>
    </div>
    <div style="margin-left: 6.5em">
        <h1><a id="$ID-title">$Title</a></h1>
        <p style="padding-top:8px;padding-bottom:14px;line-height:14px;">$Characters.Count Rivals
            <% if $Gestalt %> | $Gestalt<% end_if %>
        </p>
    </div>
    <% with $PageTop %>
        <% if $prevGroup || $nextGroup %>
            <div class="float-rt" style="margin-top:-3rem;margin-right:-0.5rem;">
                <% if $prevGroup %><a class="button"
                                      href="$Link('group/')$prevGroup">&laquo; Prev</a><% end_if %>
                <a href="$Link('group')" class="button">All Groups</a>
                <% if $nextGroup %><a class="button"
                                      href="$Link('group/')$nextGroup">Next &raquo;</a><% end_if %>
            </div>
        <% end_if %>
    <% end_with %>
</div>

<div class="artical-contents artical-img">
    <div id="bigBoy"><% with $GroupImages.first %><figure id="the-bigBoy" class="zoom" onmousemove="zoom(event)" 
  style="background-image: url($Image.FitMax(1024,1024).URL); transform-origin: {$Image.FocusPoint.PercentageX}% {$Image.FocusPoint.PercentageY}%"><a href="$Image.URL" target="_blank"><img src="$Image.FocusFill(600,450).URL" /></a></figure><% end_with %></div>
    <strong>$aTitle</strong> <small>vs</small> <strong>$dTitle</strong><br/>
    <div class="artical-img-list">
        <% loop $GroupImages %>
            <a onclick="setPreviewImg(event)"
                data-src="$Image.FocusFill(600,450).URL"
                data-zoom="$Image.FitMax(1024,1024).URL"
                data-origin="{$Image.FocusPoint.PercentageX}% {$Image.FocusPoint.PercentageY}%"
                href="$Image.URL">$Image.FocusFill(100,100)</a>
        <% end_loop %>
        <% loop $Characters %><% with $BotImages.first %>
            <a onclick="setPreviewImg(event)"
                data-src="$Image.FocusFill(600,450).URL"
                data-zoom="$Image.FitMax(1024,1024).URL"
                data-origin="{$Image.FocusPoint.PercentageX}% {$Image.FocusPoint.PercentageY}%"
                href="$Image.URL">$Image.FocusFill(100,100)</a><% end_with %>
        <% end_loop %>
    </div>
</div>

<div class="artical-content">
    $Content
    <h2>Autobots:</h2>
    <ol class="autobot">
        <% loop $Characters.filter('Faction','Autobot').sort('Title') %>
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

    <h2>Decepticons:</h2>
    <ol class="decepticon">
        <% loop $Characters.filter('Faction','Decepticon').sort('Title') %>
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
    <a href="/admin/bots/BotGroup/EditForm/field/BotGroup/item/$ID">Edit</a>
</div>
