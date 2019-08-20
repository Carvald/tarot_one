import 'package:meta/meta.dart';
import 'package:tarot_one/model/redux/state/user/user_state.dart';
import 'package:tarot_one/model/redux/state/cards/cards_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

@immutable
class AppState {
  final UserState userState;
  final DealState cardsState;
  final FirebaseUser currentUser; 

  AppState({@required this.userState,@required this.cardsState,@required this.currentUser});

  factory AppState.initial() {
    return AppState(
      userState: UserState.initial(),
      cardsState: DealState.initial(),
    );
  }

  AppState copyWith({
    UserState userState,
    DealState cardsState,
    FirebaseUser currentUser,
  }) {
    return AppState(
      userState: userState ?? this.userState,
      cardsState: cardsState ?? this.userState,
      currentUser: currentUser ?? this.currentUser
    );
  }

  @override
  int get hashCode =>
  userState.hashCode ^ cardsState.hashCode ^ currentUser.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState && userState == other.userState || other is AppState && cardsState == other.cardsState
          || other is AppState && currentUser == other.currentUser;

@override
  String toString() {                                    
    return 'AppState{currentUser: $currentUser}';
  }



}

 
