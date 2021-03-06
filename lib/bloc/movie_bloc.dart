import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutix/models/models.dart';
import 'package:flutix/services/services.dart';
import 'package:equatable/equatable.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial());

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    if (event is FetchNowPlayingMovies) {
      List<Movie> movies = await MovieServices.getNowPlayingMovies(1);

      yield (MovieLoaded(movies: movies));
    }
  }
}
