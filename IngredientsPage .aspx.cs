using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

using ExcelLibrary.CompoundDocumentFormat;
using ExcelLibrary.SpreadSheet;
using System.IO;
using System.Configuration;

public partial class IngredientsPage : System.Web.UI.Page
{
    private OleDbConnection _conn = new OleDbConnection();
    private const int BTWINGREDIENT = 6;

    protected void Page_Load(object sender, EventArgs e)
    {
        _conn.ConnectionString = ConfigurationManager.ConnectionStrings["JECO"].ToString();
        OleDbCommand cmd = new OleDbCommand();
        //cmd.CommandText = "SELECT OrderNr FROM "

    }

    //Export the table to a .xls file
    protected void btn_Export_Click(object sender, EventArgs e)
    {
        //Clear output stream
        Response.ClearContent();
        //set filename
        Response.AppendHeader("content-disposition", "attachment; filename=Ingrediententen.xls");
        //setcontenttype
        Response.ContentType = "application/excel";

        //set stringwriter to htmlwriter
        StringWriter sw = new StringWriter();
        HtmlTextWriter htmltw = new HtmlTextWriter(sw);

        //Write the data to he .xls file
        IngredientView.RenderControl(htmltw);
        Response.Write(sw.ToString());
        //end
        Response.End();
    }

    protected void IngredientView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName == "AddToCart")
        {
            //int index = IngredientView.SelectedRow.RowIndex;
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = IngredientView.Rows[index];

            int ordernr = Convert.ToInt32(IngredientView.Rows.Count);
            double pricerow = Convert.ToDouble(row.Cells[3].Text);
          //  int idrow = Convert.ToInt32(row.Cells[0].Text);
            //Add to shoppingcart\
            if(row != null)
            {
                Additem(ordernr, row.Cells[1].Text.ToString(), row.Cells[2].Text.ToString(), pricerow, BTWINGREDIENT);
            }
        }
    }
    //inset the id, name, desc, price and btw to the function to add too the Orderregel Table
    private void Additem(int itemid, string itemName, string itemDesc,double itemPrice, int btw)
    {
        try
        {
            int amount = 1;
            _conn.Open();
            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = _conn;
            cmd.Parameters.AddWithValue("@id", itemid);
            cmd.Parameters.AddWithValue("@name", itemName);
            cmd.Parameters.AddWithValue("@desc", itemDesc);
            cmd.Parameters.AddWithValue("@price", itemPrice);
            cmd.Parameters.AddWithValue("@btw", btw);
            cmd.Parameters.AddWithValue("@amount", amount);
            cmd.CommandText = "INSERT INTO Orderregel(naam, Omschrijving, Inkoopprijs, [BTW Tarief], Aantal)" +
            "VALUES(@id, @name, @price, @desc, @btw, @amount)";
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
