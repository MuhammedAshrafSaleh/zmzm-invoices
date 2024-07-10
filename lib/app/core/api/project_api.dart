import 'dart:convert';

import 'package:zmzm_cashes/app/core/api/api_constant.dart';
import 'package:http/http.dart' as http;
import 'package:zmzm_cashes/app/models/project/project_response.dart';

import '../../models/delete_response.dart';
import '../../models/project/project.dart';

class ProjectApi {
  static Future<ProjectResponse?> getAllProjectsByUserId(int id) async {
    Uri url =
        Uri.http(ApiConstants.baseURL, '${ApiConstants.apiPath}/projects/$id');
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

  static Future<Project?> getProjectById(int id) async {
    Uri url =
        Uri.http(ApiConstants.baseURL, '${ApiConstants.apiPath}/project/$id');
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

  static Future<Project?> storeProjectByUserId(
      {required int id,
      required String project_name,
      required String project_description}) async {
    Map<String, String> queryParams = {
      'user_id': '$id',
      'project_name': project_name,
      'project_description': project_description,
    };
    Uri url = Uri.http(
        ApiConstants.baseURL, '${ApiConstants.apiPath}/project', queryParams);
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

  static Future<Project?> updateProjectById(int id) async {
    Map<String, String> queryParams = {
      'user_id': '1', // TODO: User ID
      'project_name': 'vill 123123',
      'project_description': 'vill 13452',
    };
    Uri url = Uri.http(ApiConstants.baseURL,
        '${ApiConstants.apiPath}/project/$id', queryParams);
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

  static Future<DeleteResponse?> deleteProjectById(int id) async {
    Uri url =
        Uri.http(ApiConstants.baseURL, '${ApiConstants.apiPath}/projects/$id');
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
