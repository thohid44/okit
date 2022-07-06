import 'package:flutter/material.dart';
import 'package:okit/screen/payment_success_view.dart';

class RequestMoneyView extends StatelessWidget {
  const RequestMoneyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaymentAnalysis(
        viewTypeSuccess: false,
        transactionId: "8899665544",
        sendingToName: "David Morphy",
        sendingToNumber: "01908123643",
        totalPaymentAmount: "74",
        date: "5th Aug 2021",
        time: "04.20 PM",
        onDone: () {});
  }
}
