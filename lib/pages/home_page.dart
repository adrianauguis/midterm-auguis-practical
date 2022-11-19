import 'package:flutter/material.dart';
import 'package:midterm_auguis/pages/form_page.dart';

import '../models/subject.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List <Subject> newSubject = [];
  var reciever;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adrian Auguis - Midterm Exam'),
      ),
      body: ListView.builder(
          itemCount: newSubject.length,
          itemBuilder: (context, index){
            var data = newSubject[index];
            return ExpansionTile(
              title: Text(data.name),
              subtitle: Text('Instructor: ${data.instructor}'),
              leading: const Icon(Icons.menu_book),
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Lecture Schedule: ${data.lectSched}'),
                          Text('Laboratory Schedule: ${data.labSched}')
                        ],
                      )
                    ],
                  ),
                )
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          reciever = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context)=> const FormPage()));
          if (reciever != null){
            setState(() {
              newSubject.add(reciever);
            });
          }else{
            return null;
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
