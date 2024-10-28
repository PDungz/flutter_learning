import 'package:flutter/material.dart';
import 'package:flutter_basic/Firestore/features/profile/presentation/avatar_and_username_section.dart';
import 'package:flutter_basic/l10n/generated/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/enums/status_state.dart';
import '../../auth/login/widgets/loading_overlay.dart';
import '../data/remote_data_source/account_firestore_data_source.dart';
import '../data/repositories/account_repository.dart';
import 'logic_holders/bloc/account_info_bloc.dart';
import 'settings_content.dart';
import 'widgets/custom_title_and_content_section.dart';
import 'widgets/information_content.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountInfoBloc>(
      create: (context) => AccountInfoBloc(AccountRepositoryImpl(
          remoteDatasource: AccountFirestoreDataSourceImpl()))
        ..add(FetchAccountInfo()),
      child: BlocBuilder<AccountInfoBloc, AccountInfoState>(
        builder: (context, state) {
          final isLoading = state.status == StatusState.loading;
          return Stack(
            children: [
              Scaffold(
                appBar: AppBar(
                  backgroundColor: const Color(0xff1B2332),
                  title: Center(
                    child: Text(
                      AppLocalizations.of(context)!.profile_app_bar_title,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.logout,
                          color: Colors.white,
                        ))
                  ],
                ),
                body: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    color: const Color(0xff181F2B),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const AvatarAndUsernameSection(),
                          const SizedBox(
                            height: 38,
                          ),
                          CustomTitleAndContentSection(
                              title: AppLocalizations.of(context)!.information,
                              content: const InformationContent()),
                          const SizedBox(
                            height: 32,
                          ),
                          CustomTitleAndContentSection(
                              title: AppLocalizations.of(context)!.setting,
                              content: const SettingsContent()),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (isLoading) const LoadingOverylay()
            ],
          );
        },
      ),
    );
  }
}
