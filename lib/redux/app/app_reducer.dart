import 'package:reduxinflutter/redux/app/app_state.dart';
import 'package:reduxinflutter/redux/auth/auth_reducer.dart';
import 'package:reduxinflutter/redux/auth/signin/signin_reducer.dart';

AppState appReducer(AppState state, dynamic action) =>
    new AppState(
        authState: authReducer(state.authState,action),
        signInState: signinReducer(state.signInState,action)
    );