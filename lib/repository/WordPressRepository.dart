
import 'package:dart_lang_br_flutter_app/support/conection/WordPressApi.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart';

abstract class WordPressRepository{

  Future<List<Post>> loadPost(int page, int limit);

}

class WordPressRepositoryImpl extends WordPressRepository{

  final WordPressApi _wordPressApi;

  WordPressRepositoryImpl(this._wordPressApi);

  @override
  Future<List<Post>> loadPost(int page, int limit) {
    return _wordPressApi.wordPress.fetchPosts(
      postParams: ParamsPostList(
        context: WordPressContext.view,
        pageNum: page,
        perPage: limit,
        order: Order.desc,
        orderBy: PostOrderBy.date,
      ),
      fetchAuthor: true,
      fetchCategories: true,
    );
  }


}