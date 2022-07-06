import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentSuccessView extends StatelessWidget {
  const PaymentSuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaymentAnalysis(
        viewTypeSuccess: true,
        transactionId: "7852469",
        sendingToName: "David Morphy",
        sendingToNumber: "01774142172",
        totalPaymentAmount: "240",
        date: "5th Aug 2021",
        time: "02.30 PM",
        onDone: () {});
  }
}

class CustomPaymentAnalysis extends StatelessWidget {
  bool viewTypeSuccess;
  String transactionId;
  String date;
  String time;
  String sendingToName;
  String sendingToNumber;
  String totalPaymentAmount;
  var onDone;

  CustomPaymentAnalysis(
      {Key? key,
      required this.viewTypeSuccess,
      required this.transactionId,
      required this.sendingToName,
      required this.sendingToNumber,
      required this.totalPaymentAmount,
      required this.date,
      required this.time,
      required this.onDone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var smallText =
        GoogleFonts.montaguSlab(fontSize: 10.sp, color: Colors.grey);
    var mediumText =
        GoogleFonts.montaguSlab(fontSize: 13.sp, fontWeight: FontWeight.w600);
    return ScreenUtilInit(
      builder: (context) => Scaffold(
        floatingActionButton: SizedBox(
          width: 290.w,
          height: 60.h,
          child: FloatingActionButton.extended(
            backgroundColor: Colors.yellow.shade700,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            onPressed: onDone,
            label: const Text('Done'),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        backgroundColor: Colors.grey.shade300,
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30.w, right: 30.w, top: 50.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      color: Colors.white),
                  height: 360.h,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                      backgroundColor: Colors.yellow.shade700,
                      radius: 50.r,
                      child: FaIcon(
                        viewTypeSuccess
                            ? FontAwesomeIcons.check
                            : FontAwesomeIcons.paperPlane,
                        color: Colors.white,
                      )

                      // Icon(
                      //   Icons.check,
                      //   color: Colors.white,
                      //   size: 50.r,
                      // ),

                      /// Add Image here if you want
                      ),
                ),
                Positioned(
                  top: 120.h,
                  child: Text(
                    viewTypeSuccess ? 'Payment Successful!' : "Request sent",
                    style: GoogleFonts.montaguSlab(
                        fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                Positioned(
                  top: 145.h,
                  child: Text(
                    "Trans id: $transactionId",
                    style: GoogleFonts.montaguSlab(
                        fontSize: 10.sp,
                        // fontWeight: FontWeight.w600
                        color: Colors.grey),
                  ),
                ),

                /// Add package dotted_line: ^3.1.0 in pubspec.yaml file for ---------

                Positioned(
                  top: 190.h,
                  child: DottedLine(
                    lineLength: 220.w,
                    dashLength: 10.w,
                    lineThickness: 3.h,
                    dashColor: Colors.grey.shade300,
                  ),
                ),

                Positioned(
                  top: 220.h,
                  child: SizedBox(
                    width: 225.w,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Date",
                              style: smallText,
                            ),
                            // SizedBox(width: 170.w,),
                            Text(
                              "Time",
                              style: smallText,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              // "5th Aug 2021",
                              date,
                              style: mediumText,
                            ),
                            Text(
                              // "02.30 PM",
                              time,
                              style: mediumText,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "To",
                            style: smallText,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  // "David morphy",
                                  sendingToName,
                                  style: mediumText,
                                ),
                                Text(
                                  // "+01774142172",
                                  sendingToNumber,
                                  style: smallText,
                                ),
                              ],
                            ),
                            FaIcon(
                              FontAwesomeIcons.circleCheck,
                              color: Colors.yellow.shade700,
                              size: 20.r,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  viewTypeSuccess
                                      ? "Total Payed Amount"
                                      : "Requested Amount",
                                  style: smallText,
                                ),
                                Text(
                                  // r"$240.00",
                                  r"$" + totalPaymentAmount,
                                  style: GoogleFonts.montaguSlab(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            FaIcon(
                              FontAwesomeIcons.circleCheck,
                              color: Colors.yellow.shade700,
                              size: 20.r,
                            ),
                          ],
                        ),
                        // ListTile(
                        //   title: Text(
                        //     "David morphy",
                        //     style: mediumText,
                        //   ),
                        //   subtitle: Text(
                        //     "+01774142172",
                        //     style: smallText,
                        //   ),
                        //   trailing: FaIcon(
                        //     FontAwesomeIcons.circleCheck,
                        //     color: Colors.yellow,
                        //     size: 20.r,
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
          ],
        ),
      ),
      designSize: const Size(360, 720),
    );
  }
}
