import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

@RoutePage()
class ExplicitPage extends StatefulWidget {
  const ExplicitPage({super.key});

  @override
  State<ExplicitPage> createState() => _ExplicitPageState();
}

class _ExplicitPageState extends State<ExplicitPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late Animation<double> curved;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    curved = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation = Tween<double>(begin: 0, end: 300).animate(curved)
      ..addListener(() {
        setState(() {
          // animations object value has changed so we need this
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0; // 1.0 means normal animation speed.

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Explicit Animation'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: animation.value,
          width: animation.value,
          child: const FlutterLogo(),
        ),
      ),
    );
  }
}
