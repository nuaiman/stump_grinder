import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class IContactApi {}
//------------------------------------------------------------------------------

class ContactApi implements IContactApi {}
//------------------------------------------------------------------------------

final contactusApiProvider = Provider((ref) {
  return ContactApi();
});
