import 'package:redux/redux.dart';
import '../dealt/dealt_response.dart';
import '../../model/redux/actions/deal/deal_actions.dart';
import '../redux/state/app_state.dart';

class HomeViewModel {
  final bool isLoading;
  final bool loginError;
  final DealtResponse cards;


  final Function(String, String) askDeal;

  HomeViewModel({
    this.isLoading,
    this.loginError,
    this.cards,
    this.askDeal,
  });

  static HomeViewModel fromStore(Store<AppState> store) {
    return HomeViewModel(
      isLoading: store.state.userState.isLoading,
      loginError: store.state.userState.loginError,
      cards: store.state.cardsState.cards,
      askDeal: (String username, String date) {
        store.dispatch(dealUser(username, date));
      },
    );
  }
}