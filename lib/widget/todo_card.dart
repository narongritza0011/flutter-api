import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final int index;
  final Map item;
  final Function(Map) navigateEdit;
  final Function(String) deleteById;

  const TodoCard({
    super.key,
    required this.index,
    required this.item,
    required this.navigateEdit,
    required this.deleteById,
  });

  @override
  Widget build(BuildContext context) {
    final id = item["id"].toString();
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Image.network(item['avatar']),
        ),
        title: Text(
          item['fname'].toString(),
        ),
        subtitle: Text(
          item['lname'].toString(),
        ),
        trailing: PopupMenuButton(onSelected: (value) {
          if (value == 'edit') {
            //Open Edit Page
            navigateEdit(item);
          } else if (value == 'delete') {
            //delete and refresh
            deleteById(id);
          }
        }, itemBuilder: (context) {
          return [
            const PopupMenuItem(
              value: 'edit',
              child: Text('Edit'),
            ),
            const PopupMenuItem(
              value: 'delete',
              child: Text('Delete'),
            ),
          ];
        }),
      ),
    );
  }
}
