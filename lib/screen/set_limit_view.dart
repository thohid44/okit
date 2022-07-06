import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SetLimitView extends StatefulWidget {
  String limit;
  SetLimitView({Key? key, required this.limit}) : super(key: key);

  @override
  State<SetLimitView> createState() => _SetLimitViewState();
}

class _SetLimitViewState extends State<SetLimitView> {
  int amount = 0;
  @override
  Widget build(BuildContext context) {
    //  var lim = double.parse(widget.limit);
    return ScreenUtilInit(
        designSize: const Size(360, 720),
        builder: (context) => Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: SizedBox(
                width: 290.w,
                height: 60.h,
                child: FloatingActionButton.extended(
                  backgroundColor: Colors.yellow.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  onPressed: () {},
                  label: const Text('Save'),
                ),
              ),
              backgroundColor: Colors.grey.shade300,
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.grey.shade300,
                elevation: 0,
                leading: Padding(
                  padding: EdgeInsets.only(left: 18.0.w),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      context.router.pop();
                    },
                  ),
                ),
                title: Text(
                  "Set Your Limit",
                  style: GoogleFonts.montaguSlab(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                      // color: Color(0x2B303F),
                      ),
                ),
              ),
              body: Container(
                margin: EdgeInsets.all(24.r),
                padding: EdgeInsets.only(
                    left: 32.w, right: 19.w, top: 21.h, bottom: 36.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Set Limit",
                          style: GoogleFonts.montaguSlab(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const FaIcon(
                          FontAwesomeIcons.circleQuestion,
                          color: Colors.grey,
                          size: 15,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Container(
                      height: 43.h,
                      width: 117.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(width: 1.2.w)),
                      child: Center(
                        child: Text(
                          "${widget.limit == null ? 0 : widget.limit}",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montaguSlab(
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ),
                    Slider(
                      value: amount.toDouble(),
                      onChanged: (val) {
                        setState(() {
                          amount = val.toInt();
                        });
                      },
                      activeColor: Colors.yellow.shade700,
                      inactiveColor: Colors.grey,
                      thumbColor: Colors.yellow.shade700,
                      max: 1000,
                      min: 0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r"$0",
                          style: GoogleFonts.montaguSlab(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          r"$10000",
                          style: GoogleFonts.montaguSlab(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ));
  }
}
