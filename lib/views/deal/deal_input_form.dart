import 'package:flutter/material.dart';
import '../../model/dealt/dealt_response.dart';

class DealInputForm extends StatefulWidget {
  final DealtResponse cards;
  final Function(DealtResponse) onSaveDeal;
  DealInputForm({@required this.cards,@required this.onSaveDeal}) : super();

  @override
  DealInputFormState createState() {
    return DealInputFormState();
  }
}

class DealInputFormState extends State<DealInputForm> {
  final formKey = GlobalKey<FormState>();

  void callApi(DealtResponse cards) {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      widget.onSaveDeal(cards);
    } else {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: <Widget>[
                  Text("Username"),
                  Text("ext"),
                  ShowCardAsset(widget.cards.getCard(1)),
                  ShowCardAsset(widget.cards.getCard(2)),
                  MaterialButton(
                  height: 40,
                  minWidth: 150,
                  color: Theme.of(context).primaryColor,
                  splashColor: Colors.black,
                  textColor: Colors.white,
                  onPressed: () {
                    callApi(widget.cards);
                  },
                  child: Text('Pedir Lectura'),
                )
                  
                ],
              )),
        ],
      ),
    );
 
  }
}

class ShowCardAsset extends StatelessWidget {
 final int index;
 ShowCardAsset(this.index);
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage("images/"+this.index.toString()+".jpg");
    Image image = Image(image:assetImage,height: 150,
    width: 150);
    return Container(
      child: image,
    );
  }
}

class Reading extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
     return MaterialButton(
                  height: 40,
                  minWidth: 150,
                  color: Theme.of(context).primaryColor,
                  splashColor: Colors.black,
                  textColor: Colors.white,
                  onPressed: () {
                   //callApi();
                  },
                  child: Text('GYR'),
              
              );
  }
}