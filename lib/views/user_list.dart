import 'package:flutter/material.dart';
import 'package:flutter_crud/components/user_tile.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final users = Provider.of<Users>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.USER_FORM,
                arguments: User(
                  id: '',
                  name: '',
                  email: '',
                  avatarUrl: '',
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete_sweep_rounded),
            onPressed: () {
              users.removeAll();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
        ),
    );
  }
}