using DAL.Model;
using InfraDB.App.Navigation;

namespace InfraDB.App.ViewModel;
public class ViewModelMainWindow : ViewModelBase
{

    public ViewModelMainWindow(INavigationStore navigationStore, DBCrud db)
    {
        _navigationStore = navigationStore;
        _navigationStore.StateChanged += Navigator_StateChanged;
        _navigationStore.ModalStateChanged += Modal_StateChanged;
        _navigationStore.ViewModelCurrentType = ViewModelType.KeePass;
        _navigationStore.ViewModelCurrentTypeModal = ViewModelType.KeePass;
        _navigationStore.ModalIsOpen = false;

        UpdateViewModelCommand = new CommandViewModelSet(_navigationStore);
    }

    private readonly INavigationStore _navigationStore;
    public ViewModelBase? CurrentViewModel => _navigationStore.ViewModelCurrent;
    public ViewModelBase? CurrentModalVM => _navigationStore.ViewModelCurrentModal;
    public bool? IsModalOpen => _navigationStore.ModalIsOpen;

    private void Modal_StateChanged()
    {
        OnPropertyChanged(nameof(CurrentModalVM));
        OnPropertyChanged(nameof(IsModalOpen));
    }

    private void Navigator_StateChanged()
    {
        OnPropertyChanged(nameof(CurrentViewModel));
    }
}

