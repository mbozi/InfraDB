using InfraDB.App.ViewModel;
using System;

namespace InfraDB.App.Navigation;
public interface INavigationStore
{
    ViewModelBase? ViewModelCurrent { get; set; }
    ViewModelType? ViewModelCurrentType { get; set; }

    ViewModelBase? ViewModelCurrentModal { get; set; }
    ViewModelType? ViewModelCurrentTypeModal { get; set; }

    event Action StateChanged;
    event Action ModalStateChanged;

    public bool ModalIsOpen { get; set; }
    public string? TypeParameters { get; set; }
}