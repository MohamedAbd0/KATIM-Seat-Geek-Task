import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: ColorConstants.grey,
      thickness: 1,
    );
  }
}
