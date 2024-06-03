import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const platform =
  MethodChannel('com.github.Arifuljava:GrozziieBlutoothSDk:v1.0.1');
  String greeting = '';

  @override
  void initState() {
    super.initState();
    sayHello();
  }

  Future<void> sayHello() async {
    try {
      final response =
      await platform.invokeMethod('attendencemachineAndroidSDK', {'name': 'Flutter'});
      if (response is List<dynamic>) {
        setState(() {
          greeting = response.join(', ');
        });
      } else {
        print('Unexpected response type: $response');
      }
    } on PlatformException catch (e) {
      print('Failed to invoke sayHello: ${e.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter & Java Integration'),
      ),
      body: Center(
        child: Text(greeting),
      ),
    );
  }
}