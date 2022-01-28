import 'package:estartup/database/idea_api.dart';
import 'package:estartup/models/idea.dart';
import 'package:estartup/utilities/utilities.dart';
import 'package:estartup/widgets/idea_feed_tile.dart';
import 'package:estartup/widgets/show_loading.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Idea>>(
        future: IdeaAPI().feed(),
        builder: (BuildContext context, AsyncSnapshot<List<Idea>> snapshot) {
          if (snapshot.hasError) {
            return const _ErrorWidget();
          } else {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const ShowLoading();
            } else {
              List<Idea> _ideass = snapshot.data!;
              return Column(
                children: [
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.separated(
                      itemCount: _ideass.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(
                        color: Colors.grey[200],
                        thickness: 4,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return IdeaFeedTile(idea: _ideass[index]);
                      },
                    ),
                  ),
                ],
              );
            }
          }
        },
      ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const <Widget>[
          Text(
            'Some thing goes wrong',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
