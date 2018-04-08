using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyThuVIen.GUI
{

    public partial class QuanLyDOcGia : Form
    {
        DocGia_BUS dg = new DocGia_BUS();
        public QuanLyDOcGia()
        {
            InitializeComponent();
        }
        public void ResetText1()
        {
            List<TextBox> lst = new List<TextBox>()
            {
                txtDGID,txtTenDG,txtNS,txtDienthoai,txtDiachi,txtTKDiachi,txtTKTenDG
            };
            foreach (var item in lst)
                item.ResetText();
            txtTenDG.Focus();
        }
        #region Handle button
        int luu = 0;
        private void btnThem_Click(object sender, EventArgs e)
        {
            luu = 1;
            btnThem.Enabled = false;
            btnThem.BackColor = Color.LightBlue;
            btnXoa.Enabled = false;
            btnSua.Enabled = false;
            ResetText1();
            txtTKDiachi.Enabled = false;
            txtTKTenDG.Enabled = false;
        }

        private void txtKHID_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            if (txtDGID.Text == "")
                MessageBox.Show("Chọn một sản phẩm để sửa.", "Lỗi");
            else
            {
                luu = 2;
                txtTenDG.Focus();
                btnSua.BackColor = Color.LightBlue;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                btnThem.Enabled = false;
                txtTKDiachi.Enabled = false;
                txtTKTenDG.Enabled = false;
            }
        }

        private void QuanLyDOcGia_Load(object sender, EventArgs e)
        {

        }
        #endregion

        private void btnXoa_Click(object sender, EventArgs e)
        {
            luu = 0;
            int res = dg.Delete(int.Parse(txtDGID.Text));
            if (txtDGID.Text == "")
                MessageBox.Show("Chọn một khách hàng để xóa.", "Lỗi");
            else if (res == 1)
                MessageBox.Show("Khách hàng đã từng thực hiện giao dịch không thể xóa.", "Lỗi");
            else
            {
                DialogResult dr;
                dr = MessageBox.Show("Xóa dữ liệu khách hàng", "Cảnh báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning);
                if (dr == DialogResult.OK)
                {
                    dg.Delete(int.Parse(txtDGID.Text));
                    MessageBox.Show("Xóa thành công");
                    dg.ViewAll();
                }
            }
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            if (luu == 1)
            {
                txtDGID.ResetText();
                if (txtTenDG.Text == "" | txtNS.Text == "" | txtDienthoai.Text == "" | txtDiachi.Text == "")
                    MessageBox.Show("Nhập đầy đủ thông tin khách hàng.", "Lỗi");
                else
                {
                   // dg.Add(txtTenDG.Text, txtNS.Text, txtDienthoai.Text, txtDiachi.Text);
                    MessageBox.Show("Thêm thành công");
                    dg.ViewAll();
                    Start();
                }
            }
            else if (luu == 2)
            {
                if (txtTenDG.Text == "" | txtNS.Text == "" | txtDienthoai.Text == "" | txtDiachi.Text == "")
                    MessageBox.Show("Nhập đầy đủ thông tin sản phẩm.", "Lỗi");
                else
                {
                    //dg.Update(int.Parse(txtDGID.Text), txtTenDG.Text, txtNS.Text, txtDienthoai.Text, txtDiachi.Text);
                    MessageBox.Show("Sửa thành công");
                    dg.ViewAll();
                    Start();
                }
            }
        }
        public void Start()
        {
            ResetText1();
            luu = 0;
            btnSua.BackColor = Color.LightGray;
            btnThem.BackColor = Color.LightGray;
            btnHuy.BackColor = Color.LightGray;
            btnLuu.BackColor = Color.LightGray;
            btnXoa.Enabled = true;
            btnSua.Enabled = true;
            btnThem.Enabled = true;
            txtTKDiachi.Enabled = true;
            txtTKTenDG.Enabled = true;
        }
    }
}
