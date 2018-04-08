using QuanLyThuVIen.DataLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


class DocGia_BUS
{
    #region Control

    public DataGridView bangDuLieu { get; set; }
    public DataView dv { get; set; }
    #endregion
    

    public void ViewAll()
    {
        string sql = string.Format("select * from DocGia");
        DataTable dt = DataAccess.Query(sql);
        dv = new DataView(dt);
        bangDuLieu.DataSource = dt;
        bangDuLieu.Columns[0].HeaderText = "ID";
        bangDuLieu.Columns[1].HeaderText = "Tên doc gia";
        bangDuLieu.Columns[2].HeaderText = "Ngay sinh";
        bangDuLieu.Columns[3].HeaderText = "Gioi Tinh";
        bangDuLieu.Columns[4].HeaderText = "SDT";
        bangDuLieu.Columns[5].HeaderText = "Dia chi";
    }
    public void timKiem(string tendg, string diachi)
    {
        dv.RowFilter = "[HoTen] like '%" + tendg + "%' and [Diachi] like '%" + diachi + "%'";
        bangDuLieu.DataSource = dv;
    }
    public void Add(string ten, DateBoldEventArgs ngaysinh, string gt, string sdt, string diachi)
    {
        DataAccess.NonQuery("DocGia_insert",
            new SqlParameter("@ten", ten),
            new SqlParameter("@ngaysinh", ngaysinh),
            new SqlParameter("@gioitinh", gt),
            new SqlParameter("@sdt", sdt),
            new SqlParameter("@diachi", diachi));
    }
    public void Update(int id, string ten, DateBoldEventArgs ngaysinh, string gt, string sdt, string diachi)
    {
        DataAccess.NonQuery("DocGia_update",
            new SqlParameter("@id", id),
            new SqlParameter("@ten", ten),
            new SqlParameter("@ngaysinh", ngaysinh),
            new SqlParameter("@gioitinh", gt),
            new SqlParameter("@sdt", sdt),
            new SqlParameter("@diachi", diachi));
    }
    public int Delete(int id)
    {
        DataTable dt = DataAccess.Query("DocGia_delete",
            new SqlParameter("@id", id));
        int res = int.Parse(dt.Rows[0][0].ToString());
        return res;
    }
}
      
