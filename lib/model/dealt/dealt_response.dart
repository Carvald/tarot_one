class DealtResponse {
  List<Card> cards;
  DealtResponse({
    this.cards
  });
}

class Card 
{
  String name;
  String orientation;
  Card(this.name, this.orientation);
}