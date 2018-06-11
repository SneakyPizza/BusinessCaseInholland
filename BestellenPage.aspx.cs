using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using System.Configuration;

public partial class BestellenPage : System.Web.UI.Page
{
    private int _pid;
    private string _pname;
    private int _ordernr;
    private OleDbConnection _conn = new OleDbConnection();
    private HttpCookie _cookie;
    private int _count;

    protected void Page_Load(object sender, EventArgs e)
    {
        _count = 1;
        if(_cookie == null)
        {
            _cookie = new HttpCookie("cookie");
            _cookie.Values["ordercount"] = _count.ToString();
        }
        
        _conn.ConnectionString = ConfigurationManager.ConnectionStrings["JECO"].ToString();
        
        try
        {
            //check connection status
            if (_conn != null && _conn.State == ConnectionState.Closed)
            {
                //set ordernum
                _ordernr = Convert.ToInt32(tb_OrderNr.Text);
                _conn.Open();

                //command
                OleDbCommand cmd = new OleDbCommand();
                cmd.Parameters.AddWithValue("@ordernr", _ordernr);
                cmd.Connection = _conn;
                cmd.CommandText = "SELECT * FROM Orderregel INNER JOIN InkoopOrder ON Orderregel.InkoopOrderNr = InkoopOrder.InkoopOrderNr ";

                //fill the new datasource with the query result
                OleDbDataReader r = cmd.ExecuteReader();
                OleDbDataAdapter da = new OleDbDataAdapter(cmd.CommandText, _conn);
                r.Read();
                DataSet ds = new DataSet();
                da.Fill(ds);

                //Clear and add new datasource
                GridView1.DataSource = null;
                //GridView1.DataSource = ds;
                GridView1.DataSourceID = "BestellenOrderregel";
                GridView1.DataBind();
            }
            else
            {
                _conn.Close();
            }
        }
        catch (Exception exc)
        {
            lbl_error.Text = exc.Message;
        }
        finally
        {
            _conn.Close();
        }

    }


    protected void btn_ChangeOrder_Click(object sender, EventArgs e)
    {
        int order = Convert.ToInt32(tb_OrderNr.Text);
        //BestellenOrderregel.SelectParameters["@Orderregelnr"] = order;
    }

    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {



    }

    protected void BestellenView_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void btn_Bestellen_Click(object sender, EventArgs e)
    {
        _count = Convert.ToInt32(_cookie.Values["ordercount"]) + 1;
        _cookie.Values["ordercount"] = _count.ToString();
        

        lbl_error.Text = _cookie.Values["ordercount"].ToString();
    }
}

