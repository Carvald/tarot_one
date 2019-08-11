import 'package:meta/meta.dart';
import 'package:tarot_one/model/redux/state/user/user_state.dart';
import 'package:tarot_one/model/redux/state/cards/cards_state.dart';

@immutable
class AppState {
  final UserState userState;
  final DealState cardsState;

  AppState({@required this.userState,@required this.cardsState});

  factory AppState.initial() {
    return AppState(
      userState: UserState.initial(),
      cardsState: DealState.initial(),
    );
  }

  AppState copyWith({
    UserState userState,
    DealState cardsState,
  }) {
    return AppState(
      userState: userState ?? this.userState,
      cardsState: cardsState ?? this.userState,
    );
  }

  @override
  int get hashCode =>
  userState.hashCode ^ cardsState.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState && userState == other.userState || other is AppState && cardsState == other.cardsState;
}
