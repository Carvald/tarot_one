import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DealtScreen extends StatefulWidget {
  DealtScreen({Key key, this.title/*,this.pickedList*/}) : super(key: key);

  final String title;
  //final List<Card> pickedList;

  @override
  DealtScreenState createState() => DealtScreenState();
}

class DealtScreenState extends State<DealtScreen> {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Flexible(child:DisplayMenuWidget())
          ],
        ),
      ),
    );
  }
}

class DisplayMenuWidget extends StatefulWidget {  
  //OnDisplayItemsWidget();//
  @override
  DisplayMenuWidgetState createState() => new DisplayMenuWidgetState();
}

class DisplayMenuWidgetState extends State<DisplayMenuWidget> { 
 
DisplayMenuWidgetState();
  @override
  Widget build(BuildContext context) {
    return new Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: new StaggeredGridView.count(
              crossAxisCount: 4,
              staggeredTiles: _staggeredTiles,
              children: _tiles,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              padding: const EdgeInsets.all(4.0),
            ));
  }

  List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
];

List<Widget> _tiles= <Widget>[
  CallApiWidget(),
 // CallApiButtonWidget(model),
  //CallApiButtonWidget(model),
  //CallApiButtonWidget(model),
];
}

class CallApiWidget extends StatelessWidget{
@override
Widget build (BuildContext context){
 return new RaisedButton(
      child: new Text(
        "TF1"
      ),
      onPressed:() => print("call"),//model.onIncreaseCounter(model.total),}
      // onPressed:() => model.onIncreaseCounter(),
    );    
}

}