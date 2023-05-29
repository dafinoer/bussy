import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardTile extends StatelessWidget {
  const CardTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.urlImage,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String urlImage;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
      child: Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleLarge,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        subtitle,
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                CachedNetworkImage(
                  imageUrl: urlImage,
                  imageBuilder: (context, imageProvider) => Container(
                    height: 82.0,
                    width: 82.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.grey,
                      image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  placeholder: (context, url) => SizedBox(
                    height: 82.0,
                    width: 82.0,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.grey[300]!,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: 82.0,
                    width: 82.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.grey,
                    ),
                    child: const Icon(Icons.error_outline),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
