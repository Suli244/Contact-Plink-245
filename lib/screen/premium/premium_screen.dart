import 'package:apphud/apphud.dart';
import 'package:contact_plink/screen/bottom_naviator/bottom_naviator_screen.dart';
import 'package:contact_plink/style/app_colors.dart';
import 'package:contact_plink/style/app_text_styles.dart';
import 'package:contact_plink/utils/image/app_images.dart';
import 'package:contact_plink/utils/premium/premium.dart';
import 'package:contact_plink/widgets/custom_button.dart';
import 'package:contact_plink/widgets/restore_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key});

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  bool toLoad = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 18),
              Row(
                children: [
                  Opacity(
                    opacity: 0,
                    child: Image.asset(
                      AppImages.xPremiumIcon,
                      width: 24,
                      height: 24,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Premium',
                    style: AppTextStylesContactPlink.s15W700(
                      color: AppColorsContactPlink.color141415,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      AppImages.xPremiumIcon,
                      width: 24,
                      height: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
              SizedBox(height: 28.h),
              Image.asset(
                AppImages.frameImage,
                width: double.infinity,
                height: 238.h,
              ),
              SizedBox(height: 43.h),
              Text(
                'Functionality opens:',
                style: AppTextStylesContactPlink.s28W500(
                  color: AppColorsContactPlink.color141415,
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                '• Ability to add your own posts',
                style: AppTextStylesContactPlink.s19W500(
                  color: AppColorsContactPlink.color141415,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                '• Save posts without restrictions',
                style: AppTextStylesContactPlink.s19W500(
                  color: AppColorsContactPlink.color141415,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                '• Absence of advertising',
                style: AppTextStylesContactPlink.s19W500(
                  color: AppColorsContactPlink.color141415,
                ),
              ),
              SizedBox(height: 36.h),
              CustomButtonContactPlink(
                isLoading: toLoad,
                color: AppColorsContactPlink.color5973FA,
                onPress: () async {
                  await PremiumContactPlink.setPremium();

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const BottomNavigatorScreen(),
                    ),
                    (route) => false,
                  );

                  // setState(() {
                  //   toLoad = true;
                  // });
                  // final apphudPaywalls = await Apphud.paywalls();

                  // await Apphud.purchase(
                  //   product: apphudPaywalls?.paywalls.first.products?.first,
                  // ).whenComplete(
                  //   () async {
                  //     if (await Apphud.hasPremiumAccess() ||
                  //         await Apphud.hasActiveSubscription()) {
                  //       await PremiumContactPlink
                  //           .buyTradeFuncRestoreContactPlink(context);
                  //       Navigator.pushAndRemoveUntil(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (_) => const BottomNavigatorScreen(),
                  //         ),
                  //         (route) => false,
                  //       );
                  //     }
                  //   },
                  // );
                  // setState(() {
                  //   toLoad = false;
                  // });
                },
                text: 'Buy premium for \$0,99',
                textStyle:
                    AppTextStylesContactPlink.s19W500(color: Colors.white),
                height: 53,
                radius: 40,
              ),
              SizedBox(height: 12.h),
              const RestoreButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
