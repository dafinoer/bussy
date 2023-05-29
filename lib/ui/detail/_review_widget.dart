part of 'detail_screen_page.dart';

class _ReviewWidget extends StatelessWidget {
  const _ReviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Text(
              'Review',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          ListTile(
            leading: CircleAvatar(),
            title: Text('Lorem Ipsum'),
            subtitle: Text('hallo world'),
            trailing: Chip(label: Text('5'), avatar: Icon(Icons.star)),
          ),
          ListTile(
            leading: CircleAvatar(),
            title: Text('Lorem Ipsum'),
            subtitle: Text('hallo world'),
          ),
          ListTile(
            leading: CircleAvatar(),
            title: Text('Lorem Ipsum'),
            subtitle: Text('hallo world'),
          ),
        ],
      ),
    );
  }
}
