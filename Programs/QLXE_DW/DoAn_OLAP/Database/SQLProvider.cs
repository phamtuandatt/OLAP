using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace DoAn_OLAP.Database
{
    class SQLProvider
    {
        SqlConnection connect = null;
        string connectString = @"Data Source=PHAMTUANDAT\TUANDAT;Initial Catalog=QLXE_WAREHOUSE;User ID=sa;Password=123";

        public SQLProvider()
        {
            connect = new SqlConnection(connectString);
        }

        public DataTable get_data(string sql, string table_name)
        {
            try
            {
                DataSet ds = new DataSet();
                DataTable tb = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(sql, connect);
                da.Fill(ds, table_name);

                return ds.Tables[table_name];
            }
            catch (SqlException ex)
            {
                return null;
                throw new Exception(ex.Message);
            }
        }
    }
}
