import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {

    // final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
    //     ? CircleAvatar(child: Icon(Icons.person))
    //     : CircleAvatar(backgroundImage: CachedNetworkImageProvider(user.avatarUrl));

    final avatar = CircleAvatar(child: Icon(Icons.person));

    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user,
                );
              },
              color: Colors.orange,
              icon: Icon(Icons.edit),
              ),
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text('Excluir'),
                      content: Text('Tem certeza? Que deseja excluir o usuário '+user.name),
                      actions: [
                        FlatButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: Text('SIM exclui o '+user.name),
                        ),
                        FlatButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: Text('NÃO'),
                        ),
                      ],
                    )
                ).then((confirmed){
                  if(confirmed){
                    Provider.of<Users>(context, listen: false).remove(user);
                  }
                });
              },
              color: Colors.red,
              icon: Icon(Icons.delete),
              ),
            ],
          ),
      ),
    );
  }
}
