<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="BestellenPage.aspx.cs" Inherits="BestellenPage" %>

<<<<<<< HEAD

=======
>>>>>>> 6786377ab77d3d5e0b20875e6e23102a57e9022c
<asp:Content ID="Content1" ContentPlaceHolderID="ContentAsp" runat="Server">
    <asp:Label ID="_PageTitle" runat="server" Text="Bestellen pagina" Font-Bold="True" Font-Overline="False" Font-Size="X-Large" Font-Strikeout="False" ForeColor="#57504C"></asp:Label>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Orderregelnr" DataSourceID="BestellenView">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Orderregelnr" HeaderText="Orderregelnr" InsertVisible="False" ReadOnly="True" SortExpression="Orderregelnr" />
            <asp:BoundField DataField="Naam" HeaderText="Naam" ReadOnly="True" SortExpression="Naam" />
            <asp:BoundField DataField="Omschrijving" HeaderText="Omschrijving" ReadOnly="True" SortExpression="Omschrijving" />
            <asp:BoundField DataField="Inkoopprijs" HeaderText="Inkoopprijs" ReadOnly="True" SortExpression="Inkoopprijs" />
            <asp:TemplateField HeaderText="Aantal" SortExpression="Aantal" Visible="True">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Aantal") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUpdateAmount" runat="server" ErrorMessage="Aantal is a required field" ControlToValidate="TextBox1" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Aantal") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="BTW Tarief" HeaderText="BTW Tarief" SortExpression="BTW Tarief" ReadOnly="True" />
            <asp:BoundField DataField="InkoopOrderNr" HeaderText="InkoopOrderNr" ReadOnly="True" SortExpression="InkoopOrderNr" Visible="False" />
            <asp:BoundField DataField="VoorraadNr" HeaderText="VoorraadNr" ReadOnly="True" SortExpression="VoorraadNr" Visible="False" />
        </Columns>
        <EditRowStyle BorderStyle="None" BorderWidth="0px" />
        <EmptyDataRowStyle BorderStyle="None" BorderWidth="0px" />
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="White" Font-Bold="True" ForeColor="#9D2E48" BorderStyle="None" BorderWidth="0px" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" BorderStyle="None" />
        <RowStyle BackColor="White" BorderStyle="None" ForeColor="#57504C" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#E6E6E6" />
        <SortedAscendingHeaderStyle BackColor="#9D2E48" ForeColor="White" />
        <SortedDescendingCellStyle BackColor="#E6E6E6" />
        <SortedDescendingHeaderStyle BackColor="#9D2E48" />
    </asp:GridView>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <asp:AccessDataSource ID="BestellenView" runat="server" DataFile="~/App_Data/JECODatabase.accdb" 
        DeleteCommand="DELETE FROM [Orderregel] WHERE [Orderregelnr] = ?" 
        InsertCommand="INSERT INTO [Orderregel] ([Orderregelnr], [Naam], [Omschrijving], [Inkoopprijs], [BTW Tarief], [InkoopOrderNr], [VoorraadNr], [Aantal]) VALUES (?, ?, ?, ?, ?, ?, ?, ?)" 
        SelectCommand="SELECT * FROM [Orderregel]" 
        UpdateCommand="UPDATE [Orderregel] SET [Aantal] = ? WHERE [Orderregelnr] = ?">
        <DeleteParameters>
            <asp:Parameter Name="Orderregelnr" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Orderregelnr" Type="Int32" />
            <asp:Parameter Name="Naam" Type="String" />
            <asp:Parameter Name="Omschrijving" Type="String" />
            <asp:Parameter Name="Inkoopprijs" Type="Decimal" />
            <asp:Parameter Name="BTW_Tarief" Type="Int32" />
            <asp:Parameter Name="InkoopOrderNr" Type="Int32" />
            <asp:Parameter Name="VoorraadNr" Type="Int32" />
            <asp:Parameter Name="Aantal" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Naam" Type="String" />
            <asp:Parameter Name="Omschrijving" Type="String" />
            <asp:Parameter Name="Inkoopprijs" Type="Decimal" />
            <asp:Parameter Name="BTW_Tarief" Type="Int32" />
            <asp:Parameter Name="InkoopOrderNr" Type="Int32" />
            <asp:Parameter Name="VoorraadNr" Type="Int32" />
            <asp:Parameter Name="Aantal" Type="Int32" />
            <asp:Parameter Name="Orderregelnr" Type="Int32" />
        </UpdateParameters>
    </asp:AccessDataSource>
</asp:Content>

