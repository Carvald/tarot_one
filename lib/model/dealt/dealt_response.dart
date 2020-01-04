class DealtResponse extends Object {
  int id;
  List<Card> cards;
  DealtResponse({this.id,this.cards});
  Map toJson() => {"id":id, "name": cards};
  @override
  toString() {
    return cards[0].id.toString() + " " + cards[0].orientation;
  }

  getCard(int i) {
    return cards[i].id;
  }
}

class Card extends Object {
  int id;
  String orientation;
  Card(this.id, this.orientation);
  Map toJson() => {"id": id, "orientation": orientation};
}
