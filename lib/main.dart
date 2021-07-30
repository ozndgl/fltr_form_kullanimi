import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var formKey =GlobalKey<FormState>();
  var tfKullaniciAdi = TextEditingController();
  var tfSifre = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Padding(
             padding: const EdgeInsets.all(20.0),
             child: Form(
               key: formKey,
               child: Column(
                 children: [
                    TextFormField(
                      controller: tfKullaniciAdi,
                      decoration: InputDecoration(hintText: "Kullanıcı Adı"),
                      validator: (tfgirdisi){
                        if(tfgirdisi!.isEmpty){
                          return "kullanıcı adı giriniz";
                        }
                        return null;
                      },
                    ),
                   TextFormField(
                     controller: tfSifre,
                     obscureText: true,//şifreleri yıldız gösteriri
                     decoration: InputDecoration(hintText: "Şifre"),
                     validator: (tfgirdisi){
                       if(tfgirdisi!.isEmpty){
                         return "Şifre Giriniz";
                       }
                       if(tfgirdisi.length < 6){
                         return"şifreniz altı haneden küçük olamaz";
                       }
                       return null;
                     },
                   ),
                   RaisedButton(
                     child: Text("GİRİŞ"),
                     onPressed: (){
                       bool kontrolSonucu = formKey.currentState!.validate();
                       if(kontrolSonucu){
                         String ka = tfKullaniciAdi.text;
                         String s = tfSifre.text;
                         print("kulanici adi : $ka - şifre: $s");
                       }else{
                         print("kullanıcı adı veya şifreyi kontrol et");
                       }
                     },
                   )
                 ],
               ),
             ),
           ),
          ],
        ),
      ),

    );
  }
}
