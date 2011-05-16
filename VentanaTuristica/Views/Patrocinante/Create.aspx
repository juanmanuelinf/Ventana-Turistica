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
                    <%: Html.TextBoxFor(model => model.Contacto[0].Telefono[0].CodigoInt, new { @style = "width:30px;" })%>
                    <%: Html.TextBoxFor(model => model.Contacto[0].Telefono[0].CodigoLoc, new { @style = "width:30px;" })%>
                    <%: Html.TextBoxFor(model => model.Contacto[0].Telefono[0].Numero, new { @style = "width:128px;" })%>
                </div>
                <div class="editor-field">
                    <%: Html.ValidationMessageFor(model => model.Contacto[0].Telefono[0].CodigoInt)%>
                </div>
                <div class="editor-field">
                    <%: Html.ValidationMessageFor(model => model.Contacto[0].Telefono[0].CodigoLoc)%>
                </div>
                <div class="editor-field">
                    <%: Html.ValidationMessageFor(model => model.Contacto[0].Telefono[0].Numero)%>
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
    
</asp:Content>
