import 'package:flutter/material.dart';
import 'package:food_store/model/cart_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'components/grocery_items_tile.dart';
import 'pages/cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return CartPage();
          },
        ),
          ),
        backgroundColor: Colors.blue,
        child: Icon(Icons.shopping_basket),
        ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
         const  SizedBox(height: 48),

            // good morning 
         const  Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text("Good morning"),
            ),

           SizedBox(height: 4),
        
          // Let,s order resh items for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Let,s order fresh items for you",
              style: GoogleFonts.notoSerif(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
              ), 
          ),

          const SizedBox(height: 24),
        
          // divider
        const  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(),
          ),

          const SizedBox(height: 24),
        
          // fresh items + grid
         const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Fresh Items",
            style: TextStyle(fontSize: 16),
            ),
          ),

         Expanded(
         child: Consumer<CartModel>(builder: (context, value, child){
          return GridView.builder(
            itemCount: value.shopItems.length,
            padding: EdgeInsets.all(12),
            gridDelegate:
             SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.3,
              ), 
            itemBuilder: (context, index) {
              return GroceryItemsTile(
                itemName: value.shopItems[index][0],
                 itemPrice: value.shopItems[index][1],
                 imageParth: value.shopItems[index][2], 
                 Color: value.shopItems[index][3],
                 onPressed: () {
                  Provider.of<CartModel>(context, listen: false)
                  .addItemsTOCart(index);
                 },
              );
            },
          );

         },),
         )
        
          ],
        ),
      ),
    );
  }
}