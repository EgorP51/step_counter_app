import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:step_counter_app/features/statistic/presentation/widgets/statistic_widet.dart';

class StatisticPage extends StatelessWidget {
  const StatisticPage({
    super.key,
    this.user,
  });

  final User? user;

  @override
  Widget build(BuildContext context) {
    return StatisticWidget(user: user);
  }
}
