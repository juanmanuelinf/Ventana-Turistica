<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.Categorium>>" %>

    <ul id="nav">         
        <li><%: Html.ActionLink("Página principal", "Index", "Home")%></li>     
        <% 
        if (Model != null)
        {
            foreach (var item in Model)
            {%>
                <li><%:Html.ActionLink(item.Nombre, "Index", "Home")%>
                
                <%
                foreach (var subCategorium in item.SubCategoriums)
                {%>
                    <ul>
                        <li><%:Html.ActionLink(subCategorium.Nombre, "Index", "Home")%></li>
                    </ul>
                    <%
                }%>
               
                </li>
            <%  }
        } %>
        
    </ul>