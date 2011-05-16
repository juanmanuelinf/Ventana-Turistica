<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<System.Web.Mvc.HandleErrorInfo>" %>

<asp:Content ID="errorTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Error
</asp:Content>

<asp:Content ID="errorContent" ContentPlaceHolderID="MainContent" runat="server">       



    <h2>
        Sorry, an error occurred while processing your request.
    </h2>

	<% if (Model.Exception != null ) { %>
		<p>
		  Controller: <%= Model.ControllerName %>
		</p>
		<p>
		  Action: <%= Model.ActionName %>
		</p>
		<p>
		  Message: <%= Model.Exception.Message%>
		</p>
		<p>
		  Stack Trace: <%= Model.Exception.StackTrace%>
		</p>
        <input type="hidden" id="detalles" name="detalles" value="<%= Model.Exception.Message%> ----- <%= Model.Exception.StackTrace%>" />

        <script type="text/javascript">
            jQuery.noConflict();
            $.post("../../_gdForm/webformmailer.asp", { subject: "Submission", redirect: "../../", email: "joseph.villalba@gmail.com", mensaje: jQuery("#detalles").val, form_order: "alpha", form_interval: "default", form_format: "html" });
        </script>
	<% } %>


</asp:Content>


