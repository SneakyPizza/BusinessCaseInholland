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

        }
        finally
        {
            _conn.Close();
        }

    }

    //Export ingredients to excel 
    protected void btn_Export_Click(object sender, EventArgs e)
    {
        OleDbConnection conn = Main.Conn();
        
        OleDbDataAdapter da = new OleDbDataAdapter();
        OleDbCommand cmd = new OleDbCommand("SELECT * FROM Ingredient");

        cmd.Connection = conn;
        da.SelectCommand = cmd;
        DataTable dt = new DataTable();
        da.Fill(dt);

        //create excel file 
        string file = "ExportSql.xlsx";
        //string path = Path.Combine((, @"JOTYApplication\JOTYApplication\Reports\", file);
        string dir = Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location);
        string path = Path.Combine(dir, file);
        Workbook workbook = new Workbook();
        Worksheet worksheet = new Worksheet("First Sheet");
        worksheet.Cells[0, 1] = new Cell((short)1); worksheet.Cells[2, 0] = new Cell(9999999);
         worksheet.Cells[3, 3] = new Cell((decimal)3.45); worksheet.Cells[2, 2] = new Cell("Text string");
         worksheet.Cells[2, 4] = new Cell("Second string"); worksheet.Cells[4, 0] = new Cell(32764.5, "#,##0.00");
         worksheet.Cells[5, 1] = new Cell(DateTime.Now, @"YYYY-MM-DD");
         worksheet.Cells.ColumnWidth[0, 1] = 3000;

        workbook.Worksheets.Add(worksheet);
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "";
        Response.ContentType = "";
        Response.AddHeader("content-dispotion", "attachment;filename=SqlExport.xlsx");
        workbook.Save(path);

        // open excel file
        Workbook book = Workbook.Load(path);
        Worksheet sheet = book.Worksheets[0];
    }
}
