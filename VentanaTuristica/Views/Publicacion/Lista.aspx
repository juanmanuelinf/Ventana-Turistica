<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site2.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.Publicacion>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2></h2>
<%if (Model != null)
  {%>
  <%var cuenta = Convert.ToInt32(ViewData["cuenta"]);%>
   <table border=1>
   <tr>
   <td style="width: 612px">
       <%if (cuenta >= 1)
         {%>
         <b><%= Model.ElementAt(0).Nombre%></b>
           <%if (Model.ElementAt(0).Imagen != null)
            {%> 
            <img  height="150px" width="150px" src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(0).Imagen.IdImagen})%>' />
            <%}%>
       <%}%></td>
   <td style="width: 612px">
       <%if (cuenta >= 2)
         {%>
         <b><%= Model.ElementAt(1).Nombre%></b>
            <%if (Model.ElementAt(1).Imagen != null)
            {%> 
            <img height="150px" width="150px" src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(1).Imagen.IdImagen})%>' />
            <%}%>
       <%}%></td>
   <td style="width: 612px">
       <%if (cuenta >= 3)
         {%>
         <b><%= Model.ElementAt(2).Nombre%></b>
           <%if (Model.ElementAt(2).Imagen != null)
            {%> 
            <img height="150px" width="150px" src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(2).Imagen.IdImagen})%>' />
            <%}%>
       <%}%></td>
   <td style="width: 612px">
       <%if (cuenta >= 4)
         {%>
         <b><%= Model.ElementAt(3).Nombre%></b>
           <%if (Model.ElementAt(3).Imagen != null)
            {%> 
            <img height="150px" width="150px" src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(3).Imagen.IdImagen})%>' />
            <%}%>
       <%}%></td>
   </tr>
   <tr>
   <td style="width: 612px">
       <%if (cuenta >= 5)
         {%>
         <b><%= Model.ElementAt(4).Nombre%></b>
           <%if (Model.ElementAt(4).Imagen != null)
            {%> 
            <img height="150px" width="150px" src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(4).Imagen.IdImagen})%>' />
            <%}%>
       <%}%></td>
   <td style="width: 612px">
       <%if (cuenta >= 6)
         {%>
         <b><%= Model.ElementAt(5).Nombre%></b>
            <%if (Model.ElementAt(5).Imagen != null)
            {%> 
            <img height="150px" width="150px" src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(5).Imagen.IdImagen})%>' />
            <%}%>
       <%}%></td>
   <td style="width: 612px">
       <%if (cuenta >= 7)
         {%>
         <b><%= Model.ElementAt(6).Nombre%></b>
           <%if (Model.ElementAt(6).Imagen != null)
            {%> 
            <img height="150px" width="150px" src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(6).Imagen.IdImagen})%>' />
            <%}%>
            
       <%}%></td>
   <td style="width: 612px">
       <%if (cuenta >= 8)
         {%>
         <b><%= Model.ElementAt(7).Nombre%></b>
            <%if (Model.ElementAt(7).Imagen != null)
            {%> 
            <img height="150px" width="150px" src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(7).Imagen.IdImagen})%>' />
            <%}%>
       <%}%></td>
   </tr>
   <tr>
   <td style="width: 612px">
       <%if (cuenta >= 9)
         {%>
         <b><%= Model.ElementAt(8).Nombre%></b>
            <%if (Model.ElementAt(8).Imagen != null)
            {%> 
            <img height="150px" width="150px" src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(8).Imagen.IdImagen})%>' />
            <%}%>
       <%}%></td>
   <td style="width: 612px">
       <%if (cuenta >= 10)
         {%>
         <b><%= Model.ElementAt(9).Nombre%></b>
            <%if (Model.ElementAt(9).Imagen != null)
            {%> 
            <img height="150px" width="150px" src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(9).Imagen.IdImagen})%>' />
            <%}%>
       <%}%></td>
   <td style="width: 612px">
       <%if (cuenta >= 11)
         {%>
         <b><%= Model.ElementAt(10).Nombre%></b>
            <%if (Model.ElementAt(10).Imagen != null)
            {%> 
            <img height="150px" width="150px" src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(10).Imagen.IdImagen})%>' />
            <%}%>
       <%}%></td>
   <td style="width: 612px">
       <%if (cuenta >= 12)
         {%>
         <b><%= Model.ElementAt(11).Nombre%></b>
           <%if (Model.ElementAt(11).Imagen != null)
            {%> 
            <img height="150px" width="150px" src='<%=Url.Action("Show", "Publicacion", new {id = Model.ElementAt(11).Imagen.IdImagen})%>' />
            <%}%>
       <%}%></td>
   </tr>
   </table>
    
    <%}%> 
    
</asp:Content>