<div>
    <ul id="tiles">
    <% loop $allGroups %>
        <% include BotGrouped thePage=$Up.thePage %>
    <% end_loop %>
    </ul>
    <div class="toggle hide makeMeDroppable" data-id="X">
        <h3>Not Grouped:</h3>
        <% loop $notGrouped %>
            <a href="/admin/bots/Character/EditForm/field/Character/item/$ID/edit"
               class="makeMeDraggable" data-id="$ID"><span
               class="tag tag-$Faction<% if $Status == 'InProgress' %> tag-unfinished<% end_if %>">$Title</span></a>
        <% end_loop %>
        <h3>Not Assigned:</h3>
        <% loop $notCollected %><% if $Collections.Count %>
            <a href="/admin/bots/Character/EditForm/field/Character/item/$ID/edit"
               class="makeMeDraggable" data-id="$ID"><span
               class="tag tag-$Faction<% if $Status == 'InProgress' %> tag-unfinished<% end_if %>">$Title</span></a><% end_if %>
        <% end_loop %>
        <h3>Not Available:</h3>
        <% loop $notCollected %><% if not $Collections.Count %>
            <a href="/admin/bots/Character/EditForm/field/Character/item/$ID/edit"
               class="makeMeDraggable" data-id="$ID"><span
               class="tag tag-$Faction<% if $Status == 'InProgress' %> tag-unfinished<% end_if %><% if not $Purchases.Count %> tag-missing<% end_if %>">$Title</span></a><% end_if %>
        <% end_loop %>
    </div>
</div>
