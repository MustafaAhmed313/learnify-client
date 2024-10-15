part of 'favourite_cubit.dart';

@immutable
sealed class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}
final class AddFavourite extends FavouriteState {}
final class DeleteFavourite extends FavouriteState {}

