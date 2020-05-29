import 'package:animated_physical_model/images.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF832685),
        primaryColorLight: Color(0xFFC81379),
        accentColor: Colors.black,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = 'AnimatedPhysicalModel';

  bool _elev = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedPhysicalModel(
              curve: Curves.fastOutSlowIn,
              shadowColor: Colors.black,
              shape: BoxShape.rectangle,
              elevation: _elev ? 0 : 70,
              color: Colors.white,
              duration: Duration(seconds: 2),
              borderRadius: _elev
                  ? const BorderRadius.all(Radius.circular(0.0))
                  : const BorderRadius.all(Radius.circular(30.0)),
              child: Container(
                height: 200.0,
                width: 200.0,
                color: Colors.blue[50],
                child: Image(
                  image: AssetImage(wanda),
                  height: 200.0,
                  width: 200.0,
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  _elev = !_elev;
                });
              },
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 36.0,
              ),
              backgroundColor: Colors.purple,
              tooltip: 'Play',
              heroTag: 'Model',
            ),
          ],
        ),
      ),
    );
  }
}
