<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site4.Master" Inherits="System.Web.Mvc.ViewPage<VentanaTuristica.Model.Imagene>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Nuevo Patrocinante
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <% using (Html.BeginForm("Create", "Imagene", FormMethod.Post, new { enctype = "multipart/form-data" }))
           {%>

        <fieldset>

            <%= Html.ValidationSummary(true,"Ha ocurrido un error. Por favor corrijalos e intente de nuevo.") %>
        
            <legend>Nueva imagen</legend>
           
                <input type="hidden" value="I" name="Tipo" />

                <div class="editor-label">
                    <%: Html.Label("Archivo")%>
                </div>
                <div class="editor-field">
                    <input type="file" name="File" id="File" />
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Descripcion) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextAreaFor(model => model.Descripcion)%>
                    <%: Html.ValidationMessageFor(model => model.Descripcion)%>
                </div>


                <br />
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
