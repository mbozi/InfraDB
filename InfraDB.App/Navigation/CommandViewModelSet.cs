using InfraDB.App.Command;

namespace InfraDB.App.Navigation;
public class CommandViewModelSet : CommandBase
{
    private readonly INavigationStore _navigator;

    public CommandViewModelSet(INavigationStore navigator)
    {
        _navigator = navigator;
    }

    public override void Execute(object? parameter)
    {
        if (parameter is ViewModelCommandArgs vmca)
        {
            if (vmca.IsModalOpen)
            {
                _navigator.TypeParameters = vmca.Value;
                _navigator.ViewModelCurrentTypeModal = vmca.ViewModel;
                _navigator.ModalIsOpen = (vmca.ModalCommandType == ModalCommandType.NEW);
            }
            else
            {
                _navigator.TypeParameters = vmca.Value;
                _navigator.ViewModelCurrentType = vmca.ViewModel;
                _navigator.ModalIsOpen = false;
            }

        }
    }
}

