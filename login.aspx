<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h4>Username:</h4>
    <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>

    <h4>Password:</h4>
    <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
    <p>
        <asp:Button ID="btnLogin" runat="server" Text="Login" />
    </p>
    <p>Usernames: Zips, Falcons, Bulls, Lighting, Cardinals, Eagles, redHawks, Bobcats, Huskies, Rockets, Broncos, Owls, Cougars,Panthers, Bears, Tigers, Hawks, Mountaineers, Minutemen, Bulldogs
     <br />Password: Mike      
     </p>

    <p>    <asp:Label ID="lbllogin" runat="server"></asp:Label>  </p>
</asp:Content>

