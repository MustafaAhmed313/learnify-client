import 'package:hive/hive.dart';

part 'featured_model.g.dart'; // This will be generated

@HiveType(typeId: 0) // Specify a unique typeId for each model class.
class FeaturedModel {
  @HiveField(0)
   String? title;

  @HiveField(1)
   String? description;
  @HiveField(2)
   String? image;
  // Add any other fields that you have in FeaturedModel.

  FeaturedModel({this.title, this.description, this.image});
}

List<FeaturedModel> featuredModel = [
  FeaturedModel(
      title: 'UI/UX Design',
      description: 'User Interface Design Essentials',
      image: 'assets/images/R.jfif'),
  FeaturedModel(
      title: 'Busseniss Managemant',
      description: 'Supply Chain Managemant',
      image: 'assets/images/R (1).jfif'),
  FeaturedModel(
      title: 'UI/UX Design',
      description: 'User Interface Design Essentials',
      image: 'assets/images/R.jfif'),
];
