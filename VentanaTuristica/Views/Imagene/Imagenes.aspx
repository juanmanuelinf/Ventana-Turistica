<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.Imagene>>" %>
    <%  if (Model != null)
        { %>
        <div class="fbCycler" style="width: 100%; height:450px">
            <% foreach (var item in Model)
            { %>
                <div>
                    <img class="fbTooltip" data-fb-tooltip="source:#tooltip<%:item.IdImagen %> attachToHost:false moveWithMouse:true" src='<%=Url.Action("Show", "Imagene", new {id = item.IdImagen})%>' alt="" style="width: 100%"/>
                </div>
                
                <div >
                    <%: item.Descripcion %>
                </div>

                <div id="tooltip<%:item.IdImagen%>" style="display:none; width:200px;"> 
                    <div style="font-size:12px; margin:8px 0; width:200px;"> 
                        <%: item.Descripcion %>
                    </div> 
                </div> 
            <%} %>
        <%} %>
        </div>
