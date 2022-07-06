import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:okit/screen/cash_page_view.dart';
import 'package:okit/screen/profile_view.dart';

import '../routes/router.gr.dart';
import '../shared/widgets/navigation_drawer_widget.dart';
import '../utils/constants.dart';
import '../values/colors.dart';
import '../screen/cash_page_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var _currentPageIndex = 0;
  var tRouter;
  final _box = GetStorage();
  String? _token;
  String _imgPath = '';
  String userName = '';
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        drawer: NavigationDrawerWidget(),
        routes: [
          DashboardRoute(),
          SavingsRoute(),
          CashPageRoute(),
          CardsRoute(),
          ProfileRoute(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          tRouter = tabsRouter;
          return _buildBottomNavBar(tabsRouter);
        });
  }

  Widget _buildBottomNavBar(TabsRouter tabsRouter) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.white,
        primaryColor: colorPrimary,
        textTheme: Theme.of(context).textTheme.copyWith(
              caption: const TextStyle(color: colorPrimary),
            ),
      ),
      child: BottomNavigationBar(
        selectedItemColor: secondaryColor,
        unselectedItemColor: grayE5,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          tabsRouter.setActiveIndex(index);
          setState(() {
            _currentPageIndex = index;
          });
        },
        currentIndex: _currentPageIndex,
        items: [
          bottomNavigationBarItems(icon: Icons.home_filled, label: "Home"),
          bottomNavigationBarItems(icon: Icons.card_giftcard, label: "Savings"),
          bottomNavigationBarItems(icon: Icons.attach_money, label: "Cash"),
          bottomNavigationBarItems(icon: Icons.credit_card, label: "Card"),
          bottomNavigationBarItems(icon: Icons.person, label: "Profile"),
        ],
      ),
    );
  }

  bottomNavigationBarItems({required IconData icon, required String label}) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }

  void _changeTab() {
    //print('pass');
    tRouter.setActiveIndex(4);
    _currentPageIndex = 4;
  }
}


// class HomeView extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomeController>(builder: (controller) {
//       return HomeLayout(
//         drawer: NavigationDrawerWidget(),
//         body: IndexedStack(
//           index: controller.tabIndex,
//           children: [
//             DashboardView(),
//             // SavingsView(),
//             // CashPageView(),
//             // CardsView(),
//             // ProfileView(),
//           ],
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           selectedItemColor: secondaryColor,
//           unselectedItemColor: grayE5,
//           showSelectedLabels: false,
//           showUnselectedLabels: false,
//           onTap: controller.changeTabIndex,
//           currentIndex: controller.tabIndex,
//           items: [
//             bottomNavigationBarItems(icon: Icons.home_filled, label: "Home"),
//             bottomNavigationBarItems(
//                 icon: Icons.card_giftcard, label: "Savings"),
//             bottomNavigationBarItems(icon: Icons.attach_money, label: "Cash"),
//             bottomNavigationBarItems(icon: Icons.credit_card, label: "Card"),
//             bottomNavigationBarItems(icon: Icons.person, label: "Profile"),
//           ],
//         ),
//       );
//     });
//   }
//
//   bottomNavigationBarItems({required IconData icon, required String label}) {
//     return BottomNavigationBarItem(icon: Icon(icon), label: label);
//   }
// }
