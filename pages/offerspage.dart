import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: const [
      Offer(
          title: "Our hottest-selling offer",
          description: "Buy 1, get 2 free!"),
      Offer(
          title: "Our lunch-time offer",
          description: "Buy 1 entree get 50% off on 2nd!"),
      Offer(title: "Our midnight offer", description: "Flat 50% off on menu!"),
    ]);
  }
}

class Offer extends StatelessWidget {
  //properties are typically final
  final String title;
  final String description;
  const Offer({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: const Color.fromARGB(255, 59, 30, 30),
          elevation: 7,
          child: Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "./images/background.png",
                  )),
            ),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Container(
                  color: Colors.amber.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(title,
                        style: Theme.of(context).textTheme.headlineLarge),
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Container(
                  color: Colors.amber.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(description,
                        style: Theme.of(context).textTheme.bodyLarge),
                  ),
                )),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
