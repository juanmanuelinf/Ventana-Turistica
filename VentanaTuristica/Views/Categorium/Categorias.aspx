<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.Categorium>>" %>
<%@ Import Namespace="Resources" %>
  
  <script runat="server">
      protected override void InitializeCulture()
      {
          base.InitializeCulture();
          if (Session["culture"] != null)
          {
              Culture = Session["culture"].ToString();
              UICulture = Session["culture"].ToString();
          }
      }
   
</script>

    <ul id="nav">         
        <li><%: Html.ActionLink("Bio", "Index", "Home")%>
        <ul>
        <li><%: Html.ActionLink(ResourceEmpresa.BioUs, "Index", "Home")%></li>
        <li><%: Html.ActionLink(ResourceEmpresa.BioContac, "Index", "Home")%></li>
        </ul>
        </li>     
        <% 
        if (Model != null)
        {
            foreach (var item in Model)
            {%>
                <li><%:Html.ActionLink(item.Nombre, "Index", "Home", new { pagActual = 1, orden = 1, cat = item.Nombre }, null)%>
                    
                <%
                if (item.SubCategoriums.Count != 0)
                {
                    %>
                    <ul>
                    <%
                }
                foreach (var subCategorium in item.SubCategoriums)
                {%>
                    
                        <li><%:Html.ActionLink(subCategorium.Nombre, "Lista", "Publicacion", new {pagActual = 1, orden = 1, sub = subCategorium.Nombre},null)%>
                        <%
                        if (subCategorium.Lugares.Count != 0)
                        {
                            %>
                            <ul>
                            <%
                        }
                        foreach (var lugar in subCategorium.Lugares)
                        {%>
                                <li><%:Html.ActionLink(lugar, "Lista", "Publicacion", new {pagActual = 1, orden = 1, lug = lugar},null)%></li>
                        <%
                        }
                        if (subCategorium.Lugares.Count != 0)
                        {
                            %>
                            </ul>
                            <%
                        }
                        %>
                        
                        
                        
                        </li>
                    
                    <%
                }
                if (item.SubCategoriums.Count != 0)
                {
                    %>
                    </ul>
                    <%
                }%>
                </li>
            <%  }
        } %>
        
    </ul>