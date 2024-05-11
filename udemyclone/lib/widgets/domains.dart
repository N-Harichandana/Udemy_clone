import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/screens/course_desc.dart';
import '/providers/courses.dart';

Widget buildHeader(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.25,
    child: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        buildImageContainer("assets/logo/udemy_logo_2.jpg", context),
        buildImageContainer("assets/logo/udemy_3.jpg", context),
      ],
    ),
  );
}

Widget buildImageContainer(String imagePath, BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.75,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.contain,
      ),
    ),
  );
}

Widget buildContent(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "All the skills you need in one place",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "From critical skills to technical topics, Udemy supports your professional development.",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 20),
        buildSkillsTiles(context),
      ],
    ),
  );
}

Widget buildSkillsTiles(BuildContext context) {
  return Wrap(
    spacing: 16,
    runSpacing: 16,
    children: [
      buildExpansionTile(title: 'Web Development', context, "wcourse"),
      buildExpansionTile(title: 'App Development', context, "mcourse"),
      buildExpansionTile(title: 'Music', context, "music"),
    ],
  );
}

Widget buildExpansionTile(
  BuildContext context,
  String cour, {
  required String title,
}) {
  final courseProvider = Provider.of<Courses>(
    context,
  );
  return ExpansionTile(
    title: Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    onExpansionChanged: (value) async {
      courseProvider.getData(cour);
      print(courseProvider.loadedData);
    },
    children: [
      SizedBox(height: 8),
      SizedBox(
        height: 250,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: courseProvider.loadedData.length,
          itemBuilder: (context, index) => SizedBox(
              height: 200,
              child: buildCard(context,
                  image: courseProvider.loadedData[index].imageurl,
                  title: courseProvider.loadedData[index].name,
                  rating: courseProvider.loadedData[index].rating)),
        ),
      ),
      SizedBox(height: 8),
    ],
  );
}

Widget buildCard(
  BuildContext context, {
  required String image,
  required String title,
  required double rating,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pushNamed(CourseDescription.id, arguments: title);
    },
    child: SizedBox(
      height: 400,
      width: 350,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Image.network(
                    image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Instructor: Dr Angela YU",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 4),
                      StarRating(rating: rating), // Display rating as stars
                      SizedBox(height: 4),
                      Text(
                        "Duration: 15 hours",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildFooter() {
  return Container(
    padding: const EdgeInsets.all(20),
    color: Color.fromARGB(255, 47, 47, 47),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildFooterText("About us"),
        buildFooterText("Contact us"),
        buildFooterText("Company"),
        SizedBox(height: 20),
        Align(
          alignment: Alignment.bottomLeft,
          child: Image.asset("assets/logo/LOGOB.png"),
        ),
      ],
    ),
  );
}

Widget buildFooterText(String text) {
  return Text(
    text,
    style: TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.normal,
    ),
  );
}

class StarRating extends StatelessWidget {
  final double rating;
  final double starSize;

  const StarRating({
    Key? key,
    required this.rating,
    this.starSize = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int fullStars = rating.floor();
    double halfStars = rating - fullStars;
    List<Widget> stars = [];

    // Full stars
    for (int i = 0; i < fullStars; i++) {
      stars.add(Icon(
        Icons.star,
        size: starSize,
        color: Color.fromARGB(255, 255, 207, 14),
      ));
    }

    // Half stars
    if (halfStars > 0) {
      stars.add(Icon(
        Icons.star_half,
        size: starSize,
        color: Color.fromARGB(255, 255, 207, 14),
      ));
    }

    int remainingStars = 5 - fullStars - (halfStars > 0 ? 1 : 0);
    for (int i = 0; i < remainingStars; i++) {
      stars.add(Icon(Icons.star_border, size: starSize));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: stars,
    );
  }
}
