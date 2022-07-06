import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okit/screen/master_card_edit.dart';

import '../shared/layouts/blank_layout.dart';
import '../shared/widgets/string_widgets.dart';
import '../values/colors.dart';

class CardsView extends StatefulWidget {
  const CardsView({Key? key}) : super(key: key);

  @override
  State<CardsView> createState() => _CardsViewState();
}

class _CardsViewState extends State<CardsView> {
  @override
  Widget build(BuildContext context) {
    return BlankLayout(
      includeAppBar: true,
      appbar: AppBar(
        title: AppBarLabelText('Cards'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: transparent,
      ),
      backgroundColor: whiteF3,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //SizedBox(height: 20),
            CarouselSlider(
              options: CarouselOptions(
                  height: 235.h,
                  enlargeCenterPage: true,
                  viewportFraction: 0.7,
                  enableInfiniteScroll: false),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MasterCardEdit()));
                      },
                      child: CreditCardWidget(
                        cardNumber: "",
                        expiryDate: "",
                        cardHolderName: "",
                        cvvCode: "",
                        showBackView: false,
                        onCreditCardWidgetChange: (creditCardBrand) {},
                        textStyle:
                            GoogleFonts.montserrat(fontSize: 12, color: white),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: whiteFE,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 28.0, left: 28, bottom: 10),
                              child: Text(
                                'Transactions',
                                style: GoogleFonts.montserrat(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context, index) => Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin:
                                  EdgeInsets.only(left: 20, right: 20, top: 10),
                              child: ListTile(
                                contentPadding:
                                    EdgeInsets.only(right: 10, left: 10),
                                leading: Image.asset(
                                    'assets/images/payPal-logo.png'),
                                title: Text(
                                  'PayPal',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: black3F,
                                  ),
                                ),
                                subtitle: Text(
                                  '7 hours ago',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 9,
                                      fontWeight: FontWeight.w600,
                                      color: grayBF),
                                ),
                                trailing: Text(
                                  '+70.0\$',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
