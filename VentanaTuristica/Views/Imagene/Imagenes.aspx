<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.Imagene>>" %>

    <%  if (Model != null)
        { %>
        
        <div class="fbCycler" style="width: 900px; height:450px">
         <% foreach (var item in Model)
            { %>
                <div id="contenido">
                    <p class="floatbox" data-fb-options="modal:false disableScroll:true width:250 scrolling:no enableDragMove:false enableDragResize:false cornerRadius:4 padding:12 colorTheme:white">
                        <a href="#nonmodal<%: item.IdImagen %>" data-fb-options="boxLeft:+56% boxTop:550"><img class="fbTooltip" src='<%=Url.Action("Show", "Imagene", new {id = item.IdImagen})%>' alt="" style="width:900px"/></a>
                    </p>
                </div>
                    
                <div>
                    <%: item.Descripcion %>
                </div>

                <div id="nonmodal<%: item.IdImagen %>" style="display:none; width:200px;"> 
                        <%: item.Descripcion %>
                </div> 
            <%} %>
        <%} %>

        </div>
