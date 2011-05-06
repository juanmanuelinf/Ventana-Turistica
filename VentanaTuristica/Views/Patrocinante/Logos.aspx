<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.Imagene>>" %>
    <%  if (Model != null)
        { %>
        <div id="layout">
         <div class="hgroup">
            <% foreach (var item in Model)
            { %>
                <div class="cell">
                    <a target="_blank"  href="<%:item.Link %>"><img src='<%=Url.Action("Show", "Patrocinante", new {id = item.IdImagen})%>'/></a>
                </div>
            <%} %>
            </div>
            </div>
        <%} %>
