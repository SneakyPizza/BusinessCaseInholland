using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

public partial class BestellenPage : System.Web.UI.Page
{
   private List<string> Objects = new List<string>();

    protected void Page_Load(object sender, EventArgs e)
    {
        int amount; // = value input from textbox at selected value
        string name; //= selected item from tabel


    }

    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {
        string pname = GridView1.SelectedRow.Cells[1].Text;
        //add pname + amount to database

        if(Main.Conn() != null)
        {
            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = Main.Conn();
            cmd.CommandText = "";
        }
    }
}