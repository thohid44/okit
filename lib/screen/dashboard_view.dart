import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:okit/constant/pref_keys.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:okit/constant/text.dart';
import 'package:okit/model/active_wallets_model.dart';
import 'package:okit/network/api_service.dart';
import 'package:okit/screen/adhelper.dart';
import 'package:okit/screen/set_default_card_view.dart';
import 'package:provider/provider.dart';

import '../model/dashboard_list_model.dart';
import '../shared/layouts/blank_layout.dart';
import '../shared/widgets/string_widgets.dart';
import '../values/colors.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final TextEditingController type = TextEditingController();
  final TextEditingController cardNumber = TextEditingController();
  final TextEditingController cvv = TextEditingController();
  final TextEditingController month = TextEditingController();
  final TextEditingController year = TextEditingController();

  List? item;
  List<String> items = [
    "Visa Card",
    "Master Card",
  ];
  String? seletedCard;

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));

  // String expiryDate = '';
  // int? cardType;
  // int? cvvCode;
  // bool isCvvFocused = false;
  // bool useGlassMorphism = false;
  // bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> cardKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void initState() {
    getRequest();

    super.initState();

    _bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: AdHelper.bannerAdUnitId,
        listener: BannerAdListener(onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        }, onAdFailedToLoad: (ad, error) {
          print("Failed Ads load");
          _isBannerAdReady = false;
          ad.dispose();
        }),
        request: AdRequest())
      ..load();
  }

  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  void bottomsheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(shrinkWrap: true, children: [
                SizedBox(
                  height: 20,
                ),
                // DropdownButtonHideUnderline(
                //   child: DropdownButton<String>(
                //     focusColor: Colors.grey,
                //     borderRadius: BorderRadius.circular(8),
                //     value: seletedCard ?? '1',
                //     items: items!.map(buildMenuItem).toList(),
                //     onChanged: (value) {
                //       setState(() {
                //         seletedCard = value;
                //       });
                //     },
                //   ),
                // ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "type";
                      } else {
                        return null;
                      }
                    },
                    controller: type,
                    decoration: InputDecoration(
                      hintText: "Card Type",
                      hintStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        gapPadding: 4.6,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.length < 16) {
                        return "Card Number Must Be 16 Characters";
                      }
                      if (value.isEmpty) {
                        return "Card Number";
                      } else {
                        return null;
                      }
                    },
                    controller: cardNumber,
                    decoration: InputDecoration(
                      labelText: "Card Number",
                      hintText: "XXXX XXXX XXXX XXXX",
                      hintStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        gapPadding: 4.6,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Month";
                      } else {
                        return null;
                      }
                    },
                    controller: month,
                    decoration: InputDecoration(
                      hintText: "Month",
                      labelText: "Month",
                      hintStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        gapPadding: 4.6,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Year";
                      } else {
                        return null;
                      }
                    },
                    controller: year,
                    decoration: InputDecoration(
                      hintText: "Year",
                      labelText: "Year",
                      hintStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        gapPadding: 4.6,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "cvv number requird";
                      } else {
                        return null;
                      }
                    },
                    controller: cvv,
                    decoration: InputDecoration(
                      hintText: "CVV number",
                      labelText: "CVV Number",
                      hintStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        gapPadding: 4.6,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    primary: const Color(0xff1b447b),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    child: const Text(
                      'Add Card',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'halter',
                        fontSize: 14,
                        package: 'flutter_credit_card',
                      ),
                    ),
                  ),
                  onPressed: () {
                    addPaymentCard();

                    print("object");
                  },
                ),
                SizedBox(
                  height: 8,
                ),
              ]),
            ));
  }

  final _box = GetStorage();
  Future<ActiveWalletsModel?> getRequest() async {
    ActiveWalletsModel? activeWallets;
    final String token = _box.read(PrefKey.token);

    final apiService = Provider.of<ApiService>(context, listen: false);
    var response = await apiService.getActiveWallets(kBearer + token);
    print(response.body);
    if (response.isSuccessful) {
      activeWallets = response.body;
    }
    // print(activeWallets);
    return activeWallets;
  }

  Future<void> addPaymentCard() async {
    {
      String token =
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5NjZiYTc4Ny02MGY5LTRjN2YtODQ0Ni01Yzg1MzAwNmMyMTYiLCJqdGkiOiI1ZWRiYzMxNTllZGRhM2ZkNDgyMGI0MDc1NGI0NDg2MTY3MDBlYWJiNTY2MGFmZTRhMWEwNjdkNzg5ZDQ3YWI3NTQ0NWFmZmYwYzMzODE2NyIsImlhdCI6MTY1NjIxNzUyNy4yNDM1MDY5MDg0MTY3NDgwNDY4NzUsIm5iZiI6MTY1NjIxNzUyNy4yNDM1MDgxMDA1MDk2NDM1NTQ2ODc1LCJleHAiOjE2ODc3NTM1MjcuMjQyMzg4OTYzNjk5MzQwODIwMzEyNSwic3ViIjoiMiIsInNjb3BlcyI6W119.f196eIFhpOt20Ag5LoxQVsR0E35VGeDZPjsljmZ0Sc0vy-mrDWy2WnQHsSBsZ1PH_pzW4sJqF4rcVYbUqzUyrAkYXAdMFOWSmg2dsFw6A37tl42a5G3awtL9ptl-nfUxpSkYZZMb4SgKC2fsrP3EEan3_uAJCy9-IPcl85mIAQrduZCF96h1iPZJpy1LdkQhBhP6BuDHezClV59v3gJVY5IeBUXyOkoUD-crNqGHbFsC9jNyISUaTsYbQgRECFn4XODZ5RLjjCgiU9MQ5UCQSqBmu6AY8-PHTLCd-lQ6lSi75y6-uXzw_UmANiwBRlujuQWqo9cGWAqrWh5bpP0C3LfdHL6HQ7AxY29bDGJz8izbvl9OquZEEmh7qT1Zix7PgJPHvirveB1UhwlFEdl7M8o4MqPna7FxAEb86Yd60v84leUeEYgFxVED7TGJX9jogdJyq4EyJQOTXprIHHCAsIPpGjj3jN9Mfh0_l74hrubkje51u8YLK5Ipb3VmUhRlhWGQZFPsUj6JeQey3cOyWZ628cyeP7liC8b5O-SiwTkwiecUBKb0F95P7DNoHNCLSuYxXRfQC2XvfU5gzXU7jk8nl2gnYbyErjczVvqCKp8KYlgHSpeZPKJgxsUiwGyarCX-bRnM-wMphbIIth9OaupHg9OFzuE0tkxjQgPaC2k';
      final apiService = Provider.of<ApiService>(context, listen: false);

      try {
        final response = await apiService.addPaymentMethod({
          'type': type.text,
          'card_no': cardNumber.text,
          'expiry_month': month.text,
          'expiry_year': year.text,
          'cvc': cvv.text,
        }, kBearer + token);

        if (response.statusCode == 200) {
          var data = response.body;
          print(data);
          //   context.router.push(HomeRoute());
        }
      } catch (e) {
        print(e);
      }
    }
  }

  List<DashboardList> imageList = [
    DashboardList(imagePath: 'assets/images/visa.png', title: "Visa"),
    DashboardList(imagePath: 'assets/images/payPal-logo.png', title: "PayPal"),
    DashboardList(imagePath: 'assets/images/add-icon.png', title: "Add Bank"),
    DashboardList(imagePath: 'assets/images/add-icon.png', title: "Add Card"),
  ];

  List<DropdownMenuItem> get dropdownItems {
    List<DropdownMenuItem> menuItems = [
      DropdownMenuItem(child: Text("Visa Card"), value: 1),
      DropdownMenuItem(child: Text("Master  Card"), value: 2)
    ];
    return menuItems;
  }

  int selectedIndex = 0;
  @override
  @override
  Widget build(BuildContext context) {
    return BlankLayout(
      includeAppBar: true,
      appbar: AppBar(
        backgroundColor: whiteFC,
        title: Center(
          child: Image.asset(
            'assets/images/logo.png',
            height: 30.h,
            width: 60.w,
          ),
        ),
        leading: InkWell(
          child: Center(
            child: Image.asset(
              'assets/images/hamburger-menu.png',
              height: 15.h,
              width: 15.w,
            ),
          ),
          onTap: () => Scaffold.of(context).openDrawer(),
        ),
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {},
                  child: Image.asset('assets/images/notification.png'))
            ],
          )
        ],
        elevation: 0,
      ),
      backgroundColor: whiteFC,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .81,
          width: 500.w,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                margin: EdgeInsets.all(25.h),
                color: secondaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Padding(
                    //   padding: EdgeInsets.symmetric(vertical: 18.0.h),
                    //   child: FutureBuilder(
                    //       future: getRequest(),
                    //       builder: (context, AsyncSnapshot snapshot) {
                    //         if (snapshot.connectionState ==
                    //             ConnectionState.waiting) {
                    //           return Center(child: CircularProgressIndicator());
                    //         }
                    //         return Container(
                    //           height: 150.h,
                    //           child: Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Row(
                    //                 children: [
                    //                   CardTitleText(
                    //                       "0" //     snapshot.data.data.currency.symbol),
                    //                       ),
                    //                   SizedBox(
                    //                     width: 4.h,
                    //                   ),
                    //                   CardTitleText(snapshot.data.data.amount),
                    //                 ],
                    //               ),
                    //               ButtonText('Total Balance'),
                    //             ],
                    //           ),
                    //         );
                    //       }),
                    // ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset(
                          'assets/images/dots.png',
                          height: 30.h,
                          width: 50.w,
                        ),
                        Container(
                          child: FutureBuilder(
                              future: getRequest(),
                              builder: (context, AsyncSnapshot snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return Container(

                                      //padding:
                                      //  EdgeInsets.symmetric(vertical: 18.h),
                                      child: Column(
                                    children: [
                                      Text(
                                        '${snapshot.data.data.currency.symbol} ${snapshot.data.data.amount}',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Text("Total Blance",
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white))
                                    ],
                                  ));
                                }
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }),
                        ),
                        Image.asset(
                          'assets/images/ellipse.png',
                          height: 35.h,
                          width: 70.w,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,

                        builder: (context) => Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: ListView.builder(
                              itemCount: cards.length,
                              itemBuilder: (context, index) {
                                String convertedTitle = cards[index].title;

                                return Container(
                                  margin: EdgeInsets.symmetric(vertical: 8.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
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

                        // buildSheet(),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 18.0.h, horizontal: 120.w),
                      child: Text(
                        'Add Money',
                        style: TextStyle(
                            color: yellow09,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      side: BorderSide(width: 1.w, color: yellow09),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 18.0.h, horizontal: 97.w),
                      child: Text(
                        'Withdrawal Money',
                        style: TextStyle(
                            color: yellow09,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      side: BorderSide(width: 1.w, color: yellow09),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Container(
                height: 300.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                ),
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: 18.0.h, left: 18.w, right: 18.w, bottom: 10.h),
                      child: ListTile(
                        onTap: () {
                          if (imageList[index].title == 'Add Card') {
                            bottomsheet(context);
                          }
                        },
                        leading: Container(
                          color: grayE5,
                          height: 50,
                          width: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              imageList[index].imagePath!,
                              height: 15,
                              width: 15,
                            ),
                          ),
                        ),
                        title: Text(
                          imageList[index].title!,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios_outlined,
                            size: 15),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // void onCreditCardModelChange(CreditCardModel? creditCardModel) {
  //   setState(() {});
  // }

  Widget buildSheet() => DraggableScrollableSheet(
        initialChildSize: 0.5,
        builder: (_, controller) => Container(
          decoration: const BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    LabelText('Add Card'),
                    Image.asset(
                      'assets/images/masterCard-logo.png',
                      width: 25,
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: grayBF),
                        onPressed: () {},
                        child: Text('CANCLE'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: secondaryColor),
                        onPressed: () {},
                        child: Text('ADD'),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
