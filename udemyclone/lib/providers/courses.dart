import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Courses with ChangeNotifier {
  List<Course> data = [];
  List<Course> loadedData = [];
  int count = 0;
  List<Category> loadedCategory = [];

  Course findbyname(String name) {
    return data.firstWhere(
      (element) => element.name == name,
    );
  }

  Future<void> fetchData() async {
    final url =
        Uri.parse("https://udemy-1e36f-default-rtdb.firebaseio.com/ALLC.json");
    try {
      final response = await http.get(url);
      count++;
      print(count);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      extractedData.forEach((category, courseData) {
        loadedCategory.add(Category(category: category, coursew: courseData));
      });
      loadedCategory.forEach((category) {
        category.coursew.forEach((courseId, categoryData) {
          data.add(Course(
            category: category.category,
            name: categoryData['name'],
            description: categoryData['description'],
            duration: categoryData['duration'],
            price: categoryData["price"],
            discount: categoryData['discount'],
            rating: categoryData['rating'],
            imageurl: categoryData["image"],
            instructor: categoryData['instructor'],
          ));
        });
      });
      print("ft${data.first.category}");
      notifyListeners();
    } catch (error) {
      print("Error fetching data: $error");
    }
  }

  List<Course> getData(String courseId) {
    int counter = 0; // Rename variable to 'counter'
    loadedData.clear(); // Clear the list before adding new elements
    loadedData.addAll(data.where((element) {
      if (element.category == courseId) {
        counter++;
        print(
            "Adding course: ${element.name} $counter"); // Print the 'counter' variable

        return true;
      } else {
        return false;
      }
    }));
    return loadedData;
  }
}

class Category {
  final String category;
  final Map<String, dynamic> coursew;

  Category({required this.category, required this.coursew});
}

class Course {
  final String category;
  final String name;
  final String description;
  final double duration;
  final double price;
  final double discount;
  final String instructor;
  final double rating;
  final String imageurl;

  Course({
    required this.category,
    required this.rating,
    required this.imageurl,
    required this.price,
    required this.discount,
    required this.instructor,
    required this.name,
    required this.description,
    required this.duration,
  });
}
