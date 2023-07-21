import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:stump_grinder/core/providers.dart';

import '../constants/appwrite_constants.dart';
import '../core/failure.dart';
import '../core/type_defs.dart';
import '../models/contact_us.dart';

abstract class IContactApi {
  FutureEither<void> submitToContactus(ContactUsModel contactUs);
}
//------------------------------------------------------------------------------

class ContactApi implements IContactApi {
  final Databases _db;
  ContactApi({required Databases db}) : _db = db;

  @override
  FutureEither<void> submitToContactus(ContactUsModel contactUs) async {
    try {
      await _db.createDocument(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.contactusCollection,
        documentId: ID.unique(),
        data: contactUs.toMap(),
      );
      return right(null);
    } on AppwriteException catch (e, stackTrace) {
      return left(
          Failure(e.message ?? 'Some unexpected error occured!', stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
}
//------------------------------------------------------------------------------

final contactusApiProvider = Provider((ref) {
  final db = ref.watch(appwriteDatabaseProvider);
  return ContactApi(db: db);
});
