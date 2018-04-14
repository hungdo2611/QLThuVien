using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
namespace phieunhapQLTV
{
    class connectsql
    {
        public static SqlConnection conn;
        public static SqlCommand cmd;
        public static SqlDataAdapter da;
        public SqlConnection openDB()
        {
            conn = new SqlConnection(@"Data Source=DESKTOP-SNTR6UK;Initial Catalog=QLThuVien;Integrated Security=True");
            return conn;
        }
        // hàm mở kêt nối
        public static void OpenConnection()
        {
            string sql = @"Data Source=DESKTOP-SNTR6UK;Initial Catalog=QLThuVien;Integrated Security=True";
            try
            {
                conn = new SqlConnection(sql);
                conn.Open();
            }
            catch(SqlException Ex)
            {

            }

        }
        public static void disconnection()
        {
            conn.Close();
            conn.Dispose();
            conn = null;
        }
        public static DataTable getDataTable(string sql)
        {
            cmd = new SqlCommand(sql, conn);
            da = new SqlDataAdapter();
            DataTable table = new DataTable();
            da.Fill(table);
            da.Dispose();
            cmd.Dispose();
            return table;


        }
        public static void Excute(string sql)
        {
            cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
        }
    }
}
