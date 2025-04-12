using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BUS;
using MaterialSkin;
using MaterialSkin.Controls;
namespace GUI
{
    public partial class TestForm : MaterialForm
    {
        DAILY_BUS DAILYobj = new DAILY_BUS();
        DataTable DAILYtb;

        public TestForm()
        {
            InitializeComponent();
            var materialSkinManager = MaterialSkinManager.Instance;
            materialSkinManager.AddFormToManage(this);
            materialSkinManager.Theme = MaterialSkinManager.Themes.LIGHT;
            materialSkinManager.ColorScheme = new ColorScheme(Primary.BlueGrey800, Primary.BlueGrey900, Primary.BlueGrey500, Accent.LightBlue200, TextShade.WHITE);

            DAILYtb = DAILYobj.GetDAILY();
        }

        private void TestForm_Load(object sender, EventArgs e)
        {
            lstDaiLy.View = View.Details;
            lstDaiLy.FullRowSelect = true;
            lstDaiLy.GridLines = true;

            // Add columns to ListView
            foreach (DataColumn column in DAILYtb.Columns)
            {
                lstDaiLy.Columns.Add(column.ColumnName);
            }

            // Add rows to ListView
            foreach (DataRow row in DAILYtb.Rows)
            {
                var listViewItem = new ListViewItem(row.ItemArray.Select(item => item.ToString()).ToArray());
                lstDaiLy.Items.Add(listViewItem);
            }

            // Adjust column widths to fill the ListView horizontally
            foreach (ColumnHeader column in lstDaiLy.Columns)
            {
                column.Width = -2; // -2 sets the width to auto-size to the header and content
            }
        }

        private void materialScrollBar1_Scroll(object sender, ScrollEventArgs e)
        {

        }

        private void materialListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
