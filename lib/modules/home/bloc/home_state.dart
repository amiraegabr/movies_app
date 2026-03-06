import '../../../models/movie_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<MovieModel> movies;
  HomeSuccessState(this.movies);
}

class HomeErrorState extends HomeState {
  final String message;
  HomeErrorState(this.message);
}
