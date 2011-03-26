<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site2.Master" Inherits="System.Web.Mvc.ViewPage<VentanaTuristica.Model.Blog>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Nueva entrada al blog
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="<%:Url.Content("~/Scripts/jquery.ui.datepicker-es.js") %>"></script>
   
    <script type="text/javascript">
        $(function () {
            $("#Fecha").datepicker();
        });
	</script>

    <h2></h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Nueva entrada al blog</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Titulo) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Titulo) %>
                <%: Html.ValidationMessageFor(model => model.Titulo) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.Fecha) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Fecha,new { @class = "text-box" }) %>
                <%: Html.ValidationMessageFor(model => model.Fecha) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Descripcion) %>
            </div>
          
            <div class="editor-field" Height="110px" Width="275px">
                <%: Html.TextAreaFor(model => model.Descripcion)%>
                <%: Html.ValidationMessageFor(model => model.Descripcion) %>
            </div>
            
            <div>
                <input type="submit" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover" value="Aceptar" />
            </div>

    <% } %>

    <br />
        <table>
            <td><a title="Entradas del blog" href="<%=Url.Action("Index")%>">
                <img src="<%=Url.Content("~/Content/atras.png")%>" height="25px" width="25px" /></a></td>
            <td><%: Html.ActionLink("Entradas del Blog", "Index")%></td>
        </table>
    </fieldset>

</asp:Content>