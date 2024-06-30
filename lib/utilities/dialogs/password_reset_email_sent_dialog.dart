import 'package:flutter/widgets.dart';
import 'package:my_notes/utilities/dialogs/generic_dialog.dart';

Future<void> showPasswordResetSentDialog(BuildContext context) async {
  return showGenericDialog<void>(
    context: context,
    title: 'Password Reset',
    content:
        'We have now sent you a password reset email. Please check your inbox and follow the instructions to reset your password.',
    optionsBuilder: () => {
      'OK': null,
    },
  );
}
