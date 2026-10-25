
<li class="grid-item group">
    <div data-type="ajax" data-src="$Top.thePage.Link('group/')$ID"
         data-filter=".single-page-artical"
         data-options='{"smallBtn":true,"toolbar":true,"thumbs":{"autoStart":true},"idleTime":0,"slideShow":{"speed":5000},"loop":true}'
         data-fancybox="gallery">
        <div class="post-bucket group-info">
            <img class="toggle" src="$GroupImages.first.Image.FocusFill(303,181).URL" />
            <h3><a href="/admin/bots/BotGroup/EditForm/field/BotGroup/item/$ID">$Title</a></h3>
            <div class="post-info toggle">
                <div class="toggle show">
                <% loop $Characters.filter('faction','Autobot') %>$KnownAs<% if not $last %>, <% end_if %><% end_loop %>
                <br/>
                <% loop $Characters.filter('faction','Decepticon') %>$KnownAs<% if not $last %>, <% end_if %><% end_loop %>
                </div>
            </div>
            
            <div class="toggle hide makeMeDroppable" data-id="$ID">
                <% loop $Characters.filter('faction','Autobot') %>
                    <a class="makeMeDraggable" data-id="$ID" href="/admin/bots/Character/EditForm/field/Character/item/$ID/edit" title="$Title"><span class="tag tag-$Faction <% if not $Collections.Count %><% if $Purchases.Count %> tag-waiting<% else %> tag-missing<% end_if %><% end_if %><% if $Status == 'InProgress' %> tag-unfinished<% end_if %>">$KnownAs<% if $BotGroups.Count > 1 %> $BotGroups.Count<% end_if %></span></a>
                <% end_loop %>
                <% if $Characters.filter('faction','Autobot').Count < 3 %><span class="tag">($Characters.filter('faction','Autobot').Count only Bots)</span><% end_if %>
                <br/>
                <% loop $Characters.filter('faction','Decepticon') %>
                    <a class="makeMeDraggable" data-id="$ID" href="/admin/bots/Character/EditForm/field/Character/item/$ID/edit" title="$Title"><span class="tag tag-$Faction <% if not $Collections.Count %><% if $Purchases.Count %> tag-waiting<% else %> tag-missing<% end_if %><% end_if %><% if $Status == 'InProgress' %> tag-unfinished<% end_if %>">$KnownAs<% if $BotGroups.Count > 1 %> $BotGroups.Count<% end_if %></span></a>
                <% end_loop %>
                <% if $Characters.filter('faction','Decepticon').Count < 3 %><span class="tag">($Characters.filter('faction','Decepticon').Count only Cons)</span><% end_if %>
            </div>
            <div style="display:none">
                <% loop $Characters %>$Title<% if not $last %>, <% end_if %><% end_loop %>
            </div>
        </div>
    </div>
</li>
