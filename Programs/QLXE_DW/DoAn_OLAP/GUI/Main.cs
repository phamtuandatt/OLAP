using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Microsoft.SqlServer.Dts.Runtime;

namespace DoAn_OLAP.GUI
{
    public partial class Main : Form
    {
        public Main()
        {
            InitializeComponent();
        }

        private void btnTrangChu_Click(object sender, EventArgs e)
        {
            DoanhThu dt = new DoanhThu();
            dt.Dock = System.Windows.Forms.DockStyle.Fill;
            pnMain.Controls.Add(dt);
            dt.BringToFront();
        }

        private void btnBaoCaoDoanhThu_Click(object sender, EventArgs e)
        {
            TruyVanMDX tv = new TruyVanMDX();
            tv.Dock = System.Windows.Forms.DockStyle.Fill;
            pnMain.Controls.Add(tv);
            tv.BringToFront();
        }

        private void btnNapLDL_Click(object sender, EventArgs e)
        {
            DTSExecResult packResult;
            Package package = null;
            Microsoft.SqlServer.Dts.Runtime.Application app;
            app = new Microsoft.SqlServer.Dts.Runtime.Application();
            package = app.LoadPackage(@"D:\Study\OLAP\1_DoAn\Programs\QLXE_DW\QLXE_DW\QLXE_DW.dtsx", null);
            packResult = package.Execute();

            MessageBox.Show(this, "" + packResult.ToString(), "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }
    }
}
