using Microsoft.AnalysisServices.AdomdClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;



namespace DoAn_OLAP.GUI
{
    public partial class TruyVanMDX : UserControl
    {
        public TruyVanMDX()
        {
            InitializeComponent();

        }

        private void btnFilter_Click(object sender, EventArgs e)
        {
            string query = "select non EMPTY {[Measures].[GIABAN],[Measures].[SOLUONG],[Measures].[THANHTIEN]} on COLUMNS, " +
                " non EMPTY CROSSJOIN([Dim Xe].[TENXE].[TENXE],[Dim Xe].[TENLOAI].[TENLOAI])on rows from[QLXE WAREHOUSE]";
            gridTruyVan.DataSource = table(query);
            show_stt(gridTruyVan);

            string qr = "select non EMPTY {[Measures].[SOLUONG],[Measures].[THANHTIEN]}  on COLUMNS, " +
                "non EMPTY CROSSJOIN([Dim Xe].[TENXE].[TENXE],[Dim Khach Hang].[TENKH].[TENKH]) on rows from[QLXE WAREHOUSE]";
            gridTruyVan2.DataSource = table(qr);
            show_stt(gridTruyVan2);

            string query3 = "select [Measures].[Fact Doanh Thu Count] on COLUMNS,  " +
                "non empty CROSSJOIN([Dim Thoi Gian].[Y_M_D].[NAM],[Dim Thoi Gian].[THANG].[THANG], [Dim Chi Nhanh].[TENCN].[TENCN] )" +
                " on rows from[QLXE WAREHOUSE]";
            gridTruyVan3.DataSource = table(query3);
            show_stt(gridTruyVan3);

            string query4 = "select [Measures].[THANHTIEN] on COLUMNS, " +
                "non empty CROSSJOIN([Dim Thoi Gian].[Y_M_D].[NAM],[Dim Thoi Gian].[THANG].[THANG], [Dim Chi Nhanh].[TENCN].[TENCN] )" +
                " on rows from[QLXE WAREHOUSE] ";
            gridTruyVan4.DataSource = table(query4);
            show_stt(gridTruyVan4);

            string query5 = "select non EMPTY [Measures].[Maximum SOLUONG] on COLUMNs, " +
                "non EMPTY [Dim Chi Nhanh].[TENCN].[TENCN] on rows from[QLXE WAREHOUSE] where[Dim Thoi Gian].[NAM].&[2019]";
            gridTruyVan5.DataSource = table(query5);
            show_stt(gridTruyVan5);

            //string query6 = "Select non EMPTY [Dim Chi Nhanh].[MACN].[MACN] on COLUMNs, [Measures].[SOLUONG] on rows from[QLXE WAREHOUSE]";
            string query2 = "select [Dim Thoi Gian].[Y_M_D].[NAM] on COLUMNs," +
                " non EMPTY {[Measures].[THANHTIEN]} on rows from[QLXE WAREHOUSE]";
            gridTruyVan6.DataSource = table(query2);
            show_stt(gridTruyVan5);
        }

        private DataTable table(string query)
        {
            AdomdConnection connection = new AdomdConnection(@"Data Source=PHAMTUANDAT\TUANDAT;Catalog=SSAS_MDX_QL_XE");
            if (connection.State == ConnectionState.Closed)
            {
                connection.Open();
            }

            AdomdCommand command = new AdomdCommand();
            command.CommandText = query;
            command.CommandType = System.Data.CommandType.Text;
            command.Connection = connection;

            CellSet cs = command.ExecuteCellSet();

            DataTable tb = GetDataTableFromCellSet_Columns(cs);

            connection.Close();

            return tb;
        }

        private static DataTable GetDataTableFromCellSet_Columns(CellSet cs)
        {
            DataTable dt = new DataTable();
            DataColumn dc = null;
            DataRow dr = null;

            //Tạo cột 
            dt.Columns.Add(new DataColumn("."));
            string name = null;
            foreach (Position p in cs.Axes[0].Positions)
            {
                dc = new DataColumn();
                name = "";
                foreach (Member m in p.Members)
                {
                    name = name + m.Caption + "";
                }
                dc.ColumnName = name;
                dt.Columns.Add(dc);
            }

            //Thêm hàng, tiêu đề, dữ liệu
            int y = 0;
            y = 0;
            foreach (Position py in cs.Axes[1].Positions)
            {
                dr = dt.NewRow();
                name = "";//Tiêu đè dòng
                foreach (Member m in py.Members)
                {
                    if (name.Equals(""))
                    {
                        name = name + m.Caption;
                    }
                    else
                    {
                        name = name + " / " + m.Caption;
                    }

                }
                //Ô đầu tiên
                dr[0] = name;
                // Dữ liệu
                int x = 0;
                for (x = 0; x <= cs.Axes[0].Positions.Count - 1; x++)
                {
                    dr[x + 1] = cs[x, y].FormattedValue;
                }

                dt.Rows.Add(dr);
                y = y + 1;
            }
            return dt;
        }

        public void show_stt(DataGridView gridV)
        {
            for (int i = 0; i < gridV.Rows.Count; i++)
            {
                gridV.Rows[i].HeaderCell.Value = (i + 1).ToString();
            }
        }

    }
}

