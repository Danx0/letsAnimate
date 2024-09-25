import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lets_animate/router.gr.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Lets Animate"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => context.router.push(const ImplicitRoute()),
              child: const Text("Implicit Animation"),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () => context.router.push(const ExplicitRoute()),
              child: const Text("Explicit Animation"),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () => context.router.push(const HeroRoute()),
              child: const Text("Hero"),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () =>
                  context.router.push(const ContainerTransformRoute()),
              child: const Text("Container Transform"),
            ),
          ],
        ),
      ),
    );
  }
}
