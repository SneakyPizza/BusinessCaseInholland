<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="IngredientsPage .aspx.cs" Inherits="IngredientsPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentAsp" Runat="Server">
    <asp:GridView ID="IngredientView" runat="server" AutoGenerateColumns="False" DataKeyNames="IngredientNr" DataSourceID="AccessDataSource1" AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="50%">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="IngredientNr" HeaderText="IngredientNr" InsertVisible="False" ReadOnly="True" SortExpression="IngredientNr" />
            <asp:BoundField DataField="IngredientNaam" HeaderText="IngredientNaam" SortExpression="IngredientNaam" />
            <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" SortExpression="Omschrijving" />
            <asp:BoundField DataField="ProductNr" HeaderText="ProductNr" SortExpression="ProductNr" />
            <asp:BoundField DataField="MinVoorraad" HeaderText="MinVoorraad" SortExpression="MinVoorraad" />
            <asp:BoundField DataField="MaxVoorraad" HeaderText="MaxVoorraad" SortExpression="MaxVoorraad" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="Silver" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#999999" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/JECODatabase.accdb" SelectCommand="SELECT * FROM [Ingredient]"></asp:AccessDataSource>
</asp:Content>

