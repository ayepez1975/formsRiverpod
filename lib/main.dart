import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forms_app/config/router/app_router.dart';
import 'package:forms_app/config/theme/app_theme.dart';

void main() => runApp(
    const ProviderScope(child:  MyApp())
  );

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter, 
      theme: AppTheme(isDarkmode: false).getTheme(),
    );
  }
}