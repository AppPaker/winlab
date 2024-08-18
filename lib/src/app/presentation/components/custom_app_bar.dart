
import 'package:flutter/material.dart';
import 'package:winlab/src/app/presentation/theme/color_theme.dart';
import 'package:winlab/src/app/presentation/utils/consts.dart';

PreferredSize customAppBar(BuildContext context,
    {bool isDetail = false, String? title, Widget? actionWidgets}) {
  return PreferredSize(
    preferredSize: const Size(double.infinity, 70),
    child: AppBar(
      backgroundColor: kWhiteColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Column(
          children: [
            Row(
              children: [
                isDetail
                    ? IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: kPrimaryColor,
                        ))
                    : const SizedBox(),
                Padding(
                  padding: const EdgeInsets.only(left: kPadding / 2),
                  child: Text(
                    title ?? "",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: kBlackColor,
                    ),
                  ),
                ),
                const Spacer(),
                if (actionWidgets != null) ...[
                  Padding(
                      padding: const EdgeInsets.all(kPadding),
                      child: actionWidgets)
                ]
              ],
            ),
            const SizedBox(height: kPadding * 2),
          ],
        ),
      ),
    ),
  );
}
