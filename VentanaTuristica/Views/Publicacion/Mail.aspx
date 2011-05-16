<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Mail
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Mail</h2>

    <form action="../../_gdForm/webformmailer.asp" method="POST">
<input type="hidden" name="subject" value="Submission" />
<input type="hidden" name="redirect" value="../../" />
First Name: <input type="text" name="FirstName" />
Last Name :<input type="text" name="LastName" />
Email: <input type="text" name="email" />
Comments: <textarea name="comments" cols="40" rows="10">
Type comments here.</textarea>
<input type="submit" name="submit" value="submit"/>
<input type="hidden" name="form_order" value="alpha"/> <input type="hidden" name="form_interval" value="default"/> <input type="hidden" name="form_format" value="html"/> </form>

</asp:Content>
