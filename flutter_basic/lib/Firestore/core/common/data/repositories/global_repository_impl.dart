import 'dart:ui';

import '../../domain/repositories/global_repository.dart';
import '../datasources/global_info_local_data_source.dart';

class GlobalRepositoryImpl implements GlobalRepository {
  final GlobalInfoLocalDatasource localDatasource;
  GlobalRepositoryImpl({
    required this.localDatasource,
  });
  @override
  Future<Locale?> getLocale() async {
    final langCode = await localDatasource.getLangCode();
    if (langCode != null) {
      return Locale(langCode);
    }
    return null;
  }

  @override
  Future<bool> setSavedLangCode(String langCode) {
    return localDatasource.setSavedLocale(langCode);
  }
}
