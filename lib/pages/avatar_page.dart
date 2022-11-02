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
                backgroundColor: Colors.deepPurpleAccent,
                child: Text('NC'),
              ),
            ),
          )
        ],
      ),
      body: const Center(
        //FadeInImage -> hace una animación de fundido y nos deja poner un widget de tipo placeholder
        child: FadeInImage(
          image: NetworkImage('https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/matt-schulze-chad-lindberg-michelle-rodriguez-vin-diesel-news-photo-1624538754.jpg?crop=1.00xw:0.675xh;0,0.229xh&resize=640:*'),
          fadeInDuration: Duration(seconds: 2),
          fadeInCurve: Curves.fastLinearToSlowEaseIn,
          placeholder: AssetImage('assets/carga.gif'),
        ),
      ),
    );
  }
}
