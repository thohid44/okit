// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../app/core/values/colors.dart';
// import '../app/shared/layouts/blank_layout.dart';
// import '../app/shared/widgets/string_widgets.dart';
// import '../constant/colors.dart';
// import '../utils/constants.dart';
//
// class GetStartedLoginPage extends StatelessWidget {
//   GetStartedLoginPage({Key? key, required this.next, required this.skip}) : super(key: key);
//
//   final Function() next;
//   final Function() skip;
//
//
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     final textScaleFactor = width / mockupWidth;
//     return SingleChildScrollView(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/on-boarding-bg-one.png'),
//                 alignment: Alignment.center,
//                 fit: BoxFit.fill,
//               ),
//             ),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset(
//                       'assets/images/on-boarding-one.png',
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 28.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     MainTitleText(
//                       'Save your ',
//                       myTextAlign: TextAlign.start,
//                     ),
//                     MainTitleText(
//                       'money',
//                       myTextAlign: TextAlign.start,
//                     ),
//                     const SizedBox(height: 10),
//                     Container(
//                       width: MediaQuery.of(context).size.width * 0.7,
//                       child: SubText(
//                         'Make your cash secured with our strong technology. We are concerned about your privacy.',
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           // imageSection(context),
//           // textSection(context),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               // sliderButtonSection(controller),
//               Row(children: [
//                 // arrowSection(context, next())
//               ]),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Padding textSection(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 28.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               MainTitleText(
//                 'Save your ',
//                 myTextAlign: TextAlign.start,
//               ),
//               MainTitleText(
//                 'money',
//                 myTextAlign: TextAlign.start,
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 width: MediaQuery.of(context).size.width * 0.7,
//                 child: SubText(
//                   'Make your cash secured with our strong technology. We are concerned about your privacy.',
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Container imageSection(
//       BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height * 0.5,
//       width: MediaQuery.of(context).size.width,
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/images/on-boarding-bg-one.png'),
//           alignment: Alignment.center,
//           fit: BoxFit.fill,
//         ),
//       ),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 'assets/images/on-boarding-one.png',
//                 height: MediaQuery.of(context).size.height * 0.4,
//                 width: MediaQuery.of(context).size.width,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Container arrowSection(BuildContext context, Function next) {
//     return Container(
//       height: MediaQuery.of(context).size.height * 0.2,
//       width: MediaQuery.of(context).size.width * 0.3,
//       child:Padding(
//           padding: const EdgeInsets.only(top: 30.0, left: 35.0),
//           child:
//           // controller.selectedPageIndex.value != 2
//           //     ?
//           GestureDetector(
//             child: const Icon(Icons.arrow_forward_outlined),
//             onTap: () {
//               next();
//               // int nextIndex = controller.selectedPageIndex.value += 1;
//               // controller.nextPage(nextIndex);
//               // pageController.animateToPage(nextIndex,
//               //     curve: Curves.easeInOut,
//               //     duration: const Duration(milliseconds: 400));
//             },
//           )
//         //     : GestureDetector(
//         //   child: const Padding(
//         //     padding: EdgeInsets.only(top: 60.0),
//         //     child: Text(
//         //       'Let’s Start!',
//         //       textAlign: TextAlign.center,
//         //     ),
//         //   ),
//         //   onTap: () {
//         //     settingsService.viewed();
//         //     Get.offNamed('/login');
//         //   },
//         // ),
//       ),
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage(
//             'assets/images/on-boarding-bg-two.png',
//           ),
//           alignment: Alignment.center,
//           fit: BoxFit.fill,
//         ),
//       ),
//     );
//   }
// }
//
