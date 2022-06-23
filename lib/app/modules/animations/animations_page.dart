import 'package:flutter/material.dart';

import '../../core/widgets/loading_button.dart';

class AnimationsPage extends StatefulWidget {
  const AnimationsPage({Key? key}) : super(key: key);

  @override
  State<AnimationsPage> createState() => _AnimationsPageState();
}

class _AnimationsPageState extends State<AnimationsPage> with SingleTickerProviderStateMixin {
  //late Tween tween;
  late ColorTween colorTween;
  late AnimationController animationController;
  late Animation<Color?> animation;

  @override
  void initState() {
    super.initState();
    //tween = Tween(begin: 0.0, end: 255.0);
    colorTween = ColorTween(begin: Colors.yellow, end: Colors.black);
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      value: 0,
    );
    //animation = tween.animate(animationController);
    animation = colorTween.animate(animationController);
    animationController.forward();
    animation.addListener(() {
      debugPrint('${animation.value}');
    });
    animationController.addListener(() {
      if (animationController.value == 1) {
        animationController.reverse();
      } else if (animationController.value == 0) {
        animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingButton(
                onTap: () async {
                  //await Future.delayed(const Duration(seconds: 1));
                  //animation.isDismissed ? animationController.forward() : animationController.reverse();
                  animation.isDismissed
                      ? animationController.animateTo(
                          1.0,
                          //curve: Curves.elasticIn,
                          duration: const Duration(milliseconds: 300),
                        )
                      : animationController.animateBack(
                          0.0,
                          //curve: Curves.elasticOut,
                          duration: const Duration(milliseconds: 300),
                        );
                },
                enabled: true,
                label: 'Entrar'),
            // AnimatedBuilder(
            //   animation: animation,
            //   builder: (context, child) {
            //     return Container(
            //       height: animation.value,
            //       width: animation.value,
            //       color: Colors.red,
            //     );
            //   },
            // ),
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Container(
                  height: 255,
                  width: 255,
                  color: animation.value,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
