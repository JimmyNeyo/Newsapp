// ignore_for_file: avoid_print
//
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/modules/Search/search.dart';
import 'package:todo/shared/components/components.dart';
import 'package:todo/shared/cubit/main_cupit.dart';
import 'package:todo/shared/cubit/newcupit.dart';
import 'package:todo/shared/cubit/newstates.dart';

class NewsHome extends StatelessWidget {
  const NewsHome({super.key});

  @override
  Widget build(BuildContext context) {
     
    return  BlocConsumer<NewCupit , NewStates>(
        listener: (BuildContext context, NewStates state) {  },
        builder: (BuildContext context, NewStates state) { 
          
          NewCupit coco = NewCupit.get(context);   
          return Scaffold(
          appBar: AppBar(
     // title: coco.screen[coco.index],
     title:  const Text('News'),
     actions: [
       IconButton(onPressed: (){
         navigator(context, Search());
       }, icon:const Icon(Icons.search,size: 35,) ),
       IconButton(onPressed: (){
         Maincubit.get(context).themode();
       }, icon:const Icon(Icons.brightness_4_outlined,size: 35,) ),
       
     ],
          ),
          
         body: coco.screen[coco.index],
          bottomNavigationBar: BottomNavigationBar(
          currentIndex: coco.index,
          onTap: (value){
            coco.onTapinnavbar(value);
          }, items: coco.bottomnavicon,
              
          ),
    
        );
  
         },
     );

    
  }
}