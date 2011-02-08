<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site2.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.SubCategorium>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	SubCategorias
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Lista de SubCategorias</h2>

    <table>
        <tr>
            <th></th>
             <th>
                Nombre
            </th>
            <th>
                Descripcion
            </th>
            <th>
                Idioma
            </th>
            <th>
                IdSubCategoria
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
                <%: item.IdSubCategoria %>
            </td>
            
             <td>
                        <a title="Eliminar SubCategoria" href="<%=Url.Action("Delete", "SubCategorium", new {id = item.IdSubCategoria})%>">
                        <img src="<%=Url.Content("~/Content/eliminar.png")%>" height="25px" width="25px" /></a>
            </td>
             <td>
                <%: Html.ActionLink("Edit", "Edit", new {  id=item.IdSubCategoria, idCat=item.Categorium.IdCategoria}) %>           
            </td>
        </tr> 
             <% } %>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Crear Nueva Subcategoria", "Create") %>
    </p>

</asp:Content>

