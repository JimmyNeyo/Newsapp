import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/shared/components/components.dart';
import 'package:todo/shared/cubit/newcupit.dart';
import 'package:todo/shared/cubit/newstates.dart';

class Search extends StatelessWidget {
  Search({super.key});

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCupit, NewStates>(
      builder: (BuildContext context, state) {
         List listSearch = NewCupit.get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  
                  child: myTFF(
                    
                    controller: searchController,
                    type: TextInputType.text,
                    label: 'search',
                    valida: (String value) {
                      if (value.isEmpty) {
                        return 'must value';
                      } else {
                        return null;
                      }
                    },
                    // onTap: (){
                    //    NewCupit.get(context).gettes();
                    // },
                    onchange: (value) {
                      // Call the search method to initiate the search
                      NewCupit.get(context).getsearch(value);
                    },
                    prefix: Icons.search,
                  ),
                ), 
                Expanded(
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) { 
                            final article = listSearch[index]; // Assuming listSearch contains your article data
                            return buiildArticleItem(article, context);
                          } ,
                            
                          separatorBuilder: (context, build) =>
                              const SizedBox(height: 10,),
                          itemCount: listSearch.length, // Use the actual count
                          
                        ),
                      ),
                      
              ],
            ),
          ),
        );
      },
      listener: (BuildContext context, state) {},
    );
  }
}
