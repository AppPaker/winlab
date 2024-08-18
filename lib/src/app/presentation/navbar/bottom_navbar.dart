
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:winlab/src/app/presentation/screens/patients/patients_list_screen.dart';
import 'package:winlab/src/app/presentation/screens/home/home_screen.dart';
import 'package:winlab/src/app/presentation/screens/profile/profile_screen.dart';
import 'package:winlab/src/app/presentation/theme/color_theme.dart';
import 'package:winlab/src/app/presentation/utils/assets.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  int selectedTab = 0;
  BottomNavBar({
    Key? key,
    required this.selectedTab,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SalomonBottomBar(
       
          currentIndex: widget.selectedTab,
          selectedColorOpacity: 1,
          onTap: (position) => setState(() => widget.selectedTab = position),
          items: [
            // HOME
            SalomonBottomBarItem(
            
              icon: SvgPicture.asset(
                Assets.svg.homeSVG,
                color: widget.selectedTab == 0 ? kWhiteColor : kQuarterColor,
                height: 25,
              ),
              title: const Text(
                "Home",
                style: TextStyle(color: kWhiteColor),
              ),
              selectedColor: kPrimaryColor,
              unselectedColor: kQuarterColor,
            ),

            /// LIST OF PATIENTS
            SalomonBottomBarItem(
          
              icon: SvgPicture.asset(
                Assets.svg.patientsListSVG,
                color: widget.selectedTab == 1 ? kWhiteColor : kQuarterColor,
                height: 25,
              ),
              title: const Text(
                "Patients",
                style: TextStyle(color: kWhiteColor),
              ),
              selectedColor: kPrimaryColor,
              unselectedColor: kQuarterColor,
            ),

           // PROFILE
           
            SalomonBottomBarItem(
            
              icon: SvgPicture.asset(
                Assets.svg.profileSVG,
                color: widget.selectedTab == 3 ? kWhiteColor : kQuarterColor,
                height: 25,
              ),
              title: const Text(
                "Profile",
                style: TextStyle(color: kWhiteColor),
              ),
              selectedColor: kPrimaryColor,
              unselectedColor: kQuarterColor,
            ),
          ],
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: widget.selectedTab,
      children: const [
        HomeScreen(),
        PatientsListScreen(),
       
        ProfileScreen()
      ],
    );
  }
}
