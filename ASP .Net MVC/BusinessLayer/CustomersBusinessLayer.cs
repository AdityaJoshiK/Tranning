using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer
{
    public class CustomersBusinessLayer
    {
        public IEnumerable<Customers> Customers
        {
            get
            {
                string connectionString =
                    ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

                List<Customers> Customers = new List<Customers>();

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("spGetAllCustomers", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        Customers Customer = new Customers();
                        Customer.CustomerID = Convert.ToInt32(rdr["CustomerID"]);
                        Customer.CustomerName = rdr["CustomerName"].ToString();

                        Customers.Add(Customer);
                    }
                }

                return Customers;
            }
        }

        public void addCustomers(Customers Customers)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("AddCustomers", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter paramName = new SqlParameter();
                paramName.ParameterName = "@Name";
                paramName.Value = Customers.CustomerName;
                cmd.Parameters.Add(paramName);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public void saveCustomers(Customers Customers)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SaveCustomer", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter parmaId = new SqlParameter();
                parmaId.ParameterName = "@Id";
                parmaId.Value = Customers.CustomerID;
                cmd.Parameters.Add(parmaId);

                SqlParameter paramName = new SqlParameter();
                paramName.ParameterName = "@Name";
                paramName.Value = Customers.CustomerName;
                cmd.Parameters.Add(paramName);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public void deleteCustomers(int id)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("DeleteCustomer", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter parmaId = new SqlParameter();
                parmaId.ParameterName = "@Id";
                parmaId.Value = id;
                cmd.Parameters.Add(parmaId);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}
