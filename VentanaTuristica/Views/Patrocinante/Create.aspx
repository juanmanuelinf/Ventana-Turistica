<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site4.Master" Inherits="System.Web.Mvc.ViewPage<VentanaTuristica.Model.Patrocinante>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Nuevo Patrocinante
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <% using (Html.BeginForm("Create", "Patrocinante", FormMethod.Post, new { enctype = "multipart/form-data" }))
           {%>

        <fieldset>

            <%= Html.ValidationSummary(true,"Ha ocurrido un error. Por favor corrijalos e intente de nuevo.") %>
            
            <legend>Nuevo Patrocinante</legend>
           
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Nombre) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Nombre) %>
                <%: Html.ValidationMessageFor(model => model.Nombre) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.Descripcion) %>
            </div>
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.Descripcion) %>
                <%: Html.ValidationMessageFor(model => model.Descripcion) %>
            </div>
            
            <fieldset>
             
                <legend>Persona de Contacto:</legend>
                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Contacto[0].Nombre) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(model => model.Contacto[0].Nombre)%>
                    <%: Html.ValidationMessageFor(model => model.Contacto[0].Nombre)%>
                </div>

                <div class="editor-label">
                    <%: Html.Label("Numero de Telefono")%>
                </div>
                
                <div class="editor-field">
                    <%: Html.TextBoxFor(model => model.Contacto[0].ListaTelefonos[0].CodigoInt, new { @style = "width:30px;" })%>
                    <%: Html.TextBoxFor(model => model.Contacto[0].ListaTelefonos[0].CodigoLoc, new { @style = "width:30px;" })%>
                    <%: Html.TextBoxFor(model => model.Contacto[0].ListaTelefonos[0].Numero, new { @style = "width:128px;" })%>
                </div>
                
                <div class="editor-field">
                    <%: Html.ValidationMessageFor(model => model.Contacto[0].ListaTelefonos[0].CodigoInt)%>
                </div>
                <div class="editor-field">
                    <%: Html.ValidationMessageFor(model => model.Contacto[0].ListaTelefonos[0].CodigoLoc)%>
                </div>
                <div class="editor-field">
                    <%: Html.ValidationMessageFor(model => model.Contacto[0].ListaTelefonos[0].Numero)%>
                </div>

                <div class="editor-field">
                    <%: Html.TextBoxFor(model => model.Contacto[0].ListaTelefonos[1].CodigoInt, new { @style = "width:30px;", disabled = "disabled" })%>
                    <%: Html.TextBoxFor(model => model.Contacto[0].ListaTelefonos[1].CodigoLoc, new { @style = "width:30px;", disabled = "disabled" })%>
                    <%: Html.TextBoxFor(model => model.Contacto[0].ListaTelefonos[1].Numero, new { @style = "width:128px;", disabled = "disabled" })%>
                    <input  type="checkbox" id= "telefono1" name= "telefono1" onclick="telefonoUno()" value="" />
                </div>

                <div class="editor-field">
                    <%: Html.ValidationMessageFor(model => model.Contacto[0].ListaTelefonos[1].CodigoInt)%>
                </div>
                <div class="editor-field">
                    <%: Html.ValidationMessageFor(model => model.Contacto[0].ListaTelefonos[1].CodigoLoc)%>
                </div>
                <div class="editor-field">
                    <%: Html.ValidationMessageFor(model => model.Contacto[0].ListaTelefonos[1].Numero)%>
                </div>
                
                <div class="editor-field">
                    <%: Html.TextBoxFor(model => model.Contacto[0].ListaTelefonos[2].CodigoInt, new { @style = "width:30px;", disabled = "disabled" })%>
                    <%: Html.TextBoxFor(model => model.Contacto[0].ListaTelefonos[2].CodigoLoc, new { @style = "width:30px;", disabled = "disabled" })%>
                    <%: Html.TextBoxFor(model => model.Contacto[0].ListaTelefonos[2].Numero, new { @style = "width:128px;", disabled = "disabled" })%>
                    <input  type="checkbox" id= "telefono2" onclick="telefonoDos()" value="" />
                </div>

                <div class="editor-field">
                    <%: Html.ValidationMessageFor(model => model.Contacto[0].ListaTelefonos[2].CodigoInt)%>
                </div>
                <div class="editor-field">
                    <%: Html.ValidationMessageFor(model => model.Contacto[0].ListaTelefonos[2].CodigoLoc)%>
                </div>
                <div class="editor-field">
                    <%: Html.ValidationMessageFor(model => model.Contacto[0].ListaTelefonos[2].Numero)%>
                </div>
                
                <div class="editor-field">
                    <%: Html.TextBoxFor(model => model.Contacto[0].ListaTelefonos[3].CodigoInt, new { @style = "width:30px;", disabled = "disabled" })%>
                    <%: Html.TextBoxFor(model => model.Contacto[0].ListaTelefonos[3].CodigoLoc, new { @style = "width:30px;", disabled = "disabled" })%>
                    <%: Html.TextBoxFor(model => model.Contacto[0].ListaTelefonos[3].Numero, new { @style = "width:128px;", disabled = "disabled" })%>
                    <input  type="checkbox" id= "telefono3" onclick="telefonoTres()" value="" />
                </div>

                <div class="editor-field">
                    <%: Html.ValidationMessageFor(model => model.Contacto[0].ListaTelefonos[3].CodigoInt)%>
                </div>
                <div class="editor-field">
                    <%: Html.ValidationMessageFor(model => model.Contacto[0].ListaTelefonos[3].CodigoLoc)%>
                </div>
                <div class="editor-field">
                    <%: Html.ValidationMessageFor(model => model.Contacto[0].ListaTelefonos[3].Numero)%>
                </div>
                

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Contacto[0].Cargo) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(model => model.Contacto[0].Cargo)%>
                    <%: Html.ValidationMessageFor(model => model.Contacto[0].Cargo)%>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Contacto[0].Mail) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(model => model.Contacto[0].Mail)%>
                    <%: Html.ValidationMessageFor(model => model.Contacto[0].Mail)%>
                </div>

            </fieldset>

            <fieldset>
                <legend>Archivo de Patrocinante:</legend>
            
                <div class="editor-label">
                    <%: Html.Label("Tipo de Archivo")%>
                </div>
                <div class="editor-field">
                    <%: Html.DropDownList("Logo")%>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Link) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(model => model.Link)%>
                    <%: Html.ValidationMessageFor(model => model.Link)%>
                </div>

                <div class="editor-label">
                    <%: Html.Label("Archivo")%>
                </div>
                <div class="editor-field">
                    <input type="file" name="File" id="File" />
                </div>
                
                    <%: Html.ValidationMessageFor(model => model.File) %>
            </fieldset>

            <div class="editor-label">
                <input type="submit" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover" value="Aceptar" />
            </div>

    <% } %>
    <br />
        <table>
            <td><a title="Patrocinante" href="<%=Url.Action("Index")%>">
                <img src="<%=Url.Content("~/Content/atras.png")%>" height="25px" width="25px" /></a></td>
            <td><%: Html.ActionLink("Patrocinante", "Index")%></td>
        </table>
    </fieldset>
    <script type="text/javascript">
        function telefonoUno() {
            var checkbox = document.getElementById("telefono1");
            var codI = document.getElementById("Contacto_0__ListaTelefonos_1__CodigoInt");
            var codL = document.getElementById("Contacto_0__ListaTelefonos_1__CodigoLoc");
            var num = document.getElementById("Contacto_0__ListaTelefonos_1__Numero");
            if (checkbox.checked == true) {
                codI.disabled = false;
                codL.disabled = false;
                num.disabled = false;
            }
            else {
                codI.disabled = true;
                codL.disabled = true;
                num.disabled = true;
            };
        };
        
        function telefonoDos() {
            var checkbox = document.getElementById("telefono2");
            var codI = document.getElementById("Contacto_0__ListaTelefonos_2__CodigoInt");
            var codL = document.getElementById("Contacto_0__ListaTelefonos_2__CodigoLoc");
            var num = document.getElementById("Contacto_0__ListaTelefonos_2__Numero");
            if (checkbox.checked == true) {
                codI.disabled = false;
                codL.disabled = false;
                num.disabled = false;
            }
            else {
                codI.disabled = true;
                codL.disabled = true;
                num.disabled = true;
            };
        };

        function telefonoTres() {
            var checkbox = document.getElementById("telefono3");
            var codI = document.getElementById("Contacto_0__ListaTelefonos_3__CodigoInt");
            var codL = document.getElementById("Contacto_0__ListaTelefonos_3__CodigoLoc");
            var num = document.getElementById("Contacto_0__ListaTelefonos_3__Numero");
            if (checkbox.checked == true) {
                codI.disabled = false;
                codL.disabled = false;
                num.disabled = false;
            }
            else {
                codI.disabled = true;
                codL.disabled = true;
                num.disabled = true;
            };
        };

        jQuery.noConflict();
        jQuery(document).ready(function () {

            var codI1 = document.getElementById("Contacto_0__ListaTelefonos_1__CodigoInt");
            var codL1 = document.getElementById("Contacto_0__ListaTelefonos_1__CodigoLoc");
            var num1 = document.getElementById("Contacto_0__ListaTelefonos_1__Numero");

            if (codI1.value == "0" || codI1.value == "") {
                codL1.value = "";
                codI1.value = "";
                num1.value = "";
            }
            else {
                codL1.disabled = false;
                codI1.disabled = false;
                num1.disabled = false;
            }

            var codI2 = document.getElementById("Contacto_0__ListaTelefonos_2__CodigoInt");
            var codL2 = document.getElementById("Contacto_0__ListaTelefonos_2__CodigoLoc");
            var num2 = document.getElementById("Contacto_0__ListaTelefonos_2__Numero");

            if (codI2.value == "0" || codI2.value == "") {
                codL2.value = "";
                codI2.value = "";
                num2.value = "";
            }
            else {
                codL2.disabled = false;
                codI2.disabled = false;
                num2.disabled = false;
            }

            var codI3 = document.getElementById("Contacto_0__ListaTelefonos_3__CodigoInt");
            var codL3 = document.getElementById("Contacto_0__ListaTelefonos_3__CodigoLoc");
            var num3 = document.getElementById("Contacto_0__ListaTelefonos_3__Numero");

            if (codI3.value == "0" || codI3.value == "") {
                codL3.value = "";
                codI3.value = "";
                num3.value = "";
            }
            else {
                codL3.disabled = false;
                codI3.disabled = false;
                num3.disabled = false;
            }

        });
</script> 
</asp:Content>
