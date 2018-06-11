using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

using System.IO;

public partial class IngredientsPage : System.Web.UI.Page
{
    private OleDbConnection _conn = new OleDbConnection();
    private const int BTWINGREDIENT = 6;

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
                OleDbDataAdapter da = new OleDbDataAdapter(cmd.CommandText, _conn);
                DataSet ds = new DataSet();
                da.Fill(ds);
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

    protected void btn_Export_Click(object sender, EventArgs e)
    {
        Response.ClearContent();
        Response.AppendHeader("content-disposition", "attachment; filename=Ingrediententen.xls");
        Response.ContentType = "application/excel";

        StringWriter sw = new StringWriter();
        HtmlTextWriter htmltw = new HtmlTextWriter(sw);

        IngredientView.RenderControl(htmltw);
        Response.Write(sw.ToString());
        Response.End();
    }

    protected void IngredientView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName == "AddToCart")
        {
            //int index = IngredientView.SelectedRow.RowIndex;
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = IngredientView.Rows[index];
            //Add to shoppingcart\
            if(row != null)
            {
                Additem(/*Convert.ToInt32(row.Cells[1].Text),*/ row.Cells[2].Text.ToString(), row.Cells[3].Text.ToString(), BTWINGREDIENT);
            }
        }
    }

    private void Additem(string itemName, string itemDesc, int btw)
    {
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
            _conn.Open();
            cmd.ExecuteNonQuery();

        }
        catch (Exception exc)
        {
            lbl_Error.Text = exc.Message;
        }
        finally
        {
            _conn.Close();
        }

    }

    //Export ingredients to excel 


    public override void VerifyRenderingInServerForm(Control control)
    {
    }
}
