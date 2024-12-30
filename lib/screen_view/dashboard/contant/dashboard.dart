import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../custom_widget/custom_text_padding.dart';
import '../../../custom_widget/custom_textstyle.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textPaddingWidget(
          text: 'Dashboard',
          textStyle: textStyle20(color: Colors.black),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        ),
      ],
    );
  }
}
