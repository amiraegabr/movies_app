import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/network/api_service.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiService apiService;

  HomeBloc(this.apiService) : super(HomeInitialState()) {
    on<GetPopularMoviesEvent>((event, emit) async {
      emit(HomeLoadingState());
      try {
        final movies = await apiService.getPopularMovies();
        emit(HomeSuccessState(movies));
      } catch (e) {
        emit(HomeErrorState(e.toString()));
      }
    });
  }
}
