// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/shared/components/components.dart';
import 'package:todo/shared/cubit/newcupit.dart';
import 'package:todo/shared/cubit/newstates.dart';

class SportsScreen  extends StatelessWidget {
  const SportsScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocConsumer<NewCupit , NewStates>(
      
      builder:  (BuildContext context, state) {
      
        List bus = NewCupit.get(context).sports;   
       return 
    // //  
    //     state is GetSportsLoading ? 
    //           const Center(child: CircularProgressIndicator()) 
    //              : bus.isEmpty ?  
    //                   const Center(child: Text('No sports items available')) :

     state is GetSportsLoading ? 
              const Center(child: CircularProgressIndicator()) 
                 : bus.isEmpty ?  
                     const Center(child: CircularProgressIndicator())  :
       
         ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context , index) => buiildArticleItem(bus[index],context),
        separatorBuilder: (context , build) =>  const SizedBox( height: 10,),
        itemCount: 10 ,
        
        ) ; },
        listener: (BuildContext context, NewStates state) {  },
         
        
     
    ) ;
    
   }
}