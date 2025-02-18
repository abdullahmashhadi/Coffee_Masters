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
    var greetStyle = TextStyle(fontSize: 30);
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(children: [
      Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Row(
          children: [
            Text("Hello $name", style: greetStyle),
            Text("!!!", style: greetStyle),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [Text("Type your name:")],
        ),
      ),
      Padding(
          padding: const EdgeInsets.only(
              top: 300.0, left: 60, right: 60, bottom: 30),
          child: TextField(
              onChanged: (value) => setState(() {
                    name = value;
                  }))),
    ]);
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Coffee Masters',
//       theme: ThemeData(
//         primarySwatch: Colors.brown,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Masters',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 43, 28, 20), // Your brown color
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

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
        title: Image.asset("./images/logo.png"),
      ),
      body: const Greet(),
    );
  }
}
