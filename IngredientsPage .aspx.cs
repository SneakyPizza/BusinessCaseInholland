using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

public partial class IngredientsPage : System.Web.UI.Page
{
    private OleDbConnection _conn = new OleDbConnection();
    private const float BTWINGREDIENT = 6;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Main.Conn() != null)
            {
                _conn = Main.Conn();
                _conn.Open();

                OleDbCommand cmd = new OleDbCommand();
                cmd.Connection = _conn;
                cmd.CommandText = "SELECT * FROM product";

            }
        }
        catch(Exception exc)
        {
            lbl_Error.Text = exc.Message;
        }
        finally
        {
            _conn.Close();
        }
    }

    protected void IngredientView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName == "AddToCart")
        {          
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = IngredientView.Rows[index];
            //Add to shoppingcart
            Additem(Convert.ToInt32(row.Cells[1].Text), row.Cells[1].Text.ToString(), row.Cells[2].Text.ToString(), row.Cells[8].ToString(), BTWINGREDIENT.ToString());
        }
    }

    public void Additem(int itemId, string itemName, string itemDesc, string itemPrice, string btw)
    {
        try
        {
            int amount = 1;
            
            OleDbCommand cmd = new OleDbCommand();

            cmd.Parameters.AddWithValue("@id", itemId);
            cmd.Parameters.AddWithValue("@name", itemName);
            cmd.Parameters.AddWithValue("@desc", itemDesc);
            cmd.Parameters.AddWithValue("@price", itemPrice);
            cmd.Parameters.AddWithValue("@btw", btw);
            cmd.Parameters.AddWithValue("@amount", amount);

            cmd.CommandText = "INSERT INTO Orderregel(naam, Omschrijving, Inkoopprijs, BTW Tarief, Aantal)" +
                "VALUES(@name, @desc, @price, @btw, @amount)";
            _conn.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception exc)
        {

        }
        finally
        {
            _conn.Close();
        }

    }
}
