class InfoUser {
  final String name;
  final String email;
  final num? phone;
  final int agencyID;

  InfoUser({
    required this.name,
    required this.email,
    this.phone = 1,
    required this.agencyID,
  });
}

/*
@override
Future<Response> postUploadFlowRequest(UploadModel uploadModel, File file,
    {bool hasImage = true}) async {
  String token = await LocalData().readAccessToken();

  dio.options.headers["locale"] = "ar";
  dio.options.headers["Authorization"] = "Bearer ${token}";
  dio.options.headers["Accept"] = 'application/json';

  String fileName = file.path.split('/').last;

  String UploadUrl = baseServer + 'client/createReservation';

  var formData = FormData.fromMap({
    'reservation_date': uploadModel.reservationDate,
    'reservation_time': uploadModel.reservationTime,
    'service_provider_id': uploadModel.serviceProviderId,
    'service_id': uploadModel.serviceId,
    'zone_id': uploadModel.zoneId,
  });

  if (hasImage) {
    formData = FormData.fromMap({
      'reservation_date': uploadModel.reservationDate,
      'reservation_time': uploadModel.reservationTime,
      'service_provider_id': uploadModel.serviceProviderId,
      // 'service_id': uploadModel.serviceId,
      'zone_id': uploadModel.zoneId,
      'image': await MultipartFile.fromFile(file.path, filename: fileName),
    });
  }

  final UploadResponse = await dio.post(UploadUrl, data: formData);
  return UploadResponse;
}
*/
