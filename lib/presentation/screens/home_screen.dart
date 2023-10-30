import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forms_app/config/router/app_router.dart';


class HomeScreen extends ConsumerWidget {
const HomeScreen({super.key});
static const name = 'HomeScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Scaffold(
     appBar: AppBar( 
       title: const Text('Home'), 
      ),
      body:  ListView(
        children: [
            ListTile( 
              title: const Text('Registro de usuario'),
              subtitle: const Text('Manejo de Formularios'),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () => ref.watch(appRouterProvider).push('/new-user')
            )
        ],
      )
   );
  }
}