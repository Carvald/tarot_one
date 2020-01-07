import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tarot_one/model/redux/state/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
//import 'package:redux_thunk/redux_thunk.dart';
import 'screens/login/login_screen.dart';
import 'model/redux/state/app_state.dart';
import 'model/navigation/navigation.dart';
import 'screens/home/home_screen.dart';
import 'screens/dealt/dealt_screen.dart';
import 'model/redux/reducers/app_reducer.dart';
import 'package:provider/provider.dart';
import 'package:tarot_one/model/redux/actions/services/login/auth_service.dart';
import 'package:tarot_one/middleware/auth_middleware.dart';


//void main() => runApp(MyApp());
void main() =>runApp(ChangeNotifierProvider<AuthService>(
        child: MyApp(),
        builder: (BuildContext context) {
          return AuthService();
        },
      ),);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final DevToolsStore<AppState> store = DevToolsStore<AppState>(
      appReducer,
      initialState: AppState.initial(),
      //middleware: [thunkMiddleware],
      middleware: []
      ..addAll(createAuthMiddleware())
      //..add(thunkMiddleware),
    );
  @override
  Widget build(BuildContext context) {
     return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Tarot',
        navigatorKey: Keys.navKey,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: FutureBuilder<FirebaseUser>(
        future: Provider.of<AuthService>(context).getUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) { //          ⇐ NEW
          if (snapshot.connectionState == ConnectionState.done) {
            // log error to console                                            ⇐ NEW
            if (snapshot.error != null) {
              print("error");
              return Text(snapshot.error.toString());
            }
            // redirect to the proper page, pass the user into the 
            // `HomePage` so we can display the user email in welcome msg     ⇐ NEW
            return snapshot.hasData ? HomeScreen(currentUser:snapshot.data,title:'Home Screen') : LoginScreen(title: 'Log in');//Loginpage()
          } else {
            // show loading indicator                                         ⇐ NEW
            return LoadingCircle();
          }
        },
      ),
    //LoginScreen(title: 'Log in'), 
        routes: {
          Routes.homeScreen: (context) {
            return HomeScreen(title:'Home Screen');
          },
          Routes.dealtScreen: (context) {
            return DealtScreen(title:'Dealt Screen');
          },
        },
      ),
    );
    
    
  }

  
}

class LoadingCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: CircularProgressIndicator(),
        alignment: Alignment(0.0, 0.0),
      ),
    );
  }
}