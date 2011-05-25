<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site4.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.Imagene>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Gestion de Patrocinantes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <fieldset>
        <legend>Imagenes</legend>
   
    <table>
        <td> <a title="Agregar Imagen" href="<%=Url.Action("CreateForPublicacion", "Imagene")%>">
                <img src="<%=Url.Content("~/Content/agregar.png")%>" height="25px" width="25px" /></a></td>
        <td><%: Html.ActionLink("Nueva Imagen", "CreateForPublicacion", "Imagene")%></td> 
    </table>
    <br />
        <%if (Model.Count() != 0)
          { %>
        <table>
        <tr>
            <th>
                Imagen
            </th>
            
            
        </tr>

    <%
    
        foreach (var item in Model)
        {
%>
     <tr>
                <td align="center">
                    <a href="#"><img src='<%=Url.Action("Show", "Imagene", new {id = item.IdImagen})%>' height="100px"/></a>
                </td>
                <td>
                    <a title="Eliminar Imagen" href="<%=Url.Action("DeleteForPublicacion", "Imagene", new {id = item.IdImagen}, null)%>">
                        <img src="<%=Url.Content("~/Content/eliminar.png")%>" height="25px" width="25px" /></a>
                </td>
                
      </tr>
      
        <%
        }
     %>
    
      </table>
    <% }
    else
    {%> <h2>No Hay Imagenes...</h2>
          
<%  } %>
                <a title="Ir a Lista" href="<%=Url.Action("Index","Publicacion")%>">
                <img src="<%=Url.Content("~/Content/atras.png")%>" height="25px" width="25px" /></a>
   </fieldset>


</asp:Content>