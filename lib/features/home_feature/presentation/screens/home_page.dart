import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hiveeeee/common/utils/app_strings.dart';
import 'package:hiveeeee/common/utils/gradiant.dart';
import 'package:hiveeeee/features/home_feature/data/my_task_entity.dart';
import 'package:hiveeeee/features/home_feature/presentation/bloc/hive_bloc.dart';
import 'package:hiveeeee/features/home_feature/presentation/bloc/status/read_all_task_status.dart';
import 'package:hiveeeee/features/home_feature/presentation/screens/edit_task_screen.dart';
import 'package:hiveeeee/features/home_feature/presentation/screens/new_task_screen.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
   BlocProvider.of<HiveBloc>(context).add(ReadAllTaskEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey.shade300,

      ///AppBar
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(height / 7),
          child: Container(
            height: height / 7,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: AppGradiant.appBarGradiant,
                    end: Alignment.centerLeft,
                    begin: Alignment.centerRight)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(children: [
                  SizedBox(
                    width: width / 20,
                  ),
                  const Text(
                    "To Do List",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                ]),

                ///search Box
                SizedBox(
                    width: width / 1.1,
                    height: height / 15,
                    child: TextField(
                      decoration: InputDecoration(
                          iconColor: Colors.grey,
                          prefixIcon: Icon(Icons.search),
                          hintStyle: const TextStyle(color: Colors.grey),
                          hintText: "Search",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16))),
                    ))
              ],
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 15,
              width: width / 1.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("today"),
                  InkWell(
                    onTap: () {
                      BlocProvider.of<HiveBloc>(context).add(DeleteAllTaskEvent());
                    },
                    child: const SizedBox(
                      child: Row(
                        children: [Text("delete all"), Icon(Icons.delete)],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height,
              child: BlocBuilder<HiveBloc, HiveState>(
                builder: (context, state) {
                  if (state.readAllTaskStatus is ReadAllTaskComplete) {
                    ReadAllTaskComplete readAllTaskComplete =
                        state.readAllTaskStatus as ReadAllTaskComplete;
                    List<MyTask>? taskList = readAllTaskComplete.taskList!;
                    print(taskList);
                    return ListView.builder(
                      itemCount: taskList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: width / 15, vertical: height / 200),
                          child: Container(
                            width: width / 1.1,
                            height: height / 15,
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {
                                BlocProvider.of<HiveBloc>(context).add(ReadTaskEvent(index: index));
                                Navigator.push(context, MaterialPageRoute(builder: (context) => EditTaskScreen(),));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      RoundCheckBox(
                                        isChecked: taskList[index].isDone,
                                        size: 20,
                                        onTap: (selected) {
                                          Box<MyTask> box =
                                              Hive.box(AppStrings.boxName);
                                        
                                          box.values.toList()[index].isDone =
                                              selected;
                                          taskList[index].save();
                                        },
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(taskList[index].name,style: TextStyle(decorationStyle: TextDecorationStyle.dashed),))
                                    ],
                                  )
                                        
                                  ///check box
                                  ,
                                  Container(
                                    width: width / 10,
                                    height: height / 15,
                                    color: taskList[index].periority ==
                                            Periority.high
                                        ? Colors.red
                                        : taskList[index].periority ==
                                                Periority.normal
                                            ? Colors.orange
                                            : taskList[index].periority ==
                                                    Periority.low
                                                ? Colors.blueAccent
                                                : Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Container(
                    color: Colors.red,
                  );
                },
              ),
            ),
          ],
        ),
      ),

      /// list of task

      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const NewTaskScreen(),
            ));
          },
          label: const Text("Add Task")),
    ));
  }
}