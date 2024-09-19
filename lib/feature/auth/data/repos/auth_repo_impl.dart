// import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_e_commerce/feature/auth/data/models/user_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../domain/entites/user_entity.dart';
import '../../domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  // final DatabaseService databaseService;
  AuthRepoImpl(
      {
      //required this.databaseService ,
      required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      UserEntity userEntity = UserEntity(
        name: name,
        email: email,
        uId: user.uid,
      );
      return right(UserModel.fromFirebaseUser(user));
      // await addUserData(user: userEntity);
      // return right(userEntity);
    } on CustomException catch (e) {
      //  await deleteUser(user);

      return left(ServerFailure(e.message));
    } catch (e) {
      //  await deleteUser(user);
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  // Future<void> deleteUser(User? user) async {
  //   if (user != null) {
  //     await firebaseAuthService.deleteUser();
  //   }
  // }

  @override
  Future<Either<Failure, UserEntity>> signinWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      //   var userEntity = await getUserData(uid: user.uid);
      //   await saveUserData(user: userEntity);
      return right(
          //  userEntity,
          UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();

      // var userEntity = UserModel.fromFirebaseUser(user);
      // var isUserExist = await databaseService.checkIfDataExists(
      //     path: BackendEndpoint.isUserExists, docuementId: user.uid);
      // if (isUserExist) {
      //   //  await getUserData(uid: user.uid);
      // } else {
      //   // await addUserData(user: userEntity);
      // }
      // return right(userEntity);
      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      //   await deleteUser(user);
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      //  await addUserData(user: userEntity);
      return right(userEntity);
    } catch (e) {
      // await deleteUser(user);
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  // @override
  // Future<Either<Failure, UserEntity>> signinWithApple() async {
  //   User? user;
  //   try {
  //     user = await firebaseAuthService.signInWithApple();

  //     var userEntity = UserModel.fromFirebaseUser(user);
  //     await addUserData(user: userEntity);
  //     return right(userEntity);
  //   } catch (e) {
  //     await deleteUser(user);
  //     log(
  //       'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
  //     );
  //     return left(
  //       ServerFailure(
  //         'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
  //       ),
  //     );
  //   }
  // }

  // @override
  // Future addUserData({required UserEntity user}) async {
  //   await databaseService.addData(
  //     path: BackendEndpoint.addUserData,
  //     data: UserModel.fromEntity(user).toMap(),
  //     documentId: user.uId,
  //   );
  // }

  // @override
  // Future<UserEntity> getUserData({required String uid}) async {
  //   var userData = await databaseService.getData(
  //       path: BackendEndpoint.getUsersData, docuementId: uid);
  //   return UserModel.fromJson(userData);
  // }

  // @override
  // Future saveUserData({required UserEntity user}) async {
  //   var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
  //   await Prefs.setString(kUserData, jsonData);
  // }
}