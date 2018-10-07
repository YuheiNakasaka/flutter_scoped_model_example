import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_scoped_model_example/counter_model.dart';

void main() => runApp(new MyApp(CounterModel()));

class MyApp extends StatelessWidget {
  final CounterModel counterModel;

  MyApp(this.counterModel);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScopedModel<CounterModel>(
        model: counterModel,
        child: new MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter ScopedModel Demo'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            ScopedModelDescendant<CounterModel>(
              builder: (context, child, model) => new Text(
                    '${model.counter}',
                    style: Theme.of(context).textTheme.display1,
                  ),
            ),
          ],
        ),
      ),
      floatingActionButton: ScopedModelDescendant<CounterModel>(
        builder: (context, child, model) {
          return new FloatingActionButton(
            onPressed: model.increment,
            tooltip: 'Increment',
            child: new Icon(Icons.add),
          );
        },
      ),
    );
  }
}
