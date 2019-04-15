


import 'package:dart_lang_br_flutter_app/repository/PostsRepository/PostsRepository.dart';
import 'package:dart_lang_br_flutter_app/support/conection/con.dart';

abstract class Repository{
  T getRepository<T>();
}

class RepositoryImpl implements Repository{

  final Con _con;
  Map<Type,dynamic> _repo = Map();

  RepositoryImpl(this._con){
    _repo[PostsRepository] = PostsRepositoryImpl(_con);
  }

  @override
  T getRepository<T>() {
    return _repo[T];
  }

}