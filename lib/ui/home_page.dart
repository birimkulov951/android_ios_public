import 'package:android_ios/core.dart';
import 'package:android_ios/model/board_item_object.dart';
import 'package:android_ios/model/board_list_object.dart';
import 'package:android_ios/widgets/boardview/boardview_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';


class MyHomePage extends StatefulWidget {
  static const routeName = '/homePage';
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  SharedPrefHelper prefs =  SharedPrefHelper();


  final List<BoardListObject> _listData = [
    BoardListObject(title: "Первый контакт",
        items: [
          BoardItemObject(id: 'ID 044', name: 'Бекназаров Айдин',phone: '0 700 70 70 70', course: 'PHP', city: 'Bishkek'),
          BoardItemObject(id: 'ID 045', name: 'Талайбек кызы Айтурган',phone: '0 700 70 70 70', course: 'Python', city: 'Bishkek'),
          BoardItemObject(id: 'ID 046', name: 'Азамат Турганбердиев',phone: '0 700 70 70 70', course: 'C#', city: 'Bishkek'),
          BoardItemObject(id: 'ID 047', name: 'Айдин',phone: '0 700 70 70 70', course: 'Java Script', city: 'Bishkek'),
        ]),
    BoardListObject(title: "Звонок совершен"),
    BoardListObject(title: "Записан на пробный урок"),
    BoardListObject(title: "Посетил пробный урок"),
    BoardListObject(title: "ADD NEW COLUMN"),
  ];

  int _counter = 0;




  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      Fluttertoast.showToast(
          msg: "This is Center Short Toast $_counter",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return WillPopScope(
        onWillPop: () async => SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
        child: Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text('NeoPanel'),
            automaticallyImplyLeading: false,
            centerTitle: true,
          ),
          body: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Center(
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
                child: BoardViewExample(listData: _listData)),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.search),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }

/* @override
  void initState() {
    //todo open autorization page if not autorized
    if (prefs.getAuthToken() == null) {
      Navigator.of(context).pushNamed(AppConstants.AUTHORIZATION_PAGE);
    }

  }*/
}

