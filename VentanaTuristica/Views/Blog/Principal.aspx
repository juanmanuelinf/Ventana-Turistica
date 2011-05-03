<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.Blog>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Blog
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 style="color: #F9A62B">Bienvenido a mi Blog</h2>

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
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            
            <td>
                &nbsp;</td>
            <td>
                <%: String.Format("{0:g}", item.Fecha) %>
            </td>
            <td>
                <%: item.IdBlog %>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

