import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tarot_one/model/redux/state/app_state.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tarot_one/views/home/home_input_form.dart';
import 'package:tarot_one/model/dealt/home_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;
  HomeViewModel viewModel;

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  askDeal(String username, String password) {
    widget.viewModel.askDeal(username, password);
  }
  
   Widget buildContent(HomeViewModel viewModel) {
    widget.viewModel = viewModel;
    return new Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          HomeInputForm(onAskDeal: askDeal),
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
              print("pasó por aquí home screen");
            },
          )),
    );
  }
}
