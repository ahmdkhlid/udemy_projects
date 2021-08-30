import 'package:flutter/material.dart';

class UsersModel {
  final int id;
  final String name;
  final String phone;
  UsersModel({
    required this.id,
    required this.name,
    required this.phone,
  });
}

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<UsersModel> users = [
    UsersModel(id: 1, name: 'Ahmed', phone: '+201090075593'),
    UsersModel(id: 2, name: 'Mahmoud', phone: '+20105175593'),
    UsersModel(id: 3, name: 'Ali', phone: '+20104451593'),
    UsersModel(id: 1, name: 'Ahmed', phone: '+201090075593'),
    UsersModel(id: 2, name: 'Mahmoud', phone: '+20105175593'),
    UsersModel(id: 3, name: 'Ali', phone: '+20104451593'),
    UsersModel(id: 1, name: 'Ahmed', phone: '+201090075593'),
    UsersModel(id: 2, name: 'Mahmoud', phone: '+20105175593'),
    UsersModel(id: 3, name: 'Ali', phone: '+20104451593'),
    UsersModel(id: 1, name: 'Ahmed', phone: '+201090075593'),
    UsersModel(id: 2, name: 'Mahmoud', phone: '+20105175593'),
    UsersModel(id: 3, name: 'Ali', phone: '+20104451593'),
    UsersModel(id: 1, name: 'Ahmed', phone: '+201090075593'),
    UsersModel(id: 2, name: 'Mahmoud', phone: '+20105175593'),
    UsersModel(id: 3, name: 'Ali', phone: '+20104451593'),
    UsersModel(id: 1, name: 'Ahmed', phone: '+201090075593'),
    UsersModel(id: 2, name: 'Mahmoud', phone: '+20105175593'),
    UsersModel(id: 3, name: 'Ali', phone: '+20104451593'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Users'),
        ),
        body: ListView.separated(
          itemBuilder: (context, index) => buildUserItem(users[index]),
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20.0,
              end: 20.0,
            ),
            child: Container(
              height: 1.0,
              width: double.infinity,
              color: Colors.grey[300],
            ),
          ),
          itemCount: users.length,
        ));
  }

  Widget buildUserItem(UsersModel user) => Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          top: 20.0,
          bottom: 10.0,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              child: Text(
                '${user.id}',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "${user.name}",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${user.phone}",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 20.0,
                  ),
                )
              ],
            )
          ],
        ),
      );
}
