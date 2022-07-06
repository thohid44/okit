import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:okit/constant/text.dart';
import 'package:okit/model/active_wallets_model.dart';
import 'package:okit/model/currency_model.dart';
import 'package:okit/network/api_service.dart';
import 'package:provider/provider.dart';
import '../shared/layouts/large_appbar_layout.dart';
import '../shared/widgets/custom_button.dart';
import '../shared/widgets/string_widgets.dart';
import '../values/colors.dart';

class SavingsView extends StatefulWidget {
  @override
  State<SavingsView> createState() => _SavingsViewState();
}

class _SavingsViewState extends State<SavingsView> {
  @override
  Widget build(BuildContext context) {
    return LargeAppBarLayout(
        appbar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 250.h,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppBarLabelText('My Savings'),
              SizedBox(height: 50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'CURRENT SAVINGS',
                    style: GoogleFonts.montserrat(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.9),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/big-dots.png',
                        // width: 140,
                        height: 40.h,
                      ),
                      Container(
                        width: 150.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Center(child: CardTitleText('182 c')),
                      ),
                      Image.asset(
                        'assets/images/big-dots.png',
                        //width: 140,
                        height: 40.h,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 145.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: yellowCD,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Lifetime Score: \$42.73',
                        style: GoogleFonts.montserrat(
                            color: yellow0E,
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: transparent,
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Offers',
              ),
              Tab(
                text: 'Redeem',
              ),
            ],
            labelColor: black3F,
            unselectedLabelColor: grayBF,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 5, color: secondaryColor),
              insets: EdgeInsets.symmetric(horizontal: 70.w),
            ),
            indicatorColor: secondaryColor,
            indicatorSize: TabBarIndicatorSize.label,
          ),
        ),
        backgroundColor: white,
        body: TabBarView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: whiteFC,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) => Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
                  child: ListTile(
                    contentPadding: EdgeInsets.only(right: 10, left: 10),
                    leading: Image.asset('assets/images/offer-demo.png'),
                    title: Text(
                      'Shop now with Walmart!',
                      style: GoogleFonts.montserrat(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: black3F,
                      ),
                    ),
                    subtitle: Text(
                      '00:15',
                      style: GoogleFonts.montserrat(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w600,
                          color: grayBF),
                    ),
                    trailing: Text(
                      '5 -10 c',
                      style: GoogleFonts.montserrat(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: yellow0E,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 250.w,
                        child: Text(
                          'Note: Amount you redeem here will be directly transferred to your OKIT Wallet.',
                          style: GoogleFonts.montserrat(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '1.0% per withdraw',
                    style: GoogleFonts.montserrat(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Column(
                    children: [
                      Container(
                        width: 170.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: grayF4),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.r),
                          ),
                        ),
                        child: Center(
                            child: Text(
                          '1.27 c',
                          style: GoogleFonts.montserrat(
                              fontSize: 30.sp, fontWeight: FontWeight.w700),
                        )),
                      ),
                      Text(
                        '182 c AVAILABLE',
                        style: GoogleFonts.montserrat(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color: grayBF),
                      ),
                    ],
                  ),
                  Slider(
                    value: 40,
                    max: 100,
                    min: 0,
                    onChanged: (value) {},
                    inactiveColor: grayF4,
                    activeColor: secondaryColor,
                  ),
                  CustomButton(save: () {}, buttonText: "Redeem"),
                ],
              ),
            )
          ],
        ));
  }
}
