import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
              radius: 22,
            ),
            const SizedBox(width: 12),
            Text(
              'Olá, Isabela',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const Row(
          children: [
            Icon(Icons.notifications_none),
            SizedBox(width: 12),
            Icon(Icons.menu),
          ],
        ),
      ],
    );
  }
}
