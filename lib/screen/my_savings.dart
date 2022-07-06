import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:okit/screen/transactions.dart';

class MySavings extends StatelessWidget {
  const MySavings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Transactions()));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: const Text(
            'My Savings',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                  child: Column(children: [
                SizedBox(
                  height: 35.h,
                ),
                Column(
                  children: [
                    Text(
                      'CURRENT SAVINGS',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 80.h,
                          width: 200.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '182 c',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color.fromARGB(255, 247, 202, 3)),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          height: 30.h,
                          width: 170.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Lifetime Score: \$42.73',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 211, 164, 9),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Color.fromARGB(33, 221, 128, 7)),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                    height: 48,
                    child: TabBar(tabs: [
                      Column(
                        children: [
                          Text(
                            'Tips',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        'Option',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    ])),
                SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: TabBarView(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35)),
                                            color: Colors.white),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 25),
                                          child: Column(
                                            children: [
                                              Card(
                                                child: ListTile(
                                                  leading: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: const BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10)),
                                                        color: Color.fromARGB(
                                                            255, 225, 226, 228),
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/amazon.png'))),
                                                  ),
                                                  title: const Text(
                                                    "Shop now with Walmart!",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  subtitle: const Text(
                                                    "00:15",
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                  trailing: const Text(
                                                      "5 - 10 c",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color.fromARGB(
                                                              255,
                                                              248,
                                                              196,
                                                              25))),
                                                ),
                                              ),
                                              Card(
                                                child: ListTile(
                                                  leading: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: const BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10)),
                                                        color: Color.fromARGB(
                                                            255, 225, 226, 228),
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/amazon.png'))),
                                                  ),
                                                  title: const Text(
                                                    "Shop now with Walmart!",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  subtitle: const Text(
                                                    "00:15",
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                  trailing: const Text(
                                                      "5 - 10 c",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color.fromARGB(
                                                              255,
                                                              248,
                                                              196,
                                                              25))),
                                                ),
                                              ),
                                              Card(
                                                child: ListTile(
                                                  leading: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: const BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10)),
                                                        color: Color.fromARGB(
                                                            255, 225, 226, 228),
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/amazon.png'))),
                                                  ),
                                                  title: const Text(
                                                    "Shop now with Walmart!",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  subtitle: const Text(
                                                    "00:15",
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                  trailing: const Text(
                                                      "5 - 10 c",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color.fromARGB(
                                                              255,
                                                              248,
                                                              196,
                                                              25))),
                                                ),
                                              ),
                                              Card(
                                                child: ListTile(
                                                  leading: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: const BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10)),
                                                        color: Color.fromARGB(
                                                            255, 225, 226, 228),
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/amazon.png'))),
                                                  ),
                                                  title: const Text(
                                                    "Shop now with Walmart!",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  subtitle: const Text(
                                                    "00:15",
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                  trailing: const Text(
                                                      "5 - 10 c",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color.fromARGB(
                                                              255,
                                                              248,
                                                              196,
                                                              25))),
                                                ),
                                              ),
                                              Card(
                                                child: ListTile(
                                                  leading: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: const BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10)),
                                                        color: Color.fromARGB(
                                                            255, 225, 226, 228),
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/amazon.png'))),
                                                  ),
                                                  title: const Text(
                                                    "Shop now with Walmart!",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  subtitle: const Text(
                                                    "00:15",
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                  trailing: const Text(
                                                      "5 - 10 c",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color.fromARGB(
                                                              255,
                                                              248,
                                                              196,
                                                              25))),
                                                ),
                                              ),
                                              Card(
                                                child: ListTile(
                                                  leading: Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: const BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10)),
                                                        color: Color.fromARGB(
                                                            255, 225, 226, 228),
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/amazon.png'))),
                                                  ),
                                                  title: const Text(
                                                    "Shop now with Walmart!",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  subtitle: const Text(
                                                    "00:15",
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                  trailing: const Text(
                                                      "5 - 10 c",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color.fromARGB(
                                                              255,
                                                              248,
                                                              196,
                                                              25))),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 75,
                                ),
                                Text(
                                  ' Note: Amount you reedem here will be directly transferred to your OKIT Wallet.',
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                Text(
                                  ' 1.0% per withdraw.',
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                SizedBox(
                                  width: 160.w,
                                  height: 55.h,
                                  child: OutlinedButton(
                                      onPressed: () {},
                                      child: Text(
                                        '1.27 c',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      style: ButtonStyle(
                                          side: MaterialStateProperty.all(
                                              BorderSide(
                                                  color: Colors.grey,
                                                  width: 1)),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))))),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Text(
                                  ' 182 c AVAILABLE.',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                SizedBox(
                                    width: 300.w,
                                    height: 55.h,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Navigator.of(context).push(
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             const MasterCardEdit()));
                                      },
                                      child: const Text(
                                        "SAVE",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.amber),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)))),
                                    )),
                              ]),
                        ),
                      ],
                    ))
              ])),
            ],
          ),
        ),
      ),
    );
  }
}
