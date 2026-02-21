import 'package:flutter/material.dart';
import 'package:vamstreet_components/src/core/constants/dimens.dart';
import 'package:vamstreet_components/src/core/themes/app_colors.dart';
import 'package:vamstreet_components/src/core/themes/radius.dart';
import 'package:vamstreet_components/src/core/themes/typography.dart';

class InputsPage extends StatelessWidget {
  const InputsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs Showcase'),
        backgroundColor:const Color(AppColors.neutral50 ) ,
        elevation: Dimens.px0,
      ),
      body: Center(
        child: Text(
          'Inputs Page - Coming Soon',
          style: AppTypography.textTheme.headlineSmall,
        ),
      ),
    );
  }
}
