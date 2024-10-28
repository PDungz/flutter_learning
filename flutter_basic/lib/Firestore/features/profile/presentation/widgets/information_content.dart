import 'package:flutter/material.dart';
import 'package:flutter_basic/l10n/generated/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../custom_title_and_content_in_item.dart';
import '../information_section_widgets/date_picker_display.dart';
import '../information_section_widgets/fullname_input.dart';
import '../information_section_widgets/radio_gender_item.dart';
import '../logic_holders/bloc/account_info_bloc.dart';

class InformationContent extends StatefulWidget {
  const InformationContent({
    super.key,
  });

  @override
  State<InformationContent> createState() => _InformationContentState();
}

class _InformationContentState extends State<InformationContent> {
  @override
  Widget build(BuildContext context) {
    final canUpdate =
        BlocProvider.of<AccountInfoBloc>(context, listen: true).canUpdate;
    return Column(
      children: [
        CustomTitleAndContentInItem(
            title: AppLocalizations.of(context)!.fullName,
            content: BlocSelector<AccountInfoBloc, AccountInfoState, String?>(
              selector: (state) {
                final fullnameFromFirestore =
                    state.accountDataFromFirestore?.fullName;
                final fullnameFromLocal =
                    state.updatedLocalAccountData.fullName;
                return fullnameFromFirestore ?? fullnameFromLocal;
              },
              builder: (context, selectedValue) {
                return TextInput(
                  currentValue: selectedValue,
                  onChanged: (newValue) {
                    BlocProvider.of<AccountInfoBloc>(context)
                        .add(UpdateFullname(newName: newValue));
                  },
                  hintText: AppLocalizations.of(context)!.fullName,
                );
              },
            )),
        const SizedBox(
          height: 8,
        ),
        CustomTitleAndContentInItem(
          title: AppLocalizations.of(context)!.date_of_birth,
          content: BlocSelector<AccountInfoBloc, AccountInfoState, DateTime?>(
            selector: (state) {
              final dobFromFirestore = state.accountDataFromFirestore?.dob;
              final dobFromLocal = state.updatedLocalAccountData.dob;
              return dobFromLocal ?? dobFromFirestore;
            },
            builder: (context, value) {
              return DatePickerDisplay(
                selectedDate: value,
                onTap: () async {
                  final result = await showDatePicker(
                      context: context,
                      currentDate: value,
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2024));
                  if (result != null) {
                    if (context.mounted) {
                      BlocProvider.of<AccountInfoBloc>(context)
                          .add(UpdateDob(newDob: result));
                    }
                  }
                },
              );
            },
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        CustomTitleAndContentInItem(
            title: AppLocalizations.of(context)!.phoneNumber,
            content: BlocSelector<AccountInfoBloc, AccountInfoState, String?>(
              selector: (state) {
                final phoneNumFromFirestore =
                    state.accountDataFromFirestore?.phoneNumber;
                final phoneNumFromLocal =
                    state.updatedLocalAccountData.phoneNumber;
                return phoneNumFromFirestore ?? phoneNumFromLocal;
              },
              builder: (context, selectedValue) {
                return TextInput(
                  keyBoardType: TextInputType.number,
                  currentValue: selectedValue,
                  onChanged: (newValue) {
                    BlocProvider.of<AccountInfoBloc>(context)
                        .add(UpdatePhoneNum(newPhoneNum: newValue));
                  },
                  hintText: AppLocalizations.of(context)!.phoneNumber,
                );
              },
            )),
        const SizedBox(
          height: 8,
        ),
        CustomTitleAndContentInItem(
            title: AppLocalizations.of(context)!.email,
            content: BlocSelector<AccountInfoBloc, AccountInfoState, String?>(
              selector: (state) {
                final emailFromFirestore =
                    state.accountDataFromFirestore?.email;
                final emailFromLocal = state.updatedLocalAccountData.email;
                return emailFromFirestore ?? emailFromLocal;
              },
              builder: (context, selectedValue) {
                return TextInput(
                  currentValue: selectedValue,
                  onChanged: (newValue) {
                    BlocProvider.of<AccountInfoBloc>(context)
                        .add(UpdateEmail(newEmail: newValue));
                  },
                  hintText: AppLocalizations.of(context)!.email,
                );
              },
            )),
        const SizedBox(
          height: 8,
        ),
        CustomTitleAndContentInItem(
            title: AppLocalizations.of(context)!.gender,
            content: BlocSelector<AccountInfoBloc, AccountInfoState, int?>(
              selector: (state) {
                final genderFromFirestore =
                    state.accountDataFromFirestore?.gender;
                final genderFromLocal = state.updatedLocalAccountData.gender;
                return genderFromLocal ?? genderFromFirestore;
              },
              builder: (context, selectedGender) {
                return Row(
                  children: [
                    RadioGenderItem(
                      radioValue: 1,
                      selectedValue: selectedGender,
                      onTap: () {
                        BlocProvider.of<AccountInfoBloc>(context)
                            .add(UpdateGender(newGender: 1));
                      },
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    RadioGenderItem(
                      radioValue: 2,
                      selectedValue: selectedGender,
                      onTap: () {
                        BlocProvider.of<AccountInfoBloc>(context)
                            .add(UpdateGender(newGender: 2));
                      },
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    RadioGenderItem(
                      radioValue: 3,
                      selectedValue: selectedGender,
                      onTap: () {
                        BlocProvider.of<AccountInfoBloc>(context)
                            .add(UpdateGender(newGender: 3));
                      },
                    ),
                  ],
                );
              },
            )),
        const SizedBox(
          height: 8,
        ),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ElevatedButton(
            onPressed: canUpdate
                ? () {
                    FocusScope.of(context).unfocus();
                    BlocProvider.of<AccountInfoBloc>(context).add(SaveInfo());
                  }
                : null,
            style: ButtonStyle(
                backgroundColor:
                    canUpdate ? null : WidgetStateProperty.all(Colors.grey),
                padding: WidgetStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 24))),
            child: Text(AppLocalizations.of(context)!.save),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
}

extension GenderExtension on int? {
  String toGenderString(BuildContext context) {
    switch (this) {
      case 1:
        return AppLocalizations.of(context)!.male;
      case 2:
        return AppLocalizations.of(context)!.female;
      case 3:
        return AppLocalizations.of(context)!.other;
      default:
        return "Unknown";
    }
  }
}
