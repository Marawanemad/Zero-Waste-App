import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:icons_plus/icons_plus.dart';
import 'package:zero_waste_app/modules/authentication/auth_screen.dart';
import 'package:zero_waste_app/modules/home/account/account_sub_screens/about_me_screen.dart';
import 'package:zero_waste_app/modules/home/account/account_sub_screens/debit_card_screen.dart';
import 'package:zero_waste_app/modules/home/account/account_sub_screens/my_address_screen.dart';
import 'package:zero_waste_app/modules/home/account/account_sub_screens/transactions_screen.dart';
import 'package:zero_waste_app/modules/home/account/account_sub_screens/wallets_screen.dart';
import 'package:zero_waste_app/modules/home/account/account_widgets/account_row_button.dart';
import 'package:zero_waste_app/modules/home/home_screen/cubit/home_cubit.dart';
import 'package:zero_waste_app/modules/home/home_screen/cubit/home_state.dart';

import 'package:zero_waste_app/shared/assets.dart';
import 'package:zero_waste_app/shared/data/local/cache_helper.dart';
import 'package:zero_waste_app/shared/data/local/shared_pref_keys_enum.dart';
import 'package:zero_waste_app/shared/helpers/navigation_helper.dart';
import 'package:zero_waste_app/shared/helpers/responsive/context_width_extension.dart';
import 'package:zero_waste_app/shared/helpers/responsive/responsive_scroll_screen.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';
import 'package:zero_waste_app/shared/themes/font_styles.dart';
import 'package:zero_waste_app/shared/widgets/default_app_bar.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (BuildContext context, HomeState state) {},
        builder: (BuildContext context, HomeState state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: defaultAppBar(
              context: context,
              title: Row(
                children: [
                  Text(
                    "Profile",
                    style: CustomTextStyle.bold24.responsive(context),
                  ),
                  const Image(
                      image: AssetImage(Assets.imagesHomeAccount),
                      width: 39,
                      height: 55)
                ],
              ),
            ),
            body: scrollScreenResponsive(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Stack(
                      // to put the another widget in the bottom
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          width: 78,
                          height: 85,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: CustomColors.green46, width: 5),
                            shape: BoxShape.circle,
                            image: CacheHelper.cachedData[
                                        SharedPrefKeys.getImage.key] ==
                                    null
                                ? const DecorationImage(
                                    image: AssetImage(Assets.imagesDefaultUser),
                                    fit: BoxFit.cover,
                                  )
                                : DecorationImage(
                                    image: NetworkImage(CacheHelper.cachedData[
                                        SharedPrefKeys.getImage.key]),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        Positioned(
                          top: 55,
                          left: 50,
                          child: CircleAvatar(
                            radius: 13,
                            backgroundColor: CustomColors.green46,
                            child: IconButton(
                              onPressed: () {
                                cubit.getProfileImage();
                              },
                              icon: const Icon(
                                size: 11,
                                Icons.photo_camera_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      CacheHelper.cachedData[SharedPrefKeys.getName.key],
                      style: CustomTextStyle.bold24.responsive(context),
                    ),
                    const SizedBox(height: 50),
                    rowButton(
                        context: context,
                        assetIconName: Assets.iconsAccount,
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
                        pageScreen: WalletsScreen()),
                    rowButton(
                        context: context,
                        assetIconName: Assets.iconsTransaction,
                        text: "Transactions",
                        pageScreen: const TransactionsScreen()),
                    const Spacer(flex: 2),
                    MaterialButton(
                      onPressed: () {
                        navigateAndFinish(
                            context: context, pageScreen: const AuthScreen());
                        CacheHelper.setData(SharedPrefKeys.userToken.key, '');
                      },
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
          );
        },
      ),
    );
  }
}
