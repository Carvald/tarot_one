import 'package:flutter/material.dart';


class DealInputForm extends StatefulWidget {
 // final Function(String, String) onAskDeal;


 // DealInputForm({@required this.onAskDeal}) : super();
 DealInputForm() : super();
  @override
  DealInputFormState createState() {
    return DealInputFormState();
  }
}

class DealInputFormState extends State<DealInputForm> {
  final formKey = GlobalKey<FormState>();

  void validateInputs() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
     //widget.onAskDeal("a00","b");
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
                ],
              )),
        ],
      ),
    );
 
  }
}