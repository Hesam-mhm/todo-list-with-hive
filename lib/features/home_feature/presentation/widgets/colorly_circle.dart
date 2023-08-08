import 'package:flutter/material.dart';
import 'package:hiveeeee/features/home_feature/data/my_task_entity.dart';

class ColorlyCircle extends StatelessWidget {
  Color color ;
  Color titleColor ;
  String title ;
  Periority periority ;
   ColorlyCircle({super.key,required this.title,required this.color,required this.periority,required this.titleColor});

  @override
  Widget build(BuildContext context) {
        final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width:width/3.5 ,
      height: height/30,
      decoration: BoxDecoration( border: Border.all(color: Colors.grey.shade300)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,style: TextStyle(color: titleColor),),
          SizedBox(width: 10,),
        Container(width: 10,height: 10,
        decoration: BoxDecoration(color: color,
        shape: BoxShape.circle
        )
        ,)
        ],
      ),
    );
  }
}