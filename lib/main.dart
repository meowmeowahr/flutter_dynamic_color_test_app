/*
Flutter Dynamic Colors Demo
By: meowmeowahr
*/

import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  static final _defaultLightColorScheme =
      ColorScheme.fromSwatch(primarySwatch: Colors.blue);

  static final _defaultDarkColorScheme = ColorScheme.fromSwatch(
      primarySwatch: Colors.blue, brightness: Brightness.dark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
        return App(
          defaultLightColorScheme: _defaultLightColorScheme,
          defaultDarkColorScheme: _defaultDarkColorScheme,
          lightColorScheme: lightColorScheme,
          darkColorScheme: darkColorScheme,
        );
      }),
    );
  }
}

class App extends StatelessWidget {
  const App({
    super.key,
    required ColorScheme defaultLightColorScheme,
    required ColorScheme defaultDarkColorScheme,
    required ColorScheme? lightColorScheme,
    required ColorScheme? darkColorScheme,
  })  : _defaultLightColorScheme = defaultLightColorScheme,
        _defaultDarkColorScheme = defaultDarkColorScheme,
        _lightColorScheme = lightColorScheme,
        _darkColorScheme = darkColorScheme;

  final ColorScheme _defaultLightColorScheme;
  final ColorScheme _defaultDarkColorScheme;

  final ColorScheme? _lightColorScheme;
  final ColorScheme? _darkColorScheme;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return MaterialApp(
      title: 'Flutter Dynamic Colors',
      theme: ThemeData(
        colorScheme: appState.themeColor == -1
            ? (_lightColorScheme ?? _defaultLightColorScheme)
            : appState.themeColor,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: appState.themeColor == -1
            ? (_darkColorScheme ?? _defaultDarkColorScheme)
            : appState.themeColor,
        useMaterial3: true,
      ),
      themeMode: AppState().themeMode,
      home: const HomePage(),
    );
  }
}

class AppState extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  dynamic themeColor = -1;
  void changeThemeColor(newColor) {
    themeColor = newColor;
    notifyListeners();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Flutter Dynamic Colors"),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 10),
                const Icon(Icons.brush),
                const SizedBox(width: 10),
                Text(
                  'Color Scheme',
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                      appState.changeThemeColor(-1);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(84, 84), //////// HERE
                    ),
                    child: const Icon(Icons.auto_awesome),
                  ),
                  const VerticalDivider(
                    width: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 0,
                    color: Colors.grey,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      appState.changeThemeColor(ColorScheme.fromSeed(
                          seedColor: Colors.red, brightness: Brightness.dark));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(84, 84),
                      backgroundColor: Colors.red,
                    ),
                    child: null,
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                      appState.changeThemeColor(ColorScheme.fromSeed(
                          seedColor: Colors.blue, brightness: Brightness.dark));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(84, 84),
                      backgroundColor: Colors.blue,
                    ),
                    child: null,
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                      appState.changeThemeColor(ColorScheme.fromSeed(
                          seedColor: Colors.green,
                          brightness: Brightness.dark));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(84, 84),
                      backgroundColor: Colors.green,
                    ),
                    child: null,
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                      appState.changeThemeColor(ColorScheme.fromSeed(
                          seedColor: Colors.lime, brightness: Brightness.dark));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(84, 84),
                      backgroundColor: Colors.lime,
                    ),
                    child: null,
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                      appState.changeThemeColor(ColorScheme.fromSeed(
                          seedColor: Colors.deepPurple,
                          brightness: Brightness.dark));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(84, 84),
                      backgroundColor: Colors.deepPurple,
                    ),
                    child: null,
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            ),
            const Divider(),
            Row(
              children: [
                const SizedBox(width: 10),
                const Icon(Icons.widgets),
                const SizedBox(width: 10),
                Text(
                  'Demo Widgets',
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Button"),
                      ),
                      const SizedBox(width: 12),
                      const ElevatedButton(
                        onPressed: null,
                        child: Text("Button"),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton.icon(
                        onPressed: () {},
                        label: const Text("Button"),
                        icon: const Icon(Icons.home),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Expanded(child: LinearProgressIndicator()),
                      SizedBox(width: 12),
                      CircularProgressIndicator(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Sample Text"),
                      SizedBox(width: 12),
                      Icon(Icons.block),
                      FlutterLogo()
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                          child: Slider(value: 0.5, onChanged: null)),
                      Expanded(
                          child: Slider(value: 0.5, onChanged: (value) {})),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
