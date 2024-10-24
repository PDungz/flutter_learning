import 'package:flutter_basic/Firestore/features/profile/domain/entities/account_entity.dart';

abstract class AccountRepository {
  Future<void> createOrUpdateAccountData(
      String userId, AccountEntity accountDataEntity);
  Future<AccountEntity?> getAccountData(String userId);
}
