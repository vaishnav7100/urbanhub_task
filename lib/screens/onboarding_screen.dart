import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../routes/app_routes.dart';
import 'splash_screen.dart';

class OnboardingPageData {
  final String title;
  final String subtitle;
  final String imageAsset;
  final String buttonText;

  const OnboardingPageData({
    required this.title,
    required this.subtitle,
    required this.imageAsset,
    this.buttonText = 'Continue',
  });
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;
  int _currentPage = 0;

  static const List<OnboardingPageData> _pages = [
    OnboardingPageData(
      title: 'Create Your Pool',
      subtitle:
          'Bring your friends or teammates together and start a shared pool for any goal.',
      imageAsset: 'assets/images/onboarding_1.png',
      buttonText: 'Continue',
    ),
    OnboardingPageData(
      title: 'Track Everything',
      subtitle:
          'Stay updated with real-time balance, contributions, and expenses.',
      imageAsset: 'assets/images/onboarding_2.png',
      buttonText: 'Continue',
    ),
    OnboardingPageData(
      title: 'Easy to Use',
      subtitle:
          'Manage your pools effortlessly with a clean and simple interface.',
      imageAsset: 'assets/images/onboarding_3.png',
      buttonText: 'Continue',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onContinuePressed() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOutCubic,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _finishOnboarding() {
    Navigator.of(context).pushReplacementNamed(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final topPadding = mediaQuery.padding.top;
    final bottomPadding = mediaQuery.padding.bottom;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          fit: StackFit.expand,
          children: [
            const FinlotSplashBackground(fadeStart: 0.20, fadeEnd: 0.52),

            Positioned(
              top: -118.0,
              left: 165.0,
              width: 370.0,
              height: 370.0,
              child: IgnorePointer(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 80.0, sigmaY: 80.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFE0F37D).withValues(alpha: 0.30),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 228.0,
              left: -288.0,
              width: 504.0,
              height: 504.0,
              child: IgnorePointer(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 80.0, sigmaY: 80.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFE0F37D).withValues(alpha: 0.30),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: mediaQuery.size.height * 0.45,
              child: IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withValues(alpha: 0.0),
                        Colors.white,
                        Colors.white,
                      ],
                      stops: const [0.0, 0.25, 1.0],
                    ),
                  ),
                ),
              ),
            ),

            SafeArea(
              top: false,
              bottom: false,
              child: Column(
                children: [
                  SizedBox(height: topPadding > 0 ? (topPadding + 6.0) : 48.0),
                  _buildProgressIndicator(),

                  const SizedBox(height: 14.0),

                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: _pages.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        final page = _pages[index];
                        return _buildPageContent(page);
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                      left: 27.0,
                      right: 27.0,
                      bottom: bottomPadding > 0 ? (bottomPadding + 10.0) : 36.0,
                      top: 8.0,
                    ),
                    child: _buildContinueButton(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    const double totalWidth = 215.0;
    const double height = 5.0;
    const double gap = 4.0;
    const int count = 3;
    const double segmentWidth = (totalWidth - (count - 1) * gap) / count;

    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, _) {
        double page = _currentPage.toDouble();
        if (_pageController.hasClients && _pageController.page != null) {
          page = _pageController.page!;
        }

        return Center(
          child: SizedBox(
            width: totalWidth,
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(count, (index) {
                final double progress = index == 0
                    ? 1.0
                    : (page - (index - 1)).clamp(0.0, 1.0);

                return GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOutCubic,
                    );
                  },
                  child: Container(
                    width: segmentWidth,
                    height: height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(height / 2),
                      color: const Color(0xFFFFFFFF),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: FractionallySizedBox(
                        widthFactor: progress,
                        heightFactor: 1.0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF414141),
                            borderRadius: BorderRadius.circular(height / 2),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPageContent(OnboardingPageData page) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                page.imageAsset,
                fit: BoxFit.contain,
                filterQuality: FilterQuality.high,
                alignment: Alignment.bottomCenter,
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: 72.0,
                child: IgnorePointer(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.white,
                          Colors.white.withValues(alpha: 0.40),
                          Colors.white.withValues(alpha: 0.0),
                        ],
                        stops: const [0.0, 0.45, 1.0],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SizedBox(
            height: 33.0,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                page.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'TT Fors Trial',
                  fontWeight: FontWeight.w600,
                  fontSize: 30.0,
                  height: 1.10,
                  letterSpacing: 0.0,
                  color: Color(0xFF030303),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 12.0),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Text(
            page.subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'TT Fors Trial',
              fontWeight: FontWeight.w400,
              fontSize: 16.0,
              height: 1.5,
              letterSpacing: 0.0,
              color: Color(0xFF727272),
            ),
          ),
        ),

        const SizedBox(height: 8.0),
      ],
    );
  }

  Widget _buildContinueButton() {
    final String label = _pages[_currentPage].buttonText;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 339.0,
          minHeight: 58.0,
          maxHeight: 58.0,
        ),
        child: SizedBox(
          width: double.infinity,
          height: 58.0,
          child: ElevatedButton(
            onPressed: _onContinuePressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF030303),
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 12.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
                side: const BorderSide(color: Color(0xFFD9D9D9), width: 1.0),
              ),
            ),
            child: Text(
              label,
              style: const TextStyle(
                fontFamily: 'TT Fors Trial',
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
