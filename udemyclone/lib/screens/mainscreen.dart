import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '/screens/cart_screen.dart';
import '/widgets/button.dart';
import '/widgets/lister.dart';
import '/widgets/caros.dart';

import '../providers/courses.dart';

class MainScreen extends StatefulWidget {
  static const id = "main";
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _isLoading = false;
  var _isInit = true;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Courses>(context).fetchData().then((_) => _isLoading = false);
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
      drawer: Drawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 112, 101, 75),
              ),
            )
          : lister(),
    ));
  }
}
