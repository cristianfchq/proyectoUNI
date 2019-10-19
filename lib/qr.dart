import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:proyecto1001_2/page2.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result = "AQUI";
  var datos;
  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Permiso de la camara esta denegado";
        });
      } else {
        setState(() {
          result = "Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "bla bla";
      });
    } catch (ex) {
      setState(() {
        result = "Error $ex";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "QR SCANER",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Center(
                child: Text(
                  result,
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(),
              RaisedButton.icon(
                icon: Icon(Icons.add, size: 20.0),
                color: Colors.yellow,
                label: Text("Guardar Datos"),
                onPressed: () {
                  //setState(
                  //() {
                  //print(_nombre);
                  //print(_contr);
                  if (result == "bla bla" ||
                      result == "AQUI" ||
                      result == "Primero Scanear") {
                    setState(() {
                      result = "Primero Scanear";
                    });
                  } else {
                    datos = result.split(',');
                    print(datos);
                    print(datos[0]);
                    print(datos[1]);
                    //print(datos[2]);
                    //print(datos[3]);
                    //print(datos[4]);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewPage2()),
                    );
                  }
                  //},
                  //);
                },
              ),
            ],
          ),
          Divider(),
          Column(
            children: <Widget>[
              RaisedButton(
                child: Text("Guardar Datos"),
                onPressed: null,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text("scan qr"),
        onPressed: _scanQR,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
