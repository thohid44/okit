// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;

import '../screen/cards_view.dart' as _i12;
import '../screen/cash_page_view.dart' as _i11;
import '../screen/dashboard_view.dart' as _i8;
import '../screen/home_view.dart' as _i9;
import '../screen/login_view.dart' as _i2;
import '../screen/payment_success_view.dart' as _i6;
import '../screen/profile_info_view.dart' as _i4;
import '../screen/profile_view.dart' as _i13;
import '../screen/savings_view.dart' as _i10;
import '../screen/sign_up_view.dart' as _i3;
import '../screen/splash_screen_view.dart' as _i1;
import '../screen/verification_view.dart' as _i5;
import '../widget/get_you_started_page.dart' as _i7;

class AppRouter extends _i14.RootStackRouter {
  AppRouter([_i15.GlobalKey<_i15.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreenView());
    },
    LoginRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginView());
    },
    SignUpRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SignUpView());
    },
    ProfileInfoRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.ProfileInfoView());
    },
    VerificationRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.VerificationView());
    },
    PaymentSuccessRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.PaymentSuccessView());
    },
    GetStartedRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.GetStartedView());
    },
    DashboardRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.DashboardView());
    },
    HomeRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.HomeView());
    },
    SavingsRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i10.SavingsView());
    },
    CashPageRoute.name: (routeData) {
      final args = routeData.argsAs<CashPageRouteArgs>(
          orElse: () => const CashPageRouteArgs());
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: _i11.CashPageView(key: args.key));
    },
    CardsRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.CardsView());
    },
    ProfileRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.ProfileView());
    }
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig('/#redirect',
            path: '/', redirectTo: '/splash', fullMatch: true),
        _i14.RouteConfig(SplashScreenRoute.name, path: '/splash'),
        _i14.RouteConfig(LoginRoute.name, path: '/loginPage'),
        _i14.RouteConfig(SignUpRoute.name, path: '/sign-up'),
        _i14.RouteConfig(ProfileInfoRoute.name, path: '/profile-info'),
        _i14.RouteConfig(VerificationRoute.name, path: '/verification'),
        _i14.RouteConfig(PaymentSuccessRoute.name, path: '/payment-success'),
        _i14.RouteConfig(GetStartedRoute.name, path: '/GetStarted'),
        _i14.RouteConfig(DashboardRoute.name, path: 'Dashboard'),
        _i14.RouteConfig(HomeRoute.name, path: '/home', children: [
          _i14.RouteConfig(DashboardRoute.name,
              path: 'Dashboard', parent: HomeRoute.name),
          _i14.RouteConfig(SavingsRoute.name,
              path: 'savings', parent: HomeRoute.name),
          _i14.RouteConfig(CashPageRoute.name,
              path: 'cash-page', parent: HomeRoute.name),
          _i14.RouteConfig(CardsRoute.name,
              path: 'cards', parent: HomeRoute.name),
          _i14.RouteConfig(ProfileRoute.name,
              path: 'profile', parent: HomeRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.SplashScreenView]
class SplashScreenRoute extends _i14.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/splash');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.LoginView]
class LoginRoute extends _i14.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/loginPage');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.SignUpView]
class SignUpRoute extends _i14.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: '/sign-up');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i4.ProfileInfoView]
class ProfileInfoRoute extends _i14.PageRouteInfo<void> {
  const ProfileInfoRoute()
      : super(ProfileInfoRoute.name, path: '/profile-info');

  static const String name = 'ProfileInfoRoute';
}

/// generated route for
/// [_i5.VerificationView]
class VerificationRoute extends _i14.PageRouteInfo<void> {
  const VerificationRoute()
      : super(VerificationRoute.name, path: '/verification');

  static const String name = 'VerificationRoute';
}

/// generated route for
/// [_i6.PaymentSuccessView]
class PaymentSuccessRoute extends _i14.PageRouteInfo<void> {
  const PaymentSuccessRoute()
      : super(PaymentSuccessRoute.name, path: '/payment-success');

  static const String name = 'PaymentSuccessRoute';
}

/// generated route for
/// [_i7.GetStartedView]
class GetStartedRoute extends _i14.PageRouteInfo<void> {
  const GetStartedRoute() : super(GetStartedRoute.name, path: '/GetStarted');

  static const String name = 'GetStartedRoute';
}

/// generated route for
/// [_i8.DashboardView]
class DashboardRoute extends _i14.PageRouteInfo<void> {
  const DashboardRoute() : super(DashboardRoute.name, path: 'Dashboard');

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i9.HomeView]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute({List<_i14.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/home', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i10.SavingsView]
class SavingsRoute extends _i14.PageRouteInfo<void> {
  const SavingsRoute() : super(SavingsRoute.name, path: 'savings');

  static const String name = 'SavingsRoute';
}

/// generated route for
/// [_i11.CashPageView]
class CashPageRoute extends _i14.PageRouteInfo<CashPageRouteArgs> {
  CashPageRoute({_i15.Key? key})
      : super(CashPageRoute.name,
            path: 'cash-page', args: CashPageRouteArgs(key: key));

  static const String name = 'CashPageRoute';
}

class CashPageRouteArgs {
  const CashPageRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'CashPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.CardsView]
class CardsRoute extends _i14.PageRouteInfo<void> {
  const CardsRoute() : super(CardsRoute.name, path: 'cards');

  static const String name = 'CardsRoute';
}

/// generated route for
/// [_i13.ProfileView]
class ProfileRoute extends _i14.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}
