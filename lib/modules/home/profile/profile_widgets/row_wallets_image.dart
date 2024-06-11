import 'package:flutter/material.dart';
import 'package:zero_waste_app/shared/assets.dart';
import 'package:zero_waste_app/shared/themes/colors.dart';

Widget walletsImagesRow({required context}) {
  return Container(
    margin: const EdgeInsets.only(top: 20, left: 20),
    padding: const EdgeInsets.only(left: 5),
    width: 500,
    height: 82,
    decoration: BoxDecoration(
      color: CustomColors.vividGreen5A.withOpacity(0.28),
      borderRadius: BorderRadius.only(
        topLeft: const Radius.circular(15),
        bottomLeft: const Radius.circular(15),
        topRight: MediaQuery.of(context).size.width < 500
            ? Radius.zero
            : const Radius.circular(15),
        bottomRight: MediaQuery.of(context).size.width < 500
            ? Radius.zero
            : const Radius.circular(15),
      ),
    ),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          imageShape(
              assetName: Assets.imagesHomeProfileVodafoneLogo, height: 62),
          imageShape(assetName: Assets.imagesHomeProfileWeLogo, height: 40),
          imageShape(
              assetName: Assets.imagesHomeProfileEtisalatLogo, height: 40),
          imageShape(
              assetName: Assets.imagesHomeProfileOrangeMoneyLogo, height: 82),
          imageShape(
              assetName: Assets.imagesHomeProfileInstaPayLogo, height: 69),
        ],
      ),
    ),
  );
}

Widget imageShape({required assetName, required double height}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: InkWell(
      onTap: () {},
      child: Image(
        height: height,
        fit: BoxFit.contain,
        image: AssetImage(assetName),
      ),
    ),
  );
}
