import 'package:flutter/material.dart';

import 'classification_form.dart';

class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Text('Halaman di luar cakupan pengembangan.'),
          ClassificationForm(),
        ],
      ),
    );
  }
}
