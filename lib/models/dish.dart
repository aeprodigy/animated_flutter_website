class Dish {
  //model class for dish
  // This class represents a dish with its properties
  final String name;
  final String subName;
  final String description;
  final String imageUrl;
  final double price;

  // Constructor
  const Dish({
    required this.name,
    required this.subName,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
}

//list of dishes
List<Dish> dishes = [
  const Dish(
    name: "Pasta",
    subName: "Italian Pasta",
    description: "Delicious pasta with tomato sauce and cheese.",
    imageUrl: "https://images.unsplash.com/photo-1622973536968-3ead9e780960?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    price: 12.99,
  ),
  const Dish(
    name: "Pizza",
    subName: "Cheese Pizza",
    description: "Classic cheese pizza with fresh ingredients.",
    imageUrl: "https://images.unsplash.com/photo-1604382354936-07c5d9983bd3?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    price: 10.99,
  ),
  const Dish(
    name: "Fish",
    subName: "Grilled Fish",
    description: "Freshly grilled fish with lemon and herbs.",
    imageUrl: "https://images.unsplash.com/photo-1584300005420-38486f627b07?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    price: 12.99,
  ),

  const Dish(
    name: "Salad",
    subName: "Caesar Salad",
    description: "Fresh Caesar salad with croutons and dressing.",
    imageUrl: "https://images.unsplash.com/photo-1550304943-4f24f54ddde9?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    price: 8.99,
  ),
  
  
];
