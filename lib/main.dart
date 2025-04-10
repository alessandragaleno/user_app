import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
    
    @override
    void _login() {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        if (_usuario == 'alexya' && _senha == '1234'){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage(usuario: _usuario)),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Usuário ou senha inválidos')),
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
            child: Padding(padding: EdgeInsets.all(20.0),
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
                    validator: (value)  => value!.isEmpty ? 'Digite o nome do usuário' : null,
                    onSaved: (value) => _usuario = value!,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value)  => value!.isEmpty ? 'Digite sua senha' : null,
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

    //Classe Homepage que será a página de perfil de usuário
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
                  height: 200, //altura do cabeçalho
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.redAccent, Colors.orangeAccent, Colors.blue],
                      begin: Alignment.topLeft, //Começa no topo a esquerda
                      end: Alignment.bottomRight,//finaliza em baixo a direita
            ),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30), //Arredonda o cabeçalho
            ),
          ),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 80, color: Colors.grey),
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
           _buildTextField(label: "Nome", value: usuario), // Campo de entrada para o primeiro nome
            _buildTextField(label: "Sobrenome", value: "Silva"), // Campo de entrada para o sobrenome
            _buildOption(label: "nascimento"), // Opção para data de nascimento
            _buildOption(label: "Genero"), // Opção para gênero
            SizedBox(height: 20), // Espaçamento
            _buildButton(text: "Alterar Senha", color: Colors.black), // Botão para alterar senha
            _buildButton(text: "Sair", color: Colors.red, isOutlined: true), // Botão para logout
              ],
        ),
      ),
    );
   }
   // Método para criar um campo de entrada de texto
  Widget _buildTextField({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5), // Define o espaçamento externo
      child: TextFormField(
        initialValue: value, // Define o valor inicial do campo
        decoration: InputDecoration(
          labelText: label, // Define o rótulo do campo
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)), // Adiciona borda arredondada
        ),
      ),
    );
  }     
  
  Widget _buildOption({required String label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ListTile(
        title: Text(label, style: TextStyle(fontSize: 16)),
        trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
  
  Widget _buildButton({required String text, required Color color, bool isOutlined = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: isOutlined ? Colors.white : color,
            foregroundColor: isOutlined ? color : Colors.white,
            side: isOutlined ? BorderSide(color : color) : null,
            padding: EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          child: Text(text, style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}

