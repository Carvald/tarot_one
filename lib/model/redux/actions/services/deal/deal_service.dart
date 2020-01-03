
import '../../../../../model/dealt/dealt_response.dart';
import 'package:http/http.dart';
import 'dart:convert';
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
      DealtResponse response = new DealtResponse(id:8887,cards: list);
      return response;
    }
  });
}

Future saveDeal(DealtResponse cards) async {

// set up PUT request arguments
  String url = 'https://if2oqpmcdf.execute-api.us-east-1.amazonaws.com/dev/jugadores';
  Map<String, String> headers = {"x-api-key": 'dCEhn3TJZ13C8vkMZnQlk76n4X288zRG57pIJmtJ'};
  //String json = '{"id": 776, "name": "cardText"}';
  String jlst = jsonEncode(cards);
  
  // make PUT request
  Response response = await put(url, headers: headers, body: jlst);
  // check the status code for the result
  print(response.statusCode);
  // this API passes back the updated item with the id added
 print(response.body);
  // {
  //   "title": "Hello",
  //   "body": "body text",
  //   "userId": 1,
  //   "id": 1
  // }

return response;

}