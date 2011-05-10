<%@ Page Title="" Language="C#" ValidateRequest="false" MasterPageFile="~/Views/Shared/Site2.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.Lugar>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Lugares
</asp:Content>

<asp:Content ID="Content2" ValidateRequest="false" ContentPlaceHolderID="MainContent" runat="server">

    <h2></h2>

    <% using (Html.BeginForm())
    {%>
        <fieldset>
        <legend>Buscar Lugar</legend>
            
            <div class="editor-label">
                <label for="Nombre">Nombre: </label>
            </div>
            <div class="editor-field">
                <%= Html.TextBox("Nombre",null, new { @class = "text-box" })%>
            </div>
            <div class="editor-label">
                <input type="submit" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover" value="Buscar"/>
            </div>
         </fieldset>
     <%
    }%>

    <fieldset>
    <legend>Lugares</legend>

    <table>
        <td> <a title="Agregar Lugar" href="<%=Url.Action("Create", "Lugar")%>">
            <img src="<%=Url.Content("~/Content/agregar.png")%>" height="25px" width="25px" /></a></td>
        <td><%: Html.ActionLink("Nuevo Lugar", "Create", "Lugar")%></td> 
    </table>
    <br />
 <%  if (Model.Count() != 0)
     {%>
    <table>
        <tr>
         <th> </th>
             <th>
                Nombre
            </th>
        </tr>
    
    <%foreach (var group in Model.GroupBy(item => item.Tipo)){
        if (group.Key.CompareTo("Pais") == 0){%>
             <th><%=Html.Encode(group.Key)%>

        <%foreach (var item in group){%>
        <tr>
            
            <td>
                <%:item.Nombre%>
            </td>
             <td> </td>
             <td> </td>
            <td>
                <a title="Eliminar Lugar" href="<%=Url.Action("Delete", "Lugar", new {id = item.IdLugar})%>">
                    <img src="<%=Url.Content("~/Content/eliminar.png")%>" height="25px" width="25px" /></a>
            </td>
            <td>
                <a title="Editar Lugar" href="<%=Url.Action("Edit", "Lugar", new {id = item.IdLugar})%>">
                    <img src="<%=Url.Content("~/Content/editar.png")%>" height="25px" width="25px" /></a>  
            </td>
        </tr>          
          <%foreach (var group2 in Model.GroupBy(item2 => item2.Tipo))
{
    if (group2.Key.CompareTo("Estado") == 0)
    {%>
     <td> </td>
             <th><%=Html.Encode(group2.Key)%>
        <%
        foreach (var item2 in group2)
        {
            if (item2.FkLugar.Equals(item.IdLugar))
            {%>
                <tr>
                    <td> </td>
                    <td>
                        <%:item2.Nombre%>
                    </td>
                     <td> </td>
                    <td>
                        <a title="Eliminar Lugar" href="<%=Url.Action("Delete", "Lugar", new {id = item2.IdLugar})%>">
                            <img src="<%=Url.Content("~/Content/eliminar.png")%>" height="25px" width="25px" /></a>
                    </td>
                    <td>
                        <a title="Editar Lugar" href="<%=Url.Action("Edit", "Lugar", new {id = item2.IdLugar})%>">
                            <img src="<%=Url.Content("~/Content/editar.png")%>" height="25px" width="25px" /></a>  
                    </td>
                </tr> 

          <%foreach (var group3 in Model.GroupBy(item3 => item3.Tipo))
            {
                if (group3.Key.CompareTo("Localidad") == 0)
                {%>
                <td> </td>
                 <td> </td>
                         <th><%=Html.Encode(group3.Key)%>
                    <%
                    foreach (var item3 in group3)
                    {
                        if (item3.FkLugar.Equals(item2.IdLugar))
                        {%>
                        
                            <tr>
                             <td> </td>
                               <td> </td>
                                <td>
                                    <%:item3.Nombre%>
                                </td>
                                <td>
                                    <a title="Eliminar Lugar" href="<%=Url.Action("Delete", "Lugar", new {id = item3.IdLugar})%>">
                                        <img src="<%=Url.Content("~/Content/eliminar.png")%>" height="25px" width="25px" /></a>
                                </td>
                                <td>
                                    <a title="Editar Lugar" href="<%=Url.Action("Edit", "Lugar", new {id = item3.IdLugar})%>">
                                        <img src="<%=Url.Content("~/Content/editar.png")%>" height="25px" width="25px" /></a>  
                                </td>
                            </tr> 
                            <%
                        }
                    }%>
                        <%
                }
            }%>
                <%
            }
        }%>
            <%
    }
}%>

    </table>
    <%

                 }
             }
         }
     }
     else
     {%> <h2>No Hay Lugares...</h2> 
<%  } %>
   </fieldset>
   <script type="text/javascript">
       $(document).ready(function () {
           $("input#Nombre").autocomplete('<%= Url.Action("Find", "Lugar") %>');
       }); 
    </script>
</asp:Content>