<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VentanaTuristica.Model.Blog>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Nueva entrada
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <form id="form1" runat="server">

    <script type="text/javascript" src="<%:Url.Content("~/Scripts/jquery.ui.datepicker-es.js") %>"></script>
    <script type="text/javascript" src="<%:Url.Content("~/Scripts/jquery.ui.datepicker.js") %>"></script>
    <script type="text/javascript" src="<%:Url.Content("~/Scriptsjquery-1.4.3.js.js") %>"></script>
    <script type="text/javascript" src="<%:Url.Content("~/Scripts/jquery.ui.core.js") %>"></script>
   
    <script type="text/javascript">
        $(function () {
            $("#Fecha").datepicker();
        });
	</script>

    <h2>Create</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Titulo) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Titulo) %>
                <%: Html.ValidationMessageFor(model => model.Titulo) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.Descripcion) %>
            </div>
          
            <div class="editor-field" Height="110px" Width="275px">
                <%: Html.TextAreaFor(model => model.Descripcion) %>
                <%: Html.ValidationMessageFor(model => model.Descripcion) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Fecha) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Fecha,new { @class = "text-box" }) %>
                <%: Html.ValidationMessageFor(model => model.Fecha) %>
            </div>
            
            <p>
                <input type="submit" value="Crear" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Regresar", "Index") %>
    </div>

    </form>

</asp:Content>