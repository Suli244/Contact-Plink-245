import 'package:contact_plink/style/app_colors.dart';
import 'package:contact_plink/style/app_text_styles.dart';
import 'package:contact_plink/utils/premium/premium.dart';
import 'package:contact_plink/utils/urls.dart';
import 'package:contact_plink/widgets/web_view_plink.dart';
import 'package:flutter/material.dart';

class RestoreButtons extends StatelessWidget {
  const RestoreButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          InkWell(
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
            child: Text(
              'Privacy policy',
              style: AppTextStylesContactPlink.s12W400(
                color: AppColorsContactPlink.color141415,
              ),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () async {
              await PremiumContactPlink.buyTradeFuncRestoreContactPlink(
                  context);
            },
            child: Text(
              'Restore purchases',
              style: AppTextStylesContactPlink.s12W400(
                color: AppColorsContactPlink.color141415,
              ),
            ),
          ),
          const Spacer(),
          InkWell(
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
            child: Text(
              'Terms of use',
              style: AppTextStylesContactPlink.s12W400(
                color: AppColorsContactPlink.color141415,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
