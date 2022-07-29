
namespace DoAn_OLAP.GUI
{
    partial class DoanhThu
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

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(DoanhThu));
            this.gridDT = new ComponentFactory.Krypton.Toolkit.KryptonDataGridView();
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.btnLoadData = new System.Windows.Forms.ToolStripButton();
            this.kryptonPanel1 = new ComponentFactory.Krypton.Toolkit.KryptonPanel();
            this.btnLoc = new System.Windows.Forms.ToolStripButton();
            this.Column1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column4 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column5 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column6 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column7 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column8 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.cboLX = new ComponentFactory.Krypton.Toolkit.KryptonComboBox();
            this.radNongThon = new ComponentFactory.Krypton.Toolkit.KryptonRadioButton();
            this.radThanhThi = new ComponentFactory.Krypton.Toolkit.KryptonRadioButton();
            this.radAll = new ComponentFactory.Krypton.Toolkit.KryptonRadioButton();
            this.kryptonPanel2 = new ComponentFactory.Krypton.Toolkit.KryptonPanel();
            ((System.ComponentModel.ISupportInitialize)(this.gridDT)).BeginInit();
            this.toolStrip1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.kryptonPanel1)).BeginInit();
            this.kryptonPanel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.cboLX)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.kryptonPanel2)).BeginInit();
            this.kryptonPanel2.SuspendLayout();
            this.SuspendLayout();
            // 
            // gridDT
            // 
            this.gridDT.AllowUserToAddRows = false;
            dataGridViewCellStyle1.NullValue = "1";
            this.gridDT.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle1;
            this.gridDT.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.gridDT.ColumnHeadersHeight = 50;
            this.gridDT.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Column1,
            this.Column2,
            this.Column3,
            this.Column4,
            this.Column5,
            this.Column6,
            this.Column7,
            this.Column8});
            this.gridDT.Dock = System.Windows.Forms.DockStyle.Fill;
            this.gridDT.GridStyles.Style = ComponentFactory.Krypton.Toolkit.DataGridViewStyle.Mixed;
            this.gridDT.GridStyles.StyleBackground = ComponentFactory.Krypton.Toolkit.PaletteBackStyle.GridHeaderRowList;
            this.gridDT.Location = new System.Drawing.Point(0, 0);
            this.gridDT.Name = "gridDT";
            this.gridDT.ReadOnly = true;
            this.gridDT.RowHeadersWidth = 51;
            dataGridViewCellStyle2.NullValue = "1";
            this.gridDT.RowsDefaultCellStyle = dataGridViewCellStyle2;
            this.gridDT.RowTemplate.Height = 30;
            this.gridDT.Size = new System.Drawing.Size(1111, 684);
            this.gridDT.TabIndex = 1;
            // 
            // toolStrip1
            // 
            this.toolStrip1.AutoSize = false;
            this.toolStrip1.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.toolStrip1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.btnLoadData,
            this.btnLoc});
            this.toolStrip1.Location = new System.Drawing.Point(0, 0);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.Size = new System.Drawing.Size(1111, 42);
            this.toolStrip1.TabIndex = 2;
            this.toolStrip1.Text = "toolStrip1";
            // 
            // btnLoadData
            // 
            this.btnLoadData.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btnLoadData.Image = ((System.Drawing.Image)(resources.GetObject("btnLoadData.Image")));
            this.btnLoadData.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.btnLoadData.Margin = new System.Windows.Forms.Padding(5, 1, 5, 2);
            this.btnLoadData.Name = "btnLoadData";
            this.btnLoadData.Size = new System.Drawing.Size(29, 39);
            this.btnLoadData.Text = "toolStripButton1";
            this.btnLoadData.Click += new System.EventHandler(this.btnLoadData_Click);
            // 
            // kryptonPanel1
            // 
            this.kryptonPanel1.Controls.Add(this.gridDT);
            this.kryptonPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.kryptonPanel1.Location = new System.Drawing.Point(0, 42);
            this.kryptonPanel1.Name = "kryptonPanel1";
            this.kryptonPanel1.Size = new System.Drawing.Size(1111, 684);
            this.kryptonPanel1.TabIndex = 3;
            // 
            // btnLoc
            // 
            this.btnLoc.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btnLoc.Image = ((System.Drawing.Image)(resources.GetObject("btnLoc.Image")));
            this.btnLoc.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.btnLoc.Margin = new System.Windows.Forms.Padding(460, 1, 5, 2);
            this.btnLoc.Name = "btnLoc";
            this.btnLoc.Size = new System.Drawing.Size(29, 39);
            this.btnLoc.Text = "toolStripButton1";
            this.btnLoc.Click += new System.EventHandler(this.btnLoc_Click);
            // 
            // Column1
            // 
            this.Column1.DataPropertyName = "TENNV";
            this.Column1.HeaderText = "Tên nhân viên";
            this.Column1.MinimumWidth = 6;
            this.Column1.Name = "Column1";
            this.Column1.ReadOnly = true;
            // 
            // Column2
            // 
            this.Column2.DataPropertyName = "TENKH";
            this.Column2.HeaderText = "Tên khách hàng";
            this.Column2.MinimumWidth = 6;
            this.Column2.Name = "Column2";
            this.Column2.ReadOnly = true;
            // 
            // Column3
            // 
            this.Column3.DataPropertyName = "TENXE";
            this.Column3.HeaderText = "Tên xe";
            this.Column3.MinimumWidth = 6;
            this.Column3.Name = "Column3";
            this.Column3.ReadOnly = true;
            // 
            // Column4
            // 
            this.Column4.DataPropertyName = "TENCN";
            this.Column4.HeaderText = "Tên chi nhánh";
            this.Column4.MinimumWidth = 6;
            this.Column4.Name = "Column4";
            this.Column4.ReadOnly = true;
            // 
            // Column5
            // 
            this.Column5.DataPropertyName = "NGAYTHANGNAM";
            this.Column5.HeaderText = "Ngày bán";
            this.Column5.MinimumWidth = 6;
            this.Column5.Name = "Column5";
            this.Column5.ReadOnly = true;
            // 
            // Column6
            // 
            this.Column6.DataPropertyName = "SOLUONG";
            this.Column6.HeaderText = "Số lượng";
            this.Column6.MinimumWidth = 6;
            this.Column6.Name = "Column6";
            this.Column6.ReadOnly = true;
            // 
            // Column7
            // 
            this.Column7.DataPropertyName = "GIABAN";
            this.Column7.HeaderText = "Giá bán";
            this.Column7.MinimumWidth = 6;
            this.Column7.Name = "Column7";
            this.Column7.ReadOnly = true;
            // 
            // Column8
            // 
            this.Column8.DataPropertyName = "THANHTIEN";
            this.Column8.HeaderText = "Thành tiền";
            this.Column8.MinimumWidth = 6;
            this.Column8.Name = "Column8";
            this.Column8.ReadOnly = true;
            // 
            // cboLX
            // 
            this.cboLX.DropBackStyle = ComponentFactory.Krypton.Toolkit.PaletteBackStyle.ContextMenuOuter;
            this.cboLX.DropDownWidth = 282;
            this.cboLX.Location = new System.Drawing.Point(376, 8);
            this.cboLX.Margin = new System.Windows.Forms.Padding(1, 3, 3, 3);
            this.cboLX.Name = "cboLX";
            this.cboLX.Size = new System.Drawing.Size(282, 25);
            this.cboLX.TabIndex = 4;
            // 
            // radNongThon
            // 
            this.radNongThon.Location = new System.Drawing.Point(82, 3);
            this.radNongThon.Name = "radNongThon";
            this.radNongThon.Size = new System.Drawing.Size(98, 24);
            this.radNongThon.TabIndex = 5;
            this.radNongThon.Values.Text = "Nông thôn";
            this.radNongThon.CheckedChanged += new System.EventHandler(this.radNongThon_CheckedChanged);
            // 
            // radThanhThi
            // 
            this.radThanhThi.Location = new System.Drawing.Point(191, 3);
            this.radThanhThi.Name = "radThanhThi";
            this.radThanhThi.Size = new System.Drawing.Size(88, 24);
            this.radThanhThi.TabIndex = 6;
            this.radThanhThi.Values.Text = "Thành thị";
            this.radThanhThi.CheckedChanged += new System.EventHandler(this.radThanhThi_CheckedChanged);
            // 
            // radAll
            // 
            this.radAll.Checked = true;
            this.radAll.Location = new System.Drawing.Point(3, 3);
            this.radAll.Name = "radAll";
            this.radAll.Size = new System.Drawing.Size(64, 24);
            this.radAll.TabIndex = 7;
            this.radAll.Values.Text = "Tất cả";
            this.radAll.CheckedChanged += new System.EventHandler(this.radAll_CheckedChanged);
            // 
            // kryptonPanel2
            // 
            this.kryptonPanel2.Controls.Add(this.radAll);
            this.kryptonPanel2.Controls.Add(this.radNongThon);
            this.kryptonPanel2.Controls.Add(this.radThanhThi);
            this.kryptonPanel2.Location = new System.Drawing.Point(61, 7);
            this.kryptonPanel2.Name = "kryptonPanel2";
            this.kryptonPanel2.PanelBackStyle = ComponentFactory.Krypton.Toolkit.PaletteBackStyle.HeaderCustom2;
            this.kryptonPanel2.Size = new System.Drawing.Size(311, 30);
            this.kryptonPanel2.TabIndex = 8;
            // 
            // DoanhThu
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.kryptonPanel2);
            this.Controls.Add(this.cboLX);
            this.Controls.Add(this.kryptonPanel1);
            this.Controls.Add(this.toolStrip1);
            this.Name = "DoanhThu";
            this.Size = new System.Drawing.Size(1111, 726);
            ((System.ComponentModel.ISupportInitialize)(this.gridDT)).EndInit();
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.kryptonPanel1)).EndInit();
            this.kryptonPanel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.cboLX)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.kryptonPanel2)).EndInit();
            this.kryptonPanel2.ResumeLayout(false);
            this.kryptonPanel2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion
        private ComponentFactory.Krypton.Toolkit.KryptonDataGridView gridDT;
        private System.Windows.Forms.ToolStrip toolStrip1;
        private System.Windows.Forms.ToolStripButton btnLoadData;
        private System.Windows.Forms.ToolStripButton btnLoc;
        private ComponentFactory.Krypton.Toolkit.KryptonPanel kryptonPanel1;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column1;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column2;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column3;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column4;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column5;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column6;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column7;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column8;
        private ComponentFactory.Krypton.Toolkit.KryptonComboBox cboLX;
        private ComponentFactory.Krypton.Toolkit.KryptonRadioButton radNongThon;
        private ComponentFactory.Krypton.Toolkit.KryptonRadioButton radThanhThi;
        private ComponentFactory.Krypton.Toolkit.KryptonRadioButton radAll;
        private ComponentFactory.Krypton.Toolkit.KryptonPanel kryptonPanel2;
    }
}
