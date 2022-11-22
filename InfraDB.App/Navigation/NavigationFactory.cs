using InfraDB.App.ViewModel;

namespace InfraDB.App.Navigation;

public class NavigationFactory : INavigationFactory
{
    private readonly VModel<ViewModelKeePass> _keePassViewModel;

    public NavigationFactory(
        VModel<ViewModelKeePass> keePassViewModel
        )
    {
        _keePassViewModel= keePassViewModel;

    }

    public ViewModelBase SelectViewModel(ViewModelType? viewType)
    {

        return viewType switch
        {
            ViewModelType.KeePass => _keePassViewModel(),
        //    ViewModelType.Marginal => _marginalViewModel(),
                _ => _keePassViewModel(),
        };
    }
}