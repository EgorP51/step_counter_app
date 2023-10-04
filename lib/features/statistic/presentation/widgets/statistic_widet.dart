import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StatisticWidget extends StatelessWidget {
  const StatisticWidget({super.key, this.user});

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Text(user?.email ?? 'no'),
    );
  }
}
