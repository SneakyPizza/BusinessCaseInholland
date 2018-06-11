using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;

public partial class BestellenPage : System.Web.UI.Page
{
    private int _pid;
    private string _pname;
    private int _ordernr;
    private OleDbConnection _conn;

    protected void Page_Load(object sender, EventArgs e)
    {
        _ordernr = Convert.ToInt32(tb_OrderNr.Text);

        //cmd.CommandText = "SELECT  FROM Orderregel WHERE Order"
        //BestellenView.SelectParameters.Add("Orderregelnr", _ordernr.ToString());

        if (!IsPostBack)
        {
            /*if (Main.Conn() != null)
            {
                _conn = Main.Conn();
                _conn.Open();

                OleDbCommand cmd = new OleDbCommand();
                cmd.Parameters.AddWithValue("@ordernr", _ordernr);
                cmd.Connection = _conn;
                cmd.CommandText = "SELECT * FROM Orderregel WHERE OrderregelNr = @ordernr";
                OleDbDataAdapter da = new OleDbDataAdapter(cmd.CommandText, _conn);
                DataSet ds = new DataSet();
                da.Fill(ds);

                GridView1.DataSource = ds;
                GridView1.DataBind();
            }*/
        }
    }

    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {



    }

    protected void BestellenView_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void btn_Bestellen_Click(object sender, EventArgs e)
    {
        OleDbConnection conn = Main.Conn();
        OleDbCommand icmd = new OleDbCommand();

        
    }

}

