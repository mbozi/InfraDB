using DAL;
using DAL.Model;
using System.Collections.Generic;
using System.Windows;

namespace InfraDB.App;

/// <summary>
/// Interaction logic for MainWindow.xaml
/// </summary>
public partial class MainWindow : Window
{
    public MainWindow()
    {
        InitializeComponent();
    }

    public MainWindow(object dataContext)
    {
        InitializeComponent();
        DataContext = dataContext;
    }
    private void Button_Click(object sender, RoutedEventArgs e)
    {
        MethodResult res = DBSchema.VerifyDatabase("", "");
        if (res.Description != "Exists")
        {
            MessageBox.Show("Database Does Not Exist!");
            return;
        }
        DBCrud db = new(res.ReturnValue);
        db.AddTenant("BERKS", "Berkshire");
        db.AddTenant("SOUTH", "Southern Health");
        db.AddTenant("NELFT", "North East London Foundation Trust");
        db.AddEnvironmentType("DECO", "Decomissioned");
        db.AddEnvironmentType("PROD", "Production");
        db.AddEnvironmentType("PROJ", "Project");
        db.AddApplication("RIO", "Rio");
        db.AddApplication("FLOW", "Flow");
        db.AddApplication("OCEANO", "Oceano");
        Tenant t1 = db.GetTenant(1);
        List<Tenant> t2 = db.GetTenants();
        List<Tenant> t3 = db.GetTenants("Name='NELFT'");
        List<Tenant> t4 = db.GetTenants("", "Name DESC");
        List<Tenant> t5 = db.GetTenants("ID < 3", "Name DESC");
        List<Tenant> t6 = db.GetTenants("ID < 3", "Name DESC", true);
    }

    private void Button_Click_1(object sender, RoutedEventArgs e)
    {
        MethodResult res = DBSchema.CreateSchema("tbServer.Text", "tbDatabase.Text");
    }
}
