import 'classification_form.dart';
import 'package:flutter/material.dart';

import 'graph_query_form.dart';

class ECGPage extends StatelessWidget {
  const ECGPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final TextTheme textStyle = theme.textTheme;

    return Center(
      child: Stack(children: [
        ListView(
          padding: EdgeInsets.all(30.0),
          children: [
            Text(
              'ECG Readings',
              style: textStyle.headlineSmall,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  runSpacing: 5,
                  spacing: 5,
                  children: [
                    Text(
                      'Start date',
                      style: textStyle.bodySmall,
                    ),
                    Text(
                      'to',
                      style: textStyle.bodySmall,
                    ),
                    Text(
                      'End date',
                      style: textStyle.bodySmall,
                    ),
                  ],
                ),
                Wrap(
                  children: [
                    Text(
                      'Gender, ',
                      style: textStyle.bodySmall,
                    ),
                    Text(
                      'Sinus Rhythm, ',
                      style: textStyle.bodySmall,
                    ),
                    Text(
                      'hb bpm, ',
                      style: textStyle.bodySmall,
                    ),
                    Text(
                      'No sign of AFib, ',
                      style: textStyle.bodySmall,
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Image(
                      image: AssetImage('graph_example.png'),
                    ),
                  ),
                ),
                Wrap(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ClassificationForm(),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Result',
                                  style: textStyle.titleSmall,
                                ),
                                Text(
                                  'Female',
                                  style: textStyle.bodyLarge,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Verify',
                                  style: textStyle.titleSmall,
                                ),
                                Row(
                                  children: [
                                    FilledButton.tonalIcon(
                                      onPressed: () => {},
                                      style: FilledButton.styleFrom(
                                          backgroundColor: Colors.redAccent),
                                      label: Text('False'),
                                      icon: Icon(Icons.close),
                                    ), // Button
                                    SizedBox(
                                      width: 10,
                                    ),
                                    FilledButton.tonalIcon(
                                      onPressed: () => {},
                                      style: FilledButton.styleFrom(
                                          backgroundColor: Colors.greenAccent),
                                      label: Text('Correct'),
                                      icon: Icon(Icons.check),
                                    ), // Button
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 250,
            )
          ],
        ),
        Positioned.directional(
          textDirection: TextDirection.ltr,
          bottom: 0,
          start: 0,
          end: 0,
          child: SizedBox(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GraphQueryForm(),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
