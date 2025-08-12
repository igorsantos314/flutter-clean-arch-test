import 'package:flutter_clean_arch_test/domain/common/error.dart';
import 'package:flutter_clean_arch_test/domain/common/outcome.dart';
import 'package:flutter_clean_arch_test/features/user/data/mapper/user_mapper.dart';
import 'package:flutter_clean_arch_test/features/user/domain/model/user.dart';
import 'package:flutter_clean_arch_test/features/user/domain/repository/user_repository.dart';
import 'package:flutter_clean_arch_test/features/user/infra/local/user_dao.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDao _userDao;

  UserRepositoryImpl(this._userDao);

  @override
  Future<Outcome<int, AppError>> createUser(User user) async{
    try {
      final userData = UserMapper.toUserEntityCompanion(user);
      final result = await _userDao.createUser(userData);
      return Outcome.success(value: result);
    } catch (e) {
      return Outcome.failure(error: GenericError(message: e.toString()));
    }
  }

  @override
  Future<Outcome<bool, AppError>> deleteUser(String id) async{
    try {
      final userId = int.parse(id);
      final rowsAffected = await _userDao.deleteUser(userId);

      if (rowsAffected > 0) {
        return Outcome.success(value: true);
      } else {
        return Outcome.failure(error: NotFoundError(message: 'User with id $id not found'));
      }
    } catch (e) {
      return Future.value(Outcome.failure(error: GenericError(message: e.toString())));
    }
  }

  @override
  Future<Outcome<Stream<List<User>>, AppError>> fetchAllUsers() async {
    try {
      final userStream = _userDao.getAllUsers();
      final userListStream = userStream.map((userDataList) =>
          userDataList.map(UserMapper.fromUserData).toList());
      return Future.value(Outcome.success(value: userListStream)); // Placeholder
    } catch (e) {
      return Future.value(Outcome.failure(error: GenericError(message: e.toString())));
    }
  }

  @override
  Future<Outcome<User?, AppError>> fetchUser(String id) async {
    try {
      final userId = int.parse(id);
      final userData = await _userDao.getUserById(userId);

      if (userData != null) {
        final user = UserMapper.fromUserData(userData);
        return Outcome.success(value: user);
      } else {
        return Outcome.failure(error: NotFoundError(message: 'User with id $id not found'));
      }
    } catch (e) {
      return Future.value(Outcome.failure(error: GenericError(message: e.toString())));
    }
  }

  @override
  Future<Outcome<bool, AppError>> updateUser(User user) async {
    try {
      final userData = UserMapper.toUserEntityCompanion(user);
      final success = await _userDao.updateUser(userData);

      if (success) {
        return Outcome.success(value: true);
      } else {
        return Outcome.failure(error: NotFoundError(message: 'User with id ${user.id} not found'));
      }
    } catch (e) {
      return Future.value(Outcome.failure(error: GenericError(message: e.toString())));
    }
  }

}