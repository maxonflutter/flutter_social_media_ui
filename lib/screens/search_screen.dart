import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/search';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<User> users = User.users;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Discover',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
      body: MasonryGridView.count(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10.0),
        itemCount: users.length,
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemBuilder: (context, index) {
          User user = users[index];
          return _UserCard(user: user, isFirstCard: index == 0);
        },
      ),
    );
  }
}

class _UserCard extends StatelessWidget {
  const _UserCard({
    Key? key,
    required this.user,
    required this.isFirstCard,
  }) : super(key: key);

  final User user;
  final bool isFirstCard;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: isFirstCard ? 250 : 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(user.imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black],
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                stops: [0.4, 1.0],
              ),
            ),
          ),
        ),
        Positioned(
          left: 10,
          bottom: 10,
          child: Row(
            children: [
              CircleAvatar(backgroundImage: AssetImage(user.imagePath)),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.username,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '2 min ago',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
