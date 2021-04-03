import 'package:flutter/material.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';

class FloatingMenu extends StatefulWidget {
  // final String label;
  final AnimatedIconData animatedIcon;
  final List<Bubble> menuItems;
  // final Function onPressHandler;

  const FloatingMenu({
    this.animatedIcon,
    this.menuItems,
  });

  @override
  State<StatefulWidget> createState() => _FloatingMenu();
}

class _FloatingMenu extends State<FloatingMenu>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionBubble(
      items: widget.menuItems,
      // On pressed change animation state
      onPress: () => _animationController.isCompleted
          ? _animationController.reverse()
          : _animationController.forward(),
      iconColor: Colors.white,
      animatedIconData: widget.animatedIcon,
      backGroundColor: primaryDark,
      animation: _animation,
    );
  }
}

class BubbleMenuItem extends Bubble {
  static Bubble create({String label, IconData icon, Function onPress}) {
    return Bubble(
      title: label,
      iconColor: Colors.white,
      bubbleColor: primaryDark,
      icon: icon,
      titleStyle: TextStyle(fontSize: 16, color: Colors.white),
      onPress: onPress,
    );
  }
}
