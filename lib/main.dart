
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hiveeeee/common/utils/app_strings.dart';
import 'package:hiveeeee/features/home_feature/data/my_task_entity.dart';
import 'package:hiveeeee/features/home_feature/presentation/bloc/colorly_circle_cubit.dart';
import 'package:hiveeeee/features/home_feature/presentation/bloc/hive_bloc.dart';
import 'package:hiveeeee/features/home_feature/presentation/screens/home_page.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MyTaskAdapter());
  Hive.registerAdapter(PeriorityAdapter());
  await Hive.openBox<MyTask>(AppStrings.boxName);
  runApp(MultiBlocProvider(
    providers:[
      BlocProvider(create: (context) => ColorlyCircleCubit(),),
      BlocProvider(create: (context) => HiveBloc(),),
    ],
     child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage());
  }
}
