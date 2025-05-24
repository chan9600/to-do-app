import 'package:flutter/material.dart';
import 'package:provider_todo_list/list_view.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo_list/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ProviderPage())],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ListViewPage(),
      ),
    );
  }
}
