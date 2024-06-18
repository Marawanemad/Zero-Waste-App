import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:zero_waste_app/modules/home/profile/profile_widgets/drop_down_row.dart';
import 'package:zero_waste_app/modules/home/profile/profile_widgets/profile_form_field.dart';
import 'package:zero_waste_app/shared/assets.dart';
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
                      hintText: "Address",
                      validationMessage: "Address must not be empty",
                      prefixIcon: Transform.scale(
                        scaleY: 0.6,
                        scaleX: 0.7,
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
                      hintText: "Zip code",
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
                      hintText: "City",
                      validationMessage: "City must not be empty",
                      prefixIcon: const Icon(
                        IonIcons.map,
                        color: CustomColors.grey96,
                      ),
                    ),
                    dropDownRow(
                        context: context,
                        hintText: Text(
                          selectedCountry ?? "Country",
                          style: CustomTextStyle.semiBold14,
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
                    onPressed: () {},
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
