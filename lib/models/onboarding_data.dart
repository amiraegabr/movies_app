import '../core/gen/assets.gen.dart';

class OnboardingData {
  final String title;
  String? description;
  final String image;
  final String buttonLabel;

  OnboardingData({
    required this.title,
    this.description,
    required this.image,
    this.buttonLabel = 'Next',
  });
}

final List<OnboardingData> onboardingData = [
  OnboardingData(
    title: 'Find Your Next\nFavorite Movie Here',
    description:
        'Get access to a huge library of movies to suit all tastes. You will surely like it.',
    image: Assets.images.onboarding.moviePostersOnboarding.path,
    buttonLabel: 'Explore Now',
  ),
  OnboardingData(
    title: 'Discover Movies',
    description:
        'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.',
    image: Assets.images.onboarding.onboarding1.path,
  ),
  OnboardingData(
    title: 'Explore All Genres',
    description:
        'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.',
    image: Assets.images.onboarding.onboarding2.path,
  ),
  OnboardingData(
    title: 'Create Watchlists',
    description:
        'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.',
    image: Assets.images.onboarding.onboarding3.path,
  ),
  OnboardingData(
    title: 'Rate, Review, and Learn',
    description:
        "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
    image: Assets.images.onboarding.onboarding4.path,
  ),
  OnboardingData(
    title: 'Start Watching Now',
    image: Assets.images.onboarding.onboarding5.path,
    buttonLabel: 'Finish',
  ),
];
