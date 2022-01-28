import 'package:estartup/database/auth_methods.dart';
import 'package:estartup/models/idea.dart';
import 'package:estartup/screens/idea_detail_screen/pdf_view.dart';
import 'package:estartup/utilities/utilities.dart';
import 'package:flutter/material.dart';

class IdeaDetailScreen extends StatelessWidget {
  const IdeaDetailScreen({required this.idea, Key? key}) : super(key: key);
  final Idea idea;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Utilities.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10),
            Text(
              idea.title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const Divider(thickness: 1),
            Text(
              idea.description,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PdfViewer(
                      idea: idea,
                      title: idea.title,
                    ),
                  ));
                },
                child: Text('View Proposal'))
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          (idea.uid == AuthMethods.uid())
              ? const SizedBox()
              : (idea.interested!.contains(AuthMethods.uid() ?? ''))
                  ? FloatingActionButton(
                      onPressed: () {},
                      child: const Icon(Icons.thumb_up_alt),
                    )
                  : FloatingActionButton(
                      onPressed: () {},
                      child: const Icon(Icons.thumb_up_alt_outlined),
                    ),
        ],
      ),
    );
  }
}
