import 'package:estartup/models/idea.dart';
import 'package:estartup/screens/idea_detail_screen/idea_detail_screen.dart';
import 'package:estartup/utilities/utilities.dart';
import 'package:flutter/material.dart';

class IdeaFeedTile extends StatelessWidget {
  const IdeaFeedTile({required this.idea, Key? key}) : super(key: key);
  final Idea idea;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => IdeaDetailScreen(idea: idea),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Utilities.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              idea.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const Divider(thickness: 1),
            Text(
              idea.description,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
