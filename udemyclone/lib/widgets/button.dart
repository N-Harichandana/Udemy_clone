import 'package:flutter/material.dart';

class button extends StatelessWidget {
  final String text;
  final function;
  const button({
    required this.function,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      child: Text(
        this.text,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
      ),
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
            Size.fromWidth(MediaQuery.of(context).size.width)),
        backgroundColor: MaterialStateColor.resolveWith(
            (states) => Color.fromARGB(255, 164, 53, 240)),
      ),
    );
  }
}

// class cardv extends StatelessWidget {
//   const cardv({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       direction: Axis.horizontal,
//       children: [
//         GridTile(
//           child: Image.asset("assets/logo/logou.png"),
//           footer: Container(
//             color: Colors.white,
//             child: Column(children: [
//               Text(
//                 "Title",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 25,
//                     fontWeight: FontWeight.w700),
//               )
//             ]),
//           ),
//         )
//       ],
//     );
//   }
// }
