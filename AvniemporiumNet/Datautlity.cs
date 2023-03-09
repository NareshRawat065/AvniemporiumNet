using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Configuration;

namespace AvniemporiumNet
{
    public class Datautlity
    {
        private SqlConnection _Con;
        private SqlCommand _Cmd;

        public SqlConnection Con
        {
            get { return _Con; }
            set { _Con = value; }
        }

        public SqlCommand Cmd
        {
            get { return _Cmd; }
            set { _Cmd = value; }
        }

        private void openconnection()
        {
            try
            {
                if (_Con == null)
                {
                    _Con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
                    _Cmd = new SqlCommand();
                    _Cmd.Connection = _Con;
                }
                if (_Con.State == ConnectionState.Closed)
                {
                    _Con.Open();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        private void closeconnection()
        {
            if (_Con.State == ConnectionState.Open)
            {
                _Con.Close();
            }
        }
        private void disposeconnection()
        {
            if (_Con.State == ConnectionState.Closed)
            {
                _Con.Dispose();
                _Con = null;
            }
        }

        public DataSet ExecuteDataSet(string spname, SqlParameter[] arrparam)
        {
            try
            {
                DataSet ds = new DataSet();
                openconnection();
                _Cmd.CommandType = CommandType.StoredProcedure;
                _Cmd.CommandTimeout = 0;
                _Cmd.CommandText = spname;
                if (arrparam != null)
                {
                    _Cmd.Parameters.Clear();
                    for (int i = 0; i < arrparam.Length; i++)
                    {
                        _Cmd.Parameters.Add(arrparam[i]);
                    }
                }
                SqlDataAdapter da = new SqlDataAdapter(_Cmd);
                da.Fill(ds);
                closeconnection();
                disposeconnection();
                return ds;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public DataTable ExecuteDataTable(string spname, SqlParameter[] arrparam)
        {
            try
            {
                DataTable dt = new DataTable();
                openconnection();
                _Cmd.CommandType = CommandType.StoredProcedure;
                _Cmd.CommandTimeout = 0;
                _Cmd.CommandText = spname;
                if (arrparam != null)
                {
                    _Cmd.Parameters.Clear();
                    for (int i = 0; i < arrparam.Length; i++)
                    {
                        _Cmd.Parameters.Add(arrparam[i]);
                    }
                }
                SqlDataAdapter da = new SqlDataAdapter(_Cmd);
                da.Fill(dt);
                closeconnection();
                disposeconnection();
                return dt;
            }
            catch (Exception)
            {
                throw;
            }
        }


        public int executeprocedure(string spname, SqlParameter[] arrparam)
        {
            openconnection();
            _Cmd.CommandType = CommandType.StoredProcedure;
            _Cmd.CommandTimeout = 0;
            _Cmd.CommandText = spname;

            if (arrparam != null)
            {
                _Cmd.Parameters.Clear();

                _Cmd.Parameters.AddRange(arrparam);
            }

            int result = _Cmd.ExecuteNonQuery();
            closeconnection();
            disposeconnection();
            return result;
        }

        public string executescaler(string spname, SqlParameter[] arrparam)
        {
            openconnection();
            _Cmd.CommandType = CommandType.StoredProcedure;
            _Cmd.CommandTimeout = 0;
            _Cmd.CommandText = spname;

            if (arrparam != null)
            {
                _Cmd.Parameters.Clear();

                _Cmd.Parameters.AddRange(arrparam);
            }
            string result = Convert.ToString(_Cmd.ExecuteScalar());
            closeconnection();
            disposeconnection();
            return result;
        }
    }
}