import 'package:flutter/material.dart';
import 'package:provider_todo_list/form.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo_list/provider.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderPage>(
      builder: (context, model1, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.amber,
          title: const Text('Contact List'),
        ),
        body: ListView.builder(
            itemBuilder: (contaxt, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Card(
                    child: Container(
                  width: 320,
                  height: 70,
                  color: Colors.grey[300],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.person,
                          size: 35,
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    model1.contacts[index].title,
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    model1.contacts[index].subTitle,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (contaxt) => const FormWidget()));
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              context
                                  .read<ProviderPage>()
                                  .removeContact(model1.contacts[index]);
                              const snackbar = SnackBar(
                                content: Text('Contact Delete'),
                                duration: Duration(seconds: 2),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackbar);
                            },
                            icon: const Icon(Icons.delete)),
                      ],
                    ),
                  ),
                )
                    /*ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(model1.contacts[index].title),
                    subtitle: Text(model1.contacts[index].subTitle),
                    trailing: IconButton(
                        onPressed: () {
                          context
                              .read<ProviderPage>()
                              .removeContact(model1.contacts[index]);
                          const snackbar = SnackBar(
                            content: Text('Contact Delete'),
                            duration: Duration(seconds: 2),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        },
                        icon: const Icon(Icons.delete)),
                  ),
                  */
                    ),
              );
            },
            itemCount: model1.contacts.length),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const FormWidget()));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
