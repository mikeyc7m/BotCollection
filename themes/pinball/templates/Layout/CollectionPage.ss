<link rel="stylesheet" href="$ThemeDir/css/jquery.fancybox.min.css"/>
<script src="$ThemeDir/js/jquery.fancybox.min.js"></script>
<script src="$ThemeDir/js/isotope.pkgd.min.js"></script>
<script src="$ThemeDir/js/jquery.imagesloaded.js"></script>
<script type="text/javascript" src="$ThemeDir/js/jquery-ui.min.js"></script>
<script>
    var Xgrid = window.Xgrid || {};
    var qsRegex = [];
    $(function () {

        $( init );

        function init() {
            $('.makeMeDraggable').draggable({
                cursor: 'move',
                revert: "invalid",
                snap: true,
                appendTo: "body",
                delay: 200,
                zIndex: 10000
            }).on('click', function(evt) {
                evt.stopPropagation();
            });
            $('.makeMeDroppable').droppable( {
                drop: handleDropEvent,
                classes: {
                    "ui-droppable-active": "drag-available",
                    "ui-droppable-hover": "drag-hover",
                },
            } );
        }

        function handleDropEvent( event, ui ) {
            var draggable = ui.draggable;
            const botID = draggable.data('id');
            const groupOldID = draggable.parent().data('id');
            const groupNewID = $(this).data('id');
            const targetURL = $('#main').data('url');
            if (groupNewID !== groupOldID && targetURL) {
                // alert('The character with ID ' + characterID + ' was dropped onto group ' + $(this).data('id'));
                $.post(targetURL, { groupOldID, botID, groupNewID, pageID: '$ID' }, function(data){
                    const newGroup = $(document).find('.makeMeDroppable[data-id='+groupNewID+']');
                    const oldGroup = $(document).find('.makeMeDroppable[data-id='+groupOldID+']');
                    const extraGroup = $(document).find('.makeMeDroppable[data-id=X]');
                    const newContent = $(data).find('.makeMeDroppable[data-id='+groupNewID+']');
                    const oldContent = $(data).find('.makeMeDroppable[data-id='+groupOldID+']');
                    const extraContent = $(data).find('.makeMeDroppable[data-id=X]');
                    newGroup.empty().append(newContent.html());
                    oldGroup.empty().append(oldContent.html());
                    extraGroup.empty().append(extraContent.html());
                    init();
                }).fail(function(data){
                    console.log('there was an error!', {data});
                });
            }
            return false;
        }

        Xgrid = $('ul#tiles').isotope({
            // options
            itemSelector: '.grid-item',
            // layoutMode: 'fitRows',
            filter: function () {
                valText = $(this).text();
                return qsRegex.length ? qsRegex.every( valString => valText.match(valString)) : true;
            }
        });

        if (Xgrid.length) {
            Xgrid.imagesLoaded().progress(function () {
                Xgrid.isotope('layout');
            });

            $('form.quicksearch').on('reset', () => {
                qsRegex = [];
                Xgrid.isotope();
            });

// use value of search field to filter
            var Xquicksearch = $('input.quicksearch').on('keyup', (debounce(function () {
                qsRegex = [];
                vals = Xquicksearch.val().split(' ');
                vals.forEach( valString =>
                    qsRegex.push(new RegExp(valString, 'gim'))
                );
                // console.log({qsRegex});
                Xgrid.isotope();
            }, 200)));

            const doCounta = (filteredItems) => {
                const count_a = filteredItems.reduce((total,x) => total + (x.classList.contains('Autobot') ? 1 : 0), 0);
                const count_d = filteredItems.reduce((total,x) => total + (x.classList.contains('Decepticon') ? 1 : 0), 0);
                $('.counta').text(filteredItems.length);
                $('.counta-A').text(count_a);
                $('.counta-D').text(count_d);
                $('li.grid-item > div').each((i,x) => x.dataset.fancybox = null);
                filteredItems.forEach(x => x.firstElementChild.dataset.fancybox = 'gallery');
            };

            Xgrid.on('arrangeComplete', function (event, filteredItems) {
                doCounta(filteredItems.map(x => x.element));
            });

            doCounta(Xgrid.isotope('getItemElements'));

// debounce so filtering doesn't happen every millisecond
            function debounce(fn, threshold) {
                var timeout;
                return function debounced() {
                    if (timeout) {
                        clearTimeout(timeout);
                    }

                    function delayed() {
                        fn();
                        timeout = null;
                    }

                    timeout = setTimeout(delayed, threshold || 100);
                }
            }
        }

        function dragdrop(){}
    });


</script>




<div class="content">
    <div class="wrap main">

        <% if $theBot %>
            <div class="single-page" id="main" role="main">
                <% with $theBot %>
                    <div class="single-page-artical $Faction.lowercase">
                        <% include BotDetail PageTop=$Top %>
                        <div class="clear"></div>
                    </div>
                <% end_with %>
            </div>
        <% else_if $theTeam %>
            <div class="single-page" id="main" role="main">
                <% with $theTeam %>
                    <div class="single-page-artical  $Faction.lowercase">
                        <% include BotTeam PageTop=$Top %>
                        <div class="clear"></div>
                    </div>
                <% end_with %>
            </div>
        <% else_if $theGroup %>
            <div class="single-page" id="main" role="main">
                <% with $theGroup %>
                    <div class="single-page-artical  $Faction.lowercase">
                        <% include BotGroup PageTop=$Top %>
                        <div class="clear"></div>
                    </div>
                <% end_with %>
            </div>
        <% else_if $allTeams %>
            <div style="float:right">
                <button onclick="$('.toggle').toggleClass('hide');Xgrid.isotope();">Toggle members</button>
            </div> <p>
                    <a href="$Link('')">$BotCount Characters</a>
                    | <span class="counta"></span> Special Teams
                    | <a href="$Link('group')">$GroupCount Rival Groups</a>
                </p>
            <div id="main" role="main" data-url="/update/team">

                <% include BotTeams %>
                
            </div>
        <% else_if $allGroups %>
            <div style="float:right">
                <button onclick="$('.toggle').toggleClass('hide');Xgrid.isotope();">Toggle members</button>
            </div>
            <p>
                    <a href="$Link('')">$BotCount Characters</a>
                    | <a href="$Link('team')">$TeamCount Special Teams</a>
                    | <span class="counta"></span> Rival Groups
                </p>
            <div id="main" class="all-groups" role="main" data-url="/update/group">

                <% include BotGroups thePage=$Top %>

            </div>
        <% else_if $allCollections %>
            <div style="float:right">
                <button onclick="$('.toggle').toggleClass('hide');Xgrid.isotope();">Toggle members</button>
            </div>
            <p>
                    <a href="$Link('')">$BotCount Characters</a>
                    | <a href="$Link('team')">$TeamCount Special Teams</a>
                    | <a href="$Link('group')">$GroupCount Rival Groups</a>
                </p>
            <div id="main" role="main" data-url="/update/collection">

                <% include Collections thePage=$Top %>

            </div>        <% else %>
        <p>
                    <span class="counta"></span> Characters
                    <span style="color:red"><span class="counta-A"></span>A</span>
                    <span style="color:purple"><span class="counta-D"></span>D</span>
                    | <a href="$Link('team')">$TeamCount Special Teams</a>
                    | <a href="$Link('group')">$GroupCount Rival Groups</a>
                </p>
            <div id="main" role="main" class="all-bots">
                <ul id="tiles">
                    <!-- These are our grid blocks -->
                    <% loop $AllMyBots %>
                        <li class="grid-item $Faction">
                            <div data-type="ajax" data-src="$Top.Link('character/')$ID"
                                 data-filter=".single-page-artical"
                                 data-options='{"smallBtn":true,"toolbar":true,"idleTime":0,"slideShow":{"speed":5000},"loop":true}'
                                 data-fancybox="gallery">
                                <img src="<% if not $BotImages.exists %>$Top.DefaultImgURL<% else %>$BotImages.first.getThumbURL<% end_if %>" loading="lazy" alt="" style="width:187px; height: 187px;"/>
                                <div class="post-info">
                                    <div class="post-basic-info">
                                        <h3><a href="$Top.Link(character)/$ID">$KnownAs</a></h3>
                                        <span style="display:none">$Title</span>
                                        <p>$AltMode
                                            <span style="float:right"><% loop $BotTeams %><a
                                                    href="$Top.Link(team)/$ID"><% if LeaderID == Up.ID%>
                                                <label><span
                                                        style="display:none">=L</span></label><% end_if %>$Title</a><% if not $last%>
                                                <br/><% end_if %><% end_loop %>
                                            </span></p>
                                    </div>
                                    <div class="post-info-rate-share">
                                        <div style="display:none">
                                            <% if $Gender == "Male"%>=M<% else_if $Gender == "Female"%>=F<% end_if %>
                                            <% if $Faction == "Autobot"%>=A<% else_if $Faction == "Decepticon"%>
                                                =D<% end_if %>
                                            <% if $Rank == "Leader"%>=L<% end_if %>
                                            <% if $Status == 'Unchanged' %>=U<% else %>=K<% if $Status == 'InProgress' %> =P<% else %> =C<% end_if %><% end_if %>
                                        </div>
                                        <div class="rateit">
                                            <% if $Collections.filter('Title','Mikey').Count %><span
                                                    class="mine">=Y</span><% else_if $Collections.Count %><span>=X</span><% else %><span>=N</span><% end_if %><% if $Collections.Count %><span class="mine">=O</span><% end_if %>
                                        </div>
                                        <div class="post-share">
                                            <span style="background-image:url('BotCollection/images/logo_{$Faction}.png');">$Faction</span>
                                        </div>
                                        <% loop $BotGroups %><a href="$Top.Link(group)/$ID"><% if $Up.Faction == "Autobot" %>$aTitle<% else %>$dTitle<% end_if %></a>
                                            <% if not $last%><br/><% end_if %>
                                        <% end_loop %>
                                        <div class="clear"></div>
                                    </div>
                                </div>
                            </div>
                        </li>

                    <% end_loop %>
                    <!-- End of grid blocks -->
                </ul>
            </div>


        <% end_if %>
    </div>
</div>
