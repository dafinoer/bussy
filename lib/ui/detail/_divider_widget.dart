
part of 'detail_screen_page.dart';



class _DividerWidget extends StatelessWidget {
  const _DividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Divider(),
    );
  }
}
