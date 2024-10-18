import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:learnify_client/screens/courses/course_detail.dart';
import 'package:learnify_client/screens/home_screen/models/featured_model.dart';

class CoursesScreen1 extends StatefulWidget {
  const CoursesScreen1({super.key});

  @override
  _CoursesScreen1State createState() => _CoursesScreen1State();
}

class _CoursesScreen1State extends State<CoursesScreen1> {
  // List to hold the courses
  List<Map<String, dynamic>> courses = [
    {
      'imagePath': 'assets/images/R.jfif',
      'courseTitle': 'UI/UX Design',
      'courseDescription': 'User Interface Design Essentials',
      'lessonsInfo': '5/10 ',
      'progress': 0.6,
    },
    {
      'imagePath': 'assets/images/R (1).jfif',
      'courseTitle': 'Business Management',
      'courseDescription': 'Supply Chain Management',
      'lessonsInfo': '8/12 ',
      'progress': 0.8,
    },
    {
      'imagePath': 'assets/images/R (1).jfif',
      'courseTitle': 'UI/UX Design',
      'courseDescription': 'User Research And Design',
      'lessonsInfo': '3/10 ',
      'progress': 0.3,
    },
  ];

  // Function to extract and calculate progress based on lessons info
  double calculateProgress(String lessonsInfo) {
    List<String> parts = lessonsInfo.split('/'); // Split "X/Y Lessons"
    int completedLessons = int.parse(parts[0]); // Extract X
    int totalLessons = int.parse(parts[1].split(' ')[0]); // Extract Y
    return completedLessons / totalLessons; // Calculate progress as a ratio
  }

  @override
  void initState() {
    super.initState();
    // Recalculate progress for each course when the screen is first loaded
    for (var course in courses) {
      course['progress'] = calculateProgress(course['lessonsInfo']);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Determine colors based on theme
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDarkMode ? Colors.white : Colors.white;
    final textColor =
        isDarkMode ? Colors.white : Colors.black; // Declare textColor here

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("My Courses")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              SizedBox(height: screenHeight * .02),
              ...courses.asMap().entries.map((entry) {
                final index = entry.key;
                final course = entry.value;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: buildCourseCard(
                    context,
                    imagePath: course['imagePath'],
                    courseTitle: course['courseTitle'],
                    courseDescription: course['courseDescription'],
                    lessonsInfo: course['lessonsInfo'],
                    progress: course['progress'],
                    onDelete: () {
                      showDeleteDialog(
                          context, index); // Show confirmation dialog
                    },
                    onLessonsInfoChanged: (newLessonsInfo) {
                      setState(() {
                        course['lessonsInfo'] = newLessonsInfo;
                        course['progress'] = calculateProgress(newLessonsInfo);
                      });
                    },
                    textColor: textColor, // Pass textColor to the method
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCourseCard(
    BuildContext context, {
    required String imagePath,
    required String courseTitle,
    required String courseDescription,
    required String lessonsInfo,
    required double progress,
    required VoidCallback onDelete,
    required Function(String) onLessonsInfoChanged,
    required Color textColor,
  }) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        // Navigate to CourseDetail screen
        Get.to(
          CourseDetail(
            course: FeaturedModel(
              title: courseTitle,
              description: courseDescription,
              image: imagePath,
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: isDarkMode
              ? Colors.grey[850]
              : Colors.white, // Card color based on theme
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        imagePath,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: GestureDetector(
                      onTap: onDelete,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.7),
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 8.0,
                    ),
                    child: Text(
                      courseTitle,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                child: Text(
                  courseDescription,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Editable text field for lessonsInfo
                    Row(
                      children: [
                        Text(
                          "Lessons: ",
                          style: TextStyle(
                            fontSize: 12,
                            color: textColor,
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          child: TextField(
                            onSubmitted: (newValue) {
                              onLessonsInfoChanged(newValue);
                            },
                            style: TextStyle(
                              color: textColor,
                            ),
                            controller: TextEditingController(
                              text: lessonsInfo,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "${(progress * 100).toInt()}%",
                      style: TextStyle(
                        fontSize: 12,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 10,
                    ),
                    trackHeight: 6,
                    activeTrackColor: const Color.fromRGBO(33, 150, 243, 1),
                    inactiveTrackColor: Colors.grey[300],
                    thumbColor: const Color.fromRGBO(33, 150, 243, 1),
                    overlayShape: RoundSliderOverlayShape(
                      overlayRadius: 15,
                    ),
                  ),
                  child: Slider(
                    value: progress,
                    min: 0.0,
                    max: 1.0,
                    onChanged: (newValue) {
                      setState(() {
                        // Update progress
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to show course details when card is tapped
  void showCourseDetails(
      BuildContext context, String courseTitle, String courseDescription) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(courseTitle),
          content: Text(courseDescription),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  // Function to show confirmation dialog
  void showDeleteDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding: const EdgeInsets.all(20),
          title: Center(
            child: Column(
              children: [
                Icon(Icons.delete, size: 40, color: Colors.red),
                SizedBox(height: 10),
                Text(
                  "Are You Sure Want to Delete this Course?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          content: Text(
            "You still can redownload again without payment.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                setState(() {
                  courses.removeAt(index); // Remove the course
                });
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}
