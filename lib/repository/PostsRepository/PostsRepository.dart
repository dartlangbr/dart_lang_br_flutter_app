import 'package:dart_lang_br_flutter_app/repository/PostsRepository/model/Post.dart';
import 'package:dart_lang_br_flutter_app/support/conection/con.dart';

abstract class PostsRepository{
  Future<List<Post>> loadPosts(int limit, int page);
}

class PostsRepositoryImpl implements PostsRepository{

  final Con con;

  PostsRepositoryImpl(this.con);

  @override
  Future<List<Post>> loadPosts(int limit, int page) async {

    List result = await con.get('posts/$limit/$page');

    return result.map<Post>((i)=>Post.fromJson(i)).toList();

  }

}
