import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../routes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTabIndex = 0;
  int _selectedNavIndex = 1;

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
        backgroundColor: const Color(0xFFF0EFF5),
        body: Stack(
          children: [
            const Positioned.fill(child: FinlotHomeBackground()),

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
                      color: const Color(0xFFE0F37D).withValues(alpha: 0.20),
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
                      color: const Color(0xFFE0F37D).withValues(alpha: 0.40),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 853.0,
              left: -288.0,
              width: 504.0,
              height: 504.0,
              child: IgnorePointer(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 80.0, sigmaY: 80.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFE0F37D).withValues(alpha: 0.40),
                    ),
                  ),
                ),
              ),
            ),

            SafeArea(
              bottom: false,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12.0),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: _buildTopHeader(context),
                    ),

                    const SizedBox(height: 16.0),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: _buildGreeting(),
                    ),

                    const SizedBox(height: 16.0),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: _buildFirstCard(),
                    ),

                    const SizedBox(height: 18.0),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: _buildPoolTabs(),
                    ),

                    const SizedBox(height: 16.0),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: _buildPoolCard(
                        title: 'Bike Pool',
                        creator: 'Zuha • Creator',
                        drawsWon: '0/12',
                        amount: r'$ 3,000',
                        lotAmount: r'$ 12,000',
                        footerText: '08 days till the draw',
                        isCalendarDate: true,
                      ),
                    ),

                    const SizedBox(height: 20.0),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: _buildPoolCard(
                        title: 'Home Pool',
                        creator: 'Zuha • Creator',
                        drawsWon: '0/12',
                        amount: r'$ 3,000',
                        lotAmount: r'$ 12,000',
                        footerText: 'Awaiting for invitees to join',
                        isCalendarDate: false,
                      ),
                    ),

                    const SizedBox(height: 115.0),
                  ],
                ),
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              bottom: 24.0,
              child: _buildFloatingBottomNav(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => _showReplayMenu(context),
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFFFD7BA),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              'assets/images/profile_avatar.png',
              fit: BoxFit.cover,
            ),
          ),
        ),

        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Image.asset(
            'assets/images/notification_bell.png',
            width: 39,
            height: 39,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }

  Widget _buildGreeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Glad you're here,",
          style: TextStyle(
            fontFamily: 'TT Fors Trial',
            fontSize: 17.27,
            fontWeight: FontWeight.w400,
            height: 23.03 / 17.27,
            letterSpacing: 0.0,
            color: Color(0xFF1E1E1E),
          ),
        ),
        Text(
          'Vidhun',
          style: TextStyle(
            fontFamily: 'TT Fors Trial',
            fontSize: 19.0,
            fontWeight: FontWeight.w500,
            height: 23.03 / 19.0,
            letterSpacing: 0.0,
            color: Color(0xFF030303),
          ),
        ),
      ],
    );
  }

  Widget _buildFirstCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 16.0,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        'assets/images/upcoming_draw_card.png',
        fit: BoxFit.contain,
        filterQuality: FilterQuality.high,
      ),
    );
  }

  Widget _buildPoolTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => setState(() => _selectedTabIndex = 0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: _selectedTabIndex == 0
                        ? const Color(0xFFF6709E)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/settings_icon.png',
                        width: 18.0,
                        height: 18.0,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 6.0),
                      Text(
                        'Manage Pool',
                        style: TextStyle(
                          fontFamily: 'TT Fors Trial',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          height: 23.03 / 12.0,
                          letterSpacing: 0.0,
                          color: _selectedTabIndex == 0
                              ? Colors.white
                              : const Color(0xFF6B6B6B),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              GestureDetector(
                onTap: () => setState(() => _selectedTabIndex = 1),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: _selectedTabIndex == 1
                        ? const Color(0xFFF6709E)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: Text(
                    'Joined Pool',
                    style: TextStyle(
                      fontFamily: 'TT Fors Trial',
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      height: 23.03 / 12.0,
                      letterSpacing: 0.0,
                      color: _selectedTabIndex == 1
                          ? Colors.white
                          : const Color(0xFF6B6B6B),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text(
            'View all',
            style: TextStyle(
              fontFamily: 'TT Fors Trial',
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              height: 23.03 / 12.0,
              letterSpacing: 0.0,
              color: Color(0xFF4C4C4C),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPoolCard({
    required String title,
    required String creator,
    required String drawsWon,
    required String amount,
    required String lotAmount,
    required String footerText,
    required bool isCalendarDate,
  }) {
    return Center(
      child: SizedBox(
        width: 358.0,
        height: 238.0,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 0,
              left: 2.0,
              width: 354.0,
              height: 115.0,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFE3ED79),
                  borderRadius: BorderRadius.circular(36.0),
                ),
                child: Stack(
                  children: [
                    const Positioned.fill(
                      child: CustomPaint(
                        painter: InnerShadowPainter(
                          radius: 36.0,
                          offset: Offset(0, 3.67),
                          blur: 3.67,
                          shadowColor: Color(0x40FFFFFF),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                        top: 18.0,
                        left: 18.0,
                        right: 18.0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDateBadge(isCalendarDate: isCalendarDate),

                          const SizedBox(width: 14.0),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                  fontFamily: 'TT Fors Trial',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                  height: 20.0 / 20.0,
                                  letterSpacing: 0.0,
                                  color: Color(0xFF030303),
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                  vertical: 3.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.45),
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ClipOval(
                                      child: Image.asset(
                                        'assets/images/zuha_avatar.png',
                                        width: 20,
                                        height: 20,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 6.0),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: creator.contains('•')
                                                ? creator.split('•')[0].trim()
                                                : creator,
                                            style: const TextStyle(
                                              fontFamily: 'TT Fors Trial',
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w500,
                                              height: 23.03 / 12.0,
                                              letterSpacing: 0.0,
                                              color: Color(0xFF323232),
                                            ),
                                          ),
                                          if (creator.contains('•')) ...[
                                            const TextSpan(
                                              text: ' • ',
                                              style: TextStyle(
                                                fontFamily: 'TT Fors Trial',
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w400,
                                                height: 23.03 / 12.0,
                                                color: Color(0xFF323232),
                                              ),
                                            ),
                                            TextSpan(
                                              text: creator
                                                  .split('•')[1]
                                                  .trim(),
                                              style: const TextStyle(
                                                fontFamily: 'TT Fors Trial',
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w400,
                                                height: 23.03 / 12.0,
                                                letterSpacing: 0.0,
                                                color: Color(0xFF323232),
                                              ),
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              top: 96.0,
              left: 0,
              right: 0,
              height: 142.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(36.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.02),
                      offset: const Offset(0, 14),
                      blurRadius: 14,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 8.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 63.0,
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F5E1),
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(
                          color: const Color(
                            0xFFD2DB9E,
                          ).withValues(alpha: 0.20),
                          width: 1.0,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildStatItem(
                            title: 'Draws won',
                            value: drawsWon,
                            imageAsset: 'assets/images/stat_draws_won.png',
                          ),
                          _buildStatItem(
                            title: 'Amount',
                            value: amount,
                            imageAsset: 'assets/images/stat_amount.png',
                          ),
                          _buildStatItem(
                            title: 'Lot Amount',
                            value: lotAmount,
                            imageAsset: 'assets/images/stat_lot_amount.png',
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: 55.0,
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6F6F6),
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(
                          color: const Color(
                            0xFFDADADA,
                          ).withValues(alpha: 0.20),
                          width: 1.0,
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Center(
                            child: Text(
                              footerText,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 10.0,
                                fontWeight: FontWeight.w400,
                                height: 16.0 / 10.0,
                                letterSpacing: 0.0,
                                color: const Color(0xFF1E1E1E),
                              ),
                            ),
                          ),

                          Positioned(
                            right: 0,
                            child: Image.asset(
                              'assets/images/pool_arrow_btn.png',
                              width: 39.0,
                              height: 39.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateBadge({required bool isCalendarDate}) {
    return SizedBox(
      width: 57,
      height: 64,
      child: Image.asset(
        isCalendarDate
            ? 'assets/images/calendar_badge_bike.png'
            : 'assets/images/calendar_badge_home.png',
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildStatItem({
    required String title,
    required String value,
    required String imageAsset,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(imageAsset, width: 24.0, height: 24.0, fit: BoxFit.contain),
        const SizedBox(width: 4.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                height: 16.0 / 12.0,
                letterSpacing: 0.0,
                color: const Color(0xFF6B6B6B),
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontFamily: 'TT Fors Trial',
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                height: 24.0 / 16.0,
                letterSpacing: 0.0,
                color: Color(0xFF030303),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFloatingBottomNav() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 20.0,
              spreadRadius: 0,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 18.0, sigmaY: 18.0),
            child: Container(
              height: 76.0,
              padding: const EdgeInsets.symmetric(
                horizontal: 7.0,
                vertical: 4.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.55),
                borderRadius: BorderRadius.circular(100.0),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.8),
                  width: 1.5,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildNavTab(
                    index: 0,
                    assetPath: 'assets/images/nav_swap.png',
                    iconSize: 24.0,
                    onTap: () => setState(() => _selectedNavIndex = 0),
                  ),
                  const SizedBox(width: 7.0),

                  _buildNavTab(
                    index: 1,
                    assetPath: 'assets/images/nav_home.png',
                    iconSize: 25.0,
                    onTap: () => setState(() => _selectedNavIndex = 1),
                  ),
                  const SizedBox(width: 7.0),

                  _buildNavTab(
                    index: 2,
                    assetPath: 'assets/images/nav_profile.png',
                    iconSize: 23.0,
                    onTap: () => setState(() => _selectedNavIndex = 2),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavTab({
    required int index,
    required String assetPath,
    required double iconSize,
    required VoidCallback onTap,
  }) {
    final bool isSelected = _selectedNavIndex == index;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 68.0,
        height: 68.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 4.0,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          width: isSelected ? 52.0 : 68.0,
          height: isSelected ? 52.0 : 68.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? const Color(0xFFE3ED79) : Colors.transparent,
          ),
          alignment: Alignment.center,
          child: Image.asset(
            assetPath,
            width: iconSize,
            height: iconSize,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  void _showReplayMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.slideshow_rounded),
                  title: const Text('Replay Onboarding (3 screens)'),
                  onTap: () {
                    Navigator.pop(ctx);
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(AppRoutes.onboarding);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.refresh_rounded),
                  title: const Text('Replay Splash Screen'),
                  onTap: () {
                    Navigator.pop(ctx);
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(AppRoutes.splash);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class FinlotHomeBackground extends StatelessWidget {
  const FinlotHomeBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _FinlotHomeBackgroundPainter(),
      size: Size.infinite,
    );
  }
}

class _FinlotHomeBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;

    final Paint basePaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFF0EFF5), Color(0xFFEDEFE7), Color(0xFFF3EDDC)],
        stops: [0.0, 0.5, 1.0],
      ).createShader(rect);
    canvas.drawRect(rect, basePaint);

    final Paint creamAura = Paint()
      ..shader = RadialGradient(
        center: const Alignment(1.0, 1.0),
        radius: 0.85,
        colors: [
          const Color(0xFFF3EDDC).withValues(alpha: 0.80),
          const Color(0xFFF3EDDC).withValues(alpha: 0.0),
        ],
        stops: const [0.0, 1.0],
      ).createShader(rect);
    canvas.drawRect(rect, creamAura);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class InnerShadowPainter extends CustomPainter {
  final double radius;
  final Offset offset;
  final double blur;
  final Color shadowColor;

  const InnerShadowPainter({
    required this.radius,
    required this.offset,
    required this.blur,
    required this.shadowColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final RRect rrect = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(radius),
    );
    canvas.clipRRect(rrect);

    final Paint paint = Paint()
      ..color = shadowColor
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blur);

    final Path path = Path()
      ..fillType = PathFillType.evenOdd
      ..addRect(Rect.fromLTWH(-50, -50, size.width + 100, size.height + 100))
      ..addRRect(rrect.shift(offset));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant InnerShadowPainter oldDelegate) => false;
}
