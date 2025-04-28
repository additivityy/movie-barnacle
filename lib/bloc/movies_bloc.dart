import 'package:flutter_application_1/models/movie_model.dart';
import 'package:flutter_application_1/repository/movies_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movies_state.dart';
part 'movies_event.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesRepository moviesRepository = MoviesRepository();
  MoviesBloc() : super(MoviesInitial()) {
    on<MoviesInitialEvent>((event, emit) async {
      emit(MoviesLoading());
      List<MovieModel> movieList = await moviesRepository.fetchMovieData();
      emit(MoviesIFetched(movieList: movieList));
    });
  }
}
