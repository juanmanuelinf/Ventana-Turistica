<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site2.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.SubCategorium>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Gestion de SubCategorias
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    

    <% using (Html.BeginForm())
    {%>
        <fieldset>
        <legend>Buscar SubCategoria</legend>
            
            <div class="editor-label">
                <label for="Nombre">Nombre:</label>
            </div>
            <div class="editor-field">
                <%= Html.TextBox("subcategoria",null, new { @class = "text-box" })%>
            </div>
            <div class="editor-label">
                <input type="submit" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover" value="Buscar"/>
            </div>
         </fieldset>
     <%
    }%>
    <fieldset>
        <legend>SubCategorias</legend>
   
    <table>
        <td> <a title="Agregar SubCategoria" href="<%=Url.Action("Create", "SubCategorium")%>">
                <img src="<%=Url.Content("~/Content/agregar.png")%>" height="25px" width="25px" /></a></td>
        <td><%: Html.ActionLink("Nueva SubCategoria", "Create", "SubCategorium")%></td> 
    </table>
    <br />
    <%  if (Model.Count() != 0)
        { %>
    <table>
        <tr>
            <th>
                Categoria
            </th>
             <th>
                Nombre
            </th>
            <th>
                Descripcion
            </th>
            <th>
                Idioma
            </th>
        </tr>

   
    
    <% foreach (var group in Model.GroupBy(item => item.Categorium.Nombre)) { %>

     <th><%= Html.Encode(group.Key) %>

        <% foreach (var item in group) { %>
        <tr>
            <td> </td>
            <td>
                <%: item.Nombre %>
            </td>
            <td>
                <%: item.Descripcion %>
            </td>
            <td>
                <%: item.Idioma %>
            </td>
            <td>
                <a title="Eliminar SubCategoria" href="<%=Url.Action("Delete", "SubCategorium", new {id = item.IdSubCategoria})%>">
                    <img src="<%=Url.Content("~/Content/eliminar.png")%>" height="25px" width="25px" /></a>
            </td>
            <td>
                <a title="Editar SubCategoria" href="<%=Url.Action("Edit", "SubCategorium", new {  id=item.IdSubCategoria, idCat=item.Categorium.IdCategoria})%>">
                    <img src="<%=Url.Content("~/Content/editar.png")%>" height="25px" width="25px" /></a>  
            </td>
        </tr> 
             <% } %>
    
    <% } %>

    </table>
    <% }
    else
    {%> <h2>No Hay SubCategorias...</h2>
          
<%  } %>
   </fieldset>
    <script type="text/javascript">
        $(document).ready(function () {
            $("input#subcategoria").autocomplete('<%= Url.Action("Find", "SubCategorium") %>');
        }); 
    </script>
</asp:Content>

