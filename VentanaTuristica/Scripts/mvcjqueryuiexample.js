var currentTheme = "";
var originalTheme = "";

function initialise() {
    intitialiseTabs();
    initialiseButtons();
}

/********************************************************/
/*                                                      */
/*                  Mouse hover events                  */
/*                                                      */
/********************************************************/

function initialiseButtons() {
    /// <summary>
    /// Hook the mouseover and mouseout events for the usermenu.
    /// </summary>

    if ($(".usermenu > ul > li > a").length > 0) {
        $(".usermenu > ul > li > a").unbind("mouseover", onMouseOver);
        $(".usermenu > ul > li > a").bind("mouseover", onMouseOver);
        $(".usermenu > ul > li > a").unbind("mouseout", onMouseOut);
        $(".usermenu > ul > li > a").bind("mouseout", onMouseOut);
    }
}

function intitialiseTabs() {
    /// <summary>
    /// Hook the mouseover and mouseout events for the main page tabs.
    /// </summary>

    if ($(".ui-tabs-nav > li").length > 0) {
        $(".ui-tabs-nav > li").unbind("mouseover", onMouseOver);
        $(".ui-tabs-nav > li").bind("mouseover", onMouseOver);
        $(".ui-tabs-nav > li").unbind("mouseout", onMouseOut);
        $(".ui-tabs-nav > li").bind("mouseout", onMouseOut);
    }
}

function onMouseOver(event) {
    /// <summary>
    /// Add the JQueryUI hover state css class.
    /// </summary>

    $(this).addClass("ui-state-hover");
}

function onMouseOut(event) {
    /// <summary>
    /// Remove the JQueryUI hover state css class.
    /// </summary>

    $(this).removeClass("ui-state-hover");
}

/********************************************************/
/*                                                      */
/*                  Edit Profile                        */
/*                                                      */
/********************************************************/
function initialiseSettings() {
    /// <summary>
    /// Called from the edit profile page. Sets up the tabs to be JQueryUI tabs, initialises the themes select box and preloads the busy image.
    /// </summary>

    // Setup the tabs
    $("#editprofile").tabs();

    // initialise the themes select options
    initialiseThemes();

    // preload the busy image
    $.loadImages('/Hilvilla/Content/ajax-loader.gif', preloadDone());
}

/********************************************************/
/*                                                      */
/*                  Theme changes                       */
/*                                                      */
/********************************************************/
function initialiseThemes() {
    /// <summary>
    /// Get the current theme from the select element and hook the change event.
    /// </summary>

    if ($("#theme").length > 0) {
        // get the current theme setting from the select
        currentTheme = $("#theme option:selected").val();
        originalTheme = currentTheme;
        // hook the change event of the select element
        $("#theme").change(onThemeChanged);
        // make sure we aren't showing the theme message hint
        $("#thememessage").hide();
    }
}

function onThemeChanged() {
    /// <summary>
    /// Fired when the theme changes, load the new css and wait for it to complete asynchronously while diplsaying a busy indicator.
    /// </summary>

    // get the first link that points to a css in our themes folder
    var link = $("link[href*='Hilvilla/Content/themes/']")[0];

    // get the newly selected theme from the select element
    var newTheme = $("#theme").children("option:selected").text();
    newTheme = $.trim(newTheme);

    // build the url for the new css file
    var newLinkHref = "/Hilvilla/Content/themes/" + newTheme + "/jquery.ui.all.css";

    // if the theme has changed and not been saved show a message that it has not been saved yet
    if (originalTheme != newTheme) {
        $("#thememessage").show(1000);
    }
    // else clear it if saved
    else {
        $("#thememessage").hide();
    }

    // update the current theme
    currentTheme = newTheme;

    // show the busy modal dialog
    showBusy();

    // this is a hack for IE which blocks any other operation (in this case showing the dialog) as soon as another operation is in progress (in this case the ajax load of the new css stylesheet)
    setTimeout(function () { getCss(newLinkHref) }, 5);
}

function getCss(newLinkHref) {
    /// <summary>
    /// Uses the getCSS jquery plugin to retrieve the new css stylesheet for the chosen theme.
    /// </summary>

    // use ajax to get the new css file
    $.getCSS(newLinkHref, cssLoaded);
}

function cssLoaded() {
    /// <summary>
    /// Called once the new stylesheet has been loaded, this lets us know when to remove the old stylesheet.
    /// </summary>

    // remove the old element
    var cssLinks = $("link[href*='/Hilvilla/Content/themes']");
    if (cssLinks.length > 1) {
        var toDieLinks = cssLinks.slice(0, cssLinks.length - 1)
        // kill all but the last link to one of the jquery themes, the last one will be the new theme
        toDieLinks.each(function (link) {
            $(this).remove();
        });
    }

    // hide the busy modal dialog
    hideBusy();
}

function showBusy() {
    /// <summary>
    /// Shows a busy box, or if the first time first creates the DOM elements then shows them.
    /// </summary>
        
    // append a div with the busy image in it
    // check if we have not already added it to the document
    if ($("#busyIndicator").length == 0) {
        $OuterDiv = $('<div></div>')
            .hide()
            .attr({ id: "busyIndicator" })
            .append($('<img></img>')
                .attr({ alt: "" })
                .attr({ src: "/Hilvilla/Content/ajax-loader.gif" })
                .attr({ width: 64 })
                .attr({ height: 64 })
            );

        $("body").append($OuterDiv);
    }
    // show the modal dialog
    $("#busyIndicator").dialog({ modal: true, draggable: false, resizable: false, closeOnEscape: false, title: 'Loading theme, please wait...' });
    
    // hack to remove the close button from the dialog
    $(".ui-dialog-titlebar-close").attr('style', 'display: none');
}

function hideBusy() {
    /// <summary>
    /// Closes the open dialog box.
    /// </summary>

    // close the dialog
    $("#busyIndicator").dialog("close");
}

function preloadDone() {
    
}