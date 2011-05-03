<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div style="margin-right:30px">
    <% using (Html.BeginForm())
       {%>
    
        <input onblur="if(this.value=='') this.value='Buscar';" value="Buscar" class="mainFormInput" onfocus="if(this.value=='Buscar') this.value='';" type="text" />
        <input id="btnsearch" alt="search" name="search" class="mainFormSubmit" type="submit" />
    <%
       }%>
</div> 
<br />
<div style="margin-right:50px">
    <img src="<%=Url.Content("~/Content/iconos.png")%>"/>
    <a title="Ingles" href="<%=Url.Action("Ingles", "Home")%>">
        <img src="<%=Url.Content("~/Content/ingles.png")%>" /></a>  
    <a title="Español" href="<%=Url.Action("Espanol", "Home")%>">
        <img src="<%=Url.Content("~/Content/espanol.png")%>" /></a>
</div>