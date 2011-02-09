<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site2.Master" Inherits="System.Web.Mvc.ViewPage<VentanaTuristica.Model.Publicacion>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>- Publicidad -</h2>

<table border="1">
<tr>

<%foreach (var imagene in Model.Imagenes){%>
   <td>
   <img src='<%= Url.Action( "Show", "Publicacion", new { id = imagene.IdImagen } ) %>' />
   </td>
 <%}%>

</tr>
</table>

    <fieldset>
        <legend>Detalles:</legend>
        <p>
            Nro:
            <%= Html.Encode(Model.IdPublicacion) %>
        </p>
        <p>
            Latitud:
            <%= Html.Encode(Model.Latitud) %>
        </p>
        <p>
            Longitud:
            <%= Html.Encode(Model.Longitud) %>
        </p>

        <p>
            Servicios:
       
        <%foreach (var servicio in Model.Servicios)
          {%>

          <p>
            <%= Html.Encode(servicio.Nombre) %>
          </p>

        <%}%>

         </p>

         <p>
            Detalles:
       
        <%foreach (var idioma in Model.Idioma)
          {%>

          <p>
          <p>
           Categoria:
          </p>
          <p><%= Html.Encode(idioma.Categoria) %></p>
            
            <p>
           Descripcion:
          </p>
          <p> <%= Html.Encode(idioma.Descripcion) %></p>
           
            <p>
           Notas:
          </p>
          <p>  <%= Html.Encode(idioma.Notas) %></p>
          
            <p>
           Procesos Ecologicos:
          </p>
          <p> <%= Html.Encode(idioma.ProcesosEcologicos) %></p>
           
          </p>

        <%}%>

         </p>

    </fieldset>
    <p>
        <%=Html.ActionLink("Editar", "Edit", new { id=Model.IdPublicacion }) %> |
        <%=Html.ActionLink("Volver a la lista", "Index")%>
    </p>

</asp:Content>
