<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="teams.aspx.vb" Inherits="teams" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" 
    DataSourceID="SqlDataSource1" DataTextField="Team_Name" DataValueField="id">
</asp:ListBox>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:basketballDBConnectionString %>" 
    SelectCommand="SELECT [id], [Team_Name] FROM [Teams] ORDER BY [Team_Name]">
</asp:SqlDataSource>
<br />
<br />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataSourceID="SqlDataSource2">
    <Columns>
        <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname" />
        <asp:BoundField DataField="lname" HeaderText="lname" SortExpression="lname" />
        <asp:BoundField DataField="address" HeaderText="address" 
            SortExpression="address" />
        <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
        <asp:BoundField DataField="age" HeaderText="age" SortExpression="age" />
        <asp:BoundField DataField="position" HeaderText="position" 
            SortExpression="position" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:basketballDBConnectionString %>" 
    SelectCommand="SELECT [fname], [lname], [address], [city], [age], [position] FROM [Players] WHERE ([team_id] = @team_id) ORDER BY [fname]">
    <SelectParameters>
        <asp:ControlParameter ControlID="ListBox1" Name="team_id" 
            PropertyName="SelectedValue" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>

