import 'package:flutter/material.dart';

class NoDataFoundWidget extends StatelessWidget {
  final String errorMessage;
  const NoDataFoundWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/icons/no_data.png',
          width: 230,
          color: Theme.of(context).colorScheme.primary.withAlpha(150),
        ),
        Text(
          errorMessage,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary.withAlpha(150),
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
