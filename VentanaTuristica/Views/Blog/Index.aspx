<%@ Page Title="" Language="C#" ValidateRequest="false" MasterPageFile="~/Views/Shared/Site2.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.Blog>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Entradas del blog
</asp:Content>

<asp:Content ID="Content2" ValidateRequest="false" ContentPlaceHolderID="MainContent" runat="server">

    <h2></h2>

    <% using (Html.BeginForm())
    {%>
        <fieldset>
        <legend>Buscar Entrada blog</legend>
            
            <div class="editor-label">
                <label for="Nombre">Nombre: </label>
            </div>
            <div class="editor-field">
                <%= Html.TextBox("entrada",null, new { @class = "text-box" })%>
            </div>
            <div class="editor-label">
                <input type="submit" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover" value="Buscar"/>
            </div>
         </fieldset>
     <%
    }%>

    <fieldset>
    <legend>Entradas del blog</legend>

    <table>
        <td> <a title="Agregar entrada" href="<%=Url.Action("Create", "Blog")%>">
            <img src="<%=Url.Content("~/Content/agregar.png")%>" height="25px" width="25px" /></a></td>
        <td><%: Html.ActionLink("Nueva Entrada al Blog", "Create", "Blog")%></td> 
    </table>
    <br />
    <%  if (Model.Count() != 0)
        { %>
    <table>
        <tr>
            <th>
                Titulo
            </th>
            <th>
                Fecha
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: item.Titulo %>
            </td>
            <td>
                <%: String.Format("{0:g}", item.Fecha) %>
            </td>
             <td>
                <a title="Eliminar Entrada" href="<%=Url.Action("Delete", "Blog", new {id = item.IdBlog})%>">
                <img src="<%=Url.Content("~/Content/eliminar.png")%>" height="25px" width="25px" /></a>
            </td>
             <td>
                <a title="Editar Entrada" href="<%=Url.Action("Edit", "Blog", new {id = item.IdBlog})%>">
                <img src="<%=Url.Content("~/Content/editar.png")%>" height="25px" width="25px" /></a>             
            </td>
        </tr>
    
    <% } %>

    </table>
    <% }
    else
    {%> 
        <h2>No Hay Entradas al Blog...</h2>  
<%  } %>
   </fieldset>
   <script type="text/javascript">
       $(document).ready(function () {
           $("input#entrada").autocomplete('<%= Url.Action("Find", "Blog") %>');
       }); 
    </script>
</asp:Content>