// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:okit/routes/router.gr.dart';
// import 'package:okit/state%20management/cash_page_state.dart';
// import 'package:provider/provider.dart';

// import '../shared/widgets/custom_cash_buttons.dart';

// class PayMoneyView extends StatefulWidget {
//   const PayMoneyView({Key? key}) : super(key: key);

//   @override
//   State<PayMoneyView> createState() => _PayMoneyViewState();
// }

// class _PayMoneyViewState extends State<PayMoneyView> {
//   int selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       builder: (context) => Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           title: const Text("Pay money view"),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const SizedBox(
//               width: double.infinity,
//             ),
//             TextButton(
//               // style: ButtonStyle(backgroundColor: ),
//               onPressed: () {
//                 showModalBottomSheet(
//                     shape: const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(40),
//                         topRight: Radius.circular(40),
//                       ),
//                     ),
//                     context: context,
//                     builder: (context) {
//                       return Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 25.0.w, vertical: 8.h),
//                         child: ListView(
//                           children: [
//                             Divider(
//                               thickness: 8.w,
//                               indent: 115.w,
//                               endIndent: 115.w,
//                               color: Colors.grey.shade300,
//                             ),
//                             SizedBox(
//                               height: 40.h,
//                             ),
//                             SizedBox(
//                               height: 500.h,
//                               child: ListView.builder(
//                                   itemCount: cards.length,
//                                   itemBuilder: (context, index) {
//                                     String convertedTitle = cards[index].title;

//                                     bool isNumeric(String s) {
//                                       if (s == null) {
//                                         return false;
//                                       }
//                                       return double.tryParse(s) != null;
//                                     }

//                                     if (isNumeric(convertedTitle[0])) {
//                                       convertedTitle = "**** **** **** " +
//                                           cards[index].title.substring(
//                                               cards.length - 4, cards.length);
//                                     }
//                                     return Container(
//                                       margin:
//                                           EdgeInsets.symmetric(vertical: 8.h),
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(10),
//                                         border: Border.all(
//                                             color: index == selectedIndex
//                                                 ? Colors.yellow
//                                                 : Colors.grey,
//                                             width:
//                                                 index == selectedIndex ? 2 : 1),
//                                       ),
//                                       child: ListTile(
//                                         onTap: () {
//                                           setState(() {
//                                             selectedIndex = index;
//                                           });
//                                         },
//                                         selected: index == selectedIndex,
//                                         leading: SizedBox(
//                                           height: 30.h,
//                                           width: 30.w,
//                                           child: Image.asset(
//                                             cards[index].image.toString(),
//                                             fit: BoxFit.fill,
//                                           ),
//                                         ),
//                                         title: Text(
//                                           convertedTitle,
//                                           style: GoogleFonts.montaguSlab(
//                                             letterSpacing: 1,
//                                             fontSize: 12.sp,
//                                             fontWeight: FontWeight.w600,
//                                           ),
//                                         ),
//                                         trailing: Icon(
//                                           Icons.circle,
//                                           color: index == selectedIndex
//                                               ? Colors.yellow
//                                               : Colors.black,
//                                         ),
//                                       ),
//                                     );
//                                   }),
//                             ),
//                           ],
//                         ),
//                       );
//                     });
//               },
//               child: const Text("Pay money Dialogue"),
//             ),
//             TextButton(
//               onPressed: () {
//                 context.router.push(const PaymentSuccessRoute());
//               },
//               child: const Text("Payment successful"),
//             ),
//             TextButton(
//               onPressed: () {
//                 context.router.push(const RequestMoneyRoute());
//               },
//               child: const Text("Request sent"),
//             ),
//             TextButton(
//               onPressed: () {
//                 context.router.push(const SetLimitRoute());
//               },
//               child: const Text("Set money Limit"),
//             ),
//             TextButton(
//               onPressed: () {
//                 context.router.push(const AddUserRoute());
//               },
//               child: const Text("Add User"),
//             ),
//             TextButton(
//               onPressed: () {
//                 showModalBottomSheet(
//                     backgroundColor: Colors.yellow.shade50,
//                     isScrollControlled: true,
//                     shape: const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(40),
//                         topRight: Radius.circular(40),
//                       ),
//                     ),
//                     context: context,
//                     builder: (context) {
//                       return Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 25.0.w, vertical: 8.h),
//                         child: ChangeNotifierProvider<CashPageMoneyState>(
//                             create: (context) => CashPageMoneyState(),
//                             child: Consumer<CashPageMoneyState>(
//                               builder: (context, provider, child) => Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   Divider(
//                                     thickness: 8.w,
//                                     indent: 115.w,
//                                     endIndent: 115.w,
//                                     color: Colors.grey.shade300,
//                                   ),
//                                   SizedBox(
//                                     height: 40.h,
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: SizedBox(
//                                       height: 70,
//                                       child: FittedBox(
//                                         child: Text(
//                                           // context.watch<CashPageMoneyState>().amnt
//                                           r"$" + provider.amount,
//                                           style: const TextStyle(
//                                               fontSize: 60,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(16.0),
//                                     child: GestureDetector(
//                                       child: Container(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 15, vertical: 5),
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(20),
//                                             color: Colors.grey.shade300),
//                                         child: Row(
//                                           mainAxisSize: MainAxisSize.min,
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: const [
//                                             Text("USD"),
//                                             Icon(Icons.keyboard_arrow_down),
//                                           ],
//                                         ),
//                                       ),
//                                       onTap: () {
//                                         print("Currency button Pressed");
//                                       },
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(10),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceAround,
//                                       children: [
//                                         customSingleButton(
//                                             value: '1',
//                                             onTap: () {
//                                               setState(() {});
//                                               provider.add(value: '1');
//                                             }),
//                                         customSingleButton(
//                                             value: '2',
//                                             onTap: () {
//                                               setState(() {});
//                                               provider.add(value: "2");
//                                             }),
//                                         customSingleButton(
//                                             value: '3',
//                                             onTap: () {
//                                               setState(() {});
//                                               provider.add(value: "3");
//                                             }),
//                                       ],
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(10),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceAround,
//                                       children: [
//                                         customSingleButton(
//                                             value: '4',
//                                             onTap: () {
//                                               setState(() {});
//                                               provider.add(value: '4');
//                                             }),
//                                         customSingleButton(
//                                             value: '5',
//                                             onTap: () {
//                                               setState(() {});
//                                               provider.add(value: "5");
//                                             }),
//                                         customSingleButton(
//                                             value: '6',
//                                             onTap: () {
//                                               setState(() {});
//                                               provider.add(value: "6");
//                                             }),
//                                       ],
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: EdgeInsets.all(10.r),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceAround,
//                                       children: [
//                                         customSingleButton(
//                                             value: '7',
//                                             onTap: () {
//                                               setState(() {});
//                                               provider.add(value: '7');
//                                             }),
//                                         customSingleButton(
//                                             value: '8',
//                                             onTap: () {
//                                               setState(() {});
//                                               provider.add(value: "8");
//                                             }),
//                                         customSingleButton(
//                                             value: '9',
//                                             onTap: () {
//                                               setState(() {});
//                                               provider.add(value: "9");
//                                             }),
//                                       ],
//                                     ),
//                                   ),
//                                   // Padding(
//                                   //   padding: const EdgeInsets.only(bottom: 20.0),
//                                   //   child: CustomRowButton(
//                                   //     firstValue: "1",
//                                   //     secondValue: "2",
//                                   //     thirdValue: "3",
//                                   //   ),
//                                   // ),
//                                   // Padding(
//                                   //   padding: const EdgeInsets.only(bottom: 20.0),
//                                   //   child: CustomRowButton(
//                                   //     firstValue: "4",
//                                   //     secondValue: "5",
//                                   //     thirdValue: "6",
//                                   //   ),
//                                   // ),
//                                   // Padding(
//                                   //   padding: const EdgeInsets.only(bottom: 20.0),
//                                   //   child: CustomRowButton(
//                                   //     firstValue: "7",
//                                   //     secondValue: "8",
//                                   //     thirdValue: "9",
//                                   //   ),
//                                   // ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                     children: [
//                                       customSingleButton(
//                                         value: '.',
//                                         onTap: () {
//                                           setState(() {});
//                                           provider.add(value: '.');
//                                           // context.read<MoneyTransaction>().add(value: ".");
//                                         },
//                                       ),
//                                       customSingleButton(
//                                         value: '0',
//                                         onTap: () {
//                                           setState(() {});
//                                           provider.add(value: "0");
//                                           // context.read<MoneyTransaction>().add(value: "0");
//                                         },
//                                       ),
//                                       IconButton(
//                                         icon: const Icon(
//                                             Icons.backspace_outlined),
//                                         onPressed: () {
//                                           setState(() {
//                                             print(provider.amount);
//                                           });
//                                           provider.delete();
//                                           // context.read<MoneyTransaction>().delete();
//                                         },
//                                       ),
//                                     ],
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: CustomCashButton(
//                                             title: "Cancel",
//                                             onTap: () {
//                                               context.router.pop();
//                                             }),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: CustomCashButton(
//                                             title: "Add",
//                                             onTap: () {
//                                               showDialog(
//                                                   context: context,
//                                                   builder:
//                                                       (context) => AlertDialog(
//                                                             backgroundColor:
//                                                                 Colors
//                                                                     .transparent,
//                                                             // title: Text(r"Successfuly added $74.0", style: GoogleFonts.montaguSlab(
//                                                             //   fontWeight: FontWeight.w700,
//                                                             //   fontSize: 13.sp
//                                                             // ),),
//                                                             // content: Text("Card: **** **** 308821",  style: GoogleFonts.montaguSlab(
//                                                             //     fontWeight: FontWeight.w600,
//                                                             //     fontSize: 10.sp
//                                                             // ),),
//                                                             alignment: Alignment
//                                                                 .center,
//                                                             actions: [
//                                                               Stack(
//                                                                 alignment:
//                                                                     Alignment
//                                                                         .topCenter,
//                                                                 children: [
//                                                                   Container(
//                                                                     margin: EdgeInsets.only(
//                                                                         top: 40
//                                                                             .h),
//                                                                     height: 227,
//                                                                     width: 308,
//                                                                     decoration:
//                                                                         BoxDecoration(
//                                                                       color: Colors
//                                                                           .yellow
//                                                                           .shade50,
//                                                                       borderRadius:
//                                                                           BorderRadius.circular(
//                                                                               24.r),
//                                                                     ),
//                                                                   ),
//                                                                   CircleAvatar(
//                                                                     radius:
//                                                                         38.r,
//                                                                     backgroundColor:
//                                                                         Colors
//                                                                             .yellow,
//                                                                     child:
//                                                                         const FaIcon(
//                                                                       FontAwesomeIcons
//                                                                           .check,
//                                                                       color: Colors
//                                                                           .white,
//                                                                     ),
//                                                                   ),
//                                                                   Positioned(
//                                                                     top: 100.h,
//                                                                     child:
//                                                                         Column(
//                                                                       mainAxisSize:
//                                                                           MainAxisSize
//                                                                               .min,
//                                                                       children: [
//                                                                         Text(
//                                                                           r"Successfuly added $74.0",
//                                                                           style: GoogleFonts.montaguSlab(
//                                                                               fontWeight: FontWeight.w700,
//                                                                               fontSize: 13.sp),
//                                                                         ),
//                                                                         SizedBox(
//                                                                           height:
//                                                                               7.h,
//                                                                         ),
//                                                                         Text(
//                                                                           "Card: **** **** 308821",
//                                                                           style: GoogleFonts.montaguSlab(
//                                                                               //     fontWeight: FontWeight.w600,
//                                                                               fontSize: 10.sp),
//                                                                         ),
//                                                                         SizedBox(
//                                                                           height:
//                                                                               45.h,
//                                                                         ),
//                                                                         CustomCashButton(
//                                                                             title:
//                                                                                 "Done",
//                                                                             height:
//                                                                                 51.h,
//                                                                             width: 232.w,
//                                                                             circular: 5.r,
//                                                                             onTap: () {
//                                                                               context.router.pop();
//                                                                             }),
//                                                                         SizedBox(
//                                                                           height:
//                                                                               32.h,
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   )
//                                                                 ],
//                                                               ),
//                                                             ],
//                                                             // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
//                                                           ));
//                                             }),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             )),
//                       );
//                     });
//               },
//               child: const Text("Add Money Dialogue"),
//             ),
//             TextButton(
//               onPressed: () {
//                 context.router.push(ReceiverInfoRoute(
//                     receiver: "Walmart Inc",
//                     receiverCode: "123456",
//                     amount: "74",
//                     remarks: "Shopping"));
//               },
//               child: const Text("Receiver Info"),
//             ),
//           ],
//         ),
//       ),
//       designSize: const Size(360, 720),
//     );
//   }
// }

// List<Cards> cards = [
//   Cards(image: "assets/images/logo.png", title: "John Patrick"),
//   Cards(image: "assets/images/visa.png", title: "1111 1111 1111 3085"),
//   Cards(image: "assets/images/payPal-logo.png", title: "Rahul Sharma"),
//   Cards(
//       image: "assets/images/masterCard-logo.png", title: "0000 0000 0000 3082"),
// ];

// class Cards {
//   String image;
//   String title;
//   Cards({required this.image, required this.title});
// }
