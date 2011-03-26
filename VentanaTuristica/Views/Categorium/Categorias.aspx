<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.Categorium>>" %>

    <ul id="nav">         
        <li><%: Html.ActionLink("Bio", "Index", "Home")%>
        <ul>
        <li><%: Html.ActionLink("Quienes somos?", "Index", "Home")%></li>
        <li><%: Html.ActionLink("Contactenos...", "Index", "Home")%></li>
        </ul>
        </li>     
        <% 
        if (Model != null)
        {
            foreach (var item in Model)
            {%>
                <li><%:Html.ActionLink(item.Nombre, "Index", "Home")%>
                    
                <%
                if (item.SubCategoriums.Count != 0)
                {
                    %>
                    <ul>
                    <%
                }
                foreach (var subCategorium in item.SubCategoriums)
                {%>
                    
                        <li><%:Html.ActionLink(subCategorium.Nombre, "Index", "Home")%></li>
                    
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