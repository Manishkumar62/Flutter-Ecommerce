import 'package:ecommerce/screens/Home/Widget/category.dart';
import 'package:ecommerce/screens/Home/Widget/homeappbar.dart';
import 'package:ecommerce/screens/Home/Widget/imageslider.dart';
import 'package:ecommerce/screens/Home/Widget/searchbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35,),
              const CustomAppBar(),
              const SizedBox(height: 35,),
              const MySearchBar(),
              const SizedBox(height: 35,),
              ImageSlider(
                currentSlide: currentSlider, 
                onChange: (value) {
                  setState((){
                    currentSlider = value;
                  });
                }
              ),
              const SizedBox(height: 35,),
              const Categories()
            ],
          ),
        ),
      ),
    );
  }
}

