import 'package:coffee_masters/pages/offerspage.dart';
import 'package:flutter/material.dart';
import 'package:coffee_masters/pages/orderpage.dart';
import 'package:coffee_masters/pages/menupage.dart';

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
      Center(
        // Wrap the Row with Center to center both text widgets
        child: Row(
          mainAxisSize: MainAxisSize
              .min, // Ensure the row doesn't expand to fill the width
          children: [
            Center(child: Text("Hello $name", style: greetStyle)),
            Center(child: Text("!!!", style: greetStyle)),
          ],
        ),
      ),
      Center(
        child: Column(
          children: [Text("Type your name:")],
        ),
      ),
      Center(
        child: TextField(
            onChanged: (value) => setState(() {
                  name = value;
                })),
      ),
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
          seedColor:
              const Color.fromARGB(255, 255, 241, 49), // Your brown color
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
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget currentWidgetPage = const Text("!!!");
    switch (selectedIndex) {
      case 0:
        currentWidgetPage = const MenuPage();
        break;
      case 1:
        currentWidgetPage = const OffersPage();
        break;
      case 2:
        currentWidgetPage = const OrderPage();
        break;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 49, 28, 3),
        title: Image.asset("./images/logo.png"),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (newIndex) {
            setState(() {
              selectedIndex = newIndex;
            });
          },
          backgroundColor: const Color.fromARGB(255, 49, 28, 3),
          selectedItemColor: const Color.fromARGB(255, 223, 119, 0),
          unselectedItemColor: const Color.fromARGB(255, 175, 174, 171),
          items: const [
            BottomNavigationBarItem(
                label: "Menu", icon: Icon(Icons.coffee_rounded)),
            BottomNavigationBarItem(
                label: "Offers", icon: Icon(Icons.local_offer_rounded)),
            BottomNavigationBarItem(
                label: "Order",
                icon: Icon(Icons.shopping_cart_checkout_rounded)),
          ]),
      body: currentWidgetPage,
    );
  }
}
