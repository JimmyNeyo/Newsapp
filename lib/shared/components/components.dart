import 'package:flutter/material.dart';
import 'package:todo/modules/WebView/web.dart';

Widget myButton({
  double width = double.infinity,
  Color bg = Colors.blue,
  required Function fun,
  required String text,
  bool isuppercase = true,
  Color colortext = Colors.white,
  double font = 30.0,
  double radius = 15.0,
}) =>
    Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: bg,
      ),

      // Set the border radius here
      child: MaterialButton(
        onPressed: () {
          fun();
        },
        child: Text(
          isuppercase ? text.toUpperCase() : text,
          style: TextStyle(color: colortext, fontSize: font),
        ),
      ),
    );


Widget myTFF({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  Function? onSubmit,
  Function? onchange,
  Function? suffixpressd,
  Function? onTap,
  required Function valida,
  // required String Function(String?) valida,
  required IconData prefix,
  IconData? suffix,
  bool ispassword = false,
  Color? bgcolor,
}) =>
    Container(
      color: bgcolor,
      child: TextFormField(
        obscureText: ispassword,
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          fillColor: Colors.white,
          prefixIcon: Icon(prefix),
          suffixIcon: IconButton(
              icon: Icon(suffix),
              onPressed: () {
                suffixpressd!();
              }),
        ),
        onFieldSubmitted: (String value) {
          onSubmit!();
        },
        onTap: () {
          onTap!();
        },
        onChanged: (value) {
          onchange!(value);
        },
        validator: (value) {
          return valida(value);
        },
      ),
    );


Widget taskItem(Map taskss, context) => Dismissible(
      key: Key(taskss['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(children: [
          CircleAvatar(
            radius: 40,
            child: Text('${taskss['time']}'),
          ),
          const SizedBox(
            width: 40,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${taskss['title']}',
                  style: const TextStyle(
                    color: Colors.pink,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${taskss['data']}',
                  style: const TextStyle(
                    color: Colors.pink,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 40,
          ),
          IconButton(
              onPressed: () {
                //HomeCubit.get(context).updateData(

                //status: 'done', id: taskss['id']

                // );
              },
              icon: Icon(
                Icons.check_box,
                color: Colors.green[800],
              )),
          IconButton(
              onPressed: () {
                // HomeCubit.get(context).updateData(status: 'archived', id: taskss['id']);
              },
              icon: Icon(Icons.archive_outlined, color: Colors.grey[800])),
        ]),
      ),
      onDismissed: (direction) {
        //HomeCubit.get(context).deletdatabase(id: taskss['id']);
      },
    );


Widget buiildArticleItem(takeapi , context) => InkWell(
  onTap: () {
   navigator(context,  WebViewScreen(takeapi['url'],));
  },
  child:   Padding(
  
        padding: const EdgeInsets.all(20.0),
  
        child: Row(
  
          children: [
  
            Container(
  
              width: 120.0,
  
              height: 120.0,
  
              decoration: BoxDecoration(
  
                  borderRadius: BorderRadius.circular(10.0),
  
                  image:  DecorationImage(
  
                      image:  NetworkImage(
  
                           '${takeapi['urlToImage'] ?? 'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg'}',
  
                           
  
                            // remove const 
  
                              
  
                          ),
  
                      fit: BoxFit.cover)),
  
            ),
  
            const SizedBox(
  
              width: 15,
  
            ),
  
             Expanded(
  
              child: SizedBox(
  
                height: 120,
  
                child: Column(
  
                  crossAxisAlignment: CrossAxisAlignment.start,
  
                  mainAxisAlignment: MainAxisAlignment.start,
  
                  children: [
  
                    Expanded(
  
                      child: Text(
  
                        '${takeapi['title']}',
  
                        maxLines: 3,
  
                        overflow: TextOverflow.ellipsis,
  
                        style: Theme.of(context).textTheme.bodyLarge ,
  
                      ),
  
                    ),
  
                    Text(
  
                      '${takeapi['publishedAt']}',
  
                      style: Theme.of(context).textTheme.bodySmall ,
  
                    ),
  
                  ],
  
                ),
  
              ),
  
            )
  
          ],
  
        ),
  
      ),
);


void navigator(context , widget) => Navigator.push(
  context, 
  MaterialPageRoute(builder: (context) => widget)
  
  );



