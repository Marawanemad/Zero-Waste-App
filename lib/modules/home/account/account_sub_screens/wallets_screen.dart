import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:zero_waste_app/modules/home/account/account_sub_screens/validation_screen.dart';
import 'package:zero_waste_app/modules/home/account/account_widgets/account_form_field.dart';
import 'package:zero_waste_app/modules/home/account/account_widgets/row_wallets_image.dart';
import 'package:zero_waste_app/modules/home/account/account_widgets/saved_wallets_row.dart';
import 'package:zero_waste_app/shared/assets.dart';
import 'package:zero_waste_app/shared/helpers/navigation_helper.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/helpers/responsive/responsive_scroll_screen.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';
import 'package:zero_waste_app/shared/widgets/default_app_bar.dart';
import 'package:zero_waste_app/shared/widgets/default_green_button.dart';

// ignore: must_be_immutable
class WalletsScreen extends StatelessWidget {
  WalletsScreen({super.key});
  var formKey = GlobalKey<FormState>();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        centerTitle: true,
        title: Text(
          "Wallets",
          style: CustomTextStyle.medium18.responsive(context),
        ),
      ),
      body: scrollScreenResponsive(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 25),
              child: Text(
                "SELECT YOUR METHOD",
                style: CustomTextStyle.semiBold18.responsive(context),
              ),
            ),
            walletsImagesRow(context: context),
            Padding(
              padding: const EdgeInsets.only(top: 45.0, left: 25, bottom: 27),
              child: Text(
                "ADD YOUR WALLET NUMBER",
                style: CustomTextStyle.semiBold18.responsive(context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 30),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    ProfileFormField(
                      context: context,
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      text_input_action: TextInputAction.next,
                      hintText: "+20 1210 199 141",
                      validationMessage: "Phone must not be empty",
                      prefixIcon: const Icon(
                        LineAwesome.phone_solid,
                        color: CustomColors.grey96,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 45.0),
              child: Center(
                child: DefaultGreenButton(
                    text: "Add Wallet",
                    onPressed: () {},
                    horizontalPadding: 20,
                    verticalPadding: 14,
                    textSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 25, bottom: 10),
              child: Text(
                "SAVED WALLETS",
                style: CustomTextStyle.semiBold18.responsive(context),
              ),
            ),
            SavedWalletsRow(
              context: context,
              onRowTap: () => navigateAndFinish(
                  context: context,
                  pageScreen: ValidationScreen(
                    successState: true,
                  )),
              icon: const Icon(
                LineAwesome.trash_solid,
                color: CustomColors.red05,
              ),
              onIconPressed: () {},
              imageName: Assets.imagesHomeProfileWeLogo,
              walletNumber: "+20 1210 199 141",
            ),
          ],
        ),
      ),
    );
  }
}
