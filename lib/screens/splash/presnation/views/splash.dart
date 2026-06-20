import 'package:ai_app/screens/splash/presnation/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  static const id = 'SplashView';
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _backgroundController;
  late Animation<double> _backgroundAnimation;

  @override
  void initState() {
    super.initState();
    _backgroundController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _backgroundAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _backgroundController,
      curve: Curves.easeInOut,
    ));
    _backgroundController.forward();
  }

  @override
  void dispose() {
    _backgroundController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _backgroundAnimation,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.lerp(const Color(0xff3369FF), const Color(0xff667eea),
                      _backgroundAnimation.value)!,
                  Color.lerp(const Color(0xff3369FF), const Color(0xff764ba2),
                      _backgroundAnimation.value)!,
                  Color.lerp(const Color(0xff3369FF), const Color(0xff667eea),
                      _backgroundAnimation.value)!,
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
            child: Stack(
              children: [
                // Animated background particles
                ...List.generate(20, (index) {
                  return AnimatedPositioned(
                    duration: Duration(milliseconds: 2000 + (index * 100)),
                    curve: Curves.easeInOut,
                    top: _backgroundAnimation.value *
                            (MediaQuery.of(context).size.height * 0.8) +
                        (index * 40),
                    left: _backgroundAnimation.value *
                            (MediaQuery.of(context).size.width * 0.8) +
                        (index * 20),
                    child: Opacity(
                      opacity: 0.1,
                      child: Container(
                        width: 6 + (index % 4) * 2,
                        height: 6 + (index % 4) * 2,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  );
                }),
                const SplashViewBody(),
              ],
            ),
          );
        },
      ),
    );
  }
}
