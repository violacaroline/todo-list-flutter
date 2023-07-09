import 'package:flutter/material.dart';

class TodoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TodoAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.amber,
      title: const Text('Todo´s don´t forget!'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}