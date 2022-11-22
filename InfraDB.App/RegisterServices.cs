using DAL.Model;
using InfraDB.App.Navigation;
using InfraDB.App.ViewModel;
using Microsoft.Extensions.DependencyInjection;

namespace InfraDB.App;
public static class RegisterServices
{
    public static void ConfigureServices(this IServiceCollection services)
    {
        //services.AddSingleton<StoreModalCommandArgs>();
        
        services.AddSingleton<DBCrud>();

        services.AddSingleton<VModel<ViewModelKeePass>>(services => { return () => services.GetRequiredService<ViewModelKeePass>(); });
        //services.AddSingleton<VModel<ViewModelMarginal>>(services => { return () => services.GetRequiredService<ViewModelMarginal>(); });
        //services.AddSingleton<VModel<ViewModelBrexit>>(services => { return () => services.GetRequiredService<ViewModelBrexit>(); });
        //services.AddSingleton<VModel<ViewModelParty>>(services => { return () => services.GetRequiredService<ViewModelParty>(); });
        //services.AddSingleton<VModel<ViewModelGrouping>>(services => { return () => services.GetRequiredService<ViewModelGrouping>(); });
        //services.AddSingleton<VModel<ViewModelWebsite>>(services => { return () => services.GetRequiredService<ViewModelWebsite>(); });

        services.AddSingleton<ViewModelKeePass>();
        //services.AddSingleton<ViewModelMarginal>();
        //services.AddSingleton<ViewModelBrexit>();
        //services.AddSingleton<ViewModelParty>();
        //services.AddSingleton<ViewModelGrouping>();
        //services.AddSingleton<ViewModelWebsite>();

        services.AddSingleton<INavigationFactory, NavigationFactory>();
        services.AddSingleton<INavigationStore, NavigationStore>();

        services.AddSingleton<ViewModelMainWindow>();
        services.AddSingleton(s => new MainWindow(s.GetRequiredService<ViewModelMainWindow>()));

    }
}
