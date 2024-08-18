import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:winlab/src/app/presentation/utils/assets.dart';
import 'package:winlab/src/app/presentation/utils/consts.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // -------------- FIRST ROW --------------
        Row(
          children: [
            Expanded(
              child: CustomSummaryBox(
                  title: "994",
                  image: Assets.svg.homePersonSVG,
                  desc: "Tổng số bệnh nhân"),
            ),
                      const SizedBox(width: kPadding*3),

            Expanded(
              child: CustomSummaryBox(
                  title: "1200",
                  image: Assets.svg.homeSampleSVG,
                  desc: "Tổng số mẫu bệnh phẩm"),
            )
          ],
        ),
        const SizedBox(height: kPadding * 2),
        // -------------- SECOND ROW --------------
        Row(
          children: [
            Expanded(
              child: CustomSummaryBox(
                  title: "7566",
                  image: Assets.svg.homeMedkitSVG,
                  desc: "Tổng số xét nghiệm"),
            ),
                      const SizedBox(width: kPadding*3),

            Expanded(
              child: CustomSummaryBox(
                  title: "702",
                  image: Assets.svg.homeRevenueSVG,
                  desc: "Doanh thu"),
            )
          ],
        ),
      ],
    );
  }
}

class CustomSummaryBox extends StatelessWidget {
  final String title;
  final String image;
  final String desc;
  const CustomSummaryBox(
      {super.key,
      required this.title,
      required this.image,
      required this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              image,
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            const SizedBox(width: kPadding),
            Text(title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          ],
        ),
        // const SizedBox(height: kPadding / 2),
        // Text(desc,
        //     style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
      ],
    );
  }
}
