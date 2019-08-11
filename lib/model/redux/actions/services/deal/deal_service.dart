
import '../../../../../model/dealt/dealt_response.dart';

Future<DealtResponse> login(String username, String password) async {
  return Future.delayed(const Duration(milliseconds: 2000), () {
    if (username.isEmpty || password.isEmpty) {
      Error error = new Error();
      return Future.error(error);
    } else {
      Card card1= new Card("mago","normal");
      Card card2 = new Card("papa","normal");
      Card card3 = new Card("la estrella","upsidedown");
      List<Card> list = new List();
      list.add(card1);
      list.add(card2);
      list.add(card3);
      DealtResponse response = new DealtResponse(cards: list);
      return response;
    }
  });
}