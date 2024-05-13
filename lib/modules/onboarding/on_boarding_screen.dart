// import 'package:flutter/material.dart';
// import 'package:shop_app/modules/login/login_screen.dart';
// import 'package:shop_app/shared/network/local/cache_helper.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// import '../../shared/components/components.dart';
// import '../../shared/components/functions.dart';
// import '../../styles/colors.dart';

// class BoardingModel {
//   final String image;
//   final String title;
//   final String body;
//   BoardingModel({
//     required this.image,
//     required this.title,
//     required this.body,
//   });
// }

// class OnBoarding extends StatefulWidget {
//   const OnBoarding({super.key});

//   @override
//   State<OnBoarding> createState() => _OnBoardingState();
// }

// class _OnBoardingState extends State<OnBoarding> {
//   final List<BoardingModel> boarding = [
//     BoardingModel(
//       image: "assets/images/onboard_1.jpeg",
//       title: "Brows awesome  products",
//       body: "Best prices ever !",
//     ),
//     BoardingModel(
//       image: "assets/images/onboard_1.jpeg",
//       title: "on board 2 title",
//       body: "on board 2 body",
//     ),
//     BoardingModel(
//       image: "assets/images/onboard_1.jpeg",
//       title: "on board 3 title",
//       body: "on board 3 body",
//     ),
//   ];
//   void endOnBoarding() {
//     navigateToWithReplacement(context, LoginScreen());
//     CacheHelper.setData(key: 'onBoarding', value: true);
//   }

//   final PageController boardController = PageController();
//   bool isLast = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           TextButton(
//               onPressed: () {
//                 endOnBoarding();
//               },
//               child: const Text("Skip"))
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(30.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: PageView.builder(
//                 onPageChanged: (int index) {
//                   if (index == boarding.length - 1) {
//                     isLast = true;
//                   } else {
//                     isLast = false;
//                   }
//                 },
//                 controller: boardController,
//                 physics: const BouncingScrollPhysics(),
//                 itemBuilder: (context, index) =>
//                     buildBoardingItem(boarding[index]),
//                 itemCount: boarding.length,
//               ),
//             ),
//             Row(
//               children: [
//                 SmoothPageIndicator(
//                   controller: boardController,
//                   count: boarding.length,
//                   effect: const WormEffect(
//                     activeDotColor: primaryColor,
//                     dotHeight: 10,
//                     dotWidth: 10,
//                     spacing: 5,
//                     type: WormType.thin,
//                   ),
//                 ),
//                 const Spacer(),
//                 FloatingActionButton(
//                   onPressed: () {
//                     if (isLast) {
//                       endOnBoarding();
//                     } else {
//                       boardController.nextPage(
//                         duration: const Duration(milliseconds: 750),
//                         curve: Curves.easeInToLinear,
//                       );
//                     }
//                   },
//                   child: const Icon(
//                     Icons.arrow_forward_ios,
//                     color: Colors.white,
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
