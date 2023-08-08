
import 'package:bloc/bloc.dart';

class ColorlyCircleCubit extends Cubit<int>{
ColorlyCircleCubit():super(0);
int selected = 0;

changeSelected(value){
  selected=value ;
  emit(value);
}
}