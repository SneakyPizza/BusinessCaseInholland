<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="IngredientsPage .aspx.cs" Inherits="IngredientsPage" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentAsp" Runat="Server">
    <asp:Label ID="_PageTitle" runat="server" Text="Ingrediënten pagina" Font-Bold="True" Font-Overline="False" Font-Size="X-Large" Font-Strikeout="False" ForeColor="#57504C"></asp:Label>
    <br />
    <asp:GridView ID="IngredientView" runat="server" AutoGenerateColumns="False" DataKeyNames="IngredientNr" DataSourceID="AccessDataSource1" AllowSorting="True" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="50%" OnRowCommand="IngredientView_RowCommand">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="IngredientNr" HeaderText="IngredientNr" InsertVisible="False" ReadOnly="True" SortExpression="IngredientNr" />
            <asp:BoundField DataField="IngredientNaam" HeaderText="IngredientNaam" SortExpression="IngredientNaam" />
            <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" SortExpression="Omschrijving" />
            <asp:BoundField DataField="ProductNr" HeaderText="ProductNr" SortExpression="ProductNr" />
            <asp:BoundField DataField="MinVoorraad" HeaderText="MinVoorraad" SortExpression="MinVoorraad" />
            <asp:BoundField DataField="MaxVoorraad" HeaderText="MaxVoorraad" SortExpression="MaxVoorraad" />
            <asp:ButtonField ButtonType="Button" CommandName="AddToCart" Text="Add to Cart"/>
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
    <asp:Button ID="btn_Export" runat="server" OnClick="btn_Export_Click" Text="Export to Excel" />
    <br />
    <br />
    <br />
    <asp:Label ID="lbl_Error" runat="server"></asp:Label>
    </asp:Content>

