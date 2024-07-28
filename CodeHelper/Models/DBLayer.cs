using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace CodeHelper.Models
{
    public class DBLayer
    {
        SqlConnection connection;
        public DBLayer() {
            connection = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        
        }
        public int ExecuteDML(string procname, SqlParameter[] parameters)
        {
            SqlCommand command = new SqlCommand(procname, connection);
            command.CommandType = CommandType.StoredProcedure;
            foreach(SqlParameter param in parameters)
            {
                if (param.Value != null)
                {
                    command.Parameters.Add(param);
                }
            }
            if (connection.State == ConnectionState.Closed)

                connection.Open();
            int result=command.ExecuteNonQuery();
            connection.Close();
            return result;
        }
        //function to execute a stored procedure that returns a table as response.
        public DataTable ExecuteSelect(string procename, SqlParameter[] parameters)
        {
            SqlCommand command = new SqlCommand(procename,connection);
            command.CommandType = CommandType.StoredProcedure;
            foreach (SqlParameter param in parameters)
            {
                if (param.Value != null)
                {
                    command.Parameters.Add(param);
                }
            }
            SqlDataAdapter sda = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            return dt;
        }
        // function to execute a stored procedure that returns a table
        public DataTable ExecuteSelect(string procename)
        {
            SqlCommand command = new SqlCommand(procename, connection);
            command.CommandType = CommandType.StoredProcedure;
           
            SqlDataAdapter sda = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            return dt;
        }
        // A function to execute a stored procedure that returns one row and only one column as a responce
        public object ExecuteScalar(String procename, SqlParameter[] parameters)
        {
            SqlCommand command = new SqlCommand(procename,connection);
            command.CommandType = CommandType.StoredProcedure;
            foreach (SqlParameter param in parameters)
            {
                if (param.Value != null)
                    command.Parameters.Add(param);
            }
            if (connection.State == ConnectionState.Closed)
                connection.Open();
            object result = command.ExecuteScalar();
            connection.Close();
            return result;
        }
        //Execute
        public object ExecuteScalar(String procename)
        {
            SqlCommand command = new SqlCommand(procename, connection);
            command.CommandType = CommandType.StoredProcedure;
            
            if (connection.State == ConnectionState.Closed)
                connection.Open();
            object result = command.ExecuteScalar();
            connection.Close();
            return result;
        }
    }
}
