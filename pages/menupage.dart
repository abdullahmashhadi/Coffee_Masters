import 'package:flutter/material.dart';
import 'package:coffee_masters/datamodel.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    var p = Product(
        id: 1,
        name: "Black Coffee",
        price: 500,
        image: "images/black_coffee.png");
    var q = Product(
        id: 2, name: "Cappuccino", price: 600, image: "images/cappucino.jpg");
    return ListView(
      children: [
        ProductItem(
          product: p,
          onAdd: () {},
        ),
        ProductItem(
          product: q,
          onAdd: () {},
        ),
      ],
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;
  final Function onAdd;
  const ProductItem({super.key, required this.product, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        child: Card(
          elevation: 4.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(product.image,
                  fit: BoxFit.cover, width: double.infinity),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(product.name,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Rs ${product.price}"),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        onAdd(product);
                      },
                      child: Text("Add to cart")),
                )
              ])
            ],
          ),
        ));
  }
}
