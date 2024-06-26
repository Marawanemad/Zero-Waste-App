import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:zero_waste_app/modules/home/account/account_sub_screens/validation_screen.dart';
import 'package:zero_waste_app/modules/home/account/account_widgets/green_row.dart';
import 'package:zero_waste_app/modules/home/account/account_widgets/account_form_field.dart';
import 'package:zero_waste_app/shared/assets.dart';
import 'package:zero_waste_app/shared/data/local/cache_helper.dart';
import 'package:zero_waste_app/shared/data/local/shared_pref_keys_enum.dart';
import 'package:zero_waste_app/shared/helpers/navigation_helper.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/helpers/responsive/responsive_scroll_screen.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';
import 'package:zero_waste_app/shared/widgets/default_app_bar.dart';
import 'package:zero_waste_app/shared/widgets/default_green_button.dart';

class DebitCardScreen extends StatefulWidget {
  const DebitCardScreen({super.key});

  @override
  State<DebitCardScreen> createState() => _DebitCardScreenState();
}

class _DebitCardScreenState extends State<DebitCardScreen> {
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var cardNumberController = TextEditingController();
  var dateController = TextEditingController();
  var passwordController = TextEditingController();
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        appBarColor: Colors.white,
        appBarHeight: 25,
        context: context,
        centerTitle: true,
        title: Text(
          "Debit Card",
          style: CustomTextStyle.medium18.responsive(context),
        ),
      ),
      body: scrollScreenResponsive(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Center(
              child: Image(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.8,
                image: const AssetImage(Assets.imagesHomeProfileCreditCard),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    ProfileFormField(
                      context: context,
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      text_input_action: TextInputAction.next,
                      hintText: "Name on the card",
                      validationMessage: "Name must not be empty",
                      prefixIcon: const Icon(
                        LineAwesome.user_circle_solid,
                        color: CustomColors.grey96,
                      ),
                    ),
                    ProfileFormField(
                      context: context,
                      controller: cardNumberController,
                      keyboardType: TextInputType.number,
                      text_input_action: TextInputAction.next,
                      hintText: "Card number",
                      suffixIcon: Brand(Brands.mastercard_logo),
                      validationMessage: "Card number must not be empty",
                      prefixIcon: Transform.scale(
                        scale: 0.5,
                        child: SvgPicture.asset(
                          fit: BoxFit.fill,
                          Assets.iconsCreditCard,
                          colorFilter: const ColorFilter.mode(
                              CustomColors.grey96, BlendMode.srcIn),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: ProfileFormField(
                            context: context,
                            controller: dateController,
                            keyboardType: TextInputType.datetime,
                            text_input_action: TextInputAction.next,
                            hintText: "Month / Year",
                            validationMessage: "Date must not be empty",
                            prefixIcon: const Icon(
                              IonIcons.calendar_clear,
                              color: CustomColors.grey96,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: ProfileFormField(
                            context: context,
                            controller: passwordController,
                            keyboardType: TextInputType.number,
                            text_input_action: TextInputAction.done,
                            hintText: "CVV",
                            validationMessage: "CVV must not be empty",
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(bottom: 5.0),
                              child: Icon(
                                IonIcons.lock_closed,
                                color: CustomColors.grey96,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, top: 35.0, bottom: 5),
              child: Text(
                "SAVED CARDS",
                style: CustomTextStyle.semiBold18.responsive(context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 20, top: 17),
              child: greenDebitCardRow(
                context: context,
                icon: const Icon(
                  LineAwesome.trash_solid,
                  color: CustomColors.red05,
                ),
                onIconPressed: () {},
                visaNumber: "8790",
                name: CacheHelper.cachedData[SharedPrefKeys.getName.key],
                onRowTap: () => navigateAndFinish(
                  context: context,
                  pageScreen: ValidationScreen(
                    successState: false,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Center(
                child: DefaultGreenButton(
                    text: "Add Card",
                    onPressed: () {},
                    horizontalPadding: 20,
                    verticalPadding: 14,
                    textSize: 16),
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
