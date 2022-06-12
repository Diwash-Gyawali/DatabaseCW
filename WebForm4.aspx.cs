using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DatabaseCw
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        private string toLink = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        private OracleConnection oracle;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void saveModule(object sender, EventArgs e)
        {

            GridViewRow gridViewRow = (GridViewRow)((LinkButton)sender).NamingContainer;
            oracle = new OracleConnection(toLink);
            oracle.Open();
            String Module_Code = ((Label)gridViewRow.FindControl("Label1")).Text;
            String Module_Name = ((TextBox)gridViewRow.FindControl("TextBox1")).Text;
            String Credit_Hours = ((TextBox)gridViewRow.FindControl("TextBox2")).Text;
            OracleCommand command = new OracleCommand($"Update Module set Module_Name = '{Module_Name}',Credit_Hours='{Credit_Hours}  where Module_code ='{Module_Code}'", oracle);
            command.ExecuteNonQuery();
            oracle.Close();
            GridView1.EditIndex = -1;
            GridView1.DataBind();
        }
        protected void delete(object sender, EventArgs e)
        {
            GridViewRow gridViewRow = (GridViewRow)((LinkButton)sender).NamingContainer;
            oracle = new OracleConnection(toLink);
            oracle.Open();
            String Module_Code = ((Label)gridViewRow.FindControl("Label1")).Text;
            OracleCommand command = new OracleCommand($"delete Module where Module_Code={Module_Code}", oracle);
            command.ExecuteNonQuery();

            //OracleCommand commandto = new OracleCommand($"delete student where Student_Id={Student_Id} where Student_Id={Student_Id}", oracle);
            //commandto.ExecuteNonQuery();

            oracle.Close();
            GridView1.DataBind();
        }

        protected void insert(object sender, EventArgs e) {
            //System.Diagnostics.Debug.Write("hwlli");
            oracle = new OracleConnection(toLink);
            oracle.Open();

            string module_code = ((TextBox)FormView1.FindControl("MODULE_CODETextBox")).Text;
            string module_name = ((TextBox)FormView1.FindControl("MODULE_NAMETextBox")).Text;
            string credit_hours = ((TextBox)FormView1.FindControl("CREDIT_HOURSTextBox")).Text;

            OracleCommand command = new OracleCommand($"insert into module values('{module_code}', '{module_name}', {credit_hours})", oracle);
            command.ExecuteNonQuery();

            oracle.Close();
            GridView1.DataBind();
        }
    }
}