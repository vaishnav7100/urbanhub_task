import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  final Duration duration;
  final bool autoNavigate;
  final String nextRoute;

  const SplashScreen({
    super.key,
    this.duration = const Duration(seconds: 3),
    this.autoNavigate = true,
    this.nextRoute = AppRoutes.onboarding,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animController;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;
  Timer? _navTimer;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOutCubic,
    );

    _scaleAnimation = Tween<double>(begin: 0.94, end: 1.0).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeOutCubic),
    );

    _animController.forward();

    if (widget.autoNavigate) {
      _navTimer = Timer(widget.duration, _navigateToNext);
    }
  }

  void _navigateToNext() {
    if (!mounted) return;
    _navTimer?.cancel();
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          final builder = AppRoutes.routes[widget.nextRoute];
          if (builder != null) {
            return builder(context);
          }
          return const SizedBox.shrink();
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  }

  @override
  void dispose() {
    _navTimer?.cancel();
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            if (widget.autoNavigate) {
              _navigateToNext();
            }
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              const FinlotSplashBackground(),

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

              Center(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: SizedBox(
                      width: 103.15789794921875,
                      height: 31.052635192871094,
                      child: Image.asset(
                        'assets/images/finlot_logo.png',
                        width: 103.15789794921875,
                        height: 31.052635192871094,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FinlotSplashBackground extends StatelessWidget {
  final double fadeStart;
  final double fadeEnd;

  const FinlotSplashBackground({
    super.key,
    this.fadeStart = 0.0,
    this.fadeEnd = 0.48,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _FinlotBackgroundPainter(fadeStart: fadeStart, fadeEnd: fadeEnd),
      size: Size.infinite,
    );
  }
}

class _FinlotBackgroundPainter extends CustomPainter {
  final double fadeStart;
  final double fadeEnd;

  const _FinlotBackgroundPainter({this.fadeStart = 0.0, this.fadeEnd = 0.48});

  static const Color mintLeft = Color(0xFFD4E9DA);
  static const Color limeRight = Color(0xFFD8ECC2);
  static const Color fadeWhite = Color(0xFFFFFFFF);
  static const Color transparentWhite = Color(0x00FFFFFF);

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;

    final Paint basePaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.topRight,
        colors: [mintLeft, limeRight],
      ).createShader(rect);
    canvas.drawRect(rect, basePaint);

    final double mid1 = fadeStart + (fadeEnd - fadeStart) * 0.35;
    final double mid2 = fadeStart + (fadeEnd - fadeStart) * 0.70;

    final Paint overlayPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.0, fadeStart, mid1, mid2, fadeEnd, 1.0],
        colors: const [
          transparentWhite,
          transparentWhite,
          Color(0x33FFFFFF),
          Color(0x99FFFFFF),
          fadeWhite,
          fadeWhite,
        ],
      ).createShader(rect);
    canvas.drawRect(rect, overlayPaint);
  }

  @override
  bool shouldRepaint(covariant _FinlotBackgroundPainter oldDelegate) =>
      oldDelegate.fadeStart != fadeStart || oldDelegate.fadeEnd != fadeEnd;
}
