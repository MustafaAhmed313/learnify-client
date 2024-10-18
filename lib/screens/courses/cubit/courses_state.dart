part of 'courses_cubit.dart';

@immutable
sealed class CoursesState {}

final class CoursesInitial extends CoursesState {}
final class AddCourse extends CoursesState {}
final class DeleteCourse extends CoursesState {}
