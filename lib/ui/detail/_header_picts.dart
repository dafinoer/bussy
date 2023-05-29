part of 'detail_screen_page.dart';

class _HeaderPicts extends StatelessWidget {
  const _HeaderPicts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height * 0.4;

    return SliverAppBar(
      expandedHeight: sizeHeight,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.map),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: BlocBuilder<CompanyDetailCubit, CompanyDetailState>(
          builder: (context, state) {
            if (state is CompanyDetailSuccess) {
              return PageView.builder(
                itemCount: state.companyModel.photos.length,
                itemBuilder: (BuildContext context, int index) =>
                    CachedNetworkImage(
                  imageUrl: state.companyModel.photos[index],
                  imageBuilder: (context, imageProvider) => Container(
                    height: sizeHeight,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.grey,
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  placeholder: (context, url) => SizedBox(
                    height: sizeHeight,
                    width: MediaQuery.of(context).size.width,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.grey[300]!,
                      child: const ColoredBox(color: Colors.grey),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: sizeHeight,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.grey,
                    ),
                    child: const Icon(Icons.error_outline),
                  ),
                ),
              );
            }

            return SizedBox.expand(
              child: Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.grey[350]!,
                child: const ColoredBox(color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }
}
