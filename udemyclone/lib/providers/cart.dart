import 'package:flutter/foundation.dart';

class CartItem2 {
  final String imageurl;
  final String id;
  final String courseName;
  final double rating;
  final double duration;
  final double discount;

  CartItem2(
      {required this.id,
      required this.courseName,
      required this.imageurl,
      required this.rating,
      required this.duration,
      required this.discount});

  // String get coursename {
  //   return id;
  // }
}

class Cart with ChangeNotifier {
  Map<String, CartItem2> _items = {};

  Map<String, CartItem2> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalamount {
    var total = 0.0;
    _items.forEach((key, value) {
      total += value.discount;
    });
    return total;
  }

  void additem(String productid, String imageurl, String title, double price,
      double rating, double duration) {
    if (_items.containsValue(productid)) {
      print(_items.containsValue(productid));
      _items.update(
          productid,
          (existingCartitem) => CartItem2(
              imageurl: existingCartitem.imageurl,
              id: existingCartitem.id,
              courseName: existingCartitem.courseName,
              duration: existingCartitem.duration,
              rating: existingCartitem.rating,
              discount: existingCartitem.discount));
    } else {
      _items.putIfAbsent(
          productid,
          () => CartItem2(
              id: DateTime.now().toString(),
              imageurl: imageurl,
              courseName: title,
              rating: rating,
              duration: duration,
              // title: title,
              // quantity: 1,
              discount: price));
    }
    notifyListeners();
  }

  void remove_item(String coursename) {
    _items.remove(coursename);
    notifyListeners();
  }

  void remove_singleItem(
    String coursename,
  ) {
    print("hello");
    if (!_items.containsValue(coursename)) {
      return;
    } else {
      _items.remove(coursename);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
