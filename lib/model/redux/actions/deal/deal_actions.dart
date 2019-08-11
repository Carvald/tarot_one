import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import '../../../dealt/dealt_response.dart';
import '../../actions/services/deal/deal_service.dart';
import '../../../../model/navigation/navigation.dart';

ThunkAction dealUser(String username, String date) {
  return (Store store) async {
    new Future(() async{
      store.dispatch(new StartLoadingAction()); 
      login(username, date).then((dealResponse) {//llamado a algo asíncrono que randomiza, me valida si ya randomizé en el día? de ser así retorna las mismas 
        store.dispatch(new DealSuccessAction(dealResponse));
        Keys.navKey.currentState.pushNamed(Routes.dealtScreen);
      }, onError: (error) {
        print("error");
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