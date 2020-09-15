import 'package:flutter_practice/generated/json/base/json_convert_content.dart';
import 'package:flutter_practice/generated/json/base/json_filed.dart';

class UserEntity with JsonConvert<UserEntity> {
	String login;
	String name;
	@JSONField(name: "html_url")
	String htmlUrl;
	@JSONField(name: "created_at")
	String createdAt;
}
