import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fully Responsive UI"),
        backgroundColor: Colors.indigoAccent,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          // Use MediaQuery to get size info
          final screenWidth = MediaQuery.of(context).size.width;
          final screenHeight = MediaQuery.of(context).size.height;
          final isTablet = screenWidth > 600;
          final isPortrait = orientation == Orientation.portrait;

          // Choose background based on layout/orientation
          final bgColor = isTablet
              ? Colors.greenAccent.shade100
              : isPortrait
                  ? Colors.blue.shade50
                  : Colors.orange.shade50;

          return Container(
            color: bgColor,
            width: screenWidth,
            height: screenHeight,
            child: Center(
              child: isTablet
                  ? _buildTabletLayout(isPortrait)
                  : _buildMobileLayout(isPortrait),
            ),
          );
        },
      ),
    );
  }

  // Layout for mobile (small screen)
  Widget _buildMobileLayout(bool isPortrait) {
    return isPortrait
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildBox(Colors.red, "Top Box"),
              const SizedBox(height: 20),
              _buildBox(Colors.yellow, "Bottom Box"),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildBox(Colors.red, "Left Box"),
              const SizedBox(width: 20),
              _buildBox(Colors.yellow, "Right Box"),
            ],
          );
  }

  // Layout for tablet/wide screens
  Widget _buildTabletLayout(bool isPortrait) {
    return isPortrait
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildBox(Colors.deepPurple, "Tablet Top"),
              const SizedBox(height: 20),
              _buildBox(Colors.teal, "Tablet Bottom"),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildBox(Colors.deepPurple, "Tablet Left"),
              const SizedBox(width: 20),
              _buildBox(Colors.teal, "Tablet Right"),
            ],
          );
  }

  // Common widget for boxes
  Widget _buildBox(Color color, String label) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 8, spreadRadius: 2)
        ],
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
