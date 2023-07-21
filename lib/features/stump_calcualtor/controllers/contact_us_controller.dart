import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stump_grinder/apis/contact_api.dart';
import 'package:stump_grinder/features/stump_calcualtor/view/stump_type.dart';
import 'package:stump_grinder/models/contact_us.dart';

import '../../../apis/storage_api.dart';
import '../../../core/utils.dart';

class ContactUsControllerNotifier extends StateNotifier<bool> {
  final ContactApi _contactApi;
  final StorageApi _storageApi;
  ContactUsControllerNotifier({
    required ContactApi contactApi,
    required StorageApi storageApi,
  })  : _contactApi = contactApi,
        _storageApi = storageApi,
        super(false);

  void submitContactUs({
    required BuildContext context,
    required List<File> images,
    required ContactUsModel contactUsModel,
  }) async {
    state = true;
    final imageLinks = await _storageApi.uploadImages(images);
    contactUsModel = contactUsModel.copyWith(images: imageLinks);
    final response = await _contactApi
        .submitToContactus(contactUsModel)
        .timeout(const Duration(seconds: 10));
    response.fold(
      (l) {
        showSnackbar(context, l.message);
        state = false;
      },
      (r) {
        state = false;
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const StumpType(),
        ));
      },
    );
  }
}
// -----------------------------------------------------------------------------

final contactUsControllerProvider =
    StateNotifierProvider<ContactUsControllerNotifier, bool>((ref) {
  final contactusApi = ref.watch(contactusApiProvider);
  final storageApi = ref.watch(storageApiProvider);
  return ContactUsControllerNotifier(
      contactApi: contactusApi, storageApi: storageApi);
});
