import 'package:flutter/material.dart';

class Product {
  final String title;
  final String description;
  final String image;
  final String review;
  final String seller;
  final double price;
  final List<Color>colors;
  final String catogary;
  final double rate;
  int quantity;

  Product({
      required this.title,
      required this.review,
      required this.description,
      required this.image,
      required this.price,
      required this.colors,
      required this.seller,
      required this.catogary,
      required this.rate,
      required this.quantity,
  });
}

final List<Product> products = [
  Product(
    title: "Wireless Headphones",
    description: "Wireless Headphones with good sound quality",
    image: "images/wirelessearphone.jpg",
    price: 120,
    colors: [
      Colors.black,
      Colors.blue,
      Colors.orange,
    ],
    catogary: "Electronics",
    rate: 4.5,
    quantity: 1,
    seller: "John Wick",
    review: "(320 Reviews)",
  ),
  Product(
    title: "smart watch",
    description: "smart watch with good display quality",
    image: "images/smartwatch.jpg",
    price: 120,
    colors: [
      Colors.black,
      Colors.blue,
      Colors.orange,
    ],
    catogary: "Electronics",
    rate: 4.5,
    quantity: 1,
    seller: "John Wick",
    review: "(320 Reviews)",
  ),
  Product(
    title: "Mens Jacket",
    description: "Mens Jacket with good quality",
    image: "images/mensjacket.jpg",
    price: 155,
    colors: [
      Colors.blueAccent,
      Colors.orange,
      Colors.green,
    ],
    catogary: "winter clothes",
    rate: 4.5,
    quantity: 1,
    seller: "jacket store",
    review: "(20 Reviews)",
  ),
];