import 'package:flutter/material.dart';
import 'package:tarot_one/model/dealt/dealt_response.dart';

import 'package:tarot_one/model/dealt/home_viewmodel.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tarot_one/model/redux/state/app_state.dart';
import 'package:tarot_one/views/deal/deal_input_form.dart';

class DealtScreen extends StatefulWidget {
  DealtScreen({Key key, this.title}) : super(key: key);

  final String title;
   HomeViewModel viewModel;

  @override
  DealtScreenState createState() => DealtScreenState();
}

class DealtScreenState extends State<DealtScreen> {

  saveDeal(DealtResponse cards) {
    widget.viewModel.saveDeal(cards);
  }

 Widget buildContent(HomeViewModel viewModel) {
    widget.viewModel = viewModel;
    return new Container(
      child: Column(
        children: <Widget>[
        //Text(viewModel.cards.toString()),
             //ShowCardAsset(viewModel.cards.first()),
             //Reading()
              DealInputForm(cards: viewModel.cards,onSaveDeal: saveDeal)

             
        ],
      ),
    );
  }

 @override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: new StoreConnector<AppState, HomeViewModel>(
            converter: (store) => HomeViewModel.fromStore(store),
            builder: (_, viewModel) => buildContent(viewModel),
            onDidChange: (viewModel) {
             print("pasó por aquí ehh Dealt screen"); 
            },
          )),
    );
  }

}



