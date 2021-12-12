import 'package:admin/models/user/user.dart';
import 'package:admin/redux/app/users/users.dart';
import 'package:admin/redux/redux.dart';
import 'package:admin/utils/di/di.dart';
import 'package:admin/utils/responsive.dart';
import 'package:admin/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class UserEditScreen extends StatefulWidget {
  const UserEditScreen({
    Key? key,
    this.user,
  }) : super(key: key);

  final User? user;

  @override
  State<UserEditScreen> createState() => _UserEditScreenState();
}

class _UserEditScreenState extends State<UserEditScreen> {
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.user == null
              ? 'Добавление пользователя'
              : 'Редактирование пользователя',
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: ResponsiveCenteredView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    CommonTextField(
                      hintText: 'Имя',
                      controller: _nameController,
                    ),
                    const SizedBox(height: 10),
                    CommonTextField(
                      hintText: 'Фамилия',
                      controller: _lastNameController,
                    ),
                    const SizedBox(height: 10),
                    CommonTextField(
                      hintText: 'Отчество',
                      controller: _middleNameController,
                    ),
                    const SizedBox(height: 10),
                    CommonTextField(
                      hintText: 'Email',
                      controller: _emailController,
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
                      controller: _phoneController,
                      suffixIcon: InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.phone,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
          ResponsiveCenteredView(
            child: BottomButton(
              title: 'Сохранить',
              onTap: () {
                final user = User(
                  name: _nameController.text,
                  surname: _lastNameController.text,
                  patronymic: _middleNameController.text,
                  email: _emailController.text,
                  phone: _phoneController.text,
                  //TODO:
                  createdAt: DateTime.now(),
                  updatedAt: DateTime.now(),
                  birthDate: DateTime.now(),
                );
                Get.get<Store<AppState>>().dispatch(
                  CreateUserAction(
                    user,
                    onSuccesed: () {
                      Navigator.pop(context);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
