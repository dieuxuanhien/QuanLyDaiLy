using System;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;

namespace DAL
{
    public class DBConnection
    {
        public SqlConnection Connection;

        public DBConnection()
        {
            string? _connectionString;

            _connectionString = "Server=127.0.0.1,1433;Database=QUANLYDAILY;User Id=qldl;Password=12345678;TrustServerCertificate=True;";

            try
            {
                Connection = new SqlConnection(_connectionString);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        
    }
}