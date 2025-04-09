import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // remover o negócio de debug de dentro do app
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _usuario = '';
  String _senha = '';

  void _login() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_usuario == 'Chico' && _senha == '1234') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage(usuario: _usuario)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login ou senha inválidos.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.person, size: 100, color: Colors.orange),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Usuário',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Digite nome do usuário: ' : null,
                      onSaved: (value) => _usuario = value!,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Digite sua senha: ' : null,
                      onSaved: (value) => _senha = value!,
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: _login,
                        child: Text('Entrar', style: TextStyle(fontSize: 18)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
void _formKey() {
    @override
    Widget build(BuildContext context) {
      // Todo: implement build
      throw UnimplementedError();
    }
}

// classe Homepage que será a página de perfil de usuário
class HomePage extends StatelessWidget {
  final String usuario;

  HomePage({required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200, //Altura do cabeçalho
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.redAccent,Colors.orange, Colors.blue],
                  begin: Alignment.topLeft, //começa no topo a esquerda
                  end: Alignment.bottomRight, // termina no fundo em baixo a direita
                  ),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),// Arrredonda o cabeçalho
                  ),
              ),
              child: Center(
                child: Stack(
                  alignment: Alignment.center),
                  children: [
    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 80, color: Colors.grey,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.black,
                        child: Icon(Icons.edit, size: 15, color: Colors.white),
                      ),
                      ),
                      ],
                ),
                ),
              ),
              SizedBox(height: 20),
                _buildTextField(Label: 'Nome', value: username),// campo de entrada para o primeiro nome
                _buildTextField(Label: 'Sobrenome', value:'silva'),// campo de entrada para o sobrebome
                _buildOption(Label: 'nascimento'), //opção para data de nascimento
                _buildOption(label: 'Genero'), // opção para genero
                SizedBox(height: 20),// espaçamento
                _buildButton(text: 'Alterar Senha', color: Colors.black), // botão para alterar senha 
                _buildButton(text: 'Sair', color: Colors.red, isOutlined: true), // botão para alterar logout
                ],
    );
  }
}
