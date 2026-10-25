<!DOCTYPE HTML>
<html>
<head>
    <title>$Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link href="$ThemeDir/css/style.css" rel='stylesheet' type='text/css'/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    $MetaTags
    <base href="http://botcollection.local/">
    <!--[if lte IE 6]></base><![endif]-->
    <link rel="shortcut icon" type="image/x-icon" href="$ThemeDir/images/fav-icon.png"/>
    <link rel="stylesheet" href="$ThemeDir/css/main.css">
    <!--<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'/>-->

    <script src="$ThemeDir/js/jquery.min.js"></script>

    <!----start-dropdown--->
    <script type="text/javascript">
        const $ = jQuery.noConflict();
        var Xgrid = window.Xgrid || {};
        $(function () {
            $('#activator').click(function () {
                $('#box').animate({'top': '0px'}, 500);
            });
            $('#boxclose').click(function () {
                $('#box').animate({'top': '-700px'}, 500);
            });

            $('#zoomOut').click(()=>{
                const was = +$('#main').css('zoom');
                const now = (was - 0.1).toFixed(2);
                if (now >= 0.2) {
                    $('#main').css('zoom', now);
                    $("#zoomNow").text((now * 100).toFixed(0));
                    Xgrid.isotope();
                }
            });
            $('#zoomIn').click(()=>{
                const was = +$('#main').css('zoom');
                const now = (was + 0.1).toFixed(2);
                if (now <= 2) {
                    $('#main').css('zoom', now);
                    $("#zoomNow").text((now * 100).toFixed(0));
                    Xgrid.isotope();
                }
            });
            $("#zoomNow").text((+$('#main').css('zoom') * 100).toFixed(0));
            $('#toggleStats').on('click', function(){
                $('.post-info').toggle();
            });
            
        });

            function zoom(e){
              const zoomer = e.currentTarget;
              !isNaN(e.offsetX) ? offsetX = e.offsetX : e.touches[0].pageX
              !isNaN(e.offsetY) ? offsetY = e.offsetY : e.touches[0].pageY
              x = offsetX/zoomer.offsetWidth*100
              y = offsetY/zoomer.offsetHeight*100
              zoomer.style.backgroundPosition = x + '% ' + y + '%';
            }
            function setPreviewImg(e){
              e.preventDefault();
              const currentTarget = e.currentTarget || e.target;
              $('#the-bigBoy').css({'background-image': 'url(' + $(currentTarget).data('zoom') + ')', 'transform-origin': $(currentTarget).data('origin')});
              $('#the-bigBoy img').prop('src', $(currentTarget).data('src'));
              $('#the-bigBoy a').prop('href', $(currentTarget).prop('href'));
              return false;
            }


        $(document).ready(function () {
            //Hide (Collapse) the toggle containers on load
            $(".toggle_container").hide();
            //Switch the "Open" and "Close" state per click then slide up/down (depending on open/close state)
            $(".trigger").click(function () {
                $(this).toggleClass("active").next().slideToggle("slow");
                return false; //Prevent the browser jump to the link anchor
            });

        });

        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- end scrip -->
</head>
<body>
<!---start-wrap---->
<!---start-header---->
<div class="header">
    <div class="wrap">
        <%--<div class="logo">
					<a href="/"><img src="$ThemeDir/images/logo.png" title="pinbal" /></a>
				</div>--%>
        <div class="nav-icon">
            <a href="#" class="right_bt" id="activator"><span> </span> </a>
        </div>
        <div class="box" id="box">
            <div class="box_content">
                <div class="box_content_center">
                    <div class="form_content">
                        <div class="menu_box_list">
                            <ul>
                                <% loop Menu(1) %>
                                    <li><a href="$Link"><span>$MenuTitle</span></a></li>
                                <% end_loop %>
                                <div class="clear"></div>
                            </ul>
                        </div>
                        <a class="boxclose" id="boxclose"> <span> </span></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="top-searchbar">
            $SearchForm
            <form action="$Link('SearchForm')" class=quicksearch>
                <input type="submit" value="Search" disabled/>
                <input type="text" class=quicksearch name="Search" list="dataList" />
                <datalist id="dataList">
                  <option value="=A">Autobot</option>
                  <option value="=D">Deception</option>
                  <option value="=F">Female</option>
                  <option value="=M">Male</option>
                  <option value="=L">Leader</option>
                  <option value="=Y">Yes allocated</option>
                  <option value="=X">Extras unallocated</option>
                  <option value="=N">Not owned</option>
                  <option value="=O">Owned</option>
                  <option value="=U">Unchanged</option>
                  <option value="=K">Customised</option>
                  <option value="=C">Completed</option>
                  <option value="=P">In Progress</option>
                </datalist>
                <input type="reset" value="Reset"/>
            </form>
        </div>
        <div class="userinfo">
            <div class="user">
                <ul>
                <li><button class="button" type=button id="toggleStats">Toggle Stats</button></li>
                <li><button class="button" type=button id="zoomIn">+</button></li>
                <li>Zoom <span id="zoomNow"></span>%</li>
                <li><button class="button" type="button" id="zoomOut">-</button></li>
                    <%--<li><a href="#"><img src="$ThemeDir/images/user-pic.png" title="user-name" /><span>Ipsum</span></a></li>--%>
                </ul>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<!---//End-header---->


    $Layout


<!----start-footer--->
<div class="footer">
    <%--<p>Design by <a href="http://w3layouts.com/">W3layouts</a></p>--%>
    <p><a href="#top" onclick="window.scrollTo({top:0, behavior:'smooth'}); return false;">Back to top</a></p>
</div>

<%--
<% if not $LiveSite %>
<div id='EditControlsDetector'>

</div>
<% end_if %>
<div id="FrontendEditingControls" data-islive="<% if $LiveSite %>true<% end_if %>">
    <% if $LiveSite %>
        <input type="button" value="<% _t('FrontendEdit.EDIT_DRAFT_PAGE','Edit Draft Page') %>" id="FE_EditDraft"/>
    <% else %>
        <input type="button" value="<% _t('FrontendEdit.VIEW_PUBLISHED_PAGE','View Published Page') %>"
               id="FE_ViewPublished"/>
    <% end_if %>
    <input type="button" value="<% _t('FrontendEdit.START_EDITING','Open Editor') %>" id="FE_SwitchOn"/>
    <input type="button" value="<% _t('FrontendEdit.STOP_EDITING','Close Editor') %>" id="FE_SwitchOff"/>
</div>
--%>
<!----//End-footer--->
<!---//End-wrap---->

</body>
</html>
