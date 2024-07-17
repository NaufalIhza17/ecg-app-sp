import 'package:flutter/material.dart';

/// Flutter code sample for [CustomScrollView].

class ClassificationPage extends StatelessWidget {
  const ClassificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollViewExample();
  }
}

class CustomScrollViewExample extends StatefulWidget {
  const CustomScrollViewExample({super.key});

  @override
  State<CustomScrollViewExample> createState() =>
      _CustomScrollViewExampleState();
}

class _CustomScrollViewExampleState extends State<CustomScrollViewExample> {
  List<int> top = <int>[-1, -2];
  List<int> bottom = <int>[0, 1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final TextTheme textStyle = theme.textTheme;
    const Key centerKey = ValueKey<String>('bottom-sliver-list');
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Classification History',
                style: textStyle.headlineSmall,
              ),
              Text(
                'Check the classifications that have been done before.',
                style: textStyle.bodySmall,
              ),
            ],
          ),
        ),
        // leading: IconButton(
        //   icon: const Icon(Icons.add),
        //   onPressed: () {
        //     setState(() {
        //       top.add(-top.length - 1);
        //       bottom.add(bottom.length);
        //     });
        //   },
        // ),
      ),
      body: CustomScrollView(
        center: centerKey,
        slivers: <Widget>[
          SliverList(
            key: centerKey,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Card(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 15.0),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Image.network(
                            'https://picsum.photos/250?image=9',
                            width: 50.0,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Classification #1223',
                                style: textStyle.titleMedium,
                              ),
                              Text(
                                '2024/06/12 09:00 - 2024/06/13 12:00',
                                style: textStyle.bodySmall,
                              ),
                              Text(
                                'Label: Female',
                                style: textStyle.bodySmall,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              FilledButton.tonal(
                                onPressed: () {},
                                child: const Text('Edit'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
                // return Container(
                //   alignment: Alignment.center,
                //   color: Colors.blue[200 + bottom[index] % 4 * 100],
                //   height: 100 + bottom[index] % 4 * 20.0,
                //   child: Text('Item: ${bottom[index]}'),
                // );
              },
              childCount: bottom.length,
            ),
          ),
        ],
      ),
    );
  }
}
