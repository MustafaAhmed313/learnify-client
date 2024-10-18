import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:learnify_client/screens/home_screen/models/featured_model.dart';
import 'package:meta/meta.dart';

part 'favourite_state.dart';

const favbox = 'FAV_BOX';
const favkey = 'FAV_KEY'; // This should be different from favbox

class FavouriteCubit extends Cubit<FavouriteState> {
  List<FeaturedModel> featuredCourses = [];
  List<FeaturedModel> favoriteCourses = [];

  FavouriteCubit() : super(FavouriteInitial()) {
    // Make sure the box is opened before accessing it
    final box = Hive.box(favbox);
    favoriteCourses = List<FeaturedModel>.from(box.get(favkey, defaultValue: <dynamic>[]) as List<dynamic>);
  }

  void addToFavorites(FeaturedModel course) {
    if (!favoriteCourses.contains(course)) {
      favoriteCourses.add(course);
      Hive.box(favbox).put(favkey, favoriteCourses);
      emit(AddFavourite()); // لتحديث الواجهة
    }
  }

  void deleteFavorites(FeaturedModel course) {
    if (favoriteCourses.contains(course)) { // Check if the course is in the favorites
      favoriteCourses.remove(course);
      Hive.box(favbox).put(favkey, favoriteCourses);
      emit(DeleteFavourite()); // لتحديث الواجهة
    }
  }

  List<FeaturedModel> getFavorites() {
    final List<dynamic> rawFavorites = Hive.box(favbox).get(favkey, defaultValue: <dynamic>[]);

    // Safely map each dynamic item to FeaturedModel
    favoriteCourses = rawFavorites.map((e) {
      if (e is FeaturedModel) {
        return e;
      } else {
        // Handle error or return a default value
        return null; // or throw an exception
      }
    }).whereType<FeaturedModel>().toList(); // Filter out nulls

    return favoriteCourses;
  }
}
