import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zero_waste_app/modules/home/account/account_sub_screens/debit_card_screen.dart';
import 'package:zero_waste_app/modules/home/account/account_sub_screens/wallets_screen.dart';
import 'package:zero_waste_app/shared/assets.dart';
import 'package:zero_waste_app/shared/helpers/navigation_helper.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';

void exchangeDialog({required context}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
        titlePadding: const EdgeInsets.only(top: 40),
        title: Text(
          "Select Payment\nMethod",
          style: CustomTextStyle.bold20.responsive(context),
          textAlign: TextAlign.center,
        ),
        content: Row(
          children: [
            Expanded(
              child: chooseCardButton(
                  onTap: () {
                    navigate(
                        context: context, pageScreen: const DebitCardScreen());
                  },
                  context: context,
                  assetIconName: Assets.iconsCreditCard,
                  walletName: "Card",
                  height: 50,
                  width: 74),
            ),
            Expanded(
              child: chooseCardButton(
                  onTap: () {
                    navigate(context: context, pageScreen: WalletsScreen());
                  },
                  context: context,
                  assetIconName: Assets.iconsWallet,
                  walletName: "Wallet",
                  height: 68,
                  width: 68),
            ),
          ],
        )),
  );
}

Widget chooseCardButton(
    {required onTap,
    required context,
    required assetIconName,
    required walletName,
    required double height,
    required double width}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          height: height,
          width: width,
          assetIconName,
          colorFilter: const ColorFilter.mode(
              CustomColors.vividGreen49, BlendMode.srcIn),
        ),
        Text(
          walletName,
          style: CustomTextStyle.bold20
              .copyWith(color: Colors.black)
              .responsive(context),
        )
      ],
    ),
  );
}
