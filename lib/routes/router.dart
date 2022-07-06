import 'package:auto_route/annotations.dart';
import 'package:okit/screen/cash_page_view.dart';
import 'package:okit/screen/cards_view.dart';
import 'package:okit/screen/dashboard_view.dart';
import 'package:okit/screen/payment_success_view.dart';
import 'package:okit/screen/profile_info_view.dart';
import 'package:okit/screen/profile_view.dart';
import 'package:okit/screen/request_send.dart';
import 'package:okit/screen/savings_view.dart';
import 'package:okit/screen/settings_view.dart';
import 'package:okit/screen/sign_up_view.dart';
import 'package:okit/widget/get_you_started_page.dart';
import '../screen/home_view.dart';
import '../screen/login_view.dart';
import '../screen/splash_screen_view.dart';
import '../screen/verification_view.dart';
import '../utils/route_paths.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: [
    AutoRoute(path: kRoutePathSplash, page: SplashScreenView, initial: true),
    AutoRoute(path: kRoutePathLogin, page: LoginView),
    AutoRoute(path: SIGN_UP, page: SignUpView),
    AutoRoute(path: PROFILE_INFO, page: ProfileInfoView),
    AutoRoute(path: VERIFICATION, page: VerificationView),
    AutoRoute(path: PAYMENT_SUCCESS, page: PaymentSuccessView),
    // AutoRoute(path: kRoutePathOnBoarding, page: OnBoardingView),
    AutoRoute(path: kRoutePathGetStarted, page: GetStartedView),
    // AutoRoute(path: kRoutePathGetStarted, page: CardsView),
    AutoRoute(path: kRoutePathDashboard, page: DashboardView),
    AutoRoute(
      path: HOME,
      page: HomeView,
      children: [
        AutoRoute(path: kRoutePathDashboard, page: DashboardView),
        //AutoRoute(path: kRoutePathCard, page: RequestSend),
        AutoRoute(path: kRoutePathSaving, page: SavingsView),
        AutoRoute(path: kRoutePathCash, page: CashPageView),
        AutoRoute(path: kRoutePathCard, page: CardsView),
        AutoRoute(path: kRoutePathProfile, page: ProfileView),
        // AutoRoute(path: kRoutePathSettings, page: SettingsView),
      ],
    ),
  ],
)
class $AppRouter {}
