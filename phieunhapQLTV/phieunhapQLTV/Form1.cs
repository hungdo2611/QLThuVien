using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Data;
namespace phieunhapQLTV
{
    public partial class Form1 : Form
    {
        connectsql con = new connectsql();
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter da;
        
        public void showTheLoai()
        {
            conn = con.openDB();
            conn.Open();
            cmd = new SqlCommand("select * from TheLoai", conn);
            da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataTable table = new DataTable();
            da.Fill(table);
            comboBox2.DataSource = table;
            comboBox2.DisplayMember = "TenTL";
            comboBox2.ValueMember = "MaTL";
        }
        public void showNV()
        {
            conn = con.openDB();
            conn.Open();
            cmd = new SqlCommand("select * from NhanVien", conn);
            da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataTable table = new DataTable();
            da.Fill(table);
            comboBox3.DataSource = table;
            comboBox3.DisplayMember = "HoTen";
            comboBox3.ValueMember = "SDT";
        }
        public void showNXB()
        {
            conn = con.openDB();
            conn.Open();
            cmd = new SqlCommand("select * from NXB", conn);
            da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataTable table = new DataTable();
            da.Fill(table);
            comboBox4.DataSource = table;
            comboBox4.DisplayMember = "TenNXB";
        }

        public Form1()
        {
            
            InitializeComponent();
            
        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            this.showTheLoai();
            this.showNV();
            this.showNXB();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int n = dataGridView1.Rows.Add();
            dataGridView1.Rows[n].Cells[0].Value = txtID.Text;
            dataGridView1.Rows[n].Cells[1].Value = txtSL.Text;
            dataGridView1.Rows[n].Cells[2].Value = txtKH.Text;
            dataGridView1.Rows[n].Cells[3].Value = txtTP.Text;
            dataGridView1.Rows[n].Cells[4].Value = comboBox2.Text;
            dataGridView1.Rows[n].Cells[5].Value = comboBox4.Text;
            dataGridView1.Rows[n].Cells[6].Value = comboBox3.Text;








        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
           
        }

        private void button5_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            DataView dv = new DataView();
            dv.RowFilter = null;
        }

        private void button4_Click(object sender, EventArgs e)
        {

        }
    }
}
