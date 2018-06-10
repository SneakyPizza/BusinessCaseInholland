using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

public partial class DrinksPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Gridview1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName == "AddDrinks")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView1.Rows[index];

            if (row != null)
            {
                Additem(/*Convert.ToInt32(row.Cells[1].Text),*/ row.Cells[2].Text.ToString(), row.Cells[3].Text.ToString(), 10);
            }
        }
    }

    private void Additem(string itemName, string itemDesc, int btw)
    {
        OleDbConnection conn = Main.Conn();
        try
        {
            int amount = 1;

            OleDbCommand cmd = new OleDbCommand();

            //cmd.Parameters.AddWithValue("@id", itemId);
            cmd.Parameters.AddWithValue("@name", itemName);
            cmd.Parameters.AddWithValue("@desc", itemDesc);
            //cmd.Parameters.AddWithValue("@price", itemPrice);
            cmd.Parameters.AddWithValue("@btw", btw);
            cmd.Parameters.AddWithValue("@amount", amount);

            cmd.CommandText = "INSERT INTO Orderregel(naam, Omschrijving, Inkoopprijs, BTW Tarief, Aantal)" +
                "VALUES(@name, @desc, @btw, @amount)";
            conn.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception exc)
        {

        }
        finally
        {
            conn.Close();
        }

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}