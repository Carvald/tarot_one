class DealtResponse {
  List<Card> cards;

  DealtResponse({
    this.cards
  });

@override
toString(){
  // for(var i = 0;i<this.cards.length;i++){
        // return cards[i];
      return cards[0].name.toString()+" "+cards[0].orientation;  
   }

   first(){
  // for(var i = 0;i<this.cards.length;i++){
        // return cards[i];
      return cards[0].name;  
   }

   second(){
  // for(var i = 0;i<this.cards.length;i++){
        // return cards[i];
      return cards[1].name;  
   }
   third(){
  // for(var i = 0;i<this.cards.length;i++){
        // return cards[i];
      return cards[2].name;  
   }



}

class Card 
{
  int name;
  String orientation;
  Card(this.name, this.orientation);
}

