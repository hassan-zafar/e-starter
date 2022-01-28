import 'package:estartup/database/auth_methods.dart';
import 'package:estartup/database/idea_api.dart';
import 'package:estartup/database/user_api.dart';
import 'package:estartup/models/app_user.dart';
import 'package:estartup/models/idea.dart';
import 'package:estartup/screens/auth/login_screen.dart';
import 'package:estartup/widgets/circular_profile_image.dart';
import 'package:estartup/widgets/idea_feed_tile.dart';
import 'package:estartup/widgets/show_loading.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
              onPressed: () async {
                await AuthMethods().signOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  LoginScreen.routeName,
                  (route) => false,
                );
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: FutureBuilder<AppUser?>(
        future: UserAPI().getInfo(uid: AuthMethods.uid() ?? ''),
        builder: (BuildContext context, AsyncSnapshot<AppUser?> snapshot) {
          if (snapshot.hasError) {
            return const _ErrorWidget();
          } else {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const ShowLoading();
            } else {
              AppUser? _user = snapshot.data;
              return (_user == null)
                  ? const _ErrorWidget()
                  : Column(
                      children: <Widget>[
                        const SizedBox(height: 10),
                        Center(
                          child: CircularProfileImage(
                            imageURL: _user.imageURL ?? '',
                            radius: 48,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _user.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const Divider(thickness: 1),
                        Expanded(
                          child: FutureBuilder<List<Idea>>(
                            future: IdeaAPI().feed(),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<Idea>> snapshot) {
                              if (snapshot.hasError) {
                                return const _ErrorWidget();
                              } else {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const ShowLoading();
                                } else {
                                  List<Idea> _ideass = snapshot.data!;
                                  return Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      Expanded(
                                        child: ListView.separated(
                                          shrinkWrap: true,
                                          itemCount: _ideass.length,
                                          separatorBuilder:
                                              (BuildContext context,
                                                      int index) =>
                                                  Divider(
                                            color: Colors.grey[200],
                                            thickness: 4,
                                          ),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return IdeaFeedTile(
                                              idea: _ideass[index],
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                }
                              }
                            },
                          ),
                        )
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
