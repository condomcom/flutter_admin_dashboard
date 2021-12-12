import 'package:admin/utils/constants.dart';
import 'package:admin/widgets/forms/common_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      hintText: "Поиск",
      suffixIcon: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(defaultPadding * 0.75),
          margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: SvgPicture.asset("assets/icons/Search.svg"),
        ),
      ),
    );
  }
}
