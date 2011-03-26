<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div style="margin-right:30px">
    Buscar: <input type="text" id="buscar" name="buscar" /> <img src="<%=Url.Content("~/Content/buscar.png")%>" height="15px" width="15px" />
</div>
<br />
<div style="margin-right:50px">
    <img src="<%=Url.Content("~/Content/iconos.png")%>"/>
    <a title="Ingles" href="<%=Url.Action("Ingles", "Home")%>">
        <img src="<%=Url.Content("~/Content/ingles.png")%>" /></a>  
    <a title="Español" href="<%=Url.Action("Espanol", "Home")%>">
        <img src="<%=Url.Content("~/Content/espanol.png")%>" /></a>
</div>,