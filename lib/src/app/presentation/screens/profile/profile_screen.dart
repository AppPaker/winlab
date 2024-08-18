import 'package:flutter/material.dart';
import 'package:winlab/src/app/presentation/routes/routes_navigator.dart';
import 'package:winlab/src/app/presentation/screens/profile/widgets/profile_tile.dart';
import 'package:winlab/src/app/presentation/screens/splash/splash_screen.dart';
import 'package:winlab/src/app/presentation/theme/color_theme.dart';
import 'package:winlab/src/app/presentation/utils/assets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),

                //Account text
                const Text(
                  "Account",
                  textScaler: TextScaler.linear(1.2),
                  style: TextStyle(
                      color: kBlackColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
                const SizedBox(height: 15),

                const Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          "https://www.figma.com/file/CGylJZPtafCq47WcU4Vdla/image/fe179bdb3ec1aa40d3bce6c42943ebbb3a6b6ac4"),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dương",
                          style: TextStyle(
                              color: kBlackColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "SILVER - 0 point",
                          style: TextStyle(
                              color: kBlackColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 10),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),

                ProfileListTile(
                  onTap: () {RouteNavigator.pushandremoveroute(context, const SplashScreen());},
                  svg: Assets.svg.logoutSVG,
                  title: "Log out",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
