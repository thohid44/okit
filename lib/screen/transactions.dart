import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:okit/screen/my_savings.dart';

class Transactions extends StatelessWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            //Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        title: const Text(
          'Transactions',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        'Today',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 284.h,
                  width: 320.w,
                  //color: Colors.blue,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white),
                  child: Column(
                    children: [
                      ListTile(
                        //contentPadding: EdgeInsets.symmetric(vertical: 0),
                        leading: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color.fromARGB(255, 225, 226, 228),
                              image: DecorationImage(
                                  image: AssetImage('assets/amazon.png'))),
                        ),
                        title: const Text(
                          "Amazon Shopping",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text(
                          "7 hrs ago",
                          style: TextStyle(color: Colors.grey),
                        ),
                        trailing: const Text("-\$20.42",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.red)),
                      ),
                      ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color.fromARGB(255, 225, 226, 228),
                              image: DecorationImage(
                                  image: AssetImage('assets/paypal.png'),
                                  fit: BoxFit.cover)),
                        ),
                        title: const Text(
                          "Paypal",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text(
                          "7 hrs ago",
                          style: TextStyle(color: Colors.grey),
                        ),
                        trailing: const Text("-\$70.42",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.green)),
                      ),
                      ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color.fromARGB(255, 225, 226, 228),
                              image: DecorationImage(
                                  image: AssetImage('assets/amazon.png'))),
                        ),
                        title: const Text(
                          "Amazon Shopping",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text(
                          "7 hrs ago",
                          style: TextStyle(color: Colors.grey),
                        ),
                        trailing: const Text("-\$20.42",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.red)),
                      ),
                      ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color.fromARGB(255, 225, 226, 228),
                              image: DecorationImage(
                                  image: AssetImage('assets/paypal.png'),
                                  fit: BoxFit.cover)),
                        ),
                        title: const Text(
                          "Paypal",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text(
                          "7 hrs ago",
                          style: TextStyle(color: Colors.grey),
                        ),
                        trailing: const Text("-\$70.42",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.green)),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        'Yesterday',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 290.h,
                  width: 320.w,
                  //color: Colors.blue,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color.fromARGB(255, 225, 226, 228),
                              image: DecorationImage(
                                  image: AssetImage('assets/amazon.png'))),
                        ),
                        title: const Text(
                          "Amazon Shopping",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text(
                          "7 hrs ago",
                          style: TextStyle(color: Colors.grey),
                        ),
                        trailing: const Text("-\$20.42",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.red)),
                      ),
                      ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color.fromARGB(255, 225, 226, 228),
                              image: DecorationImage(
                                  image: AssetImage('assets/paypal.png'),
                                  fit: BoxFit.cover)),
                        ),
                        title: const Text(
                          "Paypal",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text(
                          "7 hrs ago",
                          style: TextStyle(color: Colors.grey),
                        ),
                        trailing: const Text("-\70.42",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.green)),
                      ),
                      ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color.fromARGB(255, 225, 226, 228),
                              image: DecorationImage(
                                  image: AssetImage('assets/amazon.png'))),
                        ),
                        title: const Text(
                          "Amazon Shopping",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text(
                          "7 hrs ago",
                          style: TextStyle(color: Colors.grey),
                        ),
                        trailing: const Text("-\$20.42",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.red)),
                      ),
                      ListTile(
                        leading: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color.fromARGB(255, 225, 226, 228),
                              image: DecorationImage(
                                  image: AssetImage('assets/paypal.png'),
                                  fit: BoxFit.cover)),
                        ),
                        title: const Text(
                          "Paypal",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text(
                          "7 hrs ago",
                          style: TextStyle(color: Colors.grey),
                        ),
                        trailing: const Text("-\$20.42",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.green)),
                      ),
                    ],
                  ),
                )
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MySavings()));
                },
                child: Text('My Savings'))
          ],
        ),
      ),
    );
  }
}
