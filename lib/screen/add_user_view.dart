import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okit/shared/layouts/blank_layout.dart';

class AddUserView extends StatefulWidget {
  const AddUserView({Key? key}) : super(key: key);

  @override
  State<AddUserView> createState() => _AddUserViewState();
}

class _AddUserViewState extends State<AddUserView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController input = TextEditingController();
    return ScreenUtilInit(
      builder: (context) => BlankLayout(
        includeAppBar: true,
        appbar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey.shade700,
          leading: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
              onPressed: () {
                context.router.pop();
              },
            ),
          ),
          title: Text(
            "Add User",
            style: GoogleFonts.montaguSlab(
                fontWeight: FontWeight.w700, fontSize: 14.sp),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey.shade700,
        body: Container(
          height: double.infinity,
          margin: EdgeInsets.only(top: 30.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40.r),
                topLeft: Radius.circular(40.r)),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 24.0.h, left: 24.0.w, right: 23.0.w),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(16.r)),
                  child: TextField(
                    onChanged: (val) {
                      checkQuery(val);
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      // fillColor: Colors.grey.shade700,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide(color: Colors.grey)),
                      hintText: "Search Friend",
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: suggestionList.length,
                        itemBuilder: ((context, index) {
                          return Column(
                            children: [
                              ListTile(
                                leading: Container(
                                  height: 32.h,
                                  width: 32.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    image: DecorationImage(
                                      fit: BoxFit.fitHeight,
                                      image: AssetImage(
                                          suggestionList[index].image),
                                    ),
                                  ),
                                ),
                                visualDensity: VisualDensity(vertical: -4.h),
                                title: Text(
                                  suggestionList[index].name,
                                  style: GoogleFonts.montaguSlab(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                subtitle: Text(
                                  suggestionList[index].number,
                                  style: GoogleFonts.montaguSlab(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                trailing: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24.w, vertical: 9.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.r),
                                      color: Colors.yellow.shade700),
                                  child: InkWell(
                                      child: Text(
                                        "ADD",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.montaguSlab(
                                            fontSize: 9.sp,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      onTap: () {}),
                                ),
                              ),
                              Divider(
                                endIndent: 15.w,
                              )
                            ],
                          );
                        })))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<NewUsers> newUsersList = [
  NewUsers(name: "Mark", number: "01774142172", image: "assets/images/u1.png"),
  NewUsers(
      name: "Angela", number: "01774142172", image: "assets/images/u2.png"),
  NewUsers(name: "Mizan", number: "01774142172", image: "assets/images/u3.png"),
  NewUsers(name: "Oyshe", number: "01774142172", image: "assets/images/u4.png"),
  NewUsers(
      name: "Tonmoy", number: "01774142172", image: "assets/images/u5.png"),
  NewUsers(
      name: "Angelina", number: "01774142172", image: "assets/images/u6.png"),
  NewUsers(
      name: "Rock Brothers",
      number: "01774142172",
      image: "assets/images/u7.png"),
  NewUsers(
      name: "Anne Marie", number: "01774142172", image: "assets/images/u8.png"),
  NewUsers(name: "Hasan", number: "01774142172", image: "assets/images/u9.png"),
  NewUsers(
      name: "Zilany", number: "01774142172", image: "assets/images/u10.png"),
  NewUsers(
      name: "Jahid", number: "01774142172", image: "assets/images/u11.png"),
];

List<NewUsers> suggestionList = [];
checkQuery(String input) {
  suggestionList = newUsersList.where((result) {
    return result.name.toLowerCase().contains(input.toLowerCase());
  }).toList();
}

// Widget newUsers(){
//
//
// }

class NewUsers {
  String name;
  String number;
  String image;
  NewUsers({required this.name, required this.number, required this.image});
}
