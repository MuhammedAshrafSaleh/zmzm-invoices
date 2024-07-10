import 'dart:convert';

import 'package:zmzm_cashes/app/core/api/api_constant.dart';
import 'package:http/http.dart' as http;
import 'package:zmzm_cashes/app/models/project/project_response.dart';

import '../../models/delete_response.dart';
import '../../models/project/project.dart';

class InvoiceApi {
  static Future<ProjectResponse?> getAllInvoicesByProjectId(int id) async {
    Uri url =
        Uri.http(ApiConstants.baseURL, '${ApiConstants.apiPath}/invoices/$id');
    try {
      var response = await http.get(url);
      print(response.body);
      var json = jsonDecode(response.body);
      ProjectResponse projects = ProjectResponse.fromJson(json);
      return projects;
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<Project?> getInvoiceById(int id) async {
    Uri url =
        Uri.http(ApiConstants.baseURL, '${ApiConstants.apiPath}/invoice/$id');
    try {
      var response = await http.get(url);
      print(response.body);
      var json = jsonDecode(response.body);
      Project projects = Project.fromJson(json);
      return projects;
    } catch (e) {
      print(e);
    }
    return null;
  }
  static Future<Project?> storeInvoiceByProjectId(int id) async {
    Map<String, String> queryParams = {
      'project_id': '$id',
      'invoice_number': '25',
      'amount': '256',
      'date': '2024-07-03',
      'image': 'vill 4',
    };
    Uri url = Uri.http(
        ApiConstants.baseURL, '${ApiConstants.apiPath}/invoice', queryParams);
    try {
      var response = await http.post(url, headers: {
        'Content-Type': 'application/json',
      });
      print(response.body);
      var json = jsonDecode(response.body);
      Project projects = Project.fromJson(json);
      return projects;
    } catch (e) {
      print(e);
    }
    return null;
  }
 static Future<Project?> updateInvoiceById(int id) async {
    Map<String, String> queryParams = {
      'project_id': '5', // TODO: Don't forget to get the project id
      'invoice_number': '25',
      'amount': '256',
      'date': '2024-07-03',
      'image': 'vill 4',
    };
    Uri url = Uri.http(
        ApiConstants.baseURL, '${ApiConstants.apiPath}/invoice/$id', queryParams);
    try {
      var response = await http.post(url, headers: {
        'Content-Type': 'application/json',
      });
      print(response.body);
      var json = jsonDecode(response.body);
      Project projects = Project.fromJson(json);
      return projects;
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<DeleteResponse?> deleteInvoiceById(int id) async {
    Uri url =
        Uri.http(ApiConstants.baseURL, '${ApiConstants.apiPath}/invoices/$id');
    try {
      var response = await http.post(url, headers: {
        'Content-Type': 'application/json',
      });
      print(response.body);
      var json = jsonDecode(response.body);
      DeleteResponse deleteResponse = DeleteResponse.fromJson(json);
      return deleteResponse;
    } catch (e) {
      print(e);
    }
    return null;
  }
}