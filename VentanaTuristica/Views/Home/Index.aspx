<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.Categorium>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Ventana Turistica
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<script type="text/javascript" src="<%:Url.Content("~/Scripts/jscroller2-1.61.js") %>"></script>

<img src="../../Content/header-bg.jpg" style="width: 870px"/>

<style>
/* Scroller Box */
#scroller_container1 {
     width: 870px;
     height: 200px;
     overflow: hidden;
    }

    /* CSS Hack Safari */
    #dummy {;# }

    #scroller_container1 {
    overflow: auto;
    }
    /* Scoller Box */
</style>    

<div id="scroller_container1">
 <div class="jscroller2_left jscroller2_speed-50 jscroller2_ignoreleave jscroller2_mousemove jscroller2_dynamic" style="font-size:60px; line-height:60px; white-space:nowrap; margin: 0;">
  <img src="../../Content/promo1.png" alt="">
  <img src="../../Content/promo2.png" alt="">
  <img src="../../Content/promo3.png" alt="">
 </div>
 <div class="jscroller2_left_endless" style="font-size:60px; line-height:60px; white-space:nowrap; margin: 0;">
  <img src="../../Content/blanco.bmp" alt="">
  <img src="../../Content/promo1.png" alt="">
  <img src="../../Content/promo2.png" alt="">
  <img src="../../Content/promo3.png" alt="">
  <img src="../../Content/blanco.bmp" alt="">
 </div>
</div>

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
</asp:Content>
