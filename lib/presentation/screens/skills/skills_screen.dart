import 'package:flutter/material.dart';

class SkillsScreen extends StatelessWidget {
  static const String name = 'skills_screen';

  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.blue.shade500,
      height: size.height * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      
          Container(
            width: size.width * 0.5,
            height: double.maxFinite,
            color: Colors.green.shade400,
            child: Text('Skills')
          ),
      
          Container(
            width: size.width * 0.28,
            height: double.maxFinite,
            color: Colors.purple.shade300,
            child: Text('Aside')
          ),
      
        ],
      ),
    );
  }
}