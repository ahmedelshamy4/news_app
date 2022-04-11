import 'package:flutter/material.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/services/news_services.dart';

import '../widgets/source_item.dart';

class SourcePage extends StatefulWidget {
  const SourcePage({Key? key}) : super(key: key);

  @override
  State<SourcePage> createState() => _SourcePageState();
}

class _SourcePageState extends State<SourcePage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: FutureBuilder<List<SourceModel>?>(
        future: NewsServices.getSources(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column(
              children: const [
                Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            );
          }
          if (snapshot.hasData) {
            return SizedBox(
              height: 115,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 3 / 3,
                    crossAxisCount: 1,
                    mainAxisExtent: 90,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, i) {
                    return SourceItem(sourc: snapshot.data![i]);
                  }),
            );
          } else {
            return Column(
              children: const [
                Center(
                  child: Text('There are no data'),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
