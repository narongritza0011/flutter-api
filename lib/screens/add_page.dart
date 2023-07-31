import 'package:flutter/material.dart';
import 'package:flutter_api/services/todo_service.dart';
import 'package:flutter_api/utils/snackbar_helper.dart';

class AddTodoPage extends StatefulWidget {
  final Map? todo;
  const AddTodoPage({super.key, this.todo});
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

  bool isEdit = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final todo = widget.todo;
    // print(todo);
    if (todo != null) {
      isEdit = true;
      // final id = todo['id'];
      final fname = todo['fname'];
      final lname = todo['lname'];
      final username = todo['username'];
      // final password = todo['password'];
      // final email = todo['email'];
      final avatar = todo['avatar'];

      fnameController.text = fname;
      lnameController.text = lname;
      usernameController.text = username;
      // passwordController.text = password;
      // emailController.text = email;
      avatarController.text = avatar;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Todo' : 'Add Todo'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: fnameController,
              decoration: InputDecoration(hintText: 'First Name'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: lnameController,
              decoration: InputDecoration(hintText: 'Last Name'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: usernameController,
              decoration: InputDecoration(hintText: 'Username'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(hintText: 'Password'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(hintText: 'Email'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: avatarController,
              decoration: InputDecoration(hintText: 'avatar'),
              keyboardType: TextInputType.multiline,
              minLines: 5,
              maxLines: 8,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              isEdit ? updateData() : submitData();
            },
            child: Text(isEdit ? 'Update' : 'Submit'),
          )
        ],
      ),
    );
  }

  Future<void> updateData() async {
    //Get the data from form
    final todo = widget.todo;
    if (todo == null) {
      print('You can not call updated without todo data');
      return;
    }

    final fname = fnameController.text;
    final lname = lnameController.text;
    final avatar = avatarController.text;
    final id = todo['id'];
    final body = {
      "id": id,
      "fname": fname,
      "lname": lname,
      "avatar": avatar,
    };

    final isSuccess = await TodoService.updateTodo(body);
    //show success or fail message based on status
    if (isSuccess) {
      print(isSuccess);
      showSuccessMessage(context, message: "Updated Successfully");
    } else {
      showErrorMessage(context, message: "Updated Failed");
    }
  }

  Future<void> submitData() async {
    //submit data to the server

    final isSuccess = await TodoService.submitData(body);
    //show success or fail message based on status
    if (isSuccess) {
      fnameController.text = "";
      lnameController.text = "";
      usernameController.text = "";
      passwordController.text = "";
      emailController.text = "";
      avatarController.text = "";
      print(isSuccess);
      showSuccessMessage(context, message: "Created Successfully");
    } else {
      showErrorMessage(context, message: "Created Failed");
    }
  }

  Map get body {
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

    return body;
  }
}
