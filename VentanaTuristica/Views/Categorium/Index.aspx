<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site2.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.Categorium>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Gestion de Categorias
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2></h2>

    <% using (Html.BeginForm())
    {%>
        <fieldset>
        <legend>Buscar Categoria</legend>
            
            <div class="editor-label">
                <label for="Nombre">Nombre:</label>
            </div>
            <div class="editor-field">
                <%= Html.TextBox("categoria",null, new { @class = "text-box" })%>
            </div>
            <div class="editor-label">
                <input type="submit" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover" value="Buscar"/>
            </div>
         </fieldset>
     <%
    }%>

    <fieldset>
    <legend>Categorias</legend>

    <table>
        <td> <a title="Agregar Patrocinante" href="<%=Url.Action("Create", "Categorium")%>">
            <img src="<%=Url.Content("~/Content/agregar.png")%>" height="25px" width="25px" /></a></td>
        <td><%: Html.ActionLink("Nueva Categoria", "Create", "Categorium")%></td> 
    </table>
    <br />
    <%  if (Model.Count() != 0)
        { %>
        <table>
            <tr>
                <th>
                    Nombre
                </th>
                <th>
                    Descripcion
                </th>
                <th>
                    FkIdCategoria
                </th>
                <th>
                    Idioma
                </th>
            </tr>

         <%foreach (var item in Model)
          { %>
    
            <tr>
                <td>
                    <%: item.Nombre %>
                </td>
                <td>
                    <%: item.Descripcion %>
                </td>
                <td>
                    <%: item.FkIdCategoria %>
                </td>
                <td>
                    <%: item.Idioma %>
                </td>
                <td>
                    <a title="Eliminar Categoria" href="<%=Url.Action("Delete", "Categorium", new {id = item.IdCategoria})%>">
                    <img src="<%=Url.Content("~/Content/eliminar.png")%>" height="25px" width="25px" /></a>
                </td>
                <td>
                    <a title="Editar Categoria" href="<%=Url.Action("Edit", "Categorium", new {id = item.IdCategoria})%>">
                    <img src="<%=Url.Content("~/Content/editar.png")%>" height="25px" width="25px" /></a>         
                </td>
            </tr>
          <%  
          }%>

        </table>
    <% }
    else
    {%> 
        <h2>No Hay Categorias...</h2>  
<%  } %>
   </fieldset>
   <script type="text/javascript">
       $(document).ready(function () {
           $("input#categoria").autocomplete('<%= Url.Action("Find", "Categorium") %>');
       }); 
    </script>
</asp:Content>

