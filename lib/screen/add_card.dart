// import 'package:flutter/material.dart';
// import 'package:flutter_credit_card/flutter_credit_card.dart';

// class MySample extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return MySampleState();
//   }
// }

// class MySampleState extends State<MySample> {
//   String cardNumber = '';
//   String expiryDate = '';
//   String cardHolderName = '';
//   String cvvCode = '';
//   bool isCvvFocused = false;
//   bool useGlassMorphism = false;
//   bool useBackgroundImage = false;
//   OutlineInputBorder? border;
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     border = OutlineInputBorder(
//       borderSide: BorderSide(
//         color: Colors.grey.withOpacity(0.7),
//         width: 2.0,
//       ),
//     );
//     super.initState();
//   }

//   void bottomsheet(context) {
//     showModalBottomSheet(
//         context: context,
//         builder: (context) => ListView(children: [
//               CreditCardForm(
//                 formKey: formKey,
//                 obscureCvv: true,
//                 obscureNumber: true,
//                 cardNumber: cardNumber,
//                 cvvCode: cvvCode,
//                 isHolderNameVisible: true,
//                 isCardNumberVisible: true,
//                 isExpiryDateVisible: true,
//                 cardHolderName: cardHolderName,
//                 expiryDate: expiryDate,
//                 themeColor: Colors.blue,
//                 textColor: Colors.black,
//                 cardNumberDecoration: InputDecoration(
//                   labelText: 'Number',
//                   hintText: 'XXXX XXXX XXXX XXXX',
//                   hintStyle: const TextStyle(color: Colors.black),
//                   labelStyle: const TextStyle(color: Colors.black),
//                   focusedBorder: border,
//                   enabledBorder: border,
//                 ),
//                 expiryDateDecoration: InputDecoration(
//                   hintStyle: const TextStyle(color: Colors.black),
//                   labelStyle: const TextStyle(color: Colors.black),
//                   focusedBorder: border,
//                   enabledBorder: border,
//                   labelText: 'Expired Date',
//                   hintText: 'XX/XX',
//                 ),
//                 cvvCodeDecoration: InputDecoration(
//                   hintStyle: const TextStyle(color: Colors.black),
//                   labelStyle: const TextStyle(color: Colors.black),
//                   focusedBorder: border,
//                   enabledBorder: border,
//                   labelText: 'CVV',
//                   hintText: 'XXX',
//                 ),
//                 cardHolderDecoration: InputDecoration(
//                   hintStyle: const TextStyle(color: Colors.black),
//                   labelStyle: const TextStyle(color: Colors.black),
//                   focusedBorder: border,
//                   enabledBorder: border,
//                   labelText: 'Card Holder',
//                 ),
//                 onCreditCardModelChange: onCreditCardModelChange,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   primary: const Color(0xff1b447b),
//                 ),
//                 child: Container(
//                   margin: const EdgeInsets.all(12),
//                   child: const Text(
//                     'Validate',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontFamily: 'halter',
//                       fontSize: 14,
//                       package: 'flutter_credit_card',
//                     ),
//                   ),
//                 ),
//                 onPressed: () {
//                   if (formKey.currentState!.validate()) {
//                     print('valid!');
//                   } else {
//                     print('invalid!');
//                   }
//                   print(cardNumber);
//                   print(cardHolderName);
//                   print(cvvCode);
//                   print(expiryDate);
//                 },
//               ),
//             ]));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Credit Card',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Container(
//           child: SafeArea(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 TextButton(
//                     onPressed: () {
//                       bottomsheet(context);
//                     },
//                     child: Text("Add Card")),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void onCreditCardModelChange(CreditCardModel? creditCardModel) {
//     setState(() {
//       cardNumber = creditCardModel!.cardNumber;
//       expiryDate = creditCardModel.expiryDate;
//       cardHolderName = creditCardModel.cardHolderName;
//       cvvCode = creditCardModel.cvvCode;
//       isCvvFocused = creditCardModel.isCvvFocused;
//     });
//   }
// }
