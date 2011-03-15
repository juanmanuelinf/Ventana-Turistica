<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site2.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.Empresa>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Empresas</h2>
     
       
    
      <% using (Html.BeginForm())
    {%>
        <fieldset>
        <legend>Buscar Empresa</legend>
            
            <div class="editor-label">
                <label for="Nombre">Nombre:</label>
            </div>
            <div class="editor-field">
            <%= Html.TextBox("empresa",null, new { @class = "text-box" })%>
            </div>
            <div class="editor-label">
                <input type="submit" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover" value="Buscar"/>
            </div>
         </fieldset>
     <%
    }%>
    <fieldset>
        <legend>Empresas</legend>
   
    <table>
    <tr> <th>Nueva Empresa</th> <th> <a title="Agregar Empresa" href="<%=Url.Action("Create", "Empresa")%>">
     <img src="<%=Url.Content("~/Content/agregar.png")%>" height="25px" width="25px" /></a></th> </tr>
        


        </table>
        <table>
        <tr>
            <th>
                Nombre
            </th>
            <th>
                Rif
            </th>
            <th>
                Direccion
            </th>
            <th>
                Ciudad
            </th>
            <th>
                Localidad
            </th>
             <th>
                Website
            </th> 
            <th>
                Mail
            </th>
            
        </tr>

    <%foreach (var item in Model)
      {
          if (Model != null)
          {%>
     <tr>
                <td>
                    <%:item.Nombre%>
                </td>
                <td>
                    <%:item.Rif%>
                </td>
                <td>
                    <%:item.Direccion%>
                </td>
                <td>
                    <%:item.Ciudad%>
                </td>
                <td>
                    <%:item.Localidad%>
                </td>
                <td>
                    <%:item.Website%>
                </td>
                <td>
                    <%:item.Mail%>
                </td>

                <td>
                        <a title="Eliminar Cliente" href="<%=Url.Action("Delete", "Empresa", new {id = item.IdEmpresa}, null)%>">
                        <img src="<%=Url.Content("~/Content/eliminar.png")%>" height="25px" width="25px" /></a>
                </td>
      </tr>
      
        <%}
          else
          {%> <h2>No Hay Empresas...</h2>
          
      <%
          }
      }%>
      </table>
   </fieldset>
       <script type="text/javascript">

           $(document).ready(function () {
               $("input#empresa").autocomplete('<%= Url.Action("Find", "Empresa") %>');
           }); 

</script>

</asp:Content>