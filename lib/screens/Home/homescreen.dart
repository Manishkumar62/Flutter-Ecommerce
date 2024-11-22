import 'package:ecommerce/models/category.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/screens/Home/Widget/homeappbar.dart';
import 'package:ecommerce/screens/Home/Widget/imageslider.dart';
import 'package:ecommerce/screens/Home/Widget/productcard.dart';
import 'package:ecommerce/screens/Home/Widget/searchbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<List<Product>> selectedCategories = [all, shoes, all, all, all, all];
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
              SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: selectedIndex == index
                ? Colors.blue[200]
                : Colors.transparent
              ),
              child: Column(
                children: [
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(categories[index].image),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    categories[index].title, 
                    style: const TextStyle(
                      fontSize: 16, 
                      fontWeight: 
                      FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Text(
                    "Special For You",
                    style:TextStyle(
                      fontSize: 25,
                      fontWeight:FontWeight.w800,
                    )
                  ),
                  Text(
                    "See all",
                    style:TextStyle(
                      fontWeight:FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black54
                    )
                  ),
                ]
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.78,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20
                ),
                itemCount: selectedCategories[selectedIndex].length,
                itemBuilder: (context,index){
                  return ProductCard(
                    product: selectedCategories[selectedIndex][index]
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

