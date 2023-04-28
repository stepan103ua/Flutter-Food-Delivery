import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/view/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const FoodDeliveryApp());
}
