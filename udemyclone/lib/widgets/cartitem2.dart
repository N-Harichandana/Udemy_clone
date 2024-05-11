import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import '/providers/cart.dart';

class CartItem2 extends StatelessWidget {
  // const CartItem2({super.key});

  final String imageurl;
  final String courseName;
  final double rating;
  final double duration;
  final double discount;

  CartItem2(
      {required this.imageurl,
      required this.courseName,
      required this.rating,
      required this.duration,
      required this.discount});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.all(8.0),
        child: ListTile(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                courseName,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  // Icon(Icons.star, color: Colors.yellow, size: 10),
                  // SizedBox(width: 5),
                  Text(
                    rating.toString(),
                    style: TextStyle(fontSize: 10, color: Colors.black),
                  ),
                  RatingBar.builder(
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                    initialRating: rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 10,
                    itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  ),
                ],
              ),
              Text(
                "$duration total hours",
                style: TextStyle(color: Colors.black, fontSize: 10),
              ),
              // SizedBox(
              //   height: 5,
              // ),
              Consumer<Cart>(
                builder: (context, cart, _) => TextButton(
                    onPressed: () {
                      print("he");
                      cart.remove_item(courseName);
                    },
                    child: Text(
                      "Remove",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 33, 82, 243),
                          fontSize: 10),
                    )),
              ),
            ],
          ),
          trailing: Wrap(
            children: [
              Text(
                "₹$discount",
                style: TextStyle(
                  color: Color.fromARGB(255, 164, 53, 240),
                ),
              ),
              Icon(
                Icons.price_check_sharp,
                color: Color.fromARGB(255, 164, 53, 240),
              )
            ],
          ),
        ));
  }
}
