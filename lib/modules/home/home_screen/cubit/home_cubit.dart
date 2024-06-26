import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zero_waste_app/modules/home/home_screen/cubit/home_state.dart';
import 'package:zero_waste_app/shared/assets.dart';
import 'package:zero_waste_app/shared/data/local/cache_helper.dart';
import 'package:zero_waste_app/shared/data/local/shared_pref_keys_enum.dart';
import 'package:image_picker/image_picker.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialState());
  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  final ScrollController scrollController = ScrollController();

  List<String> buttonsNameList = [
    "Plastic",
    "Metal",
    "Paper",
    "Glass",
  ];
  List<String> plasticImagesNames = const [
    Assets.imagesHomePlasticsLargeBottle,
    Assets.imagesHomePlasticsSmallBottle,
    Assets.imagesHomePlasticsCups,
    Assets.imagesHomePlasticsSodaBottle,
    Assets.imagesHomePlasticsJuiceBottle,
    Assets.imagesHomePlasticsGymBottle,
    Assets.imagesHomePlasticsOilBottle,
    Assets.imagesHomePlasticsYoghurt,
    Assets.imagesHomePlasticsYoghurtJuiceBottle,
    Assets.imagesHomePlasticsCutlery,
    Assets.imagesHomePlasticsFoodBox,
    Assets.imagesHomePlasticsFoodContainer,
    Assets.imagesHomePlasticsFoodPlates,
    Assets.imagesHomePlasticsBags,
    Assets.imagesHomePlasticsPens,
    Assets.imagesHomePlasticsCorrectorPens,
    Assets.imagesHomePlasticsHairOilBottle,
    Assets.imagesHomePlasticsHairProducts,
    Assets.imagesHomePlasticsHairCreamBox,
    Assets.imagesHomePlasticsShampooBottle,
  ];
  List<String> metalImagesNames = const [
    Assets.imagesHomeMetalSodaCans,
    Assets.imagesHomeMetalFoodCans,
    Assets.imagesHomeMetalTunaCans,
    Assets.imagesHomeMetalOilCan,
    Assets.imagesHomeMetalFoilPaper,
    Assets.imagesHomeMetalFoilPlates,
    Assets.imagesHomeMetalDrugsCreamTube,
    Assets.imagesHomeMetalFebreze,
    Assets.imagesHomeMetalKeys,
    Assets.imagesHomeMetalRaidSpray,
  ];
  List<String> paperImagesNames = const [
    Assets.imagesHomePaperLargeJuice,
    Assets.imagesHomePaperSmallJuice,
    Assets.imagesHomePaperCups,
    Assets.imagesHomePaperFoodBox,
    Assets.imagesHomePaperEggCarton,
    Assets.imagesHomePaperPaperTissues,
    Assets.imagesHomePaperPapers,
    Assets.imagesHomePaperReceipts,
    Assets.imagesHomePaperShoesBox,
    Assets.imagesHomePaperDrugBox,
    Assets.imagesHomePaperNewspaper,
    Assets.imagesHomePaperPaperStraw,
  ];
  List<String> glassImagesNames = const [
    Assets.imagesHomeGlassBottles,
    Assets.imagesHomeGlassCups,
    Assets.imagesHomeGlassJars,
    Assets.imagesHomeGlassBrownGlass,
    Assets.imagesHomeGlassOliveOilBottles,
    Assets.imagesHomeGlassSodaBottles
  ];

  List<String> plasticNames = const [
    "Large Bottle",
    "Small Bottle",
    "Cups",
    "Soda Bottle",
    "Juice Bottle",
    "Gym Bottle",
    "Oil Bottle",
    "Yoghurt",
    "Yoghurt Juice Bottle",
    "Cutlery",
    "Food Box",
    "Food Container",
    "Food Plates",
    "Bags",
    "Pens",
    "Corrector Pens",
    "Hair Oil Bottle",
    "Hair Products",
    "Hair CreamBox",
    "Shampoo Bottle",
  ];
  List<String> metalNames = const [
    "Soda Cans",
    "Food Cans",
    "Tuna Cans",
    "Oil Can",
    "Foil Paper",
    "Foil Plates",
    "Drugs Cream Tube",
    "Febreze",
    "Keys",
    "Raid Spray",
  ];
  List<String> paperNames = const [
    "Large Juice",
    "Small Juice",
    "Cups",
    "Food Box",
    "Egg Carton",
    "Paper Tissues",
    "Papers",
    "Receipts",
    "Shoes Box",
    "Drug Box",
    "Newspaper",
    "Paper Straw",
  ];
  List<String> glassNames = const [
    "Bottles",
    "Cups",
    "Jars",
    "Brown Glass",
    "Olive Oil Bottles",
    "Soda Bottles",
  ];

  List<List<String>> imagesListSelected = [];
  List<List<String>> textListSelected = [];
  void gridCategoryLists() {
    imagesListSelected = [
      plasticImagesNames,
      metalImagesNames,
      paperImagesNames,
      glassImagesNames
    ];
    textListSelected = [plasticNames, metalNames, paperNames, glassNames];
  }

  void onChangeIndex(int index) {
    currentIndex = index;
    // to restart scroll from began
    scrollController.jumpTo(0);

    emit(ChangeCategoriesButtonsState());
  }

  int totalPoints = 0;
  changeTotalPoints(int value) {
    totalPoints += value;
    CacheHelper.setData(SharedPrefKeys.getPointsValue.key, totalPoints);

    emit(ChangeTotalPointsValueState());
  }

  // to get image in the file
  File? profileImage;
  // to get image from device
  var picker = ImagePicker();
  // make function to get image
  Future<void> getProfileImage() async {
    // make user upload image from gallary
    final pickedFile = await picker.pickMedia();
    if (pickedFile != null) {
      // store path of the image in the file
      profileImage = File(pickedFile.path);
      profileImage != null
          ? await CacheHelper.setData(
              SharedPrefKeys.getImage.key, profileImage!.path)
          : null;

      emit(SocialProfileImagePickedSuccessState());
    } else {
      emit(SocialProfileImagePickedErrorState());
    }
  }

  String name = 'Name';
  void changeAboutMeButton(
      {required nameController,
      required emailController,
      required phoneController}) {
    nameController.text != ''
        ? CacheHelper.setData(SharedPrefKeys.getName.key, nameController.text)
        : null;
    emailController.text != ''
        ? CacheHelper.setData(SharedPrefKeys.getEmail.key, emailController.text)
        : null;
    phoneController.text != ''
        ? CacheHelper.setData(SharedPrefKeys.getPhone.key, phoneController.text)
        : null;

    name = CacheHelper.cachedData[SharedPrefKeys.getName.key];
    emit(ChangeAboutMeState());
  }
}
