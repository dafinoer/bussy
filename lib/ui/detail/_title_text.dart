part of 'detail_screen_page.dart';

class _TitleTextWidget extends StatelessWidget {
  const _TitleTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: 24.0,
          top: 24.0,
        ),
        child: BlocBuilder<CompanyDetailCubit, CompanyDetailState>(
          builder: (context, state) {
            if (state is CompanyDetailSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.companyModel.name,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  if (state.companyModel.locationModel.address != null)
                    Text(
                      state.companyModel.locationModel.address!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                ],
              );
            }

            return Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.grey[300]!,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 18.0,
                    width: 150.0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
                  SizedBox(
                    height: 16.0,
                    width: 200.0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
