import 'package:flutter/material.dart';

import 'package:tarot_one/model/dealt/home_viewmodel.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tarot_one/model/redux/state/app_state.dart';

class DealtScreen extends StatefulWidget {
  DealtScreen({Key key, this.title}) : super(key: key);

  final String title;
   HomeViewModel viewModel;

  @override
  DealtScreenState createState() => DealtScreenState();
}

class DealtScreenState extends State<DealtScreen> {

 Widget buildContent(HomeViewModel viewModel) {
    widget.viewModel = viewModel;
    return new Container(
      child: Column(
        children: <Widget>[
        //Text(viewModel.cards.toString()),
             ShowCardAsset(viewModel.cards.first()),
             ShowCardAsset(viewModel.cards.second()),
             ShowCardAsset(viewModel.cards.third()),
             Reading()
             
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

class ShowCardAsset extends StatelessWidget {
  int index;
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
