import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Run Native Code',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _a = 0;
  var _b = 0;
  var _sum = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Run Native'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sum... $_sum',
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(
                    () {
                      _a = int.tryParse(value) ?? 0;
                    },
                  );
                },
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(
                    () {
                      _b = int.tryParse(value) ?? 0;
                    },
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: RawMaterialButton(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(10),
                  fillColor: Colors.black12,
                  onPressed: _calcSum,
                  child: const Icon(
                    Icons.add,
                    size: 35.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _calcSum() async {
    const channel = MethodChannel('dev.bravox/native');
    try {
      final sum = await channel.invokeMethod('calcSum', {"a": _a, "b": _b});
      setState(() {
        _sum = sum;
      });
    } on PlatformException {
      _sum = 0;
    }
  }
}
