
import 'package:flutter/material.dart';
import 'package:winlab/src/app/presentation/utils/assets.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
   
    return Image.asset(
      Assets.images.appLogo,
 
      height: height,
              // width: MediaQuery.of(context).size.width*0.7,
              // fit: BoxFit.cover,
   
    );
  }
}
