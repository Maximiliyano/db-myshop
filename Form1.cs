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

        private void button1_Click(object sender, EventArgs e)
        {
            String sql;

            DB db = new DB();
            db.openConnection();

            DataTable table = new DataTable();
            MySqlCommand command;

            sql = "SELECT * FROM `suppliers`";
            command = new MySqlCommand(sql, db.getConnection());

            try
            {
                MySqlDataAdapter adapter = new MySqlDataAdapter(sql, db.getConnection());
                adapter.SelectCommand = command;
                adapter.Fill(table);
                dataGridView1.DataSource = table;
                dataGridView1.Update();
            }
            catch(Exception a)
            {
                MessageBox.Show(a.ToString());
            }
            command.Dispose();
            db.closeConnection();
        }

        private void button3_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {
            DB db = new DB();
            db.closeConnection();
            Close();
        }
    }
}
