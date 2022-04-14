import 'package:gsheets/gsheets.dart';
import 'package:valo/model/user.dart';

//No tengo mucha idea de como funciona esto, me vi un tutorial de 30 minutos y funciono a la primera :D
class SheetsApi {
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "gsheetsvalo",
  "private_key_id": "87e6542a4784edfa7a8a31902e9e0288afca8adf",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDU2y4QWNgFLUj7\nWb+x30NtC4xRqu/IXxoVFYgh/kmWQGzzdVKuf5iHsGAdMsXBj8FWW2R09ae81ScH\nWHnmkJjXYfSE49gaoWI/Y3/7ll5jOs9eywymZc89GkwPM+sHk9A1zDH9AEWgUGKb\n4hIQ4LGTyd3JOYx/ddqlKHv1AuqwG5VwGuMt29OvXkSqOw8JgROJABLyHw6xHstt\nwvO/p7B3JtycFMkJ8G2TUMmo0Xt5nfwhXYtn0v0nbiOt3btorUZpKG+SxPo4sE6+\n/FbaoiqqlGIJuM8OUMNFq74jqGCvyJxrt1N4G+Z/Y9MKjvPqw1s/cTdBK2W0SpZp\nmkxQzJd9AgMBAAECggEABX8xv4+oPV2KdrpanIRunOJL6Ajlmhxo1yKMjBtMIIb7\nLNyTqZih9DRvKorBkKGlwBUqWEyqa9Jqr5s1w5Pb7NBwHIypTyMxHzkPBtPNDfva\nXxhREKWs3xHAj8Bj7dxjWXIXLbiM90/Gylw24lUkB/QgYpHvOZRRkSszXaBui490\nDHiDVn0gQrcpuwPwtroTxIeqKVPJ1CUC1Yfs7v/VmZKWbjRNtHOA/0+/AIYRzdr3\nlyNN133mGY/w/OdodY3KTDPhcgUdJdAT7+es2U71lg7tpuhJsWL4yDstogGxGEIr\nTu7QZjfv5/T7EA5GAn2KVPol3wmCGXekDiQD/M2AAQKBgQD5g2V8lTcIJIMZty8G\nL0mYgVqRD7UZ2mJELloLa0PyWdX4+/0JmFbfa+MAO107ujkrZujsd8S8BvIJzSUp\nfw6mFKj+4oe5NDK/F3luk+Y3RNjwUjQTXE0UIjgtt7P1/c16Fsg97NMe1YNuiZKP\nmBof7vUU65iWdBTLEqR819epPQKBgQDaY9Egj/fxNqQKnrGFW0YHEo5PctvDxfiD\nxU/Lla9qrL/ykHxmdKTU/RkRL2BEQ2DDxXJBEcaNLL9YeP9JxF8vwnzWhMJ9Nqh0\nxCQ0f00PJILzQRt/4Qo2lja19O5M9HH9UyJHEY2AJnLCZcIydZ6v6Iv44LFLCTll\nWx4X9CkLQQKBgQDIbUgEf0gpfkrhSUi4yxtvKdk6VUfAcLAm3KTwL0XxU0CSNLja\nEEkYR22dLhKCe+CYgJ3x9XNPJrUeMm/7mViHCGmH9SfZGZj57z1YGe3/z4oD4cR7\nGNXBqos+Dia9HxcDT3GibK5aQmDFVjUoq6GwrR6po2Z61NwvE9aVgjx2cQKBgQCj\nUDvGXwMqZhMcQfo84Lmodk7nyNvhNj2WxMncU66fVlogWb49nALbp/3D5SrXQY+u\nNwwu7s0NK6ZX0fwOvQP1ojpa7WLH4kTtNPRiMcR9i29F261l3vMVSRXW0jgWYkKQ\nD0g130Fy0M3G4/PqahzmLT/nOJg8pcQ/MHl7rkG3QQKBgFP92fmLO32EuyrsjDoE\nEiz6gMEofYrIHAWgEpWBQc2E120CIicuypc/OcETyUu2olTj+2dXLWfVd0ofZiXQ\nnAaFlpIGrNiryGYtww/2O7CPYT6aL8A6DL3kqZkKcnenHQu5m+mHSdUZ25lac+u3\ndopomExuD8aOzYACGqU2TqGG\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@gsheetsvalo.iam.gserviceaccount.com",
  "client_id": "106046101833924087089",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40gsheetsvalo.iam.gserviceaccount.com"
}
''';

  static const _spreadSheetId = "1ZanVvFouVWPgeSy_MZVvdVjl1pcE8J8V7OCkmdCuL5I";
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _userSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadSheetId);
      _userSheet = await _getWorkSheet(spreadsheet, title: "Matches");

      final firstRow = UserFields.getFields();
      _userSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('Init error: $e');
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<String> rowList) async {
    _userSheet?.values.appendRow(rowList);
  }
}
