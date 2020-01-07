import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import '../../../dealt/dealt_response.dart';
import '../../actions/services/deal/deal_service.dart';
import '../../../../model/navigation/navigation.dart';

ThunkAction dealUser(String userId, int quantity) {
  return (Store store) async {
    new Future(() async{
      store.dispatch(new StartLoadingAction()); 
      randomize(userId, quantity).then((dealResponse) {//llamado a algo asíncrono que randomiza, me valida si ya randomizé en el día? de ser así retorna las mismas 
        store.dispatch(new DealSuccessAction(dealResponse));
        Keys.navKey.currentState.pushNamed(Routes.dealtScreen);
      }, onError: (error) {
        print("error");
        //store.dispatch(new LoginFailedAction());
      });
    });
  };
}

ThunkAction registerDeal(DealtResponse cards) {
  return (Store store) async {
    new Future(() async{
      store.dispatch(new StartLoadingAction()); 
      saveDeal(cards).then( (dealResponse) {
        store.dispatch(new StartLoadingAction());
        Keys.navKey.currentState.pushNamed(Routes.homeScreen);
      }, onError: (error) {
        print(error);
        //store.dispatch(new LoginFailedAction());
      });
    });
  };
}

class StartLoadingAction {
  StartLoadingAction();
}

class DealSuccessAction {
  final DealtResponse deal;
  DealSuccessAction(this.deal);
}

/*class LoginFailedAction {
  LoginFailedAction();
}*/