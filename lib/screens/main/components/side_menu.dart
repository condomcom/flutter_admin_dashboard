import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text('ТУТ ЛОГО БУДЕТ'),
          ),
          DrawerListTile(
            title: "Главная",
            iconData: Icons.home,
            press: () {},
          ),
          DrawerListTile(
            title: "Добавить коференицию",
            iconData: Icons.event,
            press: () {},
          ),
          DrawerListTile(
            title: "Добавить пользователя",
            iconData: Icons.people,
            press: () {},
          ),
          DrawerListTile(
            title: "Добавить активность",
            iconData: Icons.attractions,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.iconData,
    required this.press,
  }) : super(key: key);

  final String title;
  final IconData iconData;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: press,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          leading: Icon(
            iconData,
            color: Colors.white54,
            size: 16,
          ),
          title: Text(
            title,
            style: TextStyle(color: Colors.white54),
          ),
        ),
        Divider(
          height: 0,
          indent: 10,
          endIndent: 10,
        ),
      ],
    );
  }
}
