<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site2.Master" Inherits="System.Web.Mvc.ViewPage<VentanaTuristica.Model.Patrocinante>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editar Patrocinante
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2></h2>

     <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true,"Ha ocurrido un error. Por favor corrijalos e intente de nuevo.") %>

        <fieldset>
            <legend>Editar Patrocinante</legend>
           
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
                <%: Html.LabelFor(model => model.Contacto[0].Telefono[0].CodigoInt)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Contacto[0].Telefono[0].CodigoInt)%>
                <%: Html.ValidationMessageFor(model => model.Contacto[0].Telefono[0].CodigoInt)%>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.Contacto[0].Telefono[0].CodigoLoc)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Contacto[0].Telefono[0].CodigoLoc)%>
                <%: Html.ValidationMessageFor(model => model.Contacto[0].Telefono[0].CodigoLoc)%>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.Contacto[0].Telefono[0].Numero)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Contacto[0].Telefono[0].Numero)%>
                <%: Html.ValidationMessageFor(model => model.Contacto[0].Telefono[0].Numero)%>
            </div>
        </fieldset>
        <input type="hidden" value="<%: Model.IdPatrocinante %>" name="IdPatrocinante" />
        <input type="hidden" value="<%: Model.Contacto[0].IdContacto %>" name="Contacto[0].IdContacto" />
        <input type="hidden" value="<%: Model.Contacto[0].Telefono[0].IdTelefono %>" name="Contacto[0].Telefono[0].IdTelefono" />
                        
            <div class="editor-label">
                <input type="submit" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover" value="Actualizar" />
            </div>
            
    <% } %>
        <br />
        <table>
            <td><a title="Patrocinantes" href="<%=Url.Action("Index")%>">
                <img src="<%=Url.Content("~/Content/atras.png")%>" height="25px" width="25px" /></a></td>
            <td><%: Html.ActionLink("Patrocinantes", "Index")%></td>
        </table>
    </fieldset>
</asp:Content>
