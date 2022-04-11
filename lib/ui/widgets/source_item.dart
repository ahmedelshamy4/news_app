import 'package:flutter/material.dart';

import '../../models/source_model.dart';
import '../pages/publishers_sources_page.dart';

class SourceItem extends StatelessWidget {
  final SourceModel sourc;
  const SourceItem({Key? key, required this.sourc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PublishersSourcesPage(
              sourceId: sourc.id,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(27),
                color: Colors.red,
              ),
              height: 70,
              child: CircleAvatar(
                foregroundColor: Colors.red,
                backgroundColor: Colors.red.shade200,
                radius: 35,
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      sourc.name,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            sourc.name.substring(0, 3).toUpperCase(),
            style: const TextStyle(color: Colors.blueGrey),
          ),
        ],
      ),
    );
  }
}
