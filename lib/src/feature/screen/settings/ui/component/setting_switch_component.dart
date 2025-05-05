import 'package:flutter/material.dart';

class SettingSwitchComponent extends StatelessWidget {
  final String title;
  final String value;
  final void Function() onSwitch;

  const SettingSwitchComponent({super.key, required this.title, required this.value, required this.onSwitch});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onSwitch,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Column(
          children: [
            Text(
                title,
                style: theme.textTheme.titleLarge
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Text(
                  value,
                  style: theme.textTheme.bodyMedium,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}