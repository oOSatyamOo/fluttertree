import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/artical_entity.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget(
    this.article, {
    super.key,
  });
  final ArticleEntity? article;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
        start: 14.0,
        end: 14.0,
        bottom: 14.0,
      ),
      height: MediaQuery.of(context).size.width / 2.2,
      child: Row(
        children: [buildImage(context), buildTileAndDescription()],
      ),
    );
  }

  Widget buildImage(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: article?.urlToImage ?? '',
      imageBuilder: (context, imageProvider) => Padding(
        padding: const EdgeInsetsDirectional.only(end: 14.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  image: DecorationImage(
                      image: imageProvider, fit: BoxFit.cover))),
        ),
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) => Container(
          padding: const EdgeInsetsDirectional.only(end: 14),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
                width: MediaQuery.of(context).size.width / 3,
                height: double.maxFinite,
                decoration: const BoxDecoration(color: Colors.black26),
                child: const Icon(Icons.error)),
          )),
    );
  }

  Widget buildTileAndDescription() {
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 7),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article!.title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Butler',
                  fontWeight: FontWeight.w900,
                  fontSize: 18.0,
                  color: Colors.black87,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    article!.description,
                    maxLines: 2,
                  ),
                ),
              ),
              //DateTime
              Row(
                children: [
                  const Icon(Icons.timeline_outlined, size: 16.0),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    article!.publishedAt,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
