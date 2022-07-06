import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okit/screen/pay_money_view.dart';
import 'package:okit/shared/layouts/blank_layout.dart';

class SetDefaultCardView extends StatefulWidget {
  const SetDefaultCardView({Key? key}) : super(key: key);

  @override
  State<SetDefaultCardView> createState() => _SetDefaultCardViewState();
}

class _SetDefaultCardViewState extends State<SetDefaultCardView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 720),
        builder: (context) => BlankLayout(
              backgroundColor: Colors.white,
              includeAppBar: true,
              appbar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    context.router.pop();
                  },
                  icon: const Padding(
                    padding: EdgeInsets.only(left: 18.0),
                    child: Icon(Icons.arrow_back_ios),
                  ),
                ),
                centerTitle: true,
                title: Text(
                  "Set Default Card",
                  style: GoogleFonts.montaguSlab(
                      fontWeight: FontWeight.w700, fontSize: 14.sp),
                ),
              ),
              body: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 8.h),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    SizedBox(
                      height: 500.h,
                      child: ListView.builder(
                          itemCount: cards.length,
                          itemBuilder: (context, index) {
                            String convertedTitle = cards[index].title;

                            bool isNumeric(String s) {
                              if (s == null) {
                                return false;
                              }
                              return double.tryParse(s) != null;
                            }

                            if (isNumeric(convertedTitle[0])) {
                              convertedTitle = "**** **** **** " +
                                  cards[index].title.substring(
                                      cards.length - 4, cards.length);
                            }
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 8.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(
                                    color: index == selectedIndex
                                        ? Colors.yellow
                                        : Colors.grey,
                                    width: index == selectedIndex ? 2.w : 1.w),
                              ),
                              child: ListTile(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                selected: index == selectedIndex,
                                leading: SizedBox(
                                  height: 30.h,
                                  width: 30.w,
                                  child: Image.asset(
                                    cards[index].image.toString(),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                title: Text(
                                  convertedTitle,
                                  style: GoogleFonts.montaguSlab(
                                      letterSpacing: 1,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                trailing: Icon(
                                  Icons.circle,
                                  color: index == selectedIndex
                                      ? Colors.yellow
                                      : Colors.grey,
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ));
  }
}

List<Cards> cards = [
  Cards(image: "assets/images/logo.png", title: "John Patrick"),
  Cards(image: "assets/images/visa.png", title: "1111 1111 1111 3085"),
  Cards(image: "assets/images/payPal-logo.png", title: "Rahul Sharma"),
  Cards(
      image: "assets/images/masterCard-logo.png", title: "0000 0000 0000 3082"),
];

class Cards {
  String image;
  String title;
  Cards({required this.image, required this.title});
}
