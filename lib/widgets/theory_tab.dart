import 'package:flutter/material.dart';
import 'package:mobile_lab/widgets/theory_tabs/module_1_theory.dart';
import 'package:mobile_lab/widgets/theory_tabs/module_2_theory.dart';
import 'package:mobile_lab/widgets/theory_tabs/module_3_theory.dart';
import 'package:mobile_lab/widgets/theory_tabs/module_4_theory.dart';
import 'package:mobile_lab/widgets/theory_tabs/module_5_theory.dart';
import 'package:mobile_lab/widgets/theory_tabs/module_6_theory.dart';
import 'package:mobile_lab/widgets/theory_tabs/module_7_theory.dart';
import 'package:mobile_lab/widgets/theory_tabs/module_8_theory.dart';
import 'package:mobile_lab/widgets/theory_tabs/module_9_theory.dart';

class TheoryTab extends StatefulWidget {
  final int moduleId;

  const TheoryTab({super.key, required this.moduleId});

  @override
  State<TheoryTab> createState() => _TheoryTabState();
}

class _TheoryTabState extends State<TheoryTab> {
  @override
  Widget build(BuildContext context) {
    Widget theoryContent = const SizedBox.shrink();

    if (widget.moduleId == 1) {
      theoryContent = Module2Theory();
    } else if (widget.moduleId == 2) {
      theoryContent = Module4Theory();
    } else if (widget.moduleId == 3) {
      theoryContent = Module5Theory();
    } else if (widget.moduleId == 4) {
      theoryContent = Module6Theory();
    } else if (widget.moduleId == 5) {
      theoryContent = Module3Theory();
    } else if (widget.moduleId == 6) {
      theoryContent = Module1Theory();
    } else if (widget.moduleId == 7) {
      theoryContent = Module7Theory();
    } else if (widget.moduleId == 8) {
      theoryContent = Module8Theory();
    } else if (widget.moduleId == 9) {
      theoryContent = Module9Theory();
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Теория',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Expanded(child: theoryContent),
        ],
      ),
    );
  }
}