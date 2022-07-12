using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;

namespace shop
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            String sql, Output = "";

            DB db = new DB();
            db.openConnection();

            MySqlCommand command;
            MySqlDataReader dataReader;

            sql = "SELECT * FROM `products`";
            command = new MySqlCommand(sql, db.getConnection());
            dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                Output = Output + dataReader.GetValue(0) + " - " + dataReader.GetValue(1) + "\n";
            }
            MessageBox.Show(Output);

            dataReader.Close();
            command.Dispose();
            db.closeConnection();
        }
    }
}
