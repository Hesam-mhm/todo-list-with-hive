import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiveeeee/features/home_feature/data/my_task_entity.dart';
import 'package:hiveeeee/features/home_feature/presentation/bloc/colorly_circle_cubit.dart';
import 'package:hiveeeee/features/home_feature/presentation/bloc/hive_bloc.dart';
import 'package:hiveeeee/features/home_feature/presentation/bloc/status/read_task_status.dart';
import 'package:hiveeeee/features/home_feature/presentation/widgets/colorly_circle.dart';
class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({super.key});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  
  final TextEditingController _controller = TextEditingController();
  
  Periority periority = Periority.low;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder<HiveBloc,HiveState>(
      builder: (context, state) {
        if(state.readTaskStatus is ReadTaskComplete){
          
          ReadTaskComplete readTaskComplete = state.readTaskStatus as ReadTaskComplete ;
          MyTask? task = readTaskComplete.task ;
          _controller.text = task!.name ;
          periority = task.periority ;
          int index = readTaskComplete.index ;

          return  SafeArea(
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Row(
            children: [
              IconButton(
                  onPressed: () {
                   Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
            ],
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: height / 20,
            ),
            BlocBuilder<ColorlyCircleCubit,int>(
              builder: (context, state) {
                return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        BlocProvider.of<ColorlyCircleCubit>(context).changeSelected(1);               
                        periority = Periority.high;
                      },
                      child: ColorlyCircle(title: "High", color: Colors.red,periority: periority,titleColor: state==1 ? Colors.red : Colors.grey.shade300,)),
                  InkWell(
                      onTap: () {
                        BlocProvider.of<ColorlyCircleCubit>(context).changeSelected(2);               
    
                        periority = Periority.normal;
                      },
                      child: ColorlyCircle(title: "Normal", color: Colors.orange,periority: periority,titleColor: state==2 ? Colors.orange : Colors.grey.shade300)),
                  InkWell(
                      onTap: () {
                        BlocProvider.of<ColorlyCircleCubit>(context).changeSelected(3);               
    
                        periority = Periority.low;
                      },
                      child: ColorlyCircle(title: "Low", color: Colors.blue,periority: periority,titleColor: state==3? Colors.blueAccent : Colors.grey.shade300)),
                ],
              );
              },
              
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: width / 1.2,
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                    label: Text(
                      "add your task",
                    ),
                    border: InputBorder.none),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              MyTask myTask = MyTask(
                  name: _controller.text,
                  isDone: task.isDone,
                  periority: periority);
               BlocProvider.of<HiveBloc>(context).add(UpdateTaskEvent(index: index,task: myTask));
              //  BlocProvider.of<HiveBloc>(context).add(ReadAllTaskEvent());
    
              // ignore: use_build_context_synchronously
              Navigator.of(context).pop();
            },
            label: const Text("save changes")),
      ));
        }
        return Container( );
      },

    );
  }
}
