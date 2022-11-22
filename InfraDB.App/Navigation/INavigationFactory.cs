using InfraDB.App.ViewModel;

namespace InfraDB.App.Navigation;
public interface INavigationFactory
{
    ViewModelBase SelectViewModel(ViewModelType? viewType);
}