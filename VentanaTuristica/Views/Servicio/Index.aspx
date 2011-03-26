<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site2.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.Servicio>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Gestion de Servicios
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2></h2>
    
    <% using (Html.BeginForm())
    {%>
        <fieldset>
        <legend>Buscar Servicio</legend>
            
            <div class="editor-label">
                <label for="Nombre">Nombre:</label>
            </div>
            <div class="editor-field">
                <%= Html.TextBox("servicio", null, new { @class = "text-box" })%>
            </div>
            <div class="editor-label">
                <input type="submit" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover" value="Buscar"/>
            </div>
         </fieldset>
     <%
    }%>
    <fieldset>
        <legend>Servicios</legend>
   
    <table>
        <td> <a title="Agregar Servicio" href="<%=Url.Action("Create", "Servicio")%>">
                <img src="<%=Url.Content("~/Content/agregar.png")%>" height="25px" width="25px" /></a></td>
        <td><%: Html.ActionLink("Nuevo Servicio", "Create", "Servicio")%></td> 
    </table>
    <br />
        <%if (Model.Count() != 0)
          { %>
    <table>
        <tr>
            <th>
                Descripcion
            </th>
            <th>
                Idioma
            </th>
            <th>
                Nombre
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: item.Descripcion %>
            </td>
            <td>
                <%: item.Idioma %>
            </td>
            <td>
                <%: item.Nombre %>
            </td>
            <td>
                <a title="Eliminar Servicio" href="<%=Url.Action("Delete", "Servicio", new {id = item.IdServicio}, null)%>">
                    <img src="<%=Url.Content("~/Content/eliminar.png")%>" height="25px" width="25px" /></a>
            </td>
            <td>
                <a title="Editar Categoria" href="<%=Url.Action("Edit", "Servicio", new {id = item.IdServicio})%>">
                    <img src="<%=Url.Content("~/Content/editar.png")%>" height="25px" width="25px" /></a>           
            </td>
        </tr>
    
    <% } %>

    </table>
    <% }
    else
    {%> 
        <h2>No Hay Servicios...</h2>
<%  } %>
   </fieldset>

    <script type="text/javascript">
        $(document).ready(function () {
            $("input#servicio").autocomplete('<%= Url.Action("Find", "Servicio") %>');
        }); 
    </script>

</asp:Content>

