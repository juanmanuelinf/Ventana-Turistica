<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<VentanaTuristica.Model.Lugar>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Agregar Lugar
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript" src="<%:Url.Content("~/Scripts/jquery.cascade.js") %>"></script>
<script type="text/javascript" src="<%:Url.Content("~/Scripts/jquery.cascade.ext.js") %>"></script>
<script type="text/javascript" src="<%:Url.Content("~/Scripts/jquery.templating.js") %>"></script>


<script type="text/javascript">
    jQuery(document).ready(function () {
        jQuery("#Foranea").cascade("#Lugar", {
            ajax: { url: 'GetForaneas' },
            template: commonTemplate,
            match: commonMatch
        });
    });
    function commonTemplate(item) {
        return "<option value='" + item.Value + "'>" + item.Text + "</option>";
    };
    function commonTemplate2(item) {
        return item.Value;
    };

    function commonMatch(selectedValue) {
        return this.When == selectedValue;
    };


	</script>

    <h2>Agregar Lugar</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Datos</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Nombre) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Nombre) %>
                <%: Html.ValidationMessageFor(model => model.Nombre) %>
            </div>
            
             <div class="editor-label">
                <label> Tipo:</label>
            </div>
            
            <div class="editor-field">
                <%= Html.DropDownList("Lugar")%>
              
            </div>
            
          <div class="editor-label">
                <label> Pertenece a:</label>
            </div>
            
            <div class="editor-field">
                <%= Html.DropDownList("Foranea")%>
            </div>
            <p>
                <input type="submit" value="Crear" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Atras", "Index") %>
    </div>

</asp:Content>

