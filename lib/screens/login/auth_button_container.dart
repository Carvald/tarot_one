//containers/auth_button/auth_button_container.dart
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tarot_one/model/redux/actions/login/auth_actions.dart';
import '../../model/redux/state/app_state.dart';
import 'package:tarot_one/screens/login/google_auth_button.dart';
import 'package:redux/redux.dart';

class GoogleAuthButtonContainer extends StatelessWidget {
  GoogleAuthButtonContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  	// Connect to the store:
    return new StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _ViewModel vm) {
      	// We haven't made this yet.
        return new GoogleAuthButton(
          buttonText: vm.buttonText,
          onPressedCallback: vm.onPressedCallback,
        );
      },
    );
  }
}

class _ViewModel {
  final String buttonText;
  final Function onPressedCallback;

  _ViewModel({this.onPressedCallback, this.buttonText});

  static _ViewModel fromStore(Store<AppState> store) {
  	// This is a bit of a more complex _viewModel
  	// constructor. As the state updates, it will
  	// recreate this _viewModel, and then pass
  	// buttonText and the callback down to the button
  	// with the appropriate qualities:
  	//
    return new _ViewModel(
        buttonText:
        store.state.currentUser != null ? 'Log Out' : 'Log in with Google',
        onPressedCallback: () {
          if (store.state.currentUser != null) {
            store.dispatch(new LogOut());
          } else {
            store.dispatch(new LogIn());
          }
        });
  }
}