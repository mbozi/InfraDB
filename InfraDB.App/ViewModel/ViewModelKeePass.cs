using DAL.Model;
using System.Collections.Generic;

namespace InfraDB.App.ViewModel;
public class ViewModelKeePass : ViewModelBase
{
    public ViewModelKeePass(DBCrud dB)
    {
        DB = dB;
        ApplicationsList = DB.GetApplications("", "[Name] ASC", false);
        TenantsList =DB.GetTenants("", "[Name] ASC", false);
    }

    public DBCrud DB {  get; }

    public List<Application> ApplicationsList { get; set; }
    public List<Tenant> TenantsList { get; set; }
    
}
