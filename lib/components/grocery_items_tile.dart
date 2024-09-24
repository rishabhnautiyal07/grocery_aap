import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GroceryItemsTile extends StatelessWidget {

final String itemName;
final String itemPrice;
final String  imageParth;
final Color;
void Function()? onPressed;



 GroceryItemsTile({
  super.key,
  required this.itemName,
  required this.itemPrice,
  required this.imageParth,
  required this.Color,
  required this.onPressed,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color[100],
          borderRadius: BorderRadius.circular(12),
          ),
      
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // image
            Image.asset(imageParth,
            height: 64,
            ),
      
            // item name
            Text(itemName),

      
            // price + button
            MaterialButton(
              onPressed: onPressed ,
              color: Color[800],
              child: Text(
              '\$' + itemPrice,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                ),
              )
          ],
        ),
      ),
    );
  }
}