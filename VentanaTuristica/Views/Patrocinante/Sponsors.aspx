﻿<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.Imagene>>" %>

    <%  if (Model != null)
        {
            int contador = 0;
            foreach (var item in Model)
            {
                contador++;
                if (contador == 1)
                {%>
                    <div>
                    <%
                }%>
                    <a href="<%:item.Link %>"><img src='<%=Url.Action("Show", "Patrocinante", new {id = item.IdImagen})%>' width="195px"/></a>
                <% if (contador == 4)
                { %>
                    </div>
                    <% contador = 0;
                } %>
          <%}
        } %>