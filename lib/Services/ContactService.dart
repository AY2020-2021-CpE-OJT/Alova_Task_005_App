import 'dart:convert';

import 'package:contacts_3/models/APIResponse.dart';
import 'package:contacts_3/models/ContactInstert.dart';
import 'package:contacts_3/models/ContactModel.dart';
import 'package:http/http.dart' as http;

class ContactService{
  final String apiGet = 'https://alova-ecpe407-task005.herokuapp.com/phone';
  final contacts = <ContactModel>[];

  //GET LIST OF CONTACTS
  Future<APIResponse<List<ContactModel>>> getContactList(){
    return http.get(Uri.parse(apiGet),
      headers: {
        'auth-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MGYyZTJjNGVjMDNhYjJlZjQ4ZWRmMGMiLCJpYXQiOjE2MjY1OTM5Njl9.e5TDivGEzgh1allrOWWZhsz9wDdMWg-SKG453_uu9fI',
      },
    )
        .then((data) {
      if(data.statusCode == 200){
        final jsonData = jsonDecode(data.body);
        for(var item in jsonData){
          contacts.add(ContactModel.fromJson(item));
        }
        return APIResponse<List<ContactModel>>(data: contacts, error: false);
      }
      return APIResponse<List<ContactModel>>(data: contacts, error: true);
    }).catchError((_) => APIResponse<List<ContactModel>>(data: contacts,error: true));
  }

  //POST
  Future<APIResponse<bool>> createContact(ContactInsert item) {
    return http.post(
        Uri.parse(apiGet + '/show',),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'auth-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MGYyZTJjNGVjMDNhYjJlZjQ4ZWRmMGMiLCJpYXQiOjE2MjY1OTM5Njl9.e5TDivGEzgh1allrOWWZhsz9wDdMWg-SKG453_uu9fI',
        },
        body: json.encode(item.toJson()))
        .then((data) {
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }return APIResponse<bool>(data: true, error: true);
    }).catchError((_) => APIResponse<bool>(data: true, error: true));
  }

  //UPDATE
  Future<APIResponse<bool>> updateContact(String _id, ContactInsert item) {
    print(apiGet + '/update/' + _id);
    return http.patch(
        Uri.parse(apiGet + '/update/' + _id,),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'auth-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MGYyZTJjNGVjMDNhYjJlZjQ4ZWRmMGMiLCJpYXQiOjE2MjY1OTM5Njl9.e5TDivGEzgh1allrOWWZhsz9wDdMWg-SKG453_uu9fI',
        },
        body: json.encode(item.toJson()))
        .then((data) {
      if (data.statusCode == 204) {
        return APIResponse<bool>(data: true);
      }return APIResponse<bool>(data: true, error: true);
    }).catchError((_) => APIResponse<bool>(data: true, error: true));
  }

  //DELETE
  Future<APIResponse<bool>> deleteContact(String _id) {
    print(apiGet + '/delete/' + _id);
    return http.delete(
      Uri.parse(apiGet + '/delete/' + _id,),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'auth-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MGYyZTJjNGVjMDNhYjJlZjQ4ZWRmMGMiLCJpYXQiOjE2MjY1OTM5Njl9.e5TDivGEzgh1allrOWWZhsz9wDdMWg-SKG453_uu9fI',
      },).then((data) {
      if (data.statusCode == 204) {
        return APIResponse<bool>(data: true, error: false);
      }return APIResponse<bool>(data: true, error: true);
    }).catchError((_) => APIResponse<bool>(data: true, error: true));
  }
}