import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:okit/constant/text.dart';
import 'package:okit/model/currency_model.dart';
import 'package:okit/network/api_service.dart';
import 'package:okit/screen/pay_money_page.dart';
import 'package:okit/screen/request_money_page.dart';
import 'package:okit/shared/layouts/blank_layout.dart';
import 'package:okit/state%20management/cash_page_state.dart';
import 'package:provider/provider.dart';

import '../shared/widgets/custom_cash_buttons.dart';
import '../values/colors.dart';

class CashPageView extends StatefulWidget {
  CashPageView({Key? key}) : super(key: key);

  @override
  State<CashPageView> createState() => _CashPageViewState();
}

class _CashPageViewState extends State<CashPageView> {
  void initState() {
    getRequest();
    super.initState();
  }

  final _box = GetStorage();
  Future<SupportedCurrencyModel> getRequest() async {
    SupportedCurrencyModel? currency;

    final tok =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5NjY5ZTNiYi03ODk5LTQwMGQtYWY3Zi1kOGM3YTgzZDMzNDYiLCJqdGkiOiJhZWRkZTZmNDJhNTg2NWQyOGMyMTZiMGRhM2FmZDc2MWFkYmIwY2NiYjY1NTA5ODA2MGI1NTAwNmViNzg0NjM3YjIxMDMzODVmMmZiOGRlYiIsImlhdCI6MTY1NDQ5NjI1Ni41MTE0NjMsIm5iZiI6MTY1NDQ5NjI1Ni41MTE0NjUsImV4cCI6MTY4NjAzMjI1Ni40MzMxNjYsInN1YiI6IjMiLCJzY29wZXMiOltdfQ.SoXBoGQwNKP7cNWpKZ7JiHECL8hXiJaJdVhBuNOkTIhbKw_zUCeDtIOxenx9OgUys-kOg1eKWq-KZhv86ypdWq1muZ7LrxstCDDeOfysMFuTNRACXL-bgXhVOl_9O192_Q5xFC09NZcPejSMoDR1v4kqPRs6PAZduV-aR9PQKAN9X2QCZrPUr2_paCFSJzyKI13QYpyFG6DTkJRpFl0kUNzO0Z_SPnNhAjtH1hki4UbCBExQVkCnO6UBde4dd_yHZ466uiXCTe1CSvFWS3GoUKctVdys3VrsTNhFUcEJOiCbfC_KvlN3_Dg_ZHxhT9FyjUWwebbJYz1_CfH6uMsmLL6niHbPxLIAXzaqNEIBj14EeNR-E-vK_8AlEKMDkdmmIQxtjFRNAKCNrZY9c5fGLr1D0UaHcszDRa38jIplP6sUq7Ou24xZ7xWfgTv-KQpje296zdvsNdelzJjyRKSauX201Ty20q5Oa_U35qVUTzS3FfD2qNZl73wqQm5NXFGT2BRq4kZdlzXC0vLuv7NrAW5dfJJoXBRi1ZbxY_0rM3QXCJwr7VvJ9X__VGYJT60LW00zh_8EStBdVQgGc0Jp90qGPPDjCsVLjKfYuc5dXf-7r6Pq6pGSxnbYRqpjrP6xd6Tu5hFpn3lFUgU0n9HCSX4BGL2M0JBKm2v4Cfz04h0";

    final apiService = Provider.of<ApiService>(context, listen: false);
    var response = await apiService.getSupportCurrency(kBearer + tok);
    print(response.body);
    if (response.isSuccessful) {
      // response.body[0].image!;
      // course = response.body!;

      currency = response.body;

      item!.add(currency);
    }
    print(currency);
    return currency!;
  }

  List? item;
  List<String> items = [
    "usd",
    "BD",
  ];
  String? selectedValue;

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));

  @override
  Widget build(BuildContext context) {
    print(item);

    return BlankLayout(
      includeAppBar: true,
      appbar: AppBar(
        backgroundColor: whiteFC,
        title: Center(
          child: Image.asset(
            'assets/images/logo.png',
            height: 30,
            width: 60,
          ),
        ),
        leading: InkWell(
          child: Center(
            child: Image.asset(
              'assets/images/qr-icon.png',
              height: 15,
              width: 15,
            ),
          ),
        ),
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset('assets/images/notification.png')],
          )
        ],
        elevation: 0,
      ),
      backgroundColor: whiteFC,
      body: ChangeNotifierProvider<CashPageMoneyState>(
          create: (context) => CashPageMoneyState(),
          child: Consumer<CashPageMoneyState>(
            builder: (context, provider, child) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomCashButton(
                              title: "Request",
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RequestMoney()));
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomCashButton(
                              title: "Send",
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PayMoney()));
                              }),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 70,
                      child: FittedBox(
                        child: Text(
                          // context.watch<CashPageMoneyState>().amnt
                          r"$" + provider.amount,
                          style: const TextStyle(
                              fontSize: 60, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),

                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      focusColor: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                      value: selectedValue ?? 'usd',
                      items: items.map(buildMenuItem).toList(),
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          selectedValue = value;
                        });
                      },
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(16.0),
                  //   child: GestureDetector(
                  //     child: Container(
                  //       padding: const EdgeInsets.symmetric(
                  //           horizontal: 15, vertical: 5),
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(20),
                  //           color: Colors.grey.shade300),
                  //       child: Row(
                  //         mainAxisSize: MainAxisSize.min,
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: const [
                  //           Text("USD"),
                  //           Icon(Icons.keyboard_arrow_down),
                  //         ],
                  //       ),
                  //     ),
                  //     onTap: () {
                  //       print("Currency button Pressed");
                  //     },
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        customSingleButton(
                            value: '1',
                            onTap: () {
                              setState(() {});
                              provider.add(value: '1');
                            }),
                        customSingleButton(
                            value: '2',
                            onTap: () {
                              setState(() {});
                              provider.add(value: "2");
                            }),
                        customSingleButton(
                            value: '3',
                            onTap: () {
                              setState(() {});
                              provider.add(value: "3");
                            }),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        customSingleButton(
                            value: '4',
                            onTap: () {
                              setState(() {});
                              provider.add(value: '4');
                            }),
                        customSingleButton(
                            value: '5',
                            onTap: () {
                              setState(() {});
                              provider.add(value: "5");
                            }),
                        customSingleButton(
                            value: '6',
                            onTap: () {
                              setState(() {});
                              provider.add(value: "6");
                            }),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        customSingleButton(
                            value: '7',
                            onTap: () {
                              setState(() {});
                              provider.add(value: '7');
                            }),
                        customSingleButton(
                            value: '8',
                            onTap: () {
                              setState(() {});
                              provider.add(value: "8");
                            }),
                        customSingleButton(
                            value: '9',
                            onTap: () {
                              setState(() {});
                              provider.add(value: "9");
                            }),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 20.0),
                  //   child: CustomRowButton(
                  //     firstValue: "1",
                  //     secondValue: "2",
                  //     thirdValue: "3",
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 20.0),
                  //   child: CustomRowButton(
                  //     firstValue: "4",
                  //     secondValue: "5",
                  //     thirdValue: "6",
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(bottom: 20.0),
                  //   child: CustomRowButton(
                  //     firstValue: "7",
                  //     secondValue: "8",
                  //     thirdValue: "9",
                  //   ),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customSingleButton(
                        value: '.',
                        onTap: () {
                          setState(() {});
                          provider.add(value: '.');
                          // context.read<MoneyTransaction>().add(value: ".");
                        },
                      ),
                      customSingleButton(
                        value: '0',
                        onTap: () {
                          setState(() {});
                          provider.add(value: "0");
                          // context.read<MoneyTransaction>().add(value: "0");
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.backspace_outlined),
                        onPressed: () {
                          setState(() {
                            print(provider.amount);
                          });
                          provider.delete();
                          // context.read<MoneyTransaction>().delete();
                        },
                      ),
                    ],
                  )
                ],
              );
            },
          )),
    );
  }
}
