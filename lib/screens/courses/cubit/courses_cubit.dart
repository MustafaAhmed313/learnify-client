import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:learnify_client/screens/home_screen/models/featured_model.dart';
import 'package:meta/meta.dart';

part 'courses_state.dart';
const cousebox = 'COU_BOX';
const cousekey = 'COU_KEY';
class CoursesCubit extends Cubit<CoursesState> {
    List<FeaturedModel> featuredCourses = [];
  List<FeaturedModel> Courses = [];
  CoursesCubit() : super(CoursesInitial()){
      final box = Hive.box(cousebox);
    Courses = List<FeaturedModel>.from(box.get(cousekey, defaultValue: <dynamic>[]) as List<dynamic>);
  }
    void addToCourses(FeaturedModel course) {
    if (!Courses.contains(course)) {
      Courses.add(course);
      Hive.box(cousebox).put(cousekey, Courses);
      emit(AddCourse()); // لتحديث الواجهة
    }
  }

  void deleteCourses(FeaturedModel course) {
    if (Courses.contains(course)) { // Check if the course is in the favorites
      Courses.remove(course);
      Hive.box(cousebox).put(cousekey, Courses);
      emit(DeleteCourse()); // لتحديث الواجهة
    }
  }

  List<FeaturedModel> getCourses() {
    final List<dynamic> rawFavorites = Hive.box(cousebox).get(cousekey, defaultValue: <dynamic>[]);

    // Safely map each dynamic item to FeaturedModel
    Courses = rawFavorites.map((e) {
      if (e is FeaturedModel) {
        return e;
      } else {
        // Handle error or return a default value
        return null; // or throw an exception
      }
    }).whereType<FeaturedModel>().toList(); // Filter out nulls

    return Courses;
  }
}
