import 'project_id_secret_pass.dart';

class AppwriteConstants {
  static const String projectId = projectIdSecretPass;
  static const String databaseId = '64baa27d3f80de53210b';
  static const String endPoint = 'https://cloud.appwrite.io/v1';

  static const String contactusCollection = '64baa299c1e76f1e9058';

  static const String imagesBucket = '64baa2a4170381a80581';

  static String imageUrl(String imageId) =>
      '$endPoint/storage/buckets/$imagesBucket/files/$imageId/view?project=$projectId&mode=admin';
}
