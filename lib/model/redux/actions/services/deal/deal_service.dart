import '../../../../../model/dealt/dealt_response.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:math';

Future<DealtResponse> randomize(String id,int quantity) async {
  return Future.delayed(const Duration(milliseconds: 2000), () {
      Random rnd;
      int min = 0;
      int max = 22;
      int r;
      rnd = new Random();
      List<Card> list = new List();
      for (int i = 0; i < quantity; i++) {
        r = min + rnd.nextInt(max - min);
        Card card = new Card(r, r.isEven?"N":"U");
        list.add(card);
      }
      DealtResponse response = new DealtResponse(id: id, cards: list);
      return response; 
  });
}

Future saveDeal(DealtResponse cards) async {
  String url =
      'https://if2oqpmcdf.execute-api.us-east-1.amazonaws.com/dev/jugadores';
  Map<String, String> headers = {
    "x-api-key": 'dCEhn3TJZ13C8vkMZnQlk76n4X288zRG57pIJmtJ'
  };
  String jlst = jsonEncode(cards);

  Response response = await put(url, headers: headers, body: jlst);

  print(response.statusCode);

  print(response.body);

  return response;
}
