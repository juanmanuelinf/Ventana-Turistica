<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.Categorium>>" %>

<script runat="server">

    protected override void InitializeCulture()
    {
        base.InitializeCulture();
        if (Session["culture"] != null)
        {
            Culture = Session["culture"].ToString();
            UICulture = Session["culture"].ToString();
        }
    }
    
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Ventana Turistica
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<img src="../../Content/header-bg.jpg" style="width: 100%"/>

<style type="text/css" media="screen">

/*
	root element for the scrollable.
	when scrolling occurs this element stays still.
*/
.scrollable {
	position:relative;
	overflow:hidden;
	width: 100%;
	height:150px;
}

/*
	root element for scrollable items. Must be absolutely positioned
	and it should have a extremely large width to accomodate scrollable items.
	it's enough that you set the width and height for the root element and
	not for this element.
*/
.scrollable .items {
	/* this cannot be too large */
	width:20000em;
	position:absolute;
	clear:both;
}

.items div {
	float:left;
	width:900px;
}

/* single scrollable item */
.scrollable img {
	float:left;
	margin:0px 5px 0px 5px;
	background-color:#fff;
	padding:2px;
	border:1px solid #fff;
	
	-moz-border-radius:4px;
	-webkit-border-radius:4px;
}
</style>  


<!-- root element for scrollable -->
<div class="scrollable" id="scroller">   
   
   <!-- root element for the items -->
   <div class="items" style="left: -2040px; ">
        <% Html.RenderAction("Sponsors","Patrocinante");%>
   </div>   
</div>

    <% Html.RenderAction("Logos","Patrocinante");%>

<!-- javascript coding -->
<script type="text/javascript">
    jQuery.noConflict();
    jQuery(document).ready(function() {
    var root = jQuery("#scroller").scrollable({circular: true}).autoscroll({ autoplay: true });
    window.api = root.data("scrollable");
    });
</script>

</asp:Content>
