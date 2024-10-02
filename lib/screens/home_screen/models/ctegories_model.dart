

class CtegoriesModel {
  String? image;
  String? name;

  CtegoriesModel({this.image, this.name});
}

List<CtegoriesModel> ctegoriesModel = [
  CtegoriesModel(name: 'Development', image: 'assets/images/Icon.png'),
  CtegoriesModel(name: 'Design', image: 'assets/images/Icon (1).png'),
  CtegoriesModel(
      name: 'IT & Software',
      image: 'assets/images/eos-icons_software-outlined.png'),
  CtegoriesModel(
      name: 'Business',
      image: 'assets/images/streamline_business-idea-money.png'),
];
