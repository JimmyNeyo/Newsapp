
// ignore_for_file: avoid_print
//https://newsapi.org/v2/top-headlines?country=eg&category=business&apikey=65f7f556ec76449fa7dc7c0069f040ca
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/modules/Business/business.dart';
import 'package:todo/modules/science/science.dart';
import 'package:todo/modules/sports/sports.dart';
import 'package:todo/shared/cubit/newstates.dart';
import 'package:todo/shared/network/remote/dio_helper.dart';

class NewCupit extends Cubit<NewStates>{

  NewCupit(super.initialState);

  static NewCupit get(context) => BlocProvider.of(context);

  List<Widget> screen = [
    
    const BusinessScreen(),
    const SportsScreen(),
    const ScienseScreen(),


  ]; 

  List<BottomNavigationBarItem>  bottomnavicon =[
      
              const BottomNavigationBarItem(
                icon:Icon(Icons.business),
                label : 'Business',
              )
               ,const BottomNavigationBarItem(
                icon:Icon(Icons.science),
                label : 'Sports',
              )
             , const  BottomNavigationBarItem(
                icon:Icon(Icons.sports),
                label : 'Science',
              ),

  ];

  var index = 0 ;

  void  onTapinnavbar(value){

     index =value;
      if(index == 1){getSport();}
      if(index == 2){getscience();}
     emit(OnTapInNavBar());

  }


List<dynamic> business = [] ;

void  getBusiness()
  {
    emit(GetBusinessLoading());

      DioHelper.getData(
           url: 'v2/top-headlines', 
           query:
            {
                'country':'eg',
                'category':'business',
                'apikey':'65f7f556ec76449fa7dc7c0069f040ca',
              }
              ).then((value) {

                 
                //print(value.data.toString());
                business = value.data['articles'];
                emit(GetBusinessSuccess());

              }).catchError((e){
                print(' abdullah be carfully there is error   ${e.toString()}');
                emit(GetBusinessFail(e.toString()));
              });

  }


void getBusindess() {
  emit(GetBusinessLoading());

  DioHelper.getData(
    url: 'v2/top-headlines',
    query: {
      'country': 'eg',
      'category': 'business',
      'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
    },
  ).then((value) {
    if (value.data != null) {
      // Check if 'articles' key exists in the response
      if (value.data.containsKey('articles')) {
        business = value.data['articles'];
        print(business);
        emit(GetBusinessSuccess());
      } else {
        print('Expected key "articles" not found in the response data.');
        emit(GetBusinessFail('Data structure mismatch'));
      }
    } else {
      print('Received null data in the response.');
      emit(GetBusinessFail('Null data in the response'));
    }
  }).catchError((e) {
    print('An error occurred: $e');
    emit(GetBusinessFail(e.toString()));
  });
}



List<dynamic> sports = [] ;
void  getSport()
  {
    emit(GetSportsLoading());


      if(sports.isEmpty){
      DioHelper.getData(
           url: 'v2/top-headlines', 
           query:
            {
                'country':'eg',
                'category':'Sports',
                'apikey':'65f7f556ec76449fa7dc7c0069f040ca',
              }
              ).then((value) {

                 
                //print(value.data.toString());
                sports = value.data['articles'];
                emit(GetSportsSuccess());

              }).catchError((e){
                print(' abdullah be carfully there is error   ${e.toString()}');
                emit(GetSportsFail(e.toString()));
              });
      }
      else{
         emit(GetSportsSuccess());
      }

  }



List<dynamic> science = [] ;
void  getscience()
  {
    emit(GetScienceLoading());
      if(science.isEmpty){
      DioHelper.getData(
           url: 'v2/top-headlines', 
           query:
            {
                'country':'eg',
                'category':'Science',
                'apikey':'65f7f556ec76449fa7dc7c0069f040ca',
              }
              ).then((value) {

                 
                //print(value.data.toString());
                science = value.data['articles'];
                emit(GetScienceSuccess());

              }).catchError((e){
                print(' abdullah  error in science ${e.toString()}');
                emit(GetScienceFail(e.toString()));
              });
      }
      else{
         emit(GetScienceSuccess());
      }
  }


List<dynamic> search = [] ;
void  getsearch(String value)
  {
    emit(GetSearchLoading());

      DioHelper.getData(
           url: 'v2/everything', 
           query:
             {  
                'q':value,
                'apikey':'65f7f556ec76449fa7dc7c0069f040ca',
              }
              ).then((value) {
             
                search = value.data['articles'];
                print(search[0]['title']);

                emit(GetSearchSuccess());

              }).catchError((e){
                print(' abdullah  error in search ${e.toString()}');
                emit(GetSearchFail(e.toString()));
              });

   }


void  gettes()
  {
    emit(GetSearchLoading());

      DioHelper.getData(
           url: 'v2/everything', 
           query:
             {  
                'q':'Tesla',
                'apikey':'65f7f556ec76449fa7dc7c0069f040ca',
              }
              ).then((value) {
             
                search = value.data['articles'];
                print(search[0]['title']);

                emit(GetSearchSuccess());

              }).catchError((e){
                print(' abdullah  error in search ${e.toString()}');
                emit(GetSearchFail(e.toString()));
              });

   }




 }
