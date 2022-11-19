import 'package:flutter/material.dart';
import 'package:midterm_auguis/models/subject.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController name = TextEditingController();
  TextEditingController lecSched = TextEditingController();
  TextEditingController labSched = TextEditingController();
  var instructor, sender;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Subject'),
      ),
      body: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(30),
            children: [
              TextFormField(
                controller: name,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Subject Name*',
                    hintText: 'Ex. Mobile Programming'
                ),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter subject name';
                  } else {
                    return null;
                  }
                },
              ),
              const Divider(height: 7),
              DropdownButtonFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Instructor*',
                  ),
                  items: const [
                    DropdownMenuItem(
                        value: 'Adrian Auguis',
                        child: Text('Adrian Auguis')),
                    DropdownMenuItem(
                        value: 'Gisan Dan Raniego',
                        child: Text('Gisan Dan Raniego')),
                    DropdownMenuItem(
                        value: 'Joshua Bracho',
                        child: Text('Joshua Bracho')),
                  ],
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please select instructor';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    instructor = value;
                  }),
              const Divider(height: 7),
              TextFormField(
                controller: lecSched,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Lecture Schedule*',
                    hintText: 'Ex. Monday (10:00AM - 12:00PM)'
                ),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter lecture schedule';
                  } else {
                    return null;
                  }
                },
              ),
              const Divider(height: 7),
              TextFormField(
                controller: labSched,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Laboratory Schedule*',
                    hintText: 'Ex. Saturday (10:00AM - 12:00PM)'
                ),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter laboratory schedule';
                  } else {
                    return null;
                  }
                },
              ),
              const Divider(height: 7),
              ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      sender = await Subject(name: name.text,
                          instructor: instructor,
                          lectSched: lecSched.text,
                          labSched: labSched.text);
                      Navigator.pop(context,sender);
                    }else{
                      return null;
                    }
                  },
                  child: const Text('Submit'))
            ],
          )),
    );
  }
}
