using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;

namespace InfraDB.App.CustomControl;

public class CCModal : Control
{
    static CCModal()
    {
        DefaultStyleKeyProperty.OverrideMetadata(typeof(CCModal), new FrameworkPropertyMetadata(typeof(CCModal)));
        BackgroundProperty.OverrideMetadata(typeof(CCModal), new FrameworkPropertyMetadata(CreateDefaultBackground()));
    }

    public ICommand CloseCommand
    {
        get => (ICommand)GetValue(CloseCommandProperty);
        set => SetValue(CloseCommandProperty, value);
    }

    static public readonly DependencyProperty CloseCommandProperty = DependencyProperty.Register("CloseCommand", typeof(ICommand), typeof(CCModal), new PropertyMetadata(null));


    public string ModalTitle
    {
        get => (string)GetValue(ModalTitleProperty);
        set => SetValue(ModalTitleProperty, value);
    }

    static public readonly DependencyProperty ModalTitleProperty = DependencyProperty.Register("ModalTitle", typeof(string), typeof(CCModal), new PropertyMetadata(string.Empty));




    static public readonly DependencyProperty ContentProperty = DependencyProperty.Register("Content", typeof(object), typeof(CCModal), new PropertyMetadata(null));

    public object Content
    {
        get => GetValue(ContentProperty);
        set => SetValue(ContentProperty, value);
    }

    static public readonly DependencyProperty ContentBackgroundProperty = DependencyProperty.Register("ContentBackground", typeof(Brush), typeof(CCModal), new PropertyMetadata(Brushes.White));

    public Brush ContentBackground
    {
        get => (Brush)GetValue(ContentProperty);
        set => SetValue(ContentProperty, value);
    }

    static public readonly DependencyProperty IsOpenProperty = DependencyProperty.Register("IsOpen", typeof(bool), typeof(CCModal), new PropertyMetadata(false));

    public bool IsOpen
    {
        get => (bool)GetValue(IsOpenProperty);
        set => SetValue(IsOpenProperty, value);
    }

    static private object CreateDefaultBackground()
    {
        return new SolidColorBrush(Colors.Gray)
        {
            Opacity = 0.4
        };
    }
}

