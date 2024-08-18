import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../theme/color_theme.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile(
      {super.key,
      this.onTap,
      required this.svg,
      required this.title,
      this.isExpanded});
  final VoidCallback? onTap;
  final String svg;
  final String title;
  final bool? isExpanded;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: kTFieldColor),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  svg,
                  height: 25,
                ),
                const SizedBox(width: 15),
                Expanded(
                    child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: kBlackColor,
                  size: 20,
                ),
              ],
            ),
            if(isExpanded != null)...[
                 const SizedBox(height: 15),
                      const Divider(
                        color: kLightGreyColor,
                      ),
            Row(
                    children: [
                     
                      Expanded(
                        child: Padding(
                                              padding: const EdgeInsets.only(right: 5),

                          child: Container(
                            width: size.width,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border: Border.all(color: kOrangeColor, width: 2),
                                borderRadius: BorderRadius.circular(10),
                                color: kOrangeColor.withOpacity(0.1)),
                            child: const Column(
                              children: [
                                Text(
                                  "0",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: kOrangeColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "Just ordered",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: kOrangeColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                   
                 
                    Expanded(
                     child: Padding(
                       padding: const EdgeInsets.only(left: 5, right: 5),
                       child: Container(
                            width: size.width,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border: Border.all(color: kGreenColor, width: 2),
                                borderRadius: BorderRadius.circular(10),
                                color: kGreenColor.withOpacity(0.1)),
                            child: const Column(
                              children: [
                                Text(
                                  "0",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: kGreenColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "Confirmed",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: kGreenColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                     ),
                   ),
                     Expanded(
                     child: Padding(
                       padding: const EdgeInsets.only(left: 5),
                       child: Container(
                            width: size.width,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border: Border.all(color: kBlueColor, width: 2),
                                borderRadius: BorderRadius.circular(10),
                                color: kBlueColor.withOpacity(0.1)),
                            child: const Column(
                              children: [
                                Text(
                                  "0",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: kBlueColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "Complete",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: kBlueColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                     ),
                   ),
                   
                    ],
                  )
               
            ]
          
          ],
        ),
      ),
    );
  }
}
