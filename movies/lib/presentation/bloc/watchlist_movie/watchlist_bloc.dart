import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/domain/usecases/get_watchlist_movies.dart';

part 'watchlist_event.dart';
part 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  final GetWatchlistMovies _getWatchlistMovies;

  WatchlistBloc(this._getWatchlistMovies) : super(WatchlistEmpty()) {
    on<OnFetchWatchlistMovie>((event, emit) async {
      emit(WatchlistLoading());

      final result = await _getWatchlistMovies.execute();

      result.fold(
        (failure) {
          emit(WatchlistError(failure.message));
        }, 
        (data) {
          emit(WatchlistHasData(data));
        }
      );
    });
  }
}
