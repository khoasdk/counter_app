import 'package:counter_app/widgets/fancy_button.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Counter App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _reversed = false;
  List<UniqueKey> _buttonKeys = [UniqueKey(), UniqueKey()];

  void _incrementCounter() {
    setState(() => _counter++);
  }

  void _decrementCounter() {
    setState(() => _counter--);
  }

  void _resetCounter() {
    setState(() => _counter = 0);
    _swap();
  }

  void _swap() {
    setState(() {
      _reversed = !_reversed;
    });
  }

  @override
  Widget build(BuildContext context) {
    final incrementButton = FancyButton(
      key: _buttonKeys.first,
      child: Text(
        'Decrement',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: _decrementCounter,
    );

    final decrementButton = FancyButton(
      key: _buttonKeys.last,
      child: Text(
        'Increment',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: _incrementCounter,
    );

    List<Widget> _buttons = <Widget>[incrementButton, decrementButton];

    if (_reversed) {
      _buttons = _buttons.reversed.toList();
    }

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 100),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.25),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Image.asset(
                'images/flutter_logo_1080.png',
                width: 100,
              ),
            ),
            Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _buttons,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetCounter,
        tooltip: 'Reset Counter',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
