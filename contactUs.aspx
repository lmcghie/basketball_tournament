<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="contactUs.aspx.vb" Inherits="contactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1> Registration Page</h1>
 <br />
 
    Select Username:<asp:TextBox ID="txtNusername" runat="server"></asp:TextBox> <br />
    Select Password:<asp:TextBox ID="txtNPassword" runat="server"></asp:TextBox> <br />
    First Name:<asp:TextBox ID="txtfname" runat="server"></asp:TextBox><br />
    Last Name:<asp:TextBox ID="txtlname" runat="server"></asp:TextBox> <br />
    
    <asp:Button ID="btnUSubmit" runat="server" Text="Submit" />   


</asp:Content>

