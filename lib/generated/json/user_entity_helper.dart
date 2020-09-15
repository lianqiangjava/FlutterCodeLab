import 'package:flutter_practice/model/user_entity.dart';

userEntityFromJson(UserEntity data, Map<String, dynamic> json) {
	if (json['login'] != null) {
		data.login = json['login']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['html_url'] != null) {
		data.htmlUrl = json['html_url']?.toString();
	}
	if (json['created_at'] != null) {
		data.createdAt = json['created_at']?.toString();
	}
	return data;
}

Map<String, dynamic> userEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['login'] = entity.login;
	data['name'] = entity.name;
	data['html_url'] = entity.htmlUrl;
	data['created_at'] = entity.createdAt;
	return data;
}