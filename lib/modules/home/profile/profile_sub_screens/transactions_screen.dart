import 'package:flutter/material.dart';
import 'package:zero_waste_app/modules/home/profile/profile_widgets/transaction_item.dart';
import 'package:zero_waste_app/shared/assets.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/helpers/responsive/responsive_scroll_screen.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';
import 'package:zero_waste_app/shared/widgets/default_app_bar.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        centerTitle: true,
        title: Text(
          "Transactions",
          style: CustomTextStyle.medium18.responsive(context),
        ),
      ),
      body: scrollScreenResponsive(
        child: Column(
          children: [
            transactionItem(
                context: context,
                imageName: Assets.imagesHomeProfileWeLogo,
                walletName: "WE Pay",
                transactionDate: "Dec 12 2024 at 10:00 pm",
                pointNumber: "500.0",
                money: "110.0"),
            transactionItem(
                context: context,
                imageName: Assets.imagesHomeProfileWeLogo,
                walletName: "WE Pay",
                transactionDate: "Feb 10 2024 at 09:13 pm",
                pointNumber: "1000.0",
                money: "230.0"),
            transactionItem(
                context: context,
                imageName: Assets.imagesHomeProfileVodafoneLogo,
                walletName: "Vodafone Cash",
                transactionDate: "Dec 12 2024 at 10:00 pm",
                pointNumber: "500.0",
                money: "110.0"),
            transactionItem(
                context: context,
                imageName: Assets.imagesHomeProfileInstaPayLogo,
                walletName: "Insta Pay",
                transactionDate: "Dec 12 2024 at 10:00 pm",
                pointNumber: "650.0",
                money: "220.0"),
          ],
        ),
      ),
    );
  }
}
