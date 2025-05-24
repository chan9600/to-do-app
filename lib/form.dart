import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo_list/model.dart';
import 'package:provider_todo_list/provider.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  var name = TextEditingController();
  var phoneNumber = TextEditingController();
  final registerKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderPage>(
      builder: (context, model2, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            title: const Text('Add Contact'),
          ),
          body: SafeArea(
              child: Form(
            key: registerKey,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                      validator: (name) {
                        if (name!.isEmpty) {
                          return 'Please Enter Your Name';
                        }
                        return null;
                      },
                      cursorColor: Colors.red,
                      style: const TextStyle(fontSize: 20),
                      cursorHeight: 25,
                      controller: name,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        hintText: 'Enter Your Name',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                              left: 15, right: 5, top: 25, bottom: 25),
                          child: Icon(
                            Icons.person,
                            color: Colors.grey,
                            size: 28,
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                      maxLength: 10,
                      validator: (phoneNumber) {
                        if (phoneNumber!.isEmpty) {
                          return 'Please Enter Your Name';
                        }
                        return null;
                      },
                      cursorColor: Colors.red,
                      style: const TextStyle(fontSize: 20),
                      cursorHeight: 25,
                      controller: phoneNumber,
                      decoration: const InputDecoration(
                        labelText: 'Phone No:',
                        hintText: 'Enter Your Phone Number',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                              left: 15, right: 5, top: 25, bottom: 25),
                          child: Icon(
                            Icons.call,
                            color: Colors.grey,
                            size: 28,
                          ),
                        ),
                      )),
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (registerKey.currentState!.validate()) {
                            context.read<ProviderPage>().add(Model(
                                title: name.text, subTitle: phoneNumber.text));
                          }
                          name.clear();
                          phoneNumber.clear();
                          Navigator.of(context).pop();
                          const snackbar = SnackBar(
                            content: Text('Contact Saved'),
                            duration: Duration(seconds: 2),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        },
                        child: const Text('Add')),
                  ],
                )
              ],
            ),
          ))),
    );
  }
}
