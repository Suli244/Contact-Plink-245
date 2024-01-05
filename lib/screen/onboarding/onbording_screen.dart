import 'package:contact_plink/screen/bottom_naviator/bottom_naviator_screen.dart';
import 'package:contact_plink/style/app_colors.dart';
import 'package:contact_plink/style/app_text_styles.dart';
import 'package:contact_plink/utils/image/app_images.dart';
import 'package:contact_plink/utils/premium/first_open.dart';
import 'package:contact_plink/widgets/onboarding_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int currantPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                physics: const ClampingScrollPhysics(),
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    currantPage = value;
                  });
                },
                children: const [
                  OnboardingItemWidget(
                    image: AppImages.onboardingImageOne,
                    title: 'Welcome to ContactPlink',
                    subTitle:
                        'Discover a world where you connect, share,\nand create moments with friends and beyond, all at your\nfingertips.',
                  ),
                  OnboardingItemWidget(
                    image: AppImages.onboardingImageTwo,
                    title: 'Explore and Engage',
                    subTitle:
                        'Dive into a recomendations of inspiring stories, like\nand comment on posts.',
                  ),
                  OnboardingItemWidget(
                    image: AppImages.onboardingImageTrhee,
                    title: 'Your Space, Your Expression',
                    subTitle:
                        'Create and share your own stories, manage\nyour profile.',
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 2,
              color: AppColorsContactPlink.colorF1EEEE,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () async {
                      await FirstOpenContactPlink.setFirstOpen();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BottomNavigatorScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    child: Text(
                      'Skip',
                      style: AppTextStylesContactPlink.s19W500(
                        color: AppColorsContactPlink.color141415,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: const ScrollingDotsEffect(
                        activeDotColor: AppColorsContactPlink.color141415,
                        dotColor: AppColorsContactPlink.colorF1EEEE,
                        dotHeight: 7,
                        dotWidth: 7,
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () async {
                      if (currantPage == 2) {
                        await FirstOpenContactPlink.setFirstOpen();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BottomNavigatorScreen(),
                          ),
                          (route) => false,
                        );
                      } else {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    },
                    child: Text(
                      'Next',
                      style: AppTextStylesContactPlink.s19W500(
                        color: AppColorsContactPlink.color141415,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 34),
          ],
        ),
      ),
    );
  }
}
