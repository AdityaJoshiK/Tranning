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
    }
}
