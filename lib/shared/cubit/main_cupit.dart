
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/shared/cubit/main_states.dart';
import 'package:todo/shared/network/local/cache_helper.dart';


class Maincubit extends Cubit<MainStates>{

  Maincubit(super.initialState);

  static Maincubit get(context) => BlocProvider.of(context);


  ThemeMode mode = ThemeMode.dark ;
  
  bool isDark = false ;
  void themode ({bool? fromshared})
  {

    if(fromshared != null){
        isDark = fromshared ;
        emit(Darkmodestate());

    }
    else{
        isDark =!isDark;
        
       CacheHelper.putbool(key:'isDark' , value : isDark ).then((value){
         emit(Darkmodestate());

    });

    }
    

    
  }
 

}