import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatares'),
        actions: [
          Container(
            padding: const EdgeInsets.all(5),
            child: GestureDetector(
              onTap: () {
                //Abrir el menú de configuración de la cuenta
              },
              child: const CircleAvatar(
                backgroundImage: NetworkImage('https://culturacolectiva-cultura-colectiva-prod.cdn.arcpublishing.com/resizer/ZUD9yu2KB8YiOYTutx-MtNj7THM=/1024x768/filters:format(jpg):quality(70)/cloudfront-us-east-1.images.arcpublishing.com/culturacolectiva/DZ3PVWDKQJHSRB3TVBNVK5N6EE.jpeg'),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: GestureDetector(
              onTap: () {
                //Abrir el menú de configuración de la cuenta
              },
              child: const CircleAvatar(
                backgroundColor: Colors.indigo,
                child: Text('NC'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
