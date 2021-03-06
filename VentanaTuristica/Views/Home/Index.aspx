﻿<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.Categorium>>" %>

<script runat="server">

    protected override void InitializeCulture()
    {
        base.InitializeCulture();
        if (Session["culture"] != null)
        {
            
            Culture = Session["culture"].ToString();
            UICulture = Session["culture"].ToString();
            
        }
        else
        {
            Session["culture"] = "es-MX";
            Culture = Session["culture"].ToString();
            UICulture = Session["culture"].ToString();
        }
    }
    
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Ventana Turistica
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div align="center">
<% Html.RenderAction("Imagenes","Imagene");%>
</div>
</asp:Content>
