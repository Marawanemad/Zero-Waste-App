import 'package:flutter/material.dart';

import 'package:icons_plus/icons_plus.dart';
import 'package:zero_waste_app/modules/home/profile/profile_sub_screens/about_me_screen.dart';
import 'package:zero_waste_app/modules/home/profile/profile_sub_screens/debit_card_screen.dart';
import 'package:zero_waste_app/modules/home/profile/profile_sub_screens/my_address_screen.dart';
import 'package:zero_waste_app/modules/home/profile/profile_sub_screens/transactions_screen.dart';
import 'package:zero_waste_app/modules/home/profile/profile_sub_screens/wallets_screen.dart';
import 'package:zero_waste_app/modules/home/profile/profile_widgets/profile_row_button.dart';

import 'package:zero_waste_app/shared/assets.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';
import 'package:zero_waste_app/shared/widgets/default_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: Row(
          children: [
            Text(
              "Account",
              style: CustomTextStyle.bold24.responsive(context),
            ),
            const SizedBox(width: 10),
            Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.orange[700],
                    borderRadius: BorderRadius.circular(12)),
                child: const Icon(
                  shadows: [Shadow(offset: Offset(0, 2))],
                  IonIcons.person,
                  color: Colors.white,
                ))
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        Text(
                          "Name",
                          style: CustomTextStyle.bold24.responsive(context),
                        ),
                        const SizedBox(width: 9),
                        Stack(
                          // to put the another widget in the bottom
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            Container(
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: CustomColors.green46, width: 5),
                                shape: BoxShape.circle,
                                image: const DecorationImage(
                                  image: AssetImage(Assets.imagesApp),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: CustomColors.green46,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    size: 10,
                                    Icons.photo_camera_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    rowButton(
                        context: context,
                        assetIconName: Assets.iconsProfile,
                        text: "About me",
                        pageScreen: const AboutMeScreen()),
                    rowButton(
                        context: context,
                        assetIconName: Assets.iconsLocation,
                        text: " My Address",
                        pageScreen: const MyAddressScreen()),
                    rowButton(
                        context: context,
                        assetIconName: Assets.iconsCreditCard,
                        height: 13.3,
                        text: "Debit Cards",
                        pageScreen: const DebitCardScreen()),
                    rowButton(
                        context: context,
                        assetIconName: Assets.iconsWallet,
                        text: "Wallets",
                        pageScreen: const WalletsScreen()),
                    rowButton(
                        context: context,
                        assetIconName: Assets.iconsTransaction,
                        text: "Transactions",
                        pageScreen: const TransactionsScreen()),
                    const Spacer(flex: 2),
                    MaterialButton(
                      onPressed: () {},
                      elevation: 5,
                      color: Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Transform.rotate(
                              angle:
                                  3.14159, // This is approximately 180 degrees in radians
                              child: const Icon(
                                LineAwesome.sign_in_alt_solid,
                                color: CustomColors.red4B,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Sign out",
                              style: CustomTextStyle.semiBold16
                                  .copyWith(color: CustomColors.red4B),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}