<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.Imagene>>" %>

    <%  if (Model != null)
        { %>
        <div id="loading-image">
            <table><tr>
            <td align=center valign=middle>
            <br />
            <br />
            <br />
            <br />
            <br />
            <img src="../../Content/ajax-loader.gif" alt="Cargando..." />
            </td>
            </tr></table>
	        
        </div>
        <div class="fbCycler" style="width: 910px; height:450px">
         <% foreach (var item in Model)
            { %>
                <div id="contenido">
                    <img class="fbTooltip" data-fb-tooltip="source:#tooltip<%:item.IdImagen %> attachToHost:true" src='<%=Url.Action("Show", "Imagene", new {id = item.IdImagen})%>' alt="" style="width: 100%"/>
                </div>
                    
                <div>
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
<style>
#loading-image {
	background-color:White;
	width: 910px;
	height: 450px;
	position:absolute;
	z-index: 1;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	border-radius: 10px; /* future proofing */
	-khtml-border-radius: 10px;
}</style>

<script type="text/javascript">
    jQuery(window).load(function () {
        jQuery('#loading-image').hide();
    });
</script>

