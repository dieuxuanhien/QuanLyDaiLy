namespace GUI
{
    partial class TestForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            lstDaiLy = new MaterialSkin.Controls.MaterialListView();
            SuspendLayout();
            // 
            // lstDaiLy
            // 
            lstDaiLy.AutoSizeTable = false;
            lstDaiLy.BackColor = Color.FromArgb(255, 255, 255);
            lstDaiLy.BorderStyle = BorderStyle.None;
            lstDaiLy.Depth = 0;
            lstDaiLy.FullRowSelect = true;
            lstDaiLy.Location = new Point(16, 82);
            lstDaiLy.MinimumSize = new Size(200, 100);
            lstDaiLy.MouseLocation = new Point(-1, -1);
            lstDaiLy.MouseState = MaterialSkin.MouseState.OUT;
            lstDaiLy.Name = "lstDaiLy";
            lstDaiLy.OwnerDraw = true;
            lstDaiLy.Size = new Size(1243, 614);
            lstDaiLy.TabIndex = 1;
            lstDaiLy.UseCompatibleStateImageBehavior = false;
            lstDaiLy.View = View.Details;
            lstDaiLy.SelectedIndexChanged += materialListView1_SelectedIndexChanged;
            // 
            // TestForm
            // 
            AutoScaleDimensions = new SizeF(10F, 25F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1280, 720);
            Controls.Add(lstDaiLy);
            Name = "TestForm";
            Text = "DAILY";
            Load += TestForm_Load;
            ResumeLayout(false);
        }

        #endregion

        private MaterialSkin.Controls.MaterialListView lstDaiLy;
    }
}