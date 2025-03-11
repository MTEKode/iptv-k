import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SizedBox(
      height: 200,
      child: Column(
        children: [
          Text(
            'Apex IPTV',
            style: theme.textTheme.titleSmall?.copyWith(
              color: Colors.white,
            ),
          ),
          Text(
            'Welcome to Apex IPTV',
            style: theme.textTheme.titleSmall?.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

extension on TextTheme {
  get headline1 => null;
}