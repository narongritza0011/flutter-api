import 'package:flutter/material.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController avatarController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: ListView(
        children: [
          TextField(
            controller: fnameController,
            decoration: InputDecoration(hintText: 'First Name'),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: lnameController,
            decoration: InputDecoration(hintText: 'Last Name'),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: usernameController,
            decoration: InputDecoration(hintText: 'Username'),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(hintText: 'Password'),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(hintText: 'Email'),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: avatarController,
            decoration: InputDecoration(hintText: 'avatar'),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              submitData();
            },
            child: const Text('Submit'),
          )
        ],
      ),
    );
  }

  void submitData() {
    //Get the data from form
    final fname = fnameController.text;
    final lname = lnameController.text;
    final username = usernameController.text;
    final password = passwordController.text;
    final email = emailController.text;
    final avatar = avatarController.text;
    final body = {
      "fname": fname,
      "lname": lname,
      "username": username,
      "password": password,
      "email": email,
      "avatar": avatar
    };
    //submit data to the server
    //show success or fail message based on status
  }
}
