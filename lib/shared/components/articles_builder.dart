import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'article_item.dart';
import 'my_divider.dart';

class ArticlesBuilder extends StatelessWidget {
  const ArticlesBuilder(this.list,{Key? key}) : super(key: key);
final List list;
  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (context) =>
          ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => ArticleItem(article:list[index], context:context),
            separatorBuilder: (context, index) => const MyDivider(),
            itemCount: 10,),
      fallback: (context)=>const Center(child:  CircularProgressIndicator()),
    );
  }
}
