import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AnimationBuilderScreen());
  }
}

// ignore: must_be_immutable
class ImplicitAnimationScreen extends StatefulWidget {
  const ImplicitAnimationScreen({super.key});

  @override
  State<ImplicitAnimationScreen> createState() =>
      _ImplicitAnimationScreenState();
}

class _ImplicitAnimationScreenState extends State<ImplicitAnimationScreen> {
  double width = 100;

  double height = 100;
  double border = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AnimatedPadding(
            padding: EdgeInsets.all(border),
            duration: Duration(),
            child: AnimatedContainer(
              curve: Curves.easeInExpo,
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(border),
              ),
              duration: Duration(seconds: 2),
            ),
          ),

          ElevatedButton(
            onPressed: () {
              setState(() {});
              width = 200;
              height = 200;
              border = 30;
            },
            child: Text("Start animation"),
          ),
        ],
      ),
    );
  }
}

class TweenAnimationScreen extends StatefulWidget {
  const TweenAnimationScreen({super.key});

  @override
  State<TweenAnimationScreen> createState() => _TweenAnimationScreenState();
}

class _TweenAnimationScreenState extends State<TweenAnimationScreen> {
  // Tween<Color?> colorTween = Tween<Color?>(
  //   begin: Colors.teal,
  //   end: Colors.blueGrey,
  // );

  Tween<double?> wight = Tween<double?>(begin: 1, end: 5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TweenAnimationBuilder(
            duration: Duration(seconds: 1),
            curve: Curves.decelerate,
            builder: (context, val, _) {
              return Container(
                width: 20 * val!,
                height: 200,
                color: Colors.teal,
              );
            },
            tween: wight,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("start tween Animation"),
          ),
        ],
      ),
    );
  }
}

class AnimationBuilderScreen extends StatefulWidget {
  const AnimationBuilderScreen({super.key});

  @override
  State<AnimationBuilderScreen> createState() => _AnimationBuilderScreenState();
}

class _AnimationBuilderScreenState extends State<AnimationBuilderScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> colorAnimation;
  late Animation<double?> sizeAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    colorAnimation = ColorTween(
      begin: Colors.grey,
      end: Colors.red,
    ).animate(controller);

    sizeAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double?>(begin: 50, end: 100), weight: 50),
      TweenSequenceItem(tween: Tween<double?>(begin: 100, end: 25), weight: 25),
      TweenSequenceItem(tween: Tween<double?>(begin: 25, end: 100), weight: 50),
      TweenSequenceItem(tween: Tween<double?>(begin: 100, end: 50), weight: 75),
    ]).animate(controller);
    super.initState();

    controller.addListener(() {
      //print(colorAnimation.value);
      print(sizeAnimation);
    });

    controller.addStatusListener((status) {
      print(status);
      // if (status.isCompleted) {
      //   controller.reverse();
      // }
      // if (status.isDismissed) {
      //   controller.forward();
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Container(
            width: 100,
            height: 200,
            color: Colors.blueGrey,
            child: InkWell(
              onTap: () {
                controller.forward();
                // controller.reverse();
              },
              child: Icon(
                controller.isCompleted
                    ? Icons.favorite
                    : Icons.favorite_border_outlined,
                size: sizeAnimation.value,
                color: colorAnimation.value,
              ),
            ),
          );
        },
      ),
    );
  }
}
