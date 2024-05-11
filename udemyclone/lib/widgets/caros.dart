import 'package:flutter/material.dart';

class Caro extends StatelessWidget {
  const Caro({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        child: PageView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                    image: AssetImage("assets/logo/udemy_logo_2.jpg"),
                    fit: BoxFit.contain),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.25,
              // margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(25.0),
                image: DecorationImage(
                    image: AssetImage("assets/logo/udemy_3.jpg"),
                    fit: BoxFit.contain),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
