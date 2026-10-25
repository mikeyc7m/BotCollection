<div>
    <ul id="tiles">
    <% loop $allTeams %>
        
        
        <li class="grid-item team">
                            <div data-type="ajax" data-src="$Top.Link('team/')$ID"
                                 data-filter=".single-page-artical"
                                 data-options='{"smallBtn":true,"toolbar":true,"idleTime":0,"slideShow":{"speed":5000},"loop":true}'
                                 data-fancybox="gallery">
                                 <div><img class="toggle" src="$TeamImages.first.Image.FocusFill(414,191).URL" /></div>
                                 <div class="makeMeDroppable ui-droppable" data-id="$ID">
                                <div class="post-info">
                                    <div class="post-basic-info">
                                        <div style="float:left" class="post-share"><span
                                                style="background-image:url('BotCollection/images/logo_{$Faction}.png');">$Faction</span>
                                        </div>
                                        <p style="float:right">$Gestalt</p>
                                        <h3><a href="$Top.Link('team')/$ID">$Title ($Characters.Count)</a></h3>
                                    </div>
                                </div>
                               <div class="toggle<% if not $Top.isAjax %> hide<% end_if %>"  data-id="$ID">
                                    <% loop $Characters %><a class="makeMeDraggable" data-id="$ID" href="/admin/bots/Character/EditForm/field/Character/item/$ID/edit"><span class="tag tag-$Faction <% if not $Collections.Count %>tag-missing<% end_if %>">$KnownAs</span></a><% end_loop %>
                                </div>
                                <div style="display:none">
                                    <% loop $Characters %>$Title<% if not $last %>, <% end_if %><% end_loop %>
                                </div>
                                </div>
                            </div>
                        </li>
        
        
    <% end_loop %>
    </ul>
    <div class="toggle<% if not $Top.isAjax %> hide<% end_if %> makeMeDroppable" data-id="X">
        <h3>Not Grouped:</h3>
        <% loop $notTeamed %>
            <a href="/admin/bots/Character/EditForm/field/Character/item/$ID/edit"
               class="makeMeDraggable" data-id="$ID"><span
               class="tag tag-$Faction<% if $Status == 'InProgress' %> tag-unfinished<% end_if %>
               <% if not $Purchases.Count %> tag-missing<% end_if %>
               ">$Title</span></a>
        <% end_loop %>
    </div>
</div>




                        
                
                
                
                
                