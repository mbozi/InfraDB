using DAL;
using DAL.Model;
using System.Windows;

namespace InfraDB.App
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            MethodResult res = DBSchema.VerifyDatabase(tbServer.Text, tbDatabase.Text);
            if (res.Description != "Exists")
            {
                MessageBox.Show("Database Does Not Exist!");
                return;
            }
            DBCrud db = new(res.ReturnValue);
            _ = db.AddTenant("TEST1", "TEST01");
            _ = db.AddTenant("TEST2", "TEST02");
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            MethodResult res = DBSchema.CreateSchema(tbServer.Text, tbDatabase.Text);
        }
    }
}
