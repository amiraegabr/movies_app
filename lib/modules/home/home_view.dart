import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/theme/app_colors.dart';
import '../../core/network/api_service.dart';
import '../../models/movie_model.dart';
import '../widgets/movie_card.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_event.dart';
import 'bloc/home_state.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.7, initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(ApiService())..add(GetPopularMoviesEvent()),
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState || state is HomeInitialState) {
              return const Center(child: CircularProgressIndicator(color: AppColors.yellow));
            } else if (state is HomeErrorState) {
              return _buildErrorWidget(context, state.message);
            } else if (state is HomeSuccessState) {
              return _buildHomeContent(state.movies);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildHomeContent(List<MovieModel> movies) {
    return Stack(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: Container(
            key: ValueKey(movies[_currentPage].backdropPath),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(movies[_currentPage].backdropPath),
                fit: BoxFit.cover,
                opacity: 0.2,
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Text(
                "Available Now",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 54,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Cursive',
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              _buildCarousel(movies),
              const SizedBox(height: 15),
              const Text(
                "Watch Now",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 68,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Cursive',
                  letterSpacing: 1.5,
                  shadows: [
                    Shadow(color: Colors.black45, blurRadius: 10, offset: Offset(2, 2)),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              _buildSection("Action", movies),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCarousel(List<MovieModel> movies) {
    return SizedBox(
      height: 400,
      child: PageView.builder(
        controller: _pageController,
        itemCount: movies.length,
        onPageChanged: (index) => setState(() => _currentPage = index % movies.length),
        itemBuilder: (context, index) {
          final movie = movies[index % movies.length];
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double value = 1.0;
              if (_pageController.position.haveDimensions) {
                value = _pageController.page! - index;
                value = (1 - (value.abs() * 0.2)).clamp(0.8, 1.0);
              }
              return Center(
                child: SizedBox(
                  height: value * 380,
                  width: value * 260,
                  child: child,
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(movie.posterPath, fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSection(String title, List<MovieModel> movies) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "See More >",
                style: TextStyle(color: AppColors.yellow, fontSize: 14),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: movies.length,
            itemBuilder: (context, index) => MovieCard(movie: movies[index]),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorWidget(BuildContext context, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: AppColors.red, size: 60),
          const SizedBox(height: 16),
          Text(message, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white)),
          TextButton(
            onPressed: () => context.read<HomeBloc>().add(GetPopularMoviesEvent()),
            child: const Text("Retry", style: TextStyle(color: AppColors.yellow)),
          )
        ],
      ),
    );
  }
}
