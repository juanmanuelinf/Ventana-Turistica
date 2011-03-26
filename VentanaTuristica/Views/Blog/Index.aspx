<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.Blog>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <table>
        <tr>
            <th>
                Titulo
            </th>
            <th>
                Descripcion
            </th>
            <th>
                Fecha
            </th>
            <th>
                IdBlog
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: item.Titulo %>
            </td>
            <td>
                <%: item.Descripcion %>
            </td>
            <td>
                <%: String.Format("{0:g}", item.Fecha) %>
            </td>
            <td>
                <%: item.IdBlog %>
            </td>
             <td>
                        <a title="Eliminar Entrada" href="<%=Url.Action("Delete", "Blog", new {id = item.IdBlog})%>">
                        <img src="<%=Url.Content("~/Content/eliminar.png")%>" height="25px" width="25px" /></a>
            </td>
             <td>
                <%: Html.ActionLink("Edit", "Edit", new {  id=item.IdBlog}) %>           
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Crear nueva entrada", "Create") %>
    </p>

</asp:Content>