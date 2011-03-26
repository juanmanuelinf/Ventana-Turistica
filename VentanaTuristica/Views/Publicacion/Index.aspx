<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site2.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.Publicacion>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Gestion de Publicaciones
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2></h2>
    
    <% using (Html.BeginForm())
    {%>
        <fieldset>
        <legend>Buscar Publicacion</legend>
            
            <div class="editor-label">
                <label for="Nombre">Nombre:</label>
            </div>
            <div class="editor-field">
                <%= Html.TextBox("publicacion", null, new { @class = "text-box" })%>
            </div>
            <div class="editor-label">
                <input type="submit" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover" value="Buscar"/>
            </div>
         </fieldset>
     <%
    }%>
    <fieldset>
        <legend>Publicaciones</legend>
   
    <table>
        <td> <a title="Agregar Publicacion" href="<%=Url.Action("Create", "Publicacion")%>">
                <img src="<%=Url.Content("~/Content/agregar.png")%>" height="25px" width="25px" /></a></td>
        <td><%: Html.ActionLink("Nueva Publicacion", "Create", "Publicacion")%></td> 
    </table>
    <br />
    <%if (Model.Count() != 0)
          { %>
        <table>
        <tr>
            <th>
                Publicacion #
            </th>
            <th>
                Empresa
            </th>
            <th>
                Categoria
            </th>
            <th>
                SubCategoria
            </th>
        </tr>

    <%     foreach (var item in Model)
           {%>
             <tr>
                <td>
                    <%:item.IdPublicacion%>
                </td>
                <td>
                    <%:item.Empresa.Nombre%>
                </td>
                <td>
                    <%:item.SubCategorium.Categorium.Nombre%>
                </td>
                <td>
                    <%:item.SubCategorium.Nombre%>
                </td>
                <td>
                     <a title="Eliminar Publicacion" href="<%=Url.Action("Delete", "Publicacion", new {id = item.IdPublicacion}, null)%>">
                        <img src="<%=Url.Content("~/Content/eliminar.png")%>" height="25px" width="25px" /></a>
                </td>
                <td>
                    <a title="Editar Publicacion" href="<%=Url.Action("Edit", "Publicacion", new {id = item.IdPublicacion})%>">
                        <img src="<%=Url.Content("~/Content/editar.png")%>" height="25px" width="25px" /></a>           
                </td>
            </tr>
      
        <%}
       %>
      </table>
      <%}
       else
       {%> 
            <h2>No Hay Publicaciones...</h2>
      <%
       } %>
   </fieldset>
<script type="text/javascript">

           $(document).ready(function () {
               $("input#publicacion").autocomplete('<%= Url.Action("Find", "Publicacion") %>');
           }); 

</script>

</asp:Content>