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

class Greet extends StatelessWidget {
  const Greet({super.key});

  @override
  Widget build(BuildContext context) {
    var name = "Abdullah";
    return Column(children: [
      Text("Hello $name"),
      TextField(
        onChanged: (value) => name = value,
      )
    ]);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ✅ MaterialApp provides Directionality
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
