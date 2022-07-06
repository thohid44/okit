import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:okit/screen/master_card_edit.dart';

class MasterCardSave extends StatelessWidget {
  const MasterCardSave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 228, 225, 225),
          elevation: 0,
          title: const Text(
            'Mastercard',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Color.fromARGB(255, 228, 225, 225),
                height: 184,
                width: 400,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment(0, 45),
                      child: Container(
                        height: 182,
                        width: 291,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: Colors.black),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 30),
                              child: Align(
                                alignment: Alignment(.86, -10),
                                child: Column(
                                  children: [
                                    Text(
                                      'VALID THRU',
                                      style: TextStyle(
                                          fontSize: 8,
                                          color:
                                              Color.fromARGB(255, 71, 70, 70),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Text(
                                      '02/2022',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color:
                                              Color.fromARGB(255, 71, 70, 70),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30, top: 100),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      '**** **** 3082',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color.fromARGB(
                                              255, 192, 184, 184),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'Rahul Sharma',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color.fromARGB(
                                                  255, 192, 184, 184),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 112.w,
                                        ),
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/mastercard.png'))),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Column(
                children: [
                  Container(
                    height: 330.h,
                    width: 291.w,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                'Details',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                  labelText: 'Cardholder Name',
                                  hintText: 'Rahul Sharma',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                  labelText: 'Card Number',
                                  hintText: '**** **** 3082',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 50.h,
                                width: 140.w,
                                child: TextField(
                                  decoration: InputDecoration(
                                      labelText: 'CVV',
                                      hintText: '**g',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              SizedBox(
                                height: 50.h,
                                width: 140.w,
                                child: TextField(
                                  decoration: InputDecoration(
                                      labelText: 'Expiry Date',
                                      hintText: '02/22',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  width: 140.w,
                                  height: 55.h,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MasterCardEdit()));
                                    },
                                    child: const Text(
                                      "CANCEL",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color.fromARGB(
                                                    255, 211, 210, 210)),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10)))),
                                  )),
                              SizedBox(
                                width: 10.w,
                              ),
                              SizedBox(
                                  width: 140.w,
                                  height: 55.h,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MasterCardEdit()));
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
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
