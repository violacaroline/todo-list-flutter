import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'todo_list.dart';
import 'text_input.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyTodoListPage(title: 'My Todo List Page'),
    );
  }
}

class MyTodoListPage extends StatefulWidget {
  const MyTodoListPage({super.key, required this.title});

  final String title;

  @override
  State<MyTodoListPage> createState() => _MyTodoListState();
}

class _MyTodoListState extends State<MyTodoListPage> {
  List<String> todos = [];
  String? selectedTodo;

  void addTodo(String todo) {
    setState(() {
      selectedTodo = null;
      todos.add(todo);
    });
  }
  void removeTodoAndSetTextField(String todo) {
    setState(() {
      todos.remove(todo);
      selectedTodo = todo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: const TodoAppBar(),
      body: Stack(children: [
          TodoList(
            todos: todos,
            onTodoTap: removeTodoAndSetTextField,
          ),
        Align(
            alignment: Alignment.bottomCenter,
            child: TextInputWidget(
                onPressed: addTodo,
                selectedTodo: selectedTodo,
            )
        )
      ]),
    );
  }
}
