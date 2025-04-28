part of 'movies_bloc.dart';

abstract class MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesInitial extends MoviesState {}

class MoviesIFetched extends MoviesState {
  List<MovieModel> movieList;

  MoviesIFetched({required this.movieList});
}
