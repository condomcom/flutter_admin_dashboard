import 'package:admin/controllers/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: SizedBox()),
          DrawerListTile(
            title: "Главная",
            iconData: Icons.home,
            press: () => menuProvider.selectedPageIndex = 0,
          ),
          DrawerListTile(
            title: "Добавить коференицию",
            iconData: Icons.event,
            press: () => menuProvider.selectedPageIndex = 1,
          ),
          DrawerListTile(
            title: "Добавить пользователя",
            iconData: Icons.people,
            press: () => menuProvider.selectedPageIndex = 2,
          ),
          DrawerListTile(
            title: "Добавить активность",
            iconData: Icons.attractions,
            press: () => menuProvider.selectedPageIndex = 3,
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
