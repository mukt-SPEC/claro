import 'package:flutter/widgets.dart';
import 'package:ftoast/ftoast.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

dynamic emptyWarning(BuildContext context) {
  return FToast.toast(
    context,
    msg: 'oops!',
    subMsg: 'All fields are required to be filled to create a task',
    corner: 24,
    duration: 2000,
    padding: const EdgeInsets.all(16),
  );
}

dynamic updateTaskWarning(BuildContext context) {
  return FToast.toast(
    context,
    msg: 'oops! No tasks found',
    subMsg: 'Field must be edited to update a task',
    corner: 24,
    duration: 3000,
    padding: const EdgeInsets.all(16),
  );
}

noTaskWarning(BuildContext context) {
  return PanaraInfoDialog.showAnimatedGrow(
    context,
    title: 'Oops',
    message: 'No task',
    buttonText: 'Ok!',
    onTapDismiss: () {
      Navigator.pop(context);
    },
    panaraDialogType: PanaraDialogType.warning,
  );
}

dynamic deletAllTask(BuildContext context) {
  return PanaraConfirmDialog.show(
    context,
    title: 'Are you Sure',
    message: 'All task will be deleted',
    confirmButtonText: 'delete all',
    cancelButtonText: 'Cancel',
    onTapConfirm: () {},
    onTapCancel: () {
      Navigator.pop(context);
    },
    panaraDialogType: PanaraDialogType.error,
    barrierDismissible: false,  
  );
}
