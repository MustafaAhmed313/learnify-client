part of 'carousel_cubit.dart';

@immutable
sealed class CarouselState {}

final class CarouselInitial extends CarouselState {}
final class CarouselOnPageChange extends CarouselState {}

