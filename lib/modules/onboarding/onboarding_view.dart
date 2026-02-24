import 'package:flutter/material.dart';

import '../../core/routes/page_route_names.dart';
import '../../models/onboarding_data.dart';

class OnboardingView extends StatefulWidget {
  @override
  State<OnboardingView> createState() => _OnboardingViewState();

  const OnboardingView({super.key});
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  bool get isFirst => _currentIndex == 0;
  bool get isSecond => _currentIndex == 1;
  bool get isLast => _currentIndex == onboardingData.length - 1;
  bool get showBack => !isFirst && !isSecond;

  void _next() => _controller.animateToPage(
    _currentIndex + 1,
    duration: const Duration(milliseconds: 300),
    curve: Curves.easeInOutSine,
  );

  void _back() => _controller.animateToPage(
    _currentIndex - 1,
    duration: const Duration(milliseconds: 300),
    curve: Curves.easeInOutSine,
  );

  void _finish() =>
      Navigator.pushReplacementNamed(context, PageRouteNames.home);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final current = onboardingData[_currentIndex];

    return Scaffold(
      body: Stack(
        children: [
          // Full screen Page
          PageView.builder(
            controller: _controller,
            onPageChanged: (i) => setState(() => _currentIndex = i),
            itemCount: onboardingData.length,
            itemBuilder: (context, index) {
              return Image.asset(
                onboardingData[index].image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              );
            },
          ),

          // First page
          if (isFirst)
            Positioned(
              bottom: 40,
              left: 16,
              right: 16,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    onboardingData[0].title,
                    style: textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                  if (onboardingData[0].description != null) ...[
                    SizedBox(height: 24),
                    Text(
                      onboardingData[0].description!,
                      style: textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                  const SizedBox(height: 28),
                  _PrimaryButton(
                    label: onboardingData[0].buttonLabel,
                    onPressed: _next,
                  ),
                ],
              ),
            ),

          // Pages 2–6: bottom sheet
          if (!isFirst)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(16, 24, 16, 40),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      current.title,
                      style: textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    if (current.description != null) ...[
                      SizedBox(height: 16),
                      Text(
                        current.description!,
                        style: textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                    ],

                    SizedBox(height: 24),

                    _PrimaryButton(
                      label: isLast ? 'Finish' : current.buttonLabel,
                      onPressed: isLast ? _finish : _next,
                    ),
                    if (showBack) ...[
                      SizedBox(height: 16),
                      _BackButton(onPressed: _back),
                    ],
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _PrimaryButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _BackButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.yellow,
          backgroundColor: Colors.transparent,
          side: const BorderSide(color: Colors.yellow, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        onPressed: onPressed,
        child: const Text(
          'Back',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
