class LessonsModel {
  String? title;
  String? mins;

  LessonsModel({this.mins, this.title});
}

List<LessonsModel> lessonModel = [
  LessonsModel(
    title: 'Introduction',
    mins: '15 mins',
  ),
  LessonsModel(
    title: 'Basic About Design',
    mins: '45 mins',
  ),
  LessonsModel(
    title: 'Wireframes',
    mins: '55 mins',
  ),
];
