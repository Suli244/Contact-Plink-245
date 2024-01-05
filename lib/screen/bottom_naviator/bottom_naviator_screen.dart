import 'package:contact_plink/screen/page/add_post_page.dart';
import 'package:contact_plink/screen/page/notification_page.dart';
import 'package:contact_plink/screen/page/recomendations_page.dart';
import 'package:contact_plink/screen/page/saved_page.dart';
import 'package:contact_plink/screen/page/settings_page.dart';
import 'package:contact_plink/style/app_colors.dart';
import 'package:contact_plink/utils/image/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigatorScreen extends StatefulWidget {
  const BottomNavigatorScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigatorScreen> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigatorScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadiusDirectional.vertical(
            top: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x1E5973FA),
              blurRadius: 13.20,
              offset: Offset(0, -4),
              spreadRadius: 0,
            ),
          ],
        ),
        width: double.infinity,
        height: 105.h,
        child: ClipRRect(
          borderRadius: const BorderRadiusDirectional.vertical(
            top: Radius.circular(16),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            unselectedFontSize: 0,
            selectedFontSize: 0,
            currentIndex: index,
            onTap: (indexFrom) async {
              setState(() {
                index = indexFrom;
              });
            },
            items: [
              BottomNavigationBarItem(
                label: '',
                icon: Image.asset(
                  AppImages.homeIcon,
                  width: 25,
                  color: AppColorsContactPlink.color6D6D6D,
                ),
                activeIcon: Image.asset(
                  AppImages.homeIcon,
                  color: AppColorsContactPlink.color5973FA,
                  width: 25,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Image.asset(
                  AppImages.bellIcon,
                  width: 25,
                  color: AppColorsContactPlink.color6D6D6D,
                ),
                activeIcon: Image.asset(
                  AppImages.bellIcon,
                  color: AppColorsContactPlink.color5973FA,
                  width: 25,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Image.asset(
                  AppImages.plusCircleIcon,
                  width: 25,
                  color: AppColorsContactPlink.color6D6D6D,
                ),
                activeIcon: Image.asset(
                  AppImages.plusCircleIcon,
                  color: AppColorsContactPlink.color5973FA,
                  width: 25,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Image.asset(
                  AppImages.bookmarkIcon,
                  width: 25,
                  color: AppColorsContactPlink.color6D6D6D,
                ),
                activeIcon: Image.asset(
                  AppImages.bookmarkIcon,
                  color: AppColorsContactPlink.color5973FA,
                  width: 25,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Image.asset(
                  AppImages.slidersIcon,
                  width: 25,
                  color: AppColorsContactPlink.color6D6D6D,
                ),
                activeIcon: Image.asset(
                  AppImages.slidersIcon,
                  color: AppColorsContactPlink.color5973FA,
                  width: 25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> pages = [
  const RecomendationPage(),
  const NotificationPage(),
  const AddPostPage(),
  const SavedPage(),
  const SettingsPage(),
];
