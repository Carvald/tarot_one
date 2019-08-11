import 'package:meta/meta.dart';
import '../../../dealt/dealt_response.dart';

@immutable
class DealState {
  final bool isLoading;
  final DealtResponse cards;

  DealState({
    @required this.isLoading,
    @required this.cards,
  });

  factory DealState.initial() {
    return new DealState(isLoading: false,cards:null);
  }

  DealState copyWith({bool isLoading, DealtResponse cards}) {
    return new DealState(
        isLoading: isLoading ?? this.isLoading, cards: cards ?? this.cards);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DealState &&
              runtimeType == other.runtimeType &&
              isLoading == other.isLoading &&
              cards == other.cards;

  @override
  int get hashCode => isLoading.hashCode ^ cards.hashCode;
}