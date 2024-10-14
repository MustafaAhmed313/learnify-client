import 'package:hive/hive.dart';

part 'featured_model.g.dart'; // This will be generated

@HiveType(typeId: 0) // Specify a unique typeId for each model class.
class FeaturedModel {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;
  @HiveField(2)
  final String image;
  // Add any other fields that you have in FeaturedModel.

  FeaturedModel(
      {required this.title, required this.description, required this.image});
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
