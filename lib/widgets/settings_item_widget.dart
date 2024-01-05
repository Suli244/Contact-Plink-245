import 'package:contact_plink/style/app_colors.dart';
import 'package:contact_plink/style/app_text_styles.dart';
import 'package:contact_plink/utils/image/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingItemWidget extends StatelessWidget {
  const SettingItemWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Row(
          children: [
            Text(
              title,
              style: AppTextStylesContactPlink.s16W400(
                color: AppColorsContactPlink.color141415,
              ),
            ),
            const Spacer(),
            Image.asset(
              AppImages.arrowRightIcon,
              width: 27,
              height: 27,
            ),
          ],
        ),
      ),
    );
  }
}
