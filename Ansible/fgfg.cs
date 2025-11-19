using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class GridCrud : System.Web.UI.Page
{
    string cs = "Data Source=.;Initial Catalog=TestDB;Integrated Security=True";
    void Bind() {
        using (var c = new SqlConnection(cs))
        using (var da = new SqlDataAdapter("SELECT * FROM Students", c)) {
            var dt = new DataTable(); da.Fill(dt);
            GridView1.DataSource = dt; GridView1.DataBind();
        }
    }
    protected void Page_Load(object s, EventArgs e) { if (!IsPostBack) Bind(); }
    protected void GridView1_RowEditing(object s, GridViewEditEventArgs e) { GridView1.EditIndex = e.NewEditIndex; Bind(); }
    protected void GridView1_RowCancelingEdit(object s, GridViewCancelEditEventArgs e) { GridView1.EditIndex = -1; Bind(); }
    protected void GridView1_RowUpdating(object s, GridViewUpdateEventArgs e) {
        int id = (int)GridView1.DataKeys[e.RowIndex].Value;
        string name = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtName")).Text;
        string age = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtAge")).Text;
        using (var c = new SqlConnection(cs))
        using (var cmd = new SqlCommand("UPDATE Students SET Name=@n, Age=@a WHERE Id=@id", c)) {
            cmd.Parameters.AddWithValue("@n", name); cmd.Parameters.AddWithValue("@a", age); cmd.Parameters.AddWithValue("@id", id);
            c.Open(); cmd.ExecuteNonQuery();
        }
        GridView1.EditIndex = -1; Bind();
    }
    protected void GridView1_RowCommand(object s, GridViewCommandEventArgs e) {
        if (e.CommandName == "AddNew") {
            string name = ((TextBox)GridView1.FooterRow.FindControl("txtNameFooter")).Text;
            string age = ((TextBox)GridView1.FooterRow.FindControl("txtAgeFooter")).Text;
            using (var c = new SqlConnection(cs))
            using (var cmd = new SqlCommand("INSERT INTO Students(Name,Age) VALUES(@n,@a)", c)) {
                cmd.Parameters.AddWithValue("@n", name); cmd.Parameters.AddWithValue("@a", age);
                c.Open(); cmd.ExecuteNonQuery();
            }
            Bind();
        }
    }
}
