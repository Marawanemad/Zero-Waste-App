import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:zero_waste_app/modules/home/account/account_widgets/drop_down_row.dart';
import 'package:zero_waste_app/modules/home/account/account_widgets/account_form_field.dart';
import 'package:zero_waste_app/shared/assets.dart';
import 'package:zero_waste_app/shared/data/local/cache_helper.dart';
import 'package:zero_waste_app/shared/data/local/shared_pref_keys_enum.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/helpers/responsive/responsive_scroll_screen.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';
import 'package:zero_waste_app/shared/widgets/default_app_bar.dart';
import 'package:zero_waste_app/shared/widgets/default_green_button.dart';

class MyAddressScreen extends StatefulWidget {
  const MyAddressScreen({super.key});

  @override
  State<MyAddressScreen> createState() => _MyAddressScreenState();
}

class _MyAddressScreenState extends State<MyAddressScreen> {
  var formKey = GlobalKey<FormState>();

  var addressController = TextEditingController();

  var zipCodeController = TextEditingController();

  var cityController = TextEditingController();

  var countryController = TextEditingController();

  bool switchValue = false;
  final List<String> countries = [
    "None",
    'Egypt',
    'Saudi',
    'Emirates',
    'United States',
    'Canada',
    'Mexico',
    'United Kingdom',
    'Germany',
    'France',
    'Italy',
    'Spain',
    'Australia',
    'Japan'
  ];
  // Selected country
  String? selectedCountry;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        appBarColor: Colors.white,
        appBarHeight: 25,
        context: context,
        centerTitle: true,
        title: Text(
          "My Address",
          style: CustomTextStyle.medium18.responsive(context),
        ),
      ),
      body: scrollScreenResponsive(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 20, top: 60),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    ProfileFormField(
                      context: context,
                      controller: addressController,
                      keyboardType: TextInputType.streetAddress,
                      text_input_action: TextInputAction.next,
                      hintText:
                          CacheHelper.cachedData[SharedPrefKeys.getAddress.key],
                      validationMessage: "Address must not be empty",
                      prefixIcon: Transform.scale(
                        scaleY: 0.7,
                        scaleX: 0.55,
                        origin: const Offset(0, 2),
                        child: SvgPicture.asset(
                            width: 10,
                            height: 10,
                            fit: BoxFit.fill,
                            Assets.iconsAddressLocation),
                      ),
                    ),
                    ProfileFormField(
                      context: context,
                      controller: zipCodeController,
                      keyboardType: TextInputType.streetAddress,
                      text_input_action: TextInputAction.next,
                      hintText:
                          CacheHelper.cachedData[SharedPrefKeys.getZipCode.key],
                      validationMessage: "Zip code must not be empty",
                      prefixIcon: Transform.rotate(
                        angle:
                            3.14159, // This is approximately 180 degrees in radians
                        child: const Icon(
                          Icons.keyboard_alt_outlined,
                          color: CustomColors.grey96,
                        ),
                      ),
                    ),
                    ProfileFormField(
                      context: context,
                      controller: cityController,
                      keyboardType: TextInputType.text,
                      text_input_action: TextInputAction.next,
                      hintText:
                          CacheHelper.cachedData[SharedPrefKeys.getCity.key],
                      validationMessage: "City must not be empty",
                      prefixIcon: const Icon(
                        IonIcons.map,
                        color: CustomColors.grey96,
                      ),
                    ),
                    dropDownRow(
                        context: context,
                        hintText: Text(
                          selectedCountry ??
                              CacheHelper
                                  .cachedData[SharedPrefKeys.getCountry.key],
                          style: CustomTextStyle.semiBold14.responsive(context),
                        ),
                        iconName: IonIcons.globe,
                        selectedCountry: selectedCountry,
                        onChange: (newValue) {
                          setState(() {
                            selectedCountry = newValue;
                            selectedCountry == "None"
                                ? selectedCountry = null
                                : null;
                          });
                        },
                        dropDownList: countries)
                  ],
                ),
              ),
            ),
            const Spacer(flex: 2),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Center(
                child: DefaultGreenButton(
                    text: "Add Address",
                    onPressed: () {
                      setState(() {
                        addressController.text != ''
                            ? CacheHelper.setData(SharedPrefKeys.getAddress.key,
                                addressController.text)
                            : null;
                        zipCodeController.text != ''
                            ? CacheHelper.setData(SharedPrefKeys.getZipCode.key,
                                zipCodeController.text)
                            : null;
                        cityController.text != ''
                            ? CacheHelper.setData(
                                SharedPrefKeys.getCity.key, cityController.text)
                            : null;
                        countryController.text != ''
                            ? CacheHelper.setData(SharedPrefKeys.getCountry.key,
                                countryController.text)
                            : null;
                      });
                    },
                    horizontalPadding: 20,
                    verticalPadding: 14,
                    textSize: 16),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
