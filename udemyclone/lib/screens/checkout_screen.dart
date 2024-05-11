// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:udemy/modals/payment.dart';
// import 'package:udemy/providers/courses.dart';
// import 'package:udemy/widgets/button.dart';

// class checkout extends StatelessWidget {
//   static const id = "checkout";
//   const checkout({super.key});

//   @override
//   Widget build(BuildContext context) {
//     //final course = Provider.of<Course>(context, listen: false);
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           iconTheme: IconThemeData(),
//           surfaceTintColor: Colors.white,
//           backgroundColor: Colors.white,
//           elevation: 5,
//           title: Image.asset(
//             "assets/logo/logou.png",
//             scale: 4,
//           ),
//           actions: [
//             Consumer<Courses>(
//               builder: (ctx, courses, child) => IconButton(
//                 onPressed: () {
//                   print("hi");
//                 },
//                 icon: Icon(Icons.shopping_cart),
//               ),
//             )
//           ],
//         ),
//         // drawer: Drawer(),
//         body: Container(
//             padding: EdgeInsets.fromLTRB(16, 30, 16, 16),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Checkout",
//                   style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Text(
//                   "BIlling Address",
//                   style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
//                 ),
//                 SizedBox(
//                   height: 25,
//                 ),
//                 TextField(
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(), labelText: "Country"),
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 TextField(
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(), labelText: "State"),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Text(
//                   "Order Details",
//                   style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Column(
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           "Title",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w300, fontSize: 18),
//                         ),
//                         Spacer(),
//                         Text(
//                           "Price",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w300, fontSize: 20),
//                         )
//                       ],
//                     ),
//                     SizedBox(height: 10),
//                     Row(
//                       children: [
//                         Text(
//                           "Title",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w300, fontSize: 20),
//                         ),
//                         Spacer(),
//                         Text(
//                           "Price",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w300, fontSize: 20),
//                         )
//                       ],
//                     ),
//                   ],
//                 )
//               ],
//             )),
//         bottomSheet: Container(
//           padding: EdgeInsets.all(20),
//           height: 120,
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     "Total",
//                     style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
//                   ),
//                   Spacer(),
//                   Text(
//                     "Price",
//                     style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
//                   )
//                 ],
//               ),
//               button(
//                   function: () {
//                     payment();
//                   },
//                   text: "Checkout")
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
