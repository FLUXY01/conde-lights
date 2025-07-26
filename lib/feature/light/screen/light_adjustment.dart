import 'package:flutter/material.dart';

class LightAdjustment extends StatefulWidget {
  const LightAdjustment({super.key});

  @override
  State<LightAdjustment> createState() => _LightAdjustmentState();
}

class _LightAdjustmentState extends State<LightAdjustment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Living Room",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
