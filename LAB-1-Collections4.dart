class Product {
  String name;
  double price;
  int quantity;
  
  Product(this.name, this.price, this.quantity);
}

void main() {
  List<Product> cart = [];
  
  cart.add(Product('Shirt', 25.0, 2));
  cart.add(Product('Pants', 35.0, 1));
  
  double totalPrice = 0;
  for (var item in cart) {
    totalPrice += item.price * item.quantity;
  }
  print('Total Price: \$$totalPrice');
  
  // Remove an item from the cart
  cart.removeWhere((item) => item.name == 'Shirt');
  print('Cart after removing Shirt: $cart');
}
