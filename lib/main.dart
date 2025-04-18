import 'package:flutter/material.dart';
import 'package:master_plan/models/plan.dart';
import './views/plan_creator_screen.dart';
import './provider/plan_provider.dart';

void main() => runApp(MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PlanProvider(
      notifier: ValueNotifier<List<Plan>>(const []),
      child: MaterialApp(
        title: 'State Management App',
        theme: ThemeData(
          primarySwatch:
              Colors.purple, // Diubah dari Colors.blue ke Colors.purple
        ),
        home: const PlanCreatorScreen(),
      ),
    );
  }
}
