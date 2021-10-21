import 'package:admin/models/user/user.dart';
import 'package:admin/widgets/widgets.dart';
import 'package:flutter/material.dart';

class UserEditScreen extends StatelessWidget {
  const UserEditScreen({
    Key? key,
    this.user,
  }) : super(key: key);

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          user == null
              ? 'Добавление пользователя'
              : 'Редактирование пользователя',
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  CommonTextField(
                    hintText: 'Имя',
                  ),
                  const SizedBox(height: 10),
                  CommonTextField(
                    hintText: 'Фамилия',
                  ),
                  const SizedBox(height: 10),
                  CommonTextField(
                    hintText: 'Отчество',
                  ),
                  const SizedBox(height: 10),
                  CommonTextField(
                    hintText: 'Email',
                    suffixIcon: InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.email,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CommonTextField(
                    hintText: 'Phone',
                    suffixIcon: InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.phone,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CommonTextField(
                    hintText: 'Дата',
                    suffixIcon: InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.calendar_today,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          BottomButton(
            title: 'Сохранить',
          ),
        ],
      ),
    );
  }
}
