using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ComponentFactory.Krypton.Toolkit;
using DoAn_OLAP.Database;

namespace DoAn_OLAP.GUI
{
    public partial class DoanhThu : UserControl
    {
        SQLProvider data = new SQLProvider();
        public DoanhThu()
        {
            InitializeComponent();
            load_data();
        }

        public void load_data()
        {
            gridDT.DataSource = data.get_data("exec get_doanh_thu", "DT");
            load_combobox();
            id_tabel();
        }

        public void load_combobox()
        {
            cboLX.DataSource = data.get_data("exec get_loai_xe", "LX");
            cboLX.DisplayMember = "TENLOAI";
            cboLX.ValueMember = "MALOAI";
        }

        private void btnLoadData_Click(object sender, EventArgs e)
        {
            load_data();
        }

        private void btnLoc_Click(object sender, EventArgs e)
        {
            if (radAll.Checked) // Tìm theo tất cả
            {
                string filter = string.Format("exec get_doanh_thu_loai_xe '{0}'", cboLX.SelectedValue);
                gridDT.DataSource = data.get_data(filter, "DS_LX");
                if (gridDT.RowCount <= 0)
                {
                    KryptonMessageBox.Show(this, "Không có mặt hàng nào thuộc loại [ " + cboLX.SelectedText + " ] được bán !", "Thông báo",
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
                    load_data();
                    id_tabel();
                }
            }
            else if (radNongThon.Checked) // Tìm theo nông thôn
            {
                string filter = string.Format("exec get_doanh_thu_loai_xe_khu_vuc '{0}', '{1}'", cboLX.SelectedValue, "KV02");
                gridDT.DataSource = data.get_data(filter, "DS_LX_NT");
                if (gridDT.RowCount <= 0)
                {
                    KryptonMessageBox.Show(this, "Không có mặt hàng nào thuộc loại [ " + cboLX.SelectedText + " ] được bán !", "Thông báo",
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
                    load_data();
                    id_tabel();
                }
            }
            else // Tìm theo thành thị 
            {
                string filter = string.Format("exec get_doanh_thu_loai_xe_khu_vuc '{0}', '{1}'", cboLX.SelectedValue, "KV01");
                gridDT.DataSource = data.get_data(filter, "DS_LX_TT");
                if (gridDT.RowCount <= 0)
                {
                    KryptonMessageBox.Show(this, "Không có mặt hàng nào thuộc loại [ " + cboLX.SelectedText + " ] được bán !", "Thông báo",
                        MessageBoxButtons.OK, MessageBoxIcon.Information);
                    load_data();
                    id_tabel();
                }
            }
        }

        private void radAll_CheckedChanged(object sender, EventArgs e)
        {
            load_data();
        }

        private void radNongThon_CheckedChanged(object sender, EventArgs e)
        {
            string filter = "exec get_doanh_thu_khu_vuc 'KV02'";
            gridDT.DataSource = data.get_data(filter, "DS_LX_NT_1");
            id_tabel();
        }

        private void radThanhThi_CheckedChanged(object sender, EventArgs e)
        {
            string filter = "exec get_doanh_thu_khu_vuc 'KV01'";
            gridDT.DataSource = data.get_data(filter, "DS_LX_TT_1");
            id_tabel();
        }

        public void id_tabel()
        {
            for (int i = 0; i < gridDT.Rows.Count; i++)
            {
                gridDT.Rows[i].HeaderCell.Value = (i + 1).ToString();
            }
        }
    }
}
