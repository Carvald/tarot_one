import 'package:redux/redux.dart';
import 'package:tarot_one/model/redux/state/cards/cards_state.dart';
import '../../actions/deal/deal_actions.dart';

final dealReducer = combineReducers<DealState>([
  TypedReducer<DealState, DealSuccessAction>(_dealSuccess),
  TypedReducer<DealState, StartLoadingAction>(_startDealing),
]);

DealState _dealSuccess(DealState state, DealSuccessAction action) {
  return state.copyWith(cards: action.deal, isLoading: false);
}

DealState _startDealing(DealState state, StartLoadingAction action) {
  return state.copyWith(isLoading: true);
}