using System.Collections.Generic;
using System.Windows.Input;
using System;
using CommunityToolkit.Mvvm.ComponentModel;

namespace InfraDB.App.ViewModel;

public delegate TViewModel VModel<TViewModel>() where TViewModel : ViewModelBase;

public class ViewModelBase : ObservableObject, IDisposable
{

    public ICommand? UpdateViewModelCommand { get; set; }

    protected void OnPropertyChanged(List<string> properties)
    {
        if (properties != null)
        {
            foreach (string p in properties) { OnPropertyChanged(p); }
        }
    }

    public virtual void Dispose() { }
}
