<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="coaches.aspx.vb" Inherits="coaches" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblCoach" runat="server"></asp:Label>
    <br />
    <br />
    <!--Developer: Leonard McGhie -->
    <!---Display details view of players based on session value team_id -->
    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" DataKeyNames="id" DataSourceID="SqlDataSource2" 
        Height="50px" Width="545px">
        <Fields>
            <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname" />
            <asp:BoundField DataField="lname" HeaderText="lname" SortExpression="lname" />
            <asp:BoundField DataField="address" HeaderText="address" 
                SortExpression="address" />
            <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
            <asp:BoundField DataField="age" HeaderText="age" SortExpression="age" />
            <asp:BoundField DataField="position" HeaderText="position" 
                SortExpression="position" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:basketballDBConnectionString %>" 
        DeleteCommand="DELETE FROM [Players] WHERE [id] = @original_id " 
        InsertCommand="INSERT INTO [Players] ([fname], [lname], [address], [city], [age], [team_id], [position]) VALUES (@fname, @lname, @address, @city, @age, @team_id, @position)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT * FROM [Players] WHERE ([team_id] = @team_id) ORDER BY [fname]" 
        
        UpdateCommand="UPDATE [Players] SET [fname] = @fname, [lname] = @lname, [address] = @address, [city] = @city, [age] = @age,  [position] = @position WHERE [id] = @original_id ">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="fname" Type="String" />
            <asp:Parameter Name="lname" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="age" Type="Int32" />
            <asp:SessionParameter Name="team_id" SessionField="Team_Id" Type="Int32" />   
            <asp:Parameter Name="position" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="team_id" SessionField="Team_Id" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="fname" Type="String" />
            <asp:Parameter Name="lname" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="age" Type="Int32" />
            <asp:Parameter Name="team_id" Type="Int32" />
            <asp:Parameter Name="position" Type="String" />
            <asp:Parameter Name="original_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

