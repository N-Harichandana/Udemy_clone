import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '/modals/payment.dart';
import '/screens/checkout_screen.dart';
import '/widgets/button.dart';
import '/widgets/cartitem2.dart';
import '/providers/cart.dart' show Cart;

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(),
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        elevation: 5,
        title: Image.asset(
          "assets/logo/logou.png",
          scale: 4,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Total:",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "₹${cart.totalamount.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "${cart.itemCount} Course${cart.itemCount > 1 ? 's' : ''} in Cart",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              textAlign: TextAlign.right,
            ),
            Divider(
              color: Colors.black,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (ctx, i) => CartItem2(
                  imageurl: cart.items.values.toList()[i].imageurl,
                  courseName: cart.items.values.toList()[i].courseName,
                  rating: cart.items.values.toList()[i].rating,
                  duration: cart.items.values.toList()[i].duration,
                  discount: cart.items.values.toList()[i].discount,
                ),
                itemCount: cart.items.length,
              ),
            ),
            Spacer(),
            button(
                function: () {
                  payment(cart.totalamount);
                },
                text: "CheckOut")
          ],
        ),
      ),
    );
  }
}
