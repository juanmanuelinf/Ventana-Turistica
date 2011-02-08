<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site2.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.Publicacion>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Publicaciones</h2>
     
       
    
      <% using (Html.BeginForm())
    {%>
        <fieldset>
        <legend>Buscar Publicacion</legend>
            
            <div class="editor-label">
                <label for="Nombre">Nro:</label>
            </div>
            <div class="editor-field">
            <%= Html.TextBox("publicacion",null, new { @class = "text-box" })%>
            </div>
            <div class="editor-label">
                <input type="submit" value="Buscar"/>
            </div>
         </fieldset>
     <%
    }%>
    <fieldset>
        <legend>Empresas</legend>
   
    <table>
    <tr> <th>Nueva Publicacion</th> <th> <a title="Agregar Publicacion" href="<%=Url.Action("Create", "Publicacion")%>">
     <img src="<%=Url.Content("~/Content/agregar.png")%>" height="25px" width="25px" /></a></th> </tr>
        


        </table>
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

    <% if (Model != null)
       {
           foreach (var item in Model)
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
                        <a title="Eliminar Publicacion" href="<%=Url.Action("Delete", "Empresa", new {id = item.IdPublicacion}, null)%>">
                        <img src="<%=Url.Content("~/Content/eliminar.png")%>" height="25px" width="25px" /></a>
                </td>
            </tr>
      
        <%}
       }
       else
       {%> <h2>No Hay Publicaciones...</h2>
          
      <%
       }%>
      </table>
   </fieldset>
       <script type="text/javascript">

           $(document).ready(function () {
               $("input#publicacion").autocomplete('<%= Url.Action("Find", "Publicacion") %>');
           }); 

</script>

</asp:Content>