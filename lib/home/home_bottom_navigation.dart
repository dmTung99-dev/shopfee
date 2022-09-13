
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shopfee/home/home_page.dart';

class HomeNavigationPage extends StatefulWidget {
  const HomeNavigationPage({Key? key}) : super(key: key);

  @override
  State<HomeNavigationPage> createState() => _HomeNavigationPageState();
}

class _HomeNavigationPageState extends State<HomeNavigationPage> {
  late PersistentTabController _controller;
  // int _selectedIndex = 0;
  // List pages = [
  //   const HomePage(),
  //   Container(child: const Center(child: Text("Next next page"))),
  //   Container(child: const Center(child: Text("Next next page"))),
  // ];
  // void onTapNav(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  void initState(){
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }
  @override
  void dispose(){
    super.dispose();
  }
  List<Widget> _buildScreens() {
        return [
          HomePage(),
          Container(child: Center(child: Text("Next page"))),
          Container(child: Center(child: Text("Next next page"))),
          // Container(child: Center(child: Text("Next next next page"))),
        ];
    }
  List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.home),
                title: ("Home"),
                activeColorPrimary: Colors.brown,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(Icons.article_outlined),
                title: ("History"),
                activeColorPrimary: Colors.brown,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(Icons.person_outline),
                title: ("Account"),
                activeColorPrimary: Colors.brown,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            // PersistentBottomNavBarItem(
            //     icon: Icon(CupertinoIcons.person),
            //     title: ("Me"),
            //     activeColorPrimary: CupertinoColors.activeBlue,
            //     inactiveColorPrimary: CupertinoColors.systemGrey,
            // ),
        ];
    }
    
       Widget build(BuildContext context) {
    return PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(15.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }


  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: pages[_selectedIndex],
  //     bottomNavigationBar: NavigationBarTheme(
  //       data: const NavigationBarThemeData(
  //         // indicatorColor: Colors.red
  //       ),
  //       child: ClipRRect(
  //         borderRadius: const BorderRadius.only(
  //           topRight: Radius.circular(15),
  //           topLeft: Radius.circular(15),
  //         ),
  //         child: NavigationBar  (
  //           height: 60,
  //           selectedIndex: _selectedIndex,
  //           onDestinationSelected: (int newIndex){
  //             setState(() {
  //               _selectedIndex = newIndex;
  //             });
  //           },
  //           destinations: const[
  //             NavigationDestination(
  //              icon: Icon(Icons.home_outlined), 
  //              selectedIcon: Icon(Icons.home_outlined, color: Colors.brown), 
  //              label: 'Home',
  //             ),
  //             NavigationDestination(
  //               icon: Icon(Icons.article_outlined),
  //               selectedIcon: Icon(Icons.article_outlined, color: Colors.brown), 
  //               label: 'History'
  //             ),
  //             NavigationDestination(
  //                icon: Icon(Icons.person_outline),
  //                selectedIcon: Icon(Icons.person_outline, color: Colors.brown), 
  //               label: 'Account'
  //             ),
  //           ],),
  //       ),
  //     )
  //   );
  // }
}
