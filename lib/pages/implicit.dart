import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ImplicitPage extends StatefulWidget {
  const ImplicitPage({super.key});

  @override
  State<ImplicitPage> createState() => _ImplicitPageState();
}

class _ImplicitPageState extends State<ImplicitPage> {
  double opacity = 1.0;
  double scale = 1.0;
  double turns = 0.0;
  bool _first = true;
  bool _selected = true;

  void _changeScale() {
    setState(() {
      opacity = opacity == 1.0 ? 0.0 : 1.0;
      scale = scale == 1.0 ? 5.0 : 1.0;
      turns += 1.0 / 4.0;
      _first = !_first;
      _selected = !_selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Implicit Animation'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: _changeScale,
                child: const Text('Start animation'),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: AnimatedOpacity(
                  // value between 0.0 and 1.0
                  opacity: opacity,
                  duration: const Duration(seconds: 3),
                  child: const FlutterLogo(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: AnimatedScale(
                  scale: scale,
                  duration: const Duration(seconds: 2),
                  child: const FlutterLogo(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: AnimatedRotation(
                  turns: turns,
                  duration: const Duration(seconds: 2),
                  child: const FlutterLogo(
                    size: 100,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: AnimatedCrossFade(
                  duration: const Duration(seconds: 3),
                  firstChild: const FlutterLogo(
                      style: FlutterLogoStyle.horizontal, size: 100.0),
                  secondChild: const FlutterLogo(
                      style: FlutterLogoStyle.stacked, size: 100.0),
                  crossFadeState: _first
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: AnimatedContainer(
                  width: _selected ? 150.0 : 100.0,
                  height: _selected ? 100.0 : 150.0,
                  color: _selected ? Colors.red : Colors.blue,
                  alignment: _selected
                      ? Alignment.center
                      : AlignmentDirectional.topCenter,
                  duration: const Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                  child: const FlutterLogo(size: 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
