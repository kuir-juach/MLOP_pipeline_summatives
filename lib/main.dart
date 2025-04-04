import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home_screen.dart';
import 'screens/prediction_screen.dart';
import 'screens/visualization_screen.dart';
import 'screens/retrain_screen.dart';

void main() {
  runApp(const DropoutPredictorApp());
}

class DropoutPredictorApp extends StatelessWidget {
  const DropoutPredictorApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            Brightness.light, // Changed to light for dark background
      ),
    );

    return MaterialApp(
      title: 'Dropout Predictor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A1A3A), // Dark blue color
          foregroundColor: Colors.white, // White text/icons
          elevation: 0,
          centerTitle: true,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF0A1A3A), // Dark blue color
          selectedItemColor: Colors.white, // White selected icon
          unselectedItemColor:
              Colors.white70, // Slightly transparent white for unselected
          type: BottomNavigationBarType.fixed,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    PredictionScreen(),
    VisualizationScreen(),
    RetrainScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropout Predictor'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Prediction',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Visualization',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.model_training),
            label: 'Retrain',
          ),
        ],
      ),
    );
  }
}
