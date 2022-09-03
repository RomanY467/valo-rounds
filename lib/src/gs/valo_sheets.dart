import 'package:gsheets/gsheets.dart';
import 'package:valo/model/user.dart';

//No tengo mucha idea de como funciona esto, me vi un tutorial de 30 minutos y funciono a la primera :D
class SheetsApi {
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "gsheetsvalo",
  "private_key_id": "",
  "private_key": "-----BEGIN PRIVATE KEY-----\\n-----END PRIVATE KEY-----\n",
  "client_email": "",
  "client_id": "",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": ""
}
''';

  static const _spreadSheetId = "";
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
