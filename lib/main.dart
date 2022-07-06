import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logging/logging.dart';
import 'package:okit/network/api_service.dart';
import 'package:okit/routes/router.gr.dart';
import 'package:provider/provider.dart';

import 'routes/router.gr.dart';

void main() async {
  await GetStorage.init();
  _setupLogging();
  runApp(MyApp());
  HttpOverrides.global = MyHttpOverrides();
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(
    (event) {
      print('${event.level.name}: ${event.time}: ${event.message}');
    },
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  static const String _title = 'OKIT';
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiService>(create: (_) => ApiService.create()),
      ],
      builder: (context, child) {
        return ScreenUtilInit(
          designSize: const Size(360, 720),
          builder: (BuildContext context) => MaterialApp.router(
            title: _title,
            routeInformationParser: _appRouter.defaultRouteParser(),
            routerDelegate: _appRouter.delegate(),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}

// class MyApp extends StatelessWidget {
//   MyApp({Key? key}) : super(key: key);

//   static const String _title = 'OKIT';
//   final _appRouter = AppRouter();

//   @override
//   Widget build(BuildContext context) {
//     return Provider(
//       create: (_) => ApiService.create(),
//       dispose: (context, ApiService service) => service.client.dispose(),
//       child: ScreenUtilInit(
//         designSize: const Size(360, 720),
//         builder:(BuildContext context)=> MaterialApp.router(
//           title: _title,
//           routeInformationParser: _appRouter.defaultRouteParser(),
//           routerDelegate: _appRouter.delegate(),
//           debugShowCheckedModeBanner: false,
//         ),
//       ),
//     );
//   }
// }
