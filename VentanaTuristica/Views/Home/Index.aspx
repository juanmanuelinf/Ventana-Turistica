<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.Categorium>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Ventana Turistica
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 
<div id="menucontainer">
    <ul id="nav">         
        <li><%: Html.ActionLink("Página principal", "Index", "Home")%></li>     
        <% 
        if (Model != null)
        {
            foreach (var item in Model)
            {%>
                <li><%:Html.ActionLink(item.Nombre, "About", "Home")%>
                
                <%
                foreach (var subCategorium in item.SubCategoriums)
                {%>
                    <ul>
                        <li><a href="#"><%: subCategorium.Nombre%></a></li>
                    </ul>
                    <%
                }%>
               
                </li>
            <%  }
        } %>
        
    </ul>
</div>

<img src="../../Content/header-bg.jpg" style="width: 100%"/>

<table style=" width:100%;">
    <tr align="center" bottom="middle">
        <td valign="middle">
            <img src="../../Content/promo1.png"/>
        </td>
        <td valign="middle">
            <img src="../../Content/promo2.png"/>
        </td>
        <td valign="middle">
            <img src="../../Content/promo3.png"/>
        </td>
    </tr>
</table>
<table style=" width:100%;">
    <tr align="center" bottom="middle">
        <td valign="middle">
            <img src="../../Content/LogoPromo1.png"/>
        </td>
        <td valign="middle">
            <img src="../../Content/LogoPromo2.png"/>
        </td>
        <td valign="middle">
            <img src="../../Content/LogoPromo3.png"/>
        </td>
        <td valign="middle">
            <img src="../../Content/LogoPromo4.png"/>
        </td>
        <td valign="middle">
            <img src="../../Content/LogoPromo5.png"/>
        </td>
        <td valign="middle">
            <img src="../../Content/LogoPromo6.png"/>
        </td>
        <td valign="middle">
            <img src="../../Content/LogoPromo7.png"/>
        </td>
    </tr>
</table>


    <!-- Load the Mootools Framework -->
	<script src="http://www.google.com/jsapi"></script>
    <script>        google.load("mootools", "1.2.1");</script>	
	
	<!-- Load the MenuMatic Class -->
	<script type="text/javascript" src="<%:Url.Content("~/Scripts/MenuMatic_0.68.3.js") %>"></script>
	
	<!-- Create a MenuMatic Instance -->
	<script type="text/javascript" >
	    window.addEvent('domready', function () {
	        var myMenu = new MenuMatic();
	    });		
	</script>
	
	<!-- begin google tracking code -->
	 <script type="text/javascript">
	     var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
	     document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
    </script>
    <script type="text/javascript">
        var pageTracker = _gat._getTracker("UA-2180518-1");
        pageTracker._initData();
        pageTracker._trackPageview();
    </script>
	<!-- end google tracking code -->
	
 
</asp:Content>
