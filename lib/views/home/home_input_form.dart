import 'package:flutter/material.dart';

class HomeInputForm extends StatefulWidget {
  final Function(String, String) onAskDeal;

  HomeInputForm({@required this.onAskDeal}) : super();

  @override
  HomeInputFormState createState() {
    return HomeInputFormState();
  }
}

class HomeInputFormState extends State<HomeInputForm> {
  final formKey = GlobalKey<FormState>();

  void validateInputs() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      widget.onAskDeal("a00","b");
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
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: <Widget>[
                  //InputField(title: "Username", controller: usernameController),
                  //InputField(title: "Password", controller: passwordController),
                ],
              )),
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
                    validateInputs();
                  },
                  child: Text('deal'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}