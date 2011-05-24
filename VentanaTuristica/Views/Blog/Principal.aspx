<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site2.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<VentanaTuristica.Model.Blog>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Blog
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 align="center" style="color: #F9A62B" >Bienvenido a mi Blog</h2>

 <% foreach (var item in Model) { %>
   
     <h><%: item.Titulo %> </h>
               
   <h>  <%: String.Format("{0:g}", item.Fecha) %></h>
               
   <h align="center">  <%= item.Descripcion %> </h>
               
   <!-- AddThis Button BEGIN -->
      <h1 class="addthis_toolbox addthis_default_style ">
         <a class="addthis_button_preferred_1"></a>
         <a class="addthis_button_preferred_2"></a>
         <a class="addthis_button_preferred_3"></a>
         <a class="addthis_button_preferred_4"></a>
         <a class="addthis_button_compact"></a>
         <a class="addthis_counter addthis_bubble_style"></a>
       </h1>
       <script type="text/javascript">           var addthis_config = { "data_track_clickback": true };</script>
       <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=ra-4dc0a19b40eda3d6"></script>
    <!-- AddThis Button END -->        
   
    <%} %>

</asp:Content>