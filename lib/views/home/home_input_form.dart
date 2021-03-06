import 'package:flutter/material.dart';

class HomeInputForm extends StatefulWidget {
  final Function(String, int) onAskDeal;

  HomeInputForm({@required this.onAskDeal}) : super();

  @override
  HomeInputFormState createState() {
    return HomeInputFormState();
  }
}

class HomeInputFormState extends State<HomeInputForm> {
  final formKey = GlobalKey<FormState>();

  void callApi(int quantity) {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      widget.onAskDeal("a00",quantity);
    } else {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: MaterialButton(
                  height: 40,
                  minWidth: 150,
                  color: Theme.of(context).primaryColor,
                  splashColor: Colors.black,
                  textColor: Colors.white,
                  onPressed: () {
                    callApi(5);
                  },
                  child: Text('TDM'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: MaterialButton(
                  height: 40,
                  minWidth: 150,
                  color: Theme.of(context).primaryColor,
                  splashColor: Colors.black,
                  textColor: Colors.white,
                  onPressed: () {
                    callApi(7);
                  },
                  child: Text('TE2'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: MaterialButton(
                  height: 40,
                  minWidth: 150,
                  color: Theme.of(context).primaryColor,
                  splashColor: Colors.black,
                  textColor: Colors.white,
                  onPressed: () {
                    callApi(3);
                  },
                  child: Text('TE3'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}