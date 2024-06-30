import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'config/bloc_observe.dart';
import 'config/hive_config.dart';
import 'config/routes.dart';
import 'features/authentication/presentation_layer/pages/register.dart';
import 'features/creat_join/presentation_layer/pages/create&join.dart';
import 'injection_container.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  await Hive.initFlutter();
  await setupHive();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // userHive!.delete("token");
    print(userHive!.get("token"));
    return   MaterialApp(
        debugShowCheckedModeBanner:false,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: (userHive!.get("token")==null || userHive!.get("token")=='')?
               Register() : CreateAndJoin(),
      );
  }
}
