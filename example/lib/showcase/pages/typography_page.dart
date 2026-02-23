import 'package:flutter/material.dart';
import 'package:vamstreet_uikit/src/core/themes/typography.dart';

class TypographyPage extends StatelessWidget {
  const TypographyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Typography Test'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // تست فونت با وزن‌های مختلف
            const Text(
              'تست فونت IRANSansXFaNum',
              style: TextStyle(
                fontFamily: 'IRANSansXFaNum',
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),

            // تست وزن 400
            Text(
              'وزن 400 (Regular) - این یک متن تستی است',
              style: AppTypography.textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),

            // تست وزن 500
            Text(
              'وزن 500 (Medium) - این یک متن تستی است',
              style: AppTypography.textTheme.titleMedium,
            ),
            const SizedBox(height: 10),

            // تست وزن 700
            Text(
              'وزن 700 (Bold) - این یک متن تستی است',
              style: AppTypography.textTheme.displaySmall,
            ),
          ],
        ),
      ),
    );
  }
}
