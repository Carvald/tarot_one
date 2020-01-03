class DealtResponse extends Object {
  int id;
  List<Card> cards;
  DealtResponse({this.id,this.cards});
  Map toJson() => {"id":id, "name": cards};
  @override
  toString() {
    return cards[0].name.toString() + " " + cards[0].orientation;
  }

  getCard(int i) {
    return cards[i].name;
  }
}

class Card extends Object {
  int name;
  String orientation;
  Card(this.name, this.orientation);
  Map toJson() => {"id": name, "childName": orientation};
}
