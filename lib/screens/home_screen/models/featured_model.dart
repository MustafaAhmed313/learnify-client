class FeaturedModel {
  String? title;
  String? description;

  FeaturedModel({this.description, this.title});
}

List<FeaturedModel> featuredModel = [
  FeaturedModel(
      title: 'UI/UX Design', description: 'User Interface Design Essentials'),
  FeaturedModel(
      title: 'Busseniss Managemant', description: 'Supply Chain Managemant'),
  FeaturedModel(
      title: 'UI/UX Design', description: 'User Interface Design Essentials'),
];
