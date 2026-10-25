<div class="artical-content">
    <div class="post-share">
        <span style="background-image:url('BotCollection/images/logo_{$Faction}.png');">$Faction</span>
    </div>
    <div style="margin-left: 6.5em">
        <h1><a id="$ID-title">$KnownAs <small class="smallbits"><% if $Title != $KnownAs %>($Title)<% end_if %></small></a></h1>
        <h2 style="padding-top:8px;padding-bottom:14px;line-height:14px;">$Faction $Rank | $Gender $Role | $AltMode</h2>
    </div>
    <% with $PageTop %>
        <% if $prevBot || $nextBot %>
            <div class="float-rt" style="margin-top:-3rem;margin-right:-0.5rem;">
                <% if $prevBot %><a class="button"
                                    href="$Link('character/')$prevBot">&laquo; Prev</a><% end_if %>
                <a href="$Link()" class="button">All Bots</a>
                <% if $nextBot %><a class="button"
                                    href="$Link('character/')$nextBot">Next &raquo;</a><% end_if %>
            </div>
        <% end_if %>
    <% end_with %>
</div>
<div class="clear"></div>
<br/>
<div class="artical-img">

<% if $BotImages.exists %><% with $BotImages.first %>
<figure id="the-bigBoy" class="zoom" onmousemove="zoom(event)" 
  style="background-image: url($Image.FitMax(1024,1024).URL); transform-origin: {$Image.FocusPoint.PercentageX}% {$Image.FocusPoint.PercentageY}%"><a href="$Image.URL" target="_blank"><img src="$Image.FocusFill(600,450).URL" /></a></figure>
<% end_with %><% else %>
<img src="$DefaultImage.FocusFill(600,450).URL" />
<% end_if %> 

    $Faction <strong>$KnownAs</strong><br/>

    <div class="artical-img-list">
    <% loop $BotImages %>
        <a onclick="setPreviewImg(event)"
            data-src="$Image.FocusFill(600,450).URL"
            data-zoom="$Image.FitMax(1024,1024).URL"
            data-origin="{$Image.FocusPoint.PercentageX}% {$Image.FocusPoint.PercentageY}%"
            href="$Image.URL">$Image.FocusFill(100,100)</a>
    <% end_loop %>
    </div>
</div>
<div class="artical-content">

    $EditableField('Content')

    <% if $BotTeams %><h2>Teams:</h2>
        <ul>
            <% loop $BotTeams %>
                <li class="$Faction.lowercase"><a href="$Top.PageTop.Link('team/')$ID">$Title</a></li><% end_loop %>
        </ul>
    <% end_if %>

    <% if $BotGroups %><h2>Groups:</h2>
        <ul>
            <% loop $BotGroups %>
                <li><a href="$Top.PageTop.Link('group/')$ID">$Title</a></li><% end_loop %>
        </ul>
    <% end_if %>

    <% if $MainPurchase %><% loop $Purchases %>
        <p class="smallbits">Purchased<% if $Characters.Count > 1%> $Characters.Count items<% end_if %> on $Vendor.Title for $SpentAUD.Nice on $PurchaseDate.Nice from {$SellerName}.</p>
    <% end_loop %><% else_if $PurchaseCost %>
        <p class="smallbits">Purchased for $PurchaseCost.Nice</p>
    <% end_if %>

<p><strong>Customisation:</strong><br/>$Status</p>

<p><a href="/admin/bots/Character/EditForm/field/Character/item/$ID">Edit</a></p>

</div>
<style>
.artical-img-list {
    height: 122px;
    gap: 5px;
}
.artical-img-list a {
    border: 4px solid white;
    box-shadow: -1px 5px 5px #00000080;
}
</style>
