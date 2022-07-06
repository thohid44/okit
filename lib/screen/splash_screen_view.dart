import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../constant/pref_keys.dart';
import '../routes/router.gr.dart';
import '../shared/layouts/blank_layout.dart';
import '../values/colors.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 2500),
          () {
        //get auth token from cached
        String? token = GetStorage().read(PrefKey.token);

        // if (token == null || token.isEmpty) {
          context.router.push(GetStartedRoute());
        // } else {
        //   context.router.replace(DashboardRoute(type: 'all'));
        // }
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return BlankLayout(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.cover,
              width: 200,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Money in your hand',
                style: TextStyle(color: yellow0E, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
