import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo/layout/new_app/news_app.dart';
import 'package:todo/shared/cubit/bloc_observer.dart';
import 'package:todo/shared/cubit/main_cupit.dart';
import 'package:todo/shared/cubit/main_states.dart';
import 'package:todo/shared/cubit/newcupit.dart';
import 'package:todo/shared/cubit/newstates.dart';
import 'package:todo/shared/network/local/cache_helper.dart';
import 'package:todo/shared/network/remote/dio_helper.dart';

void main()async {
  // بيتأكد ان كل حاجه ف المثود خلصت وبعدين يفتح الابلكشن
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();


  bool? isDark = CacheHelper.getBool(key: 'isDark');

  runApp(
    MyNews(
      isDark:isDark
      ));
}

class MyNews extends StatelessWidget {

   final bool? isDark;

   const MyNews( {super.key , required this.isDark});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(BuildContext context) => NewCupit(NewsInitialize())..getBusiness()..getSport()..getscience(),),
        BlocProvider(create: (BuildContext context) => Maincubit(InitialStatemain())..themode(fromshared: isDark),
),
      ],
      child: BlocConsumer<Maincubit, MainStates>(
          listener: (BuildContext context, MainStates state) {},
          builder: (BuildContext context, MainStates state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
    
    
              theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.indigo,
        appBarTheme: const AppBarTheme(
          titleSpacing: 20,
          backgroundColor: Colors.indigo,
          elevation: 0.0,
          titleTextStyle: TextStyle(
            // text in app bar
            color: Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor:
                Colors.white, // اول جزء ف الشاشه فوق خالص حته البار
            statusBarIconBrightness:
                Brightness.dark, // الايقونات اللى ف الشاشه نفسها
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
            //color: Colors.white, // in dark
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.indigoAccent,
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.grey),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          bodySmall: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
              
        )),
        
              darkTheme: ThemeData(
        scaffoldBackgroundColor: HexColor('333739'),
        primarySwatch: Colors.indigo,
        appBarTheme: AppBarTheme(
          titleSpacing: 20,
          backgroundColor: HexColor('333739'), // in dark
          elevation: 0.0,
    
          titleTextStyle: const TextStyle(
            // text in app bar
            color: Colors.white, // in dark
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
    
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: HexColor(
                '333739'), // in dark اول جزء ف الشاشه فوق خالص حته البار
            statusBarBrightness: Brightness.light, // in dark
            statusBarIconBrightness:
                Brightness.light, // الايقونات اللى ف الشاشه نفسها
          ),
    
          iconTheme: const IconThemeData(
            color: Colors.white, // in dark
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            backgroundColor: HexColor('333739'),
            selectedItemColor: Colors.indigoAccent,
            unselectedItemColor: Colors.grey),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
    
          bodySmall: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        )),
             
             
              themeMode: Maincubit.get(context).isDark
        ? ThemeMode.dark
        : ThemeMode.light,
    
    
              home: const Directionality(
        textDirection: TextDirection.ltr, child: NewsHome()),
            );
          },
        ),
    );
  }
}
