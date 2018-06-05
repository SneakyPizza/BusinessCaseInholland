<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="IngredientsPage .aspx.cs" Inherits="IngredientsPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentAsp" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="IngredientNr" DataSourceID="AccessDataSource1">
        <Columns>
            <asp:BoundField DataField="IngredientNr" HeaderText="IngredientNr" InsertVisible="False" ReadOnly="True" SortExpression="IngredientNr" />
            <asp:BoundField DataField="IngredientNaam" HeaderText="IngredientNaam" SortExpression="IngredientNaam" />
            <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" SortExpression="Omschrijving" />
        </Columns>
    </asp:GridView>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/JECODatabase.accdb" SelectCommand="SELECT [IngredientNr], [IngredientNaam], [Omschrijving] FROM [Ingredient]"></asp:AccessDataSource>
<asp:Label ID="IngredientTestLabel" runat="server" Text="Label"></asp:Label>
</asp:Content>

