class Category{
  final String title;
  final String image;

  Category({
    required this.title,
    required this.image,
  });
}

final List<Category> categories = [
  Category(
    title: "All",
    image: "images/shoes.jpg",
  ),
  Category(
    title: "Shoes",
    image: "images/shoes.jpg",
  ),
  Category(
    title: "Beauty",
    image: "images/beauty.jpg",
  ),
  Category(
    title: "Women's\nFashion",
    image: "images/women.jpg",
  ),
  Category(
    title: "Jewelry",
    image: "images/jewelry.jpg",
  ),
  Category(
    title: "Men's\nFashion",
    image: "images/men.jpg",
  ),
];