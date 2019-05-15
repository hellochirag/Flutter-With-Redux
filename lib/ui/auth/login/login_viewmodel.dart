import 'package:redux/redux.dart';
import 'package:reduxinflutter/models/loading_status.dart';
import 'package:reduxinflutter/redux/app/app_state.dart';
import 'package:reduxinflutter/redux/auth/auth_actions.dart';
import 'package:reduxinflutter/redux/auth/screen_state.dart';
import 'package:reduxinflutter/redux/auth/screen.dart';

class LoginViewModel{

  final LoadingStatus status;
  final ScreenState type;
  final String password;
  final String passwordError;
  final String email;
  final String emailError;

  final Function(String) validateEmail;
  final Function(String) validatePassword;
  final Function(String email, String password) login;
  final Function clearError;
  final Function navigateToRegistration;


  LoginViewModel({this.status,
    this.type,
    this.password,
    this.passwordError,
    this.email,
    this.emailError,
    this.validateEmail,
    this.validatePassword,
    this.login,
    this.clearError,
    this.navigateToRegistration});


  static LoginViewModel fromStore(Store<AppState> store){
    return LoginViewModel(
      status: store.state.signInState.loadingStatus,
      type: store.state.signInState.type,
      email: store.state.signInState.email,
      emailError: store.state.signInState.emailError,
      password:store.state.signInState.password,
      passwordError: store.state.signInState.passwordError,
      validateEmail: (email) => store.dispatch(new ValidateEmailAction(email,Screen.SIGNIN)),
      validatePassword: (password) =>store.dispatch(new ValidatePasswordAction(password,Screen.SIGNIN)),
      login: (email, password) {
        store.dispatch(new ValidateLoginFields(email, password));
      },
      clearError: () => store.dispatch(new ClearErrorsAction()),
      navigateToRegistration: () => store.dispatch(new NavigateToRegistrationAction())
    );
  }
}