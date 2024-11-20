import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/screens/Detail/Widget/description.dart';
import 'package:ecommerce/screens/Detail/Widget/detailappbar.dart';
import 'package:ecommerce/screens/Detail/Widget/imageslider.dart';
import 'package:ecommerce/screens/Detail/Widget/itemsdetails.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImage = 0;
  int currentColor = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcontentColor,
      body: SafeArea(
        child: Column(
          children: [
            const DetailAppBar(),
            MyImageSlider(
              image: widget.product.image, 
              onChange: (index){
                setState(() {
                  currentImage = index;
                });
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index)=> AnimatedContainer(
                  duration:const Duration(microseconds: 300),
                  width: currentImage == index ? 15 : 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentImage == index ? Colors.black : Colors.transparent,
                    border: Border.all(
                      color: Colors.black,
                    )
                  ),
                )
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                )
              ),
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: 100,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemsDetails(product: widget.product),
                  const SizedBox(height: 20),
                  Text(
                    "Color",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: List.generate(
                      widget.product.colors.length, 
                      (index) => GestureDetector(
                        onTap: (){
                          setState(() {
                            currentColor = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(
                            milliseconds: 300
                          ),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentColor == index ? Colors.white : widget.product.colors[index],
                            border:currentColor == index ? Border.all(color: widget.product.colors[index]) : null,
                          ),
                          padding: currentColor == index ? EdgeInsets.all(2) : null,
                          margin: EdgeInsets.only(right: 10),
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: widget.product.colors[index],
                              shape: BoxShape.circle
                            ),
                          ),
                        ),
                      )
                    ),
                  ),
                  SizedBox(height: 25),
                  Description(description: widget.product.description)
                ],
              ),
            )
          ],
        )
      
      ),
    );
  }
}