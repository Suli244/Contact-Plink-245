import 'package:contact_plink/style/app_colors.dart';
import 'package:contact_plink/style/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingItemWidget extends StatelessWidget {
  const OnboardingItemWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });
  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          width: 390.w,
          height: 488.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Text(
            title,
            style: AppTextStylesContactPlink.s24W500(
              color: AppColorsContactPlink.color141415,
            ),
          ),
        ),
        SizedBox(height: 18.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: FittedBox(
            child: Text(
              subTitle,
              style: AppTextStylesContactPlink.s14W400(
                color: AppColorsContactPlink.color6D6D6D,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
