import 'package:flutter/material.dart';

class MovieTypeSection extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? suffix;

  const MovieTypeSection({
    super.key,
    required this.title,
    required this.child,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              if (suffix != null) suffix!,
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        child
      ],
    );
  }
}
