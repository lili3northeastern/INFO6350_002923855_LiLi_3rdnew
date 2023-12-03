import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Animations Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildHeroContainer(context, 'heroTag1', Colors.blue, HeroAnimationType.standard),
          SizedBox(height: 20),
          buildHeroContainer(context, 'radialHeroTag1', Colors.red, HeroAnimationType.radial),
          SizedBox(height: 20),
          buildHeroContainer(context, 'translateHeroTag1', Colors.green, HeroAnimationType.translate),
          SizedBox(height: 20),
          buildHeroContainer(context, 'scaleHeroTag1', Colors.orange, HeroAnimationType.scale),
          SizedBox(height: 20),
          buildHeroContainer(context, 'opacityHeroTag1', Colors.purple, HeroAnimationType.opacity),
        ],
      ),
    );
  }

  Widget buildHeroContainer(BuildContext context, String tag, Color color, HeroAnimationType animationType) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              tag: tag,
              color: color,
              animationType: animationType,
            ),
          ),
        );
      },
      child: buildHeroByType(tag, color, animationType),
    );
  }

  Widget buildHeroByType(String tag, Color color, HeroAnimationType animationType) {
    switch (animationType) {
      case HeroAnimationType.standard:
        return Hero(
          tag: tag,
          child: Container(
            width: 100,
            height: 100,
            color: color,
          ),
        );
      case HeroAnimationType.radial:
        return Hero(
          tag: tag,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
        );
      case HeroAnimationType.translate:
        return Hero(
          tag: tag,
          child: Transform.translate(
            offset: Offset(50, 0),
            child: Container(
              width: 100,
              height: 100,
              color: color,
            ),
          ),
        );
      case HeroAnimationType.scale:
        return Hero(
          tag: tag,
          child: Transform.scale(
            scale: 1.5,
            child: Container(
              width: 100,
              height: 100,
              color: color,
            ),
          ),
        );
      case HeroAnimationType.opacity:
        return Hero(
          tag: tag,
          child: Container(
            width: 100,
            height: 100,
            color: color.withOpacity(0.5),
          ),
        );
    }
  }
}

class DetailScreen extends StatelessWidget {
  final String tag;
  final Color color;
  final HeroAnimationType animationType;

  DetailScreen({required this.tag, required this.color, required this.animationType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: buildHeroByType(tag, color, animationType),
      ),
    );
  }

  Widget buildHeroByType(String tag, Color color, HeroAnimationType animationType) {
    switch (animationType) {
      case HeroAnimationType.standard:
        return Hero(
          tag: tag,
          child: Container(
            width: 200,
            height: 200,
            color: color,
          ),
        );
      case HeroAnimationType.radial:
        return Hero(
          tag: tag,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
        );
      case HeroAnimationType.translate:
        return Hero(
          tag: tag,
          child: Transform.translate(
            offset: Offset(150, 0),
            child: Container(
              width: 200,
              height: 200,
              color: color,
            ),
          ),
        );
      case HeroAnimationType.scale:
        return Hero(
          tag: tag,
          child: Transform.scale(
            scale: 2.0,
            child: Container(
              width: 200,
              height: 200,
              color: color,
            ),
          ),
        );
      case HeroAnimationType.opacity:
        return Hero(
          tag: tag,
          child: Container(
            width: 200,
            height: 200,
            color: color.withOpacity(0.5),
          ),
        );
    }
  }
}

enum HeroAnimationType {
  standard,
  radial,
  translate,
  scale,
  opacity,
}
