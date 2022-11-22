using InfraDB.App.ViewModel;
using System.Windows.Input;
using System;

namespace InfraDB.App.Navigation;

public class NavigationStore : INavigationStore
{
    public NavigationStore(INavigationFactory navigationFactory)
    {
        _navigationFactory = navigationFactory;
        VMCommand = new CommandViewModelSet(this);
        ModalIsOpen = false;
    }

    public ICommand VMCommand { get; private set; }

    private ViewModelBase? _viewModelCurrent;
    private ViewModelType? _viewModelCurrentType;
    private ViewModelType? _viewModelCurrentTypeModal;

    private readonly INavigationFactory _navigationFactory;

    private bool _modalIsOpen;
    private string? _typeParameters;

    public event Action? StateChanged;
    public event Action? ModalStateChanged;

    public ViewModelType? ViewModelCurrentType
    {
        get
        {
            return _viewModelCurrentType;
        }
        set
        {
            if (value is ViewModelType val)
            {
                _viewModelCurrentType = val;
                ViewModelCurrent = _navigationFactory.SelectViewModel(val);
            }
        }
    }
    public ViewModelBase? ViewModelCurrent
    {
        get => _viewModelCurrent;
        set
        {
            _viewModelCurrent = value;
            StateChanged?.Invoke();
        }
    }
    public ViewModelType? ViewModelCurrentTypeModal
    {
        get
        {
            return _viewModelCurrentTypeModal;
        }
        set
        {
            _viewModelCurrentTypeModal = value;
            ViewModelCurrentModal = _navigationFactory.SelectViewModel(value);
        }
    }
    public ViewModelBase? ViewModelCurrentModal { get; set; }
    public bool ModalIsOpen
    {
        get => _modalIsOpen;
        set
        {
            _modalIsOpen = value;
            ModalStateChanged?.Invoke();
        }
    }
    public string? TypeParameters
    {
        get => _typeParameters;
        set => _typeParameters = string.IsNullOrEmpty(value) ? _typeParameters : value;
    }

}