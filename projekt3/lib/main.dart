import 'package:eyro_toast/eyro_toast.dart';
import 'package:flutter/material.dart';
import 'package:projekt2/ui/global_providers.dart';
import 'package:projekt2/ui/home_screen.dart';

void main() {
  EyroToastSetup.shared.navigatorKey = GlobalKey<NavigatorState>();
  runApp(const GlobalProviders(
    child: HomeScreen(),
  ));
}
