import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zero_waste_app/modules/home/home_screen/cubit/home_state.dart';
import 'package:zero_waste_app/shared/assets.dart';

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
    "LargeBottle",
    "SmallBottle",
    "Cups",
    "SodaBottle",
    "JuiceBottle",
    "GymBottle",
    "OilBottle",
    "Yoghurt",
    "YoghurtJuiceBottle",
    "Cutlery",
    "FoodBox",
    "FoodContainer",
    "FoodPlates",
    "Bags",
    "Pens",
    "CorrectorPens",
    "HairOilBottle",
    "HairProducts",
    "HairCreamBox",
    "ShampooBottle",
  ];
  List<String> metalNames = const [
    "SodaCans",
    "FoodCans",
    "TunaCans",
    "OilCan",
    "FoilPaper",
    "FoilPlates",
    "DrugsCreamTube",
    "Febreze",
    "Keys",
    "RaidSpray",
  ];
  List<String> paperNames = const [
    "LargeJuice",
    "SmallJuice",
    "Cups",
    "FoodBox",
    "EggCarton",
    "PaperTissues",
    "Papers",
    "Receipts",
    "ShoesBox",
    "DrugBox",
    "Newspaper",
    "PaperStraw",
  ];
  List<String> glassNames = const [
    "Bottles",
    "Cups",
    "Jars",
    "BrownGlass",
    "OliveOilBottles",
    "SodaBottles",
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
}
