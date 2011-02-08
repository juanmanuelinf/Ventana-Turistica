<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site2.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.Categorium>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

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
                IdCategoria
            </th>
            <th>
                Idioma
            </th>
        </tr>

     <%foreach (var item in Model)
      {
          if (Model != null)
          {%>
    
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
                <%: item.IdCategoria %>
            </td>
            <td>
                <%: item.Idioma %>
            </td>
            <td>
                        <a title="Eliminar Categoria" href="<%=Url.Action("Delete", "Categorium", new {id = item.IdCategoria})%>">
                        <img src="<%=Url.Content("~/Content/eliminar.png")%>" height="25px" width="25px" /></a>
            </td>
             <td>
                <%: Html.ActionLink("Edit", "Edit", new {  id=item.IdCategoria}) %>           
            </td>
        </tr>
      <%}
          else
          {%> <h2>No Hay Categorias...</h2>
          
      <%
          }
      }%>

    </table>

    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

