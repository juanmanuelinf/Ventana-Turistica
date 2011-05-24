<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site4.Master" Inherits="System.Web.Mvc.ViewPage<VentanaTuristica.Model.Publicacion>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Crear Empresa
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<script type="text/javascript" src="<%:Url.Content("~/Scripts/jquery.cascade.js") %>"></script>
<script type="text/javascript" src="<%:Url.Content("~/Scripts/jquery.cascade.ext.js") %>"></script>
<script type="text/javascript" src="<%:Url.Content("~/Scripts/jquery.templating.js") %>"></script>

<script type="text/javascript">
    jQuery(document).ready(function () {
        jQuery("#Estado").cascade("#Pais", {
            ajax: { url: 'GetForaneas' },
            template: commonTemplate,
            match: commonMatch
        });
        jQuery("#Ciudad").cascade("#Estado", {
            ajax: { url: 'GetForaneas' },
            template: commonTemplate,
            match: commonMatch
        });
    });
    function commonTemplate(item) {
        return "<option value='" + item.Value + "'>" + item.Text + "</option>";
    };

    function commonMatch(selectedValue) {
        return this.When == selectedValue;
    };


	</script>
 <h2></h2>
  <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(false,"Ha ocurrido un error. Por favor corrijalos e intente de nuevo.") %>
        

        <fieldset>
            <legend>Registro de Publicacion:</legend>

             <fieldset>
        <legend>Buscar Empresa</legend>
            
            <div class="editor-label">
                <label for="Empresa.Nombre">Nombre:</label>
            </div>
            <div class="editor-field">
            <%= Html.TextBox("Empresa")%>
            </div>
         </fieldset>

         <fieldset>
        <legend>Datos de la Publicacion:</legend>
         <label for="Nombre"> Nombre de la Publicacion:</label>
         <%= Html.TextBoxFor(model => model.Nombre)%>

        <div class="editor-label">
        <label for="Descripcion"> Descripcion:</label>
        </div>
        <div class="editor-field">
            <%= Html.TextAreaFor(model => model.Idioma[0].Descripcion)%>
        </div>

        <div class="editor-label">
        <label for="Direccion"> Direccion:</label>
        </div>
           <div class="editor-field">
                 <label> Pais:</label>    
                <%= Html.DropDownList("Pais")%>
              
            </div>
            
          <div class="editor-label">
                <label> Estado:</label>
                 <%= Html.DropDownList("Estado")%>    
            </div>

             <div class="editor-label">
                <label> Localidad:</label>
                 <%= Html.DropDownList("Ciudad")%>    
            </div>
        <div class="editor-field">
        <%= Html.TextAreaFor(model => model.Direccion)%>
        </div>
         </fieldset>

        <fieldset>
            <legend>Categorias:</legend>
            <div class="editor-field">
              <%= Html.DropDownListFor(model => model.SubCategorium.Nombre, (SelectList)ViewData["SubCategorium.Nombre"])%>
            <%= Html.DropDownList("SubCategorium.Nombre") %>
            <%= Html.ValidationMessage("SubCategorium.Nombre", "*")%>
        </div>
        </fieldset>


        <fieldset>
        <legend>Categoria:</legend>
         <div class="editor-field">
           <%= Html.DropDownListFor(model => model.Idioma[0].Categoria, (SelectList)ViewData["Idioma[0].Categoria"])%>
            <%= Html.ValidationMessage("Idioma[0].Categoria", "*")%>
         </div>

        <label for="Otra"> Otra:</label>
        <input  type="text" id= "Text1" name="Idioma[1].Categoria"/>
        </fieldset>

        <%
             var Modelo = (IList<string>)ViewData["Servicios-Es"];
             var Modelo2 = (IList<string>)ViewData["Servicios-Es-id"];
          %>
        <fieldset>
        <legend>Servicios:</legend>
         <div class="editor-label">
        <%for (int i = 0; i < Modelo.Count(); i++)
        {%>
      <label  id="Servicios[<%=i%>].Nombre"><%=Modelo[i] %></label>
      <input  type="checkbox" id= "Servicios[<%=i%>].IdServicio"name="Servicios[<%=i%>].IdServicio" value="<%= Modelo2[i]%>" />
      <input  type="hidden"  name="Servicios[<%=i%>].Nombre" value="<%=Modelo[i] %>" />
     <%}%>
       </div>
        </fieldset>

        <fieldset>
        <legend>Metodos de Pago:</legend>
       
        <div class="editor-field">
        <label name="Efectivo" >Efectivo</label>
        <input  type="checkbox" id= "Efectivo" name="Efectivo" value="S" />

        <label name="Transferencia">Transferencia</label>
        <input  type="checkbox" id= "Transferencia" name="Transferencia" value="S" />

        <label name="Tdebito" >TDebito</label>
        <input  type="checkbox" id= "Tdebito" name="Tdebito" value="S" />

        <label name="Tcredito" >TCredito</label>
        <input  type="checkbox" id= "Tcredito" name="Tcredito" value="S" />

        <label name="Reservacion">Reservacion</label>
        <input  type="checkbox" id= "Reservacion" name="Reservacion" value="S" />
         </div>
         </fieldset>


         <fieldset>
        <legend>Coordenadas:</legend>
        <div class="editor-field">
        <label for="Latitud"> Latitud:</label>
            <%= Html.TextBoxFor(model => model.Latitud)%>
        
         <label for="Longitud"> Longitud:</label>
            <%= Html.TextBoxFor(model => model.Longitud)%>
        </div>
          </fieldset>
        
        <fieldset>
        <legend>Precios:</legend>
        <div class="editor-field">
        <label for="TBaja"> Temporada Baja:</label>
        <label for="PrecioMinTb"> Min:</label>
        <%= Html.TextBoxFor(model => model.Precios[0].PrecioMin)%>
        <label for="PrecioMaxTb"> Max:</label>
        <%= Html.TextBoxFor(model => model.Precios[0].PrecioMax)%>
        <%= Html.DropDownListFor(model => model.Precios[0].Moneda, (SelectList)ViewData["Precios[0].Moneda"])%>
        <input type="hidden" id="Precios[0].Tipo" name="Precios[0].Tipo" value="TB" /> 
      
        </div>

        <div class="editor-field">
        <label for="TBaja"> Temporada  Alta:</label>
        <label for="PrecioMinTa"> Min:</label>
        <%= Html.TextBoxFor(model => model.Precios[1].PrecioMin)%>
        <label for="PrecioMaxTa"> Max:</label>
        <%= Html.TextBoxFor(model => model.Precios[1].PrecioMax)%>
        <%= Html.DropDownListFor(model => model.Precios[1].Moneda, (SelectList)ViewData["Precios[1].Moneda"])%>
        <input type="hidden" id="Precios[1].Tipo" name="Precios[1].Tipo" value="TA" /> 
       
        </div>
        </fieldset>

        <div class="editor-label">
            <label for="Coordenadas"> Notas:</label>
        </div>
        <div class="editor-field">
        <%= Html.TextAreaFor(model => model.Idioma[0].Notas)%>
        </div>

        <div class="editor-label">
            <label for="Coordenadas"> Procesos Ecologicos:</label>
        </div>
        <div class="editor-field">
        <%= Html.TextAreaFor(model => model.Idioma[0].ProcesosEcologicos)%>
        
        </div>



        <div class="editor-label">
                    <input type="submit" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover" value="Aceptar" />
                </div>
            
        </fieldset>

    <% } %>

     <script type="text/javascript">

         $(document).ready(function () {
             $("input#Empresa").autocomplete('<%= Url.Action("Find", "Empresa") %>');
         }); 

</script>
</asp:Content>

