import 'package:contact_plink/screen/premium/premium_screen.dart';
import 'package:contact_plink/style/app_colors.dart';
import 'package:contact_plink/style/app_text_styles.dart';
import 'package:contact_plink/utils/image/app_images.dart';
import 'package:contact_plink/utils/premium/premium.dart';
import 'package:contact_plink/utils/urls.dart';
import 'package:contact_plink/widgets/custom_app_bar.dart';
import 'package:contact_plink/widgets/custom_button.dart';
import 'package:contact_plink/widgets/settings_item_widget.dart';
import 'package:contact_plink/widgets/web_view_plink.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_review/in_app_review.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isPremium = true;
  @override
  void initState() {
    getIsPremium();
    super.initState();
  }

  getIsPremium() async {
    isPremium = await PremiumContactPlink.getPremium();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarContactPlink(title: 'Settings'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 27.r,
                    backgroundImage: const AssetImage(AppImages.profileIcon),
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Flutter',
                        style: AppTextStylesContactPlink.s15W700(
                          color: AppColorsContactPlink.color141415,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Flutter@gmail.com',
                        style: AppTextStylesContactPlink.s12W400(
                          color: AppColorsContactPlink.color6D6D6D,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      AppImages.arrowRightIcon,
                      width: 27,
                      height: 27,
                    ),
                  ),
                  const SizedBox(width: 4),
                ],
              ),
              SizedBox(height: 48.h),
              Text(
                'Settings',
                style: AppTextStylesContactPlink.s24W500(
                  color: AppColorsContactPlink.color141415,
                ),
              ),
              SettingItemWidget(
                title: 'Privacy policy',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WebPlink(
                        title: 'Privacy policy',
                        url: DocFFContactPlink.pP,
                      ),
                    ),
                  );
                },
              ),
              SettingItemWidget(
                title: 'Terms of use',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WebPlink(
                        title: 'Terms of use',
                        url: DocFFContactPlink.tUse,
                      ),
                    ),
                  );
                },
              ),
              SettingItemWidget(
                title: 'Eula',
                onTap: () {},
              ),
              SettingItemWidget(
                title: 'Restore purchases',
                onTap: () async {
                  await PremiumContactPlink.buyTradeFuncRestoreContactPlink(
                      context);
                },
              ),
              SizedBox(height: 40.h),
              Text(
                'Support',
                style: AppTextStylesContactPlink.s24W500(
                  color: AppColorsContactPlink.color141415,
                ),
              ),
              SettingItemWidget(
                title: 'Rate App',
                onTap: () async {
                  try {
                    final InAppReview inAppReview = InAppReview.instance;

                    if (await inAppReview.isAvailable()) {
                      inAppReview.requestReview();
                    }
                  } catch (e) {
                    throw Exception(e);
                  }
                },
              ),
              SettingItemWidget(
                title: 'Help',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WebPlink(
                        title: 'Help',
                        url: DocFFContactPlink.s,
                      ),
                    ),
                  );
                },
              ),
              if (!isPremium) SizedBox(height: 24.h),
              if (!isPremium)
                CustomButtonContactPlink(
                  color: AppColorsContactPlink.color5973FA,
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PremiumScreen(),
                      ),
                    );
                  },
                  text: 'Buy premium for \$0,99',
                  textStyle:
                      AppTextStylesContactPlink.s19W500(color: Colors.white),
                  height: 53,
                  radius: 40,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
