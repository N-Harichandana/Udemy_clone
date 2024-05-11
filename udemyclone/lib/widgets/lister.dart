import 'package:flutter/material.dart';
import '/widgets/domains.dart';

class lister extends StatelessWidget {
  const lister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildContent(context),
            buildFooter(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
