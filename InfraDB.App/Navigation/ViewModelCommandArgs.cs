namespace InfraDB.App.Navigation;
public class ViewModelCommandArgs
{
    public ViewModelCommandArgs(ViewModelType modalVM, ModalCommandType modalCommandType, string value)
    {
        ViewModel = modalVM;
        IsModalOpen = (modalCommandType == ModalCommandType.NEW);
        Value = value;
        ModalCommandType = modalCommandType;
    }

    public ViewModelType ViewModel { get; }
    public bool IsModalOpen { get; }
    public string Value { get; }
    public ModalCommandType ModalCommandType { get; }
}