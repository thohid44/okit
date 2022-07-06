import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okit/screen/contact_list_view.dart';
import 'package:okit/shared/layouts/blank_layout.dart';
import 'package:okit/shared/widgets/custom_dropdown_menu_item.dart';
import 'package:okit/shared/widgets/custom_icon.dart';
import 'package:okit/shared/widgets/custom_textfield.dart';

class AutomaticPayView extends StatefulWidget {
  const AutomaticPayView({Key? key}) : super(key: key);

  @override
  State<AutomaticPayView> createState() => _AutomaticPayViewState();
}

class _AutomaticPayViewState extends State<AutomaticPayView> {
  bool switchValue = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _mobile = TextEditingController();
  final TextEditingController amount = TextEditingController();

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          bool isChecked = false;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _mobile,
                        validator: (value) {
                          return value!.isNotEmpty
                              ? null
                              : "Enter Mobile Number";
                        },
                        decoration:
                            InputDecoration(hintText: "Please Enter Text"),
                      ),
                      TextFormField(
                        controller: amount,
                        validator: (value) {
                          return value!.isNotEmpty
                              ? null
                              : "Enter your amount ";
                        },
                        decoration: InputDecoration(
                            hintText: "Please Enter mobile number"),
                      ),
                    ],
                  )),
              title: Text('Stateful Dialog'),
              actions: <Widget>[
                InkWell(
                  child: Text('OK   '),
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // Do something like updating SharedPreferences or User Settings etc.
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController scNoTextController = TextEditingController();
    TextEditingController _mobileNumber = TextEditingController();
    TextEditingController _amount = TextEditingController();
    customBottomSheet({List<Widget>? children, required onProceed}) {
      return showModalBottomSheet(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30))),
          context: context,
          builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Divider(
                    indent: 140,
                    endIndent: 140,
                    thickness: 10,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: _mobileNumber,
                    decoration: InputDecoration(
                      labelText: "Mobile Number",
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: _amount,
                    decoration: InputDecoration(
                      labelText: "Amount",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: children ?? [],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: onProceed,
                    child: Text("Proceed",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montaguSlab(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16)),
                  ),
                ),
              ],
            );
          });
    }

    Color iconColor = Colors.red.shade200;
    return ScreenUtilInit(
      designSize: const Size(360, 720),
      builder: (context) => BlankLayout(
        includeAppBar: true,
        appbar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                context.router.pop();
              },
              icon: const Padding(
                padding: EdgeInsets.only(left: 18.0),
                child: Icon(Icons.arrow_back_ios),
              )),
          title: Text(
            "Automatic Pay",
            style: GoogleFonts.montserrat(
              letterSpacing: 1,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Switch(
                  activeColor: Colors.yellow,
                  value: switchValue,
                  onChanged: (value) {
                    setState(() {
                      switchValue = value;
                    });
                  }),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, bottom: 10.0),
                  child: Text(
                    "Chose Service",
                    style: GoogleFonts.montaguSlab(
                        letterSpacing: 1,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomIcon(
                        title: "Recharge",
                        icon: Icon(
                          Icons.padding,
                          color: iconColor,
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => ContactList()));
                          //  showInformationDialog(context);
                          // customBottomSheet(
                          //     onProceed: () {},
                          //     children: <Widget>[const Text("Recharge pay")]);
                        }),
                    CustomIcon(
                        title: "Electricity\nBill",
                        icon: Icon(
                          Icons.lightbulb,
                          color: iconColor,
                        ),
                        onTap: () {
                          customBottomSheet(
                              onProceed: () {},
                              children: <Widget>[
                                Text(
                                  "Electricity Counter",
                                  style: GoogleFonts.montaguSlab(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                SizedBox(height: 7.h),
                                CustomDropDownMenuItem(
                                    value: "New York",
                                    items: const <String>[
                                      "New York",
                                      "Bangladesh",
                                      "India"
                                    ]),
                                SizedBox(height: 28.h),
                                CustomTextField(
                                  textEditingController: scNoTextController,
                                  title: "Sc. No.",
                                  labelText: "001.02.30",
                                  textInputType: TextInputType.number,
                                ),
                                SizedBox(height: 28.h),
                                CustomTextField(
                                  textEditingController: scNoTextController,
                                  title: "Customer Id",
                                  labelText: "John Patrick",
                                  textInputType: TextInputType.name,
                                ),
                                SizedBox(height: 28.h),
                                CustomTextField(
                                  textEditingController: scNoTextController,
                                  title: "Amount",
                                  labelText: r"$250",
                                  textInputType: TextInputType.number,
                                ),
                                SizedBox(
                                  height: 28.h,
                                ),
                                Text(
                                  "Time Interval",
                                  style: GoogleFonts.montaguSlab(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                SizedBox(height: 7.h),
                                CustomDropDownMenuItem(
                                    value: "30 Days",
                                    items: const <String>[
                                      "30 Days",
                                      "1 month",
                                      "3 months"
                                    ]),
                                // SizedBox(height: 28.h),
                                // Container(
                                //   padding: EdgeInsets.symmetric(horizontal: 20.w),
                                //   height: 52.h,
                                //   width: 300.w,
                                //   decoration: BoxDecoration(
                                //       color: Colors.grey.shade300,
                                //       borderRadius: BorderRadius.circular(10.r)),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //     children: [
                                // Text("New York", style: GoogleFonts.montaguSlab(
                                //     fontSize: 12.sp,
                                //     fontWeight: FontWeight.w400
                                //   ),),
                                //       const Icon(Icons.keyboard_arrow_down, ),
                                //   ],),
                                //   // Center(
                                //   //   child: ListTile(title: Text("New York", style: GoogleFonts.montaguSlab(
                                //   //     fontSize: 12.sp,
                                //   //     fontWeight: FontWeight.w400
                                //   //   ),), trailing: IconButton(icon: Icon(Icons.keyboard_arrow_down, ), onPressed: (){}),),
                                //   // ),
                                // ),
                              ]);
                        }),
                    CustomIcon(
                        title: "Tax",
                        icon: Icon(
                          Icons.payment_outlined,
                          color: iconColor,
                        ),
                        onTap: () {}),
                    CustomIcon(
                        title: "Pay",
                        icon: Icon(
                          Icons.camera_enhance_sharp,
                          color: iconColor,
                        ),
                        onTap: () {}),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomIcon(
                        title: "Donation",
                        icon: Icon(
                          Icons.medical_services_outlined,
                          color: iconColor,
                        ),
                        onTap: () {}),
                    CustomIcon(
                        title: "Insurance",
                        includeFaIcon: true,
                        faIcon: FaIcon(
                          FontAwesomeIcons.umbrellaBeach,
                          color: iconColor,
                        ),
                        onTap: () {}),
                    CustomIcon(
                        title: "Water Bill",
                        icon: Icon(
                          Icons.water_drop,
                          color: iconColor,
                        ),
                        onTap: () {}),
                    CustomIcon(
                        title: "Mortgage",
                        includeFaIcon: true,
                        faIcon: FaIcon(
                          FontAwesomeIcons.handshakeSimple,
                          color: iconColor,
                        ),
                        onTap: () {}),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomIcon(
                        title: "Internet",
                        icon: Icon(
                          Icons.wifi,
                          color: iconColor,
                        ),
                        onTap: () {}),
                    CustomIcon(
                        title: "School Fee",
                        includeFaIcon: true,
                        faIcon: FaIcon(
                          FontAwesomeIcons.graduationCap,
                          color: iconColor,
                        ),
                        onTap: () {}),
                    CustomIcon(
                        title: "Bank\nDeposit",
                        includeFaIcon: true,
                        faIcon: FaIcon(
                          FontAwesomeIcons.buildingColumns,
                          color: iconColor,
                        ),
                        onTap: () {}),
                    CustomIcon(
                        title: "Car Note",
                        includeFaIcon: true,
                        faIcon: FaIcon(
                          FontAwesomeIcons.fileInvoiceDollar,
                          color: iconColor,
                        ),
                        onTap: () {}),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 35.0, vertical: 20),
                  child: Text(
                    "Automated Payments",
                    style: GoogleFonts.montaguSlab(
                        letterSpacing: 1,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView.builder(
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          leading: Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/images/starlink.png"),
                              ),
                            ),
                          ),
                          title: const Text("Metlife Insurance"),
                          subtitle: const Text("30 Days interval"),
                          trailing: const Text(r"$10.00"),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// class CustomPayBillService extends StatelessWidget {
//   const CustomPayBillService({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
//
// }
