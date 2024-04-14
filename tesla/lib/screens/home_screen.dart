import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tesla/screens/widgets/custom_bottom_navigation.dart';
import '../constanins.dart';
import '../home_controller.dart';
import 'widgets/door_locker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomeController _homeController = HomeController();
  // int customeNavigationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _homeController,
        builder: (context, _) {
          return Scaffold(
            bottomNavigationBar: CustomBottomNavigation(
              onTap: (index) {
                _homeController.onSelecte(index);
                print("the selected indext = $index");
              },
              selectedTab: _homeController.selectedIndex,
            ),
            body: SafeArea(
              child: LayoutBuilder(builder: (context, constrains) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: constrains.maxHeight * 0.1),
                      child: SvgPicture.asset(
                        "assets/icons/Car.svg",
                        width: double.infinity,
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      right: _homeController.selectedIndex == 0
                          ? constrains.maxWidth * 0.04
                          : constrains.maxWidth / 2.5,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _homeController.selectedIndex == 0 ? 1 : 0,
                        child: Locker(
                            isLock: _homeController.isRightDoorLock,
                            onTap: _homeController.updateRightDoorLock),
                      ),
                    ),
                    AnimatedPositioned(
                      bottom: _homeController.selectedIndex == 0
                          ? constrains.maxHeight * 0.18
                          : constrains.maxHeight / 2.2,
                      duration: defaultDuration,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _homeController.selectedIndex == 0 ? 1 : 0,
                        child: Locker(
                          isLock: _homeController.isBackDoorLock,
                          onTap: _homeController.updateBAckDoorLock,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      top: _homeController.selectedIndex == 0
                          ? constrains.maxHeight * 0.15
                          : constrains.maxHeight / 2.2,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _homeController.selectedIndex == 0 ? 1 : 0,
                        child: Locker(
                          isLock: _homeController.isTopDoorLock,
                          onTap: () => _homeController.updateTopDoorLock(),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: defaultDuration,
                      left: _homeController.selectedIndex == 0
                          ? constrains.maxWidth * 0.04
                          : constrains.maxWidth / 2.5,
                      child: AnimatedOpacity(
                        duration: defaultDuration,
                        opacity: _homeController.selectedIndex == 0 ? 1 : 0,
                        child: Locker(
                          isLock: _homeController.isLeftDoorLock,
                          onTap: () => _homeController.updateLeftDoorLock(),
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: _homeController.selectedIndex == 1 ? 1 : 0,
                      duration: defaultDuration,
                      child: SvgPicture.asset("assets/icons/Battery.svg",
                          width: constrains.maxWidth *
                              0.45), // Don't ever assint a fix value to hight or width
                    ),
                  ],
                );
              }),
            ),
          );
        });
  }
}

// class Doorlocker extends StatelessWidget {
//   const Doorlocker({
//     super.key,
//     required HomeController homeController,
//   }) : _homeController = homeController;

//   final HomeController _homeController;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: () => _homeController.updateRightDoorLock(),
//         child: AnimatedSwitcher(
//           switchInCurve: Curves.easeInOutBack,
//           transitionBuilder: (child, animation) =>
//               ScaleTransition(scale: animation, child: child),
//           duration: defaultDuration,
//           child: _homeController.isRightDoorLock
//               ? SvgPicture.asset(
//                   "assets/icons/door_lock.svg",
//                   key: const ValueKey("lock"),
//                 )
//               : SvgPicture.asset(
//                   "assets/icons/door_unlock.svg",
//                 ),
//         ));
//   }
// }
