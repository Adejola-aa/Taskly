import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _circleController;
  late AnimationController _checkController;
  late AnimationController _textController;

  late Animation<double> _circleScale;
  late Animation<double> _circleFade;
  late Animation<double> _checkProgress;
  late Animation<double> _titleFade;
  late Animation<double> _titleSlide;
  late Animation<double> _taglineFade;

  @override
  void initState() {
    super.initState();

    _circleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _checkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _circleScale = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(parent: _circleController, curve: Curves.easeOutCubic),
    );

    _circleFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _circleController, curve: Curves.easeOut),
    );

    _checkProgress = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _checkController, curve: Curves.easeInOut),
    );

    _titleFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
      ),
    );

    _titleSlide = Tween<double>(begin: 8.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
      ),
    );

    _taglineFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
      ),
    );

    _runSequence();
  }

  Future<void> _runSequence() async {
    await Future.delayed(const Duration(milliseconds: 300));

    // 1. circle scales + fades in
    await _circleController.forward();

    await Future.delayed(const Duration(milliseconds: 100));

    // 2. checkmark draws in
    await _checkController.forward();

    await Future.delayed(const Duration(milliseconds: 150));

    // 3. text fades in
    await _textController.forward();
  }

  @override
  void dispose() {
    _circleController.dispose();
    _checkController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5B4FCF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: Listenable.merge([
                _circleController,
                _checkController,
              ]),
              builder: (context, _) {
                return Opacity(
                  opacity: _circleFade.value,
                  child: Transform.scale(
                    scale: _circleScale.value,
                    child: SizedBox(
                      width: 120,
                      height: 120,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // white circle
                          Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          // checkmark drawn on top, bleeds outside circle
                          CustomPaint(
                            size: const Size(120, 120),
                            painter: CheckmarkPainter(
                              progress: _checkProgress.value,
                              color: const Color(0xFF5B4FCF),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 24),

            AnimatedBuilder(
              animation: _textController,
              builder: (context, _) {
                return Column(
                  children: [
                    Opacity(
                      opacity: _titleFade.value,
                      child: Transform.translate(
                        offset: Offset(0, _titleSlide.value),
                        child: const Text(
                          'Taskly',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Opacity(
                      opacity: _taglineFade.value,
                      child: const Text(
                        'get things done',
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CheckmarkPainter extends CustomPainter {
  final double progress;
  final Color color;

  const CheckmarkPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (progress == 0) return;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7.5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // checkmark path scaled to size
    // starts from left, goes down to bottom, then up to top right
    // sized to bleed slightly outside the circle
    final path = Path();
    path.moveTo(size.width * 0.18, size.height * 0.52);
    path.lineTo(size.width * 0.42, size.height * 0.74);
    path.lineTo(size.width * 0.82, size.height * 0.28);

    // use PathMetrics to draw only progress portion
    final pathMetrics = path.computeMetrics();
    for (final metric in pathMetrics) {
      final extractPath = metric.extractPath(0, metric.length * progress);
      canvas.drawPath(extractPath, paint);
    }
  }

  @override
  bool shouldRepaint(CheckmarkPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
