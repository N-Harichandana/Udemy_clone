import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import '/providers/cart.dart';
import '/providers/courses.dart';
import '/screens/cart_screen.dart';

class CourseDescription extends StatelessWidget {
  static const id = 'cd';
  CourseDescription({
    super.key,
  });

  // bool _isHovering = false;
  @override
  Widget build(BuildContext context) {
    final cousename = ModalRoute.of(context)?.settings.arguments as String;
    final loadedproduct = Provider.of<Courses>(context).findbyname(cousename);
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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => CartScreen()));
            },
            icon: Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(loadedproduct.imageurl),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                loadedproduct.name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    "${loadedproduct.rating}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                RatingBar.builder(
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                  initialRating: loadedproduct.rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: Text(
                "Created by ${loadedproduct.instructor}",
                style: TextStyle(color: Colors.black, fontSize: 13),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: Text(
                "₹ ${loadedproduct.discount}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8),
              child: Text(
                "₹ ${loadedproduct.price}",
                style: TextStyle(
                    fontSize: 14,
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Consumer<Cart>(
                builder: (context, cart, _) => Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.0)),
                  child: ListTile(
                    title: Text(
                      "Add to Cart",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      cart.additem(
                          loadedproduct.imageurl,
                          loadedproduct.name,
                          loadedproduct.name,
                          loadedproduct.discount,
                          loadedproduct.rating,
                          loadedproduct.duration);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => CartScreen()));
                    },
                  ),
                ),
              ),
            ),
            Center(
              // padding: const EdgeInsets.only(left: 16),
              child: Text(
                "30-Day Money-Back Guarantee",
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                // margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 0.5)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "What You'll Learn",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        loadedproduct.description,
                        textAlign: TextAlign.justify,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
