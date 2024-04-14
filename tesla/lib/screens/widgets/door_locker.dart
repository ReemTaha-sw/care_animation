import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constanins.dart';

class Locker extends StatelessWidget {
  final Function() onTap;
  final bool isLock;
  const Locker({super.key, required this.isLock, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedSwitcher(
        switchInCurve: Curves.easeInOutBack,
        transitionBuilder: (child, animation) => ScaleTransition(
          scale: animation,
          child: child,
        ),
        duration: defaultDuration,
        child: isLock
            ? SvgPicture.asset(
                "assets/icons/door_lock.svg",
                key: const ValueKey("lock"),
              )
            : SvgPicture.asset(
                "assets/icons/door_unlock.svg",
              ),
      ),
    );
  }
}
