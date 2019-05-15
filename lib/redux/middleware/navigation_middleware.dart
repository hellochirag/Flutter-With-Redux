

import 'package:redux/redux.dart';
import 'package:reduxinflutter/redux/app/app_state.dart';
import 'package:reduxinflutter/redux/auth/auth_actions.dart';
import 'package:reduxinflutter/redux/auth/keys.dart';

class NavigationMiddleware extends MiddlewareClass<AppState>{
  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if(action is NavigateToRegistrationAction){
      Keys.navKey.currentState.pushNamed("/signup");
    }
    next(action);
  }
}