
import '../../../../../model/dealt/dealt_response.dart';
import 'dart:math';

Future<DealtResponse> login(String username, String password) async {
  return Future.delayed(const Duration(milliseconds: 2000), () {
    if (username.isEmpty || password.isEmpty) {
      Error error = new Error();
      return Future.error(error);
    } else {
      final _random = new Random();
       Random rnd;
       int min = 0;
       int max = 22;
       rnd = new Random();
       int r = min + rnd.nextInt(max - min);
      print(r);
      Card card1= new Card(r,"");
      int r1 = min + rnd.nextInt(max - min);
      print(r1);
      Card card2 = new Card(r1,"");
      int r2 = min + rnd.nextInt(max - min);
      print(r2);
      Card card3 = new Card(r2,"");
      List<Card> list = new List();
      list.add(card1);
      list.add(card2);
      list.add(card3);
      DealtResponse response = new DealtResponse(cards: list);
      return response;
    }
  });
}