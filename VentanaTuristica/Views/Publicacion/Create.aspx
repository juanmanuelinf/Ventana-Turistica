<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site2.Master" Inherits="System.Web.Mvc.ViewPage<IList<VentanaTuristica.Model.Servicio>>" %>



<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true,"Ha ocurrido un error. Por favor corrijalos e intente de nuevo.") %>

        <fieldset>
            <legend>Registro de Publicacion:</legend>

             <fieldset>
        <legend>Buscar Empresa</legend>
            
            <div class="editor-label">
                <label for="Empresa.Nombre">Nombre:</label>
            </div>
            <div class="editor-field">
            <%= Html.TextBox("Empresa",null, new { @class = "text-box" })%>
            </div>
         </fieldset>


        <div class="editor-label">
            <label for="Servicios"> Servicios:</label>
        </div>

         <div class="editor-label">
        <%for (int i = 0; i < Model.Count(); i++)
        {%>
      <label  id="Servicios[<%=i%>].Nombre"><%=Model[i].Nombre %></label>
      <input  type="checkbox" id= "Servicios[<%=i%>].IdServicio"name="Servicios[<%=i%>].IdServicio" value="<%= Model[i].IdServicio%>" />
      <input  type="hidden"  name="Servicios[<%=i%>].Nombre" value="<%=Model[i].Nombre %>" />
     <%}%>
       </div>
        
        <div class="editor-label">
            <label for="Servicios"> Metodos de Pago:</label>
        </div>
        <div class="editor-field">
        <label name="Efectivo" id="Efectivo1">Efectivo</label>
        <input  type="checkbox" id= "Efectivo" name="Efectivo" value="S" />

        <label name="Transferencia" id="Transferencia">Transferencia</label>
        <input  type="checkbox" id= "Transferencia1" name="Transferencia" value="S" />

        <label name="Tdebito" id="Tdebito">TDebito</label>
        <input  type="checkbox" id= "Tdebito1" name="Tdebito" value="S" />

        <label name="Tcredito" id="Tcredito">TCredito</label>
        <input  type="checkbox" id= "Tcredito1" name="Tcredito" value="S" />

        <label name="Reservacion" id="Reservacion">Reservacion</label>
        <input  type="checkbox" id= "Reservacion1" name="Reservacion" value="S" />
         </div>

         <div class="editor-label">
            <label for="Coordenadas"> Coordenadas:</label>
        </div>

        <div class="editor-field">
        <label for="Latitud"> Latitud:</label>
         <input  type="text" id= "Latitud" name="Latitud"/>
         <label for="Longitud"> Longitud:</label>
         <input  type="text" id= "Longitud" name="Longitud"/>
        </div>
        
        <div class="editor-label">
            <label for="SubCategorium.Nombre"> Categorias:</label>
        </div>
        <div class="editor-field">
            <%= Html.DropDownList("SubCategorium.Nombre") %>
            <%= Html.ValidationMessage("SubCategorium.Nombre", "*")%>
        </div>


        <div class="editor-label">
            <label for="Coordenadas"> Precios:</label>
        </div>

        <div class="editor-field">
        <label for="TBaja"> Temporada Baja:</label>
        <label for="PrecioMinTb"> Min:</label>
        <input  type="text" id= "Precio[0].PrecioMin" name="Precio[0].PrecioMin"/>
        <label for="PrecioMaxTb"> Max:</label>
        <input  type="text" id= "Precio[0].PrecioMax" name="Precio[0].PrecioMax"/>
        </div>

        <div class="editor-field">
        <label for="TBaja"> Temporada  Alta:</label>
        <label for="PrecioMinTa"> Min:</label>
        <input  type="text" id= "Precio[1].PrecioMin" name="Precio[1].PrecioMin"/>
        <label for="PrecioMaxTa"> Max:</label>
        <input  type="text" id= "Precio[1].PrecioMax" name="Precio[1].PrecioMax"/>
        </div>

        <div class="editor-field">
       

       <div class="editor-label">
            <label for="Coordenadas"> Categoria:</label>
        </div>
        <div class="editor-field">
            <%= Html.DropDownList("Idioma[0].Categoria") %>
            <%= Html.ValidationMessage("Idioma[0].Categoria", "*")%>
        </div>

        <label for="Otra"> Otra:</label>
        <input  type="text" id= "Text1" name="Idioma[1].Categoria"/>
        </div>

        <div class="editor-label">
            <label for="Coordenadas"> Descripcion:</label>
        </div>
        <div class="editor-field">
        <textarea name="Idioma[0].Descripcion" rows="5" cols="45" ></textarea>
        </div>

        <div class="editor-label">
            <label for="Coordenadas"> Notas:</label>
        </div>
        <div class="editor-field">
         <textarea name="Idioma[0].Notas" rows="5" cols="45" ></textarea>
        </div>

        <div class="editor-label">
            <label for="Coordenadas"> Procesos Ecologicos:</label>
        </div>
        <div class="editor-field">
        <textarea name="Idioma[0].ProcesosEcologicos" rows="5" cols="45" ></textarea>
        </div>



        <div class="editor-label">
                    <input type="submit" value="Registrar" />
                </div>
            
        </fieldset>

    <% } %>

     <script type="text/javascript">

         $(document).ready(function () {
             $("input#Empresa").autocomplete('<%= Url.Action("Find", "Empresa") %>');
         }); 

</script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
