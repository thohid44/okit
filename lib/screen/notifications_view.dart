import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okit/shared/layouts/blank_layout.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    TextStyle headerTextStyle =
        GoogleFonts.montaguSlab(fontSize: 12.sp, fontWeight: FontWeight.w600);
    return ScreenUtilInit(
        designSize: const Size(360, 720),
        builder: (context) => BlankLayout(
            backgroundColor: Colors.white,
            includeAppBar: true,
            appbar: AppBar(
              title: const Text("Notifications"),
              centerTitle: true,
              backgroundColor: Colors.white,
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
            ),
            body: Padding(
              padding: EdgeInsets.all(16.0.r),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.0.w),
                      child: Text(
                        "Today",
                        style: headerTextStyle,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                leading: Container(
                                  height: 30.h,
                                  width: 40.w,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(7.r),
                                  ),
                                ),
                                title: Row(
                                  children: [
                                    Text(
                                      "andrew simon ",
                                      style: GoogleFonts.montaguSlab(
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    Text(r"Sent you $74.00",
                                        style: headerTextStyle),
                                  ],
                                ),
                                subtitle: Text(
                                  "2 minutes ago",
                                  style: GoogleFonts.montaguSlab(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 16.0.w),
                                child: const Divider(),
                              ),
                            ],
                          );
                        }),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.0.w),
                      child: Text(
                        "Yesterday",
                        style: headerTextStyle,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                leading: Container(
                                  height: 30.h,
                                  width: 40.w,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(7.r),
                                  ),
                                ),
                                title: Row(
                                  children: [
                                    Text(
                                      "andrew simon ",
                                      style: GoogleFonts.montaguSlab(
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    Text(r"Sent you $74.00",
                                        style: headerTextStyle),
                                  ],
                                ),
                                subtitle: Text(
                                  "3 days ago",
                                  style: GoogleFonts.montaguSlab(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 16.0.w),
                                child: Divider(),
                              ),
                            ],
                          );
                        }),
                  )
                ],
              ),
            )));
  }
}
