import 'package:flutter/material.dart';

const owlUrl =
    'https://raw.githubusercontent.com/flutter/website/main/src/content/assets/images/docs/owl.jpg';

class FadeIn extends StatefulWidget {
  const FadeIn({super.key});
  @override
  State<FadeIn> createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> {
  double opacity = 0;
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Image.network(owlUrl),
      TextButton(
        child: Text(
          show ? 'Show Details' : 'Hide Details',
          style: const TextStyle(color: Colors.blueAccent),
        ),
        onPressed: () => setState(() {
          if (show) {
            show = false;
            opacity = 1;
          } else {
            show = true;
            opacity = 0;
          }
        }),
      ),
      AnimatedOpacity(
        duration: const Duration(seconds: 2),
        opacity: opacity,
        child: const Column(
          children: [
            Text('Type: Owl'),
            Text('Age: 39'),
            Text('Employment: None'),
          ],
        ),
      )
    ]);
  }
}
