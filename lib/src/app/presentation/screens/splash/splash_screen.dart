
import 'package:flutter/material.dart';
import 'package:winlab/src/app/presentation/components/app_logo_widget.dart';
import 'package:winlab/src/app/presentation/screens/splash/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    SplashServices().isUserlogin(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: AppLogoWidget(
              height: size.height / 100 * 10,
            ),
          ),
        ),
      ),
    );
  }
}
