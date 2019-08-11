import 'package:tarot_one/model/redux/state/app_state.dart';
import 'user/user_reducer.dart';
import 'deal/deal_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    userState: userReducer(state.userState, action),
    cardsState: dealReducer(state.cardsState, action),
    //DEBERÍA CREAR OTRO REDUCER PARA HACER UN STATE CON LOS VALORES MOSTRADOS EN PANTALLA??
  );
}