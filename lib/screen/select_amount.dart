import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:okit/constant/pref_keys.dart';
import 'package:okit/constant/text.dart';
import 'package:okit/model/topup_model.dart';
import 'package:okit/network/api_service.dart';
import 'package:provider/provider.dart';

class SelectAmount extends StatefulWidget {
  final operatorId;
  final operator;
  final number;
  final name;
  final uniquekey;
  SelectAmount({
    required this.operatorId,
    required this.name,
    required this.operator,
    required this.number,
    required this.uniquekey,
  });

  @override
  State<SelectAmount> createState() => _SelectAmountState();
}

class _SelectAmountState extends State<SelectAmount> {
  TextEditingController amountController = TextEditingController();
  String access_token =
      "eyJraWQiOiI1N2JjZjNhNy01YmYwLTQ1M2QtODQ0Mi03ODhlMTA4OWI3MDIiLCJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxNTM1MCIsImlzcyI6Imh0dHBzOi8vcmVsb2FkbHktc2FuZGJveC5hdXRoMC5jb20vIiwiaHR0cHM6Ly9yZWxvYWRseS5jb20vc2FuZGJveCI6dHJ1ZSwiaHR0cHM6Ly9yZWxvYWRseS5jb20vcHJlcGFpZFVzZXJJZCI6IjE1MzUwIiwiZ3R5IjoiY2xpZW50LWNyZWRlbnRpYWxzIiwiYXVkIjoiaHR0cHM6Ly90b3B1cHMtaHMyNTYtc2FuZGJveC5yZWxvYWRseS5jb20iLCJuYmYiOjE2NTYzOTI0OTUsImF6cCI6IjE1MzUwIiwic2NvcGUiOiJzZW5kLXRvcHVwcyByZWFkLW9wZXJhdG9ycyByZWFkLXByb21vdGlvbnMgcmVhZC10b3B1cHMtaGlzdG9yeSByZWFkLXByZXBhaWQtYmFsYW5jZSByZWFkLXByZXBhaWQtY29tbWlzc2lvbnMiLCJleHAiOjE2NTY0Nzg4OTUsImh0dHBzOi8vcmVsb2FkbHkuY29tL2p0aSI6ImQ1MzlmNWYxLWUwNmItNDAwOC1hZDkyLTljNTA2Nzc1MmU3MiIsImlhdCI6MTY1NjM5MjQ5NSwianRpIjoiNzVlYmMwYzAtMTBiOS00ODkwLTg1MTYtOWYwOTUxZTU3Y2NjIn0.oW8EZIHQxfdV-48dYGVupdC-ajsPvkEpOalrzZCsOI4";
  final _box = GetStorage();
  List rechargeAmnt = [10, 21, 29, 49];
  String getUrl = 'topups-sandbox.reloadly.com';

  Future<void> recharge() async {
    {
      String tok =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5NjZiYTc4Ny02MGY5LTRjN2YtODQ0Ni01Yzg1MzAwNmMyMTYiLCJqdGkiOiJlZWFlMTY0YmJjNmJkODE5MjA2MDhlOTRhOTcwOTRkOWQwZTBlMmM3ZWI2YWQyNDhhZjQ4ZWVjZmNmZDJmNDg3N2Q5YTJlZmZiZWNjNDFjNiIsImlhdCI6MTY1NjMyODg1MC4wMzkzODAwNzM1NDczNjMyODEyNSwibmJmIjoxNjU2MzI4ODUwLjAzOTM4MTAyNzIyMTY3OTY4NzUsImV4cCI6MTY4Nzg2NDg1MC4wMzgyMDk5MTUxNjExMzI4MTI1LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.X5HCFrtYa0BGPP6HjEKmVXb1-bmZulmmNb8nY1CFXyT_SzSbZvdbOXZs4DUunaUcu6sAZ9lAuEzaZgn0yoU7bSthWcVAD2cozwjOLDT7VXxQ0_H-19QrNgiSw-CMPFGRdnmR5lq3HOu9XTwOgL8Q0wkilArupRwg4NllEhckBjp1yP_hS221FmObiFLHuVXzoJdFxkkZs8fJimSfDh-7u20SRkhkhrCoVAeSC-qRmGmxm5Otl-_FR2l0S3kyLVpgxSo_bcivU4C6P9LBiDn5m39-y0e6rtDQ-mVR4xfg5Dt_S3DR0w6mdzmLMsB5nhl_XrOzuaYpjz8io13UtgWmjlU_BK_UuWhaa0bS0huR5_zuCWTSDcmuP_gYXAAdsfTXQNChlAQqaJc4unx3L3t9DFXrENqSW_ljkKsboSSmcQ3ECnx-r8wSrS72L4q3CQauSl1WVFPL7O8YFZ_zmFSgcfHFeckosLemtFr56eTs3ZKQeTB8dO8bKTR4gWiRND9Z6nmiGrJtnLZAFw2vzrCaJlonx6Od2a7kgzK9C8khLP7ktdrLYK_jT7P7LGTKiDNGiolUMSy7JDlg-eBDf5PmzVBRCTaCw6t9zU2VLwkiwW_eFNEC7UWbEjZ9eqop9dgwA6R8zayzOM_SGUvL0C-opTUi1ppK-u55xL1QLJRwwHo";
      final String token = _box.read(PrefKey.token);
      final apiService = Provider.of<ApiService>(context, listen: false);

      TopUpModel topUpModel = TopUpModel(
        access_token: access_token,
        amount: int.parse(amountController.text.toString()),
        useLocalAmount: true,
        customIdentifier: widget.uniquekey,
        operatorId: widget.operatorId.toString(),
        recipientPhone:
            RecipientPhone(countryCode: 'BD', number: widget.number),
      );

      try {
        final response =
            await apiService.topUpMobile(topUpModel, kBearer + tok);
        print(response.statusCode);
        if (response.statusCode == 200) {
          print(response.body!.message);

          //   context.router.push(HomeRoute());
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Amount"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 150,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Text(widget.number),
                  )
                ]),
          ),
          Container(
            margin: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.all(16),
                  width: 60,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: rechargeAmnt.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            // amountController.text = rechargeAmnt[index];
                            // print(amountController.text);
                          });
                        },
                        child: Container(
                            width: 60,
                            height: 30,
                            margin: const EdgeInsets.all(4),
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.red),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: FittedBox(
                                child: Text(
                              rechargeAmnt[index].toString(),
                              textAlign: TextAlign.center,
                            ))),
                      );
                    },
                  ),
                ),
                // const SizedBox(width: 50,),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: TextField(
                    controller: amountController,
                    // keyboardType: TextInputType.number,
                    // decoration: InputDecoration(
                    //     hintText: amountController.text.isEmpty
                    //         ? "0"
                    //         : amountController.text),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward),
                )
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                recharge();
              },
              child: const Text("Recharge"))
        ],
      ),
    );
  }
}
