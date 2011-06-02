<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.Patrocinante>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Ofertas Destacadas
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <fieldset>
        <legend>Ofertas</legend>
   
    <%if (Model != null)
      {%>
        <%
          if (Model.Count() != 0)
          {%>
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
            
        </tr>

    <%

              foreach (var item in Model)
              {
%>
     <tr>
                <td align="center">
                    <a href="<%=item.Imagene.Link%>"><img src='<%=Url.Action("Show", "Patrocinante", new {id = item.Imagene.IdImagen})%>' width="50px"/></a>
                </td>
                <td>
                    <%:item.Nombre%>
                </td>
                <td>
                    <%:item.Descripcion%>
                </td>
                
      </tr>
      
        <%
              }
%>
    
      </table>
    <%
          }
          else
          {%> <h2>No Hay Ofertas...</h2>
          
<%
          }%>
<%
      }else{%> <h2>No Hay Ofertas...</h2>
          
<%
          }%>
   </fieldset>

   

</asp:Content>