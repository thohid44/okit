import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/colors.dart';

class RequestSend extends StatelessWidget {
  const RequestSend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              'assets/images/hamburger-menu.png',
              height: 15,
              width: 15,
            ),
          ),
          onTap: () => Scaffold.of(context).openDrawer(),
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
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: 50.h,
                width: 50.h,
                color: Colors.amber,
              )
            ],
          )
        ],
      ),
    );
  }
}
