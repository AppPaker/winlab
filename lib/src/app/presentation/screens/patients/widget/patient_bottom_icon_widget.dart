import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:winlab/src/app/presentation/theme/color_theme.dart';
import 'package:winlab/src/app/presentation/utils/consts.dart';

class PatientBottomCardWidget extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback? onTap;
  const PatientBottomCardWidget({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            image,
            height: 25,
          ),
          const SizedBox(
            height: kPadding,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: kBlackColor,
            ),
          ),
        ],
      ),
    );
  }
}
