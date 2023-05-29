part of 'home_screen_page.dart';

class _AppBarContent extends StatelessWidget {
  const _AppBarContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Deliver To:",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _LocationText(),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.orange,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LocationText extends StatelessWidget {
  const _LocationText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationPermissionCubit, LocationPermissionState>(
      listener: (context, state) {
        if (state is LocationPermissionSuccess) {
          context
              .read<LocationPermissionCubit>()
              .addressLocation(state.lat, state.lon);
        }
      },
      builder: (context, state) {
        if (state is LocationPermissionAddress) {
          return Flexible(
            child: Text(
              state.address ?? 'No Location Detection',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          );
        }
        if (state is LocationPermissionSyncProcess ||
            state is LocationPermissionSyncProcess) {
          return SizedBox(
            width: 100.0,
            height: 16.0,
            child: Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.grey[350]!,
              child: Container(
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
