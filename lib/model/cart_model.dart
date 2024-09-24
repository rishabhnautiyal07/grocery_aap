import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {

  // list of items on sale
  final List _shopItems = [
    // [ itemName, itemprice, imagePath, colour ]
    ["Avagado", "4.00","lib/images/fruit_14923663.png", Colors.green],
    ["Banana", "2.50","lib/images/banana_10247520.png", Colors.yellow],
    ["chicken", "12.80","lib/images/chicken_4952283.png", Colors.brown],
    ["water", "1.00","lib/images/water.png", Colors.blue],
  ];

// list of cart items
List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  // add items to cart
  void addItemsTOCart(int index){
_cartItems.add(_shopItems[index]);
notifyListeners();
  }

// remove items from cart
void removeItemsFromCart(int index){
  _cartItems.removeAt(index);
  notifyListeners();
}

// calculate total price
String calculateTotal(){
 double totalPrice = 0;
 for(int i=0; i< _cartItems.length; i++) {
totalPrice += double.parse(_cartItems[i][1]);
 }
 return totalPrice.toStringAsFixed(2);
}
}