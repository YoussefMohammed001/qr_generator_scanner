import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrCode extends StatefulWidget {
   GenerateQrCode({Key? key}) : super(key: key);

  @override
  State<GenerateQrCode> createState() => _GenerateQrCodeState();
}

class _GenerateQrCodeState extends State<GenerateQrCode> {
final data = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              QrImage(data:data.text,
              size: 200,
                backgroundColor: Colors.white,
              ),
              SizedBox(height: 40,),
              TextFormField(
                controller: data,
                textInputAction:TextInputAction.done ,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(onPressed: () {



                    setState(() {

                    });
                  }, icon: Icon(Icons.done),
                  ),
                  labelText: "write your data"
                ),
              )
            ],
          ),
        ),
      );
  }
}
