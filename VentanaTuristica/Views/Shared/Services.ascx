﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div>
    <% using (Html.BeginForm())
       {%>
    
        <input onblur="if(this.value=='') this.value='Buscar';" value="Buscar" class="mainFormInput" onfocus="if(this.value=='Buscar') this.value='';" type="text" />
        <input id="btnsearch" alt="search" name="search" class="mainFormSubmit" type="submit" />
    <%
       }%>
</div> 
<br />
<div>
    <a title="FaceBook" target="_blank" href="http://www.facebook.com/pages/Ventana-Turisticacom/113756445350700">
        <img src="<%=Url.Content("~/Content/facebook.png")%>" width="25px" /></a>
    <a title="Twitter" target="_blank" href="#">
        <img src="<%=Url.Content("~/Content/twitter.gif")%>" width="25px" /></a>
    <a title="Ingles" href="<%=Url.Action("Ingles", "Home")%>">
        <img src="<%=Url.Content("~/Content/english.png")%>" width="24px" /></a>  
    <a title="Español" href="<%=Url.Action("Espanol", "Home")%>">
        <img src="<%=Url.Content("~/Content/spanish.png")%>" width="24px" /></a>
</div>