<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site2.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.Patrocinante>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Gestion de Patrocinantes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% using (Html.BeginForm())
    {%>
        <fieldset>
        <legend>Buscar Patrocinante</legend>
            
            <div class="editor-label">
                <label for="Nombre">Nombre:</label>
            </div>
            <div class="editor-field">
                <%= Html.TextBox("patrocinante", null, new { @class = "text-box" })%>
            </div>
            <div class="editor-label">
                <input type="submit" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover" value="Buscar"/>
            </div>
         </fieldset>
     <%
    }%>
    <fieldset>
        <legend>Patrocinantes</legend>
   
    <table>
        <td> <a title="Agregar Patrocinante" href="<%=Url.Action("Create", "Patrocinante")%>">
                <img src="<%=Url.Content("~/Content/agregar.png")%>" height="25px" width="25px" /></a></td>
        <td><%: Html.ActionLink("Nuevo Patrocinante", "Create", "Patrocinante")%></td> 
    </table>
    <br />
        <%if (Model.Count() != 0)
          { %>
        <table>
        <tr>
            <th>
                    <a title="Ver Sponsors" href="<%=Url.Action("Index", "Patrocinante", new {tipo = "S"}, null)%>">
                        Sponsor</a>
                        
                    <a title="Ver Logos" href="<%=Url.Action("Index", "Patrocinante", new {tipo = "L"}, null)%>">
                        Logo</a>
            </th>
            <th>
                Nombre
            </th>
            <th>
                Descripcion
            </th>
            <th>
                Persona Contacto
            </th>
            <th>
                Telefono
            </th>
            
        </tr>

    <%
    
        foreach (var item in Model)
        {
%>
     <tr>
                <td align="center">
                    <a href="<%=item.Imagene.Link %>"><img src='<%=Url.Action("Show", "Patrocinante", new {id = item.Imagene.IdImagen})%>' width="50px"/></a>
                </td>
                <td>
                    <%:item.Nombre%>
                </td>
                <td>
                    <%:item.Descripcion%>
                </td>
                <td>
                    <%:item.Contacto[0].Nombre%>
                </td>
                <td>
                    <%:item.Contacto[0].Telefono[0].CodigoInt + " " + item.Contacto[0].Telefono[0].CodigoLoc +
                              " " + item.Contacto[0].Telefono[0].Numero%>
                </td>
                <td>
                    <a title="Eliminar Patrocinante" href="<%=Url.Action("Delete", "Patrocinante", new {id = item.IdPatrocinante}, null)%>">
                        <img src="<%=Url.Content("~/Content/eliminar.png")%>" height="25px" width="25px" /></a>
                </td>
                <td>
                    <a title="Editar Categoria" href="<%=Url.Action("Edit", "Patrocinante", new {id = item.IdPatrocinante})%>">
                        <img src="<%=Url.Content("~/Content/editar.png")%>" height="25px" width="25px" /></a>           
                </td>
      </tr>
      
        <%
        }
     %>
    
      </table>
    <% }
    else
    {%> <h2>No Hay Patrocinantes...</h2>
          
<%  } %>
   </fieldset>

    <script type="text/javascript">
        $(document).ready(function () {
            $("input#patrocinante").autocomplete('<%= Url.Action("Find", "Patrocinante") %>');
        }); 
    </script>

</asp:Content>