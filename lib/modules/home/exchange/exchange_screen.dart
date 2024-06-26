import 'package:flutter/material.dart';
import 'package:zero_waste_app/modules/home/exchange/exchange_widget.dart/exchange_dialog.dart';
import 'package:zero_waste_app/modules/home/exchange/exchange_widget.dart/exchange_money_row.dart';
import 'package:zero_waste_app/shared/assets.dart';
import 'package:zero_waste_app/shared/data/local/cache_helper.dart';
import 'package:zero_waste_app/shared/data/local/shared_pref_keys_enum.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/helpers/responsive/responsive_scroll_screen.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';
import 'package:zero_waste_app/shared/widgets/default_app_bar.dart';
import 'package:zero_waste_app/shared/widgets/default_green_button.dart';

class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({super.key});

  @override
  State<ExchangeScreen> createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        title: Row(
          children: [
            Text(
              "Exchange",
              style: CustomTextStyle.bold24.responsive(context),
            ),
            const Image(
                image: AssetImage(Assets.imagesHomeExchange),
                width: 45,
                height: 63)
          ],
        ),
        context: context,
      ),
      body: scrollScreenResponsive(
          child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50, bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
            decoration: const BoxDecoration(
              color: CustomColors.vividGreen49,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                      text: "Balance\n",
                      style: CustomTextStyle.semiBold20
                          .copyWith(fontSize: 32, color: Colors.white)
                          .responsive(context)),
                  TextSpan(
                    text: CacheHelper
                        .cachedData[SharedPrefKeys.getPointsValue.key]
                        .toString(),
                    style: CustomTextStyle.semiBold20.copyWith(
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          offset: const Offset(.0, 2.0),
                          blurRadius: 3.0,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ],
                    ).responsive(context),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, bottom: 10),
            child: Text(
              "Select Suitable Package",
              style: CustomTextStyle.semiBold20
                  .copyWith(color: Colors.black)
                  .responsive(context),
            ),
          ),
          ExchangeMoneyRow(
            money: "20",
            pointValue: "100",
            isSelected: _selectedIndex == 0,
            onSelected: () {
              setState(() {
                _selectedIndex = 0;
              });
            },
          ),
          ExchangeMoneyRow(
            money: "110",
            pointValue: "500",
            isSelected: _selectedIndex == 1,
            onSelected: () {
              setState(() {
                _selectedIndex = 1;
              });
            },
          ),
          ExchangeMoneyRow(
            money: "230",
            pointValue: "1000",
            isSelected: _selectedIndex == 2,
            onSelected: () {
              setState(() {
                _selectedIndex = 2;
              });
            },
          ),
          ExchangeMoneyRow(
            money: "480",
            pointValue: "2000",
            isSelected: _selectedIndex == 3,
            onSelected: () {
              setState(() {
                _selectedIndex = 3;
              });
            },
          ),
          const Spacer(),
          DefaultGreenButton(
            horizontalPadding: 35,
            verticalPadding: 5,
            text: "Get",
            onPressed: () {
              exchangeDialog(context: context);
            },
          ),
          const Spacer(),
        ],
      )),
    );
  }
}
