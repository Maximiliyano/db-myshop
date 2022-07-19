using Microsoft.Build.Tasks;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Windows.Forms;

namespace shop
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void FillDataGrid(string sql)
        {
            DB db = new DB();
            db.openConnection();

            DataTable table = new DataTable();
            MySqlCommand command = new MySqlCommand(sql, db.getConnection());

            try
            {
                MySqlDataAdapter adapter = new MySqlDataAdapter(sql, db.getConnection());
                adapter.SelectCommand = command;
                adapter.Fill(table);
                dataGridView1.DataSource = table;
                dataGridView1.Update();
            }
            catch (Exception a)
            {
                MessageBox.Show(a.ToString());
            }
            command.Dispose();
            db.closeConnection();
        }

        private void Button1_Click(object sender, EventArgs e)
        {
            FillDataGrid(
                "SELECT `ProductName` " +
                "FROM `products` " +
                "WHERE `ProductName` " +
                "LIKE 'C%'");
        }

        private void Button2_Click(object sender, EventArgs e)
        {
            FillDataGrid(
                "SELECT `ProductName`, `Price` " +
                "FROM `products` " +
                "ORDER BY `Price` ASC");
        }

        private void Button3_Click(object sender, EventArgs e)
        {
            FillDataGrid(
                "SELECT `ProductName`, `Price`, `Country` " +
                "FROM `suppliers`, `products` " +
                "WHERE suppliers.Country = 'USA' AND suppliers.SupplierID = products.SupplierID " +
                "ORDER BY `Price` ASC");
        }

        private void Button4_Click(object sender, EventArgs e)
        {
            FillDataGrid(
                "SELECT `SupplierName` " +
                "FROM `suppliers`, `products` " +
                "WHERE suppliers.SupplierID = products.SupplierID AND `CategoryID` = '2' " +
                "GROUP BY `SupplierName` " +
                "HAVING COUNT(*) > 0");
        }

        private void Button5_Click(object sender, EventArgs e)
        {
            DB db = new DB();
            db.closeConnection();
            Close();
        }
    }
}
