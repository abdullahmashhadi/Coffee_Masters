import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/*
Widget Tree
MyApp
  MyHomePage
    HelloWorld
      Text
*/
class HelloWorld extends StatelessWidget {
  const HelloWorld({super.key});
  @override
  Widget build(BuildContext context) {
    return const Text("Hello World");
  }
}

class Greet extends StatefulWidget {
  const Greet({super.key});

  @override
  State<Greet> createState() => _GreetState();
}

class _GreetState extends State<Greet> {
  //State variable
  var name = "";
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Text("Hello $name"),
        ],
      ),
      Padding(
          padding: const EdgeInsets.only(
              top: 300.0, left: 60, right: 60, bottom: 300),
          child: TextField(
              onChanged: (value) => setState(() {
                    name = value;
                  }))),
    ]);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ✅ MaterialApp provides Directionality
      title: 'Coffee Masters',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Coffee Masters'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Greet(),
    );
  }
}
