import 'dart:convert';
import 'dart:io';


class User
{
  late  String name;
  late  String email;
  late  String password;


  User(this.name,this.email,this.password);
  
  String get nome => this.name;
  void set nome(String value) => this.name = value;

  String get endereco => this.email;
  void set endereco(String value) => this.email = value;

  String get senha => this.email;
  void set senha(String value) => this.email = value;
  
}

class Runner
{
  List<User> user = [];
  bool application = true;
  late int escolha;
  int i = 0;

  void removedor(){
    int escolha;
    String lixo, lixo2;
    print('[1] -> Remover usuário');
    print('[2] -> Remover projeto.');
    print('[3] -> Remover atividade');

    escolha = int.parse(stdin.readLineSync()!);

    switch(escolha){
      case(1):
        print('Digite o usuário.');
        lixo = stdin.readLineSync()!;

        print('Digite o email do usuário');
        lixo2 = stdin.readLineSync()!;


        for(int i = 0; i < user.length;i++){
          if(user[i].name == lixo && user[i].email == lixo2){
            print('Tem certeza que deseja remover o usuário: ${user[i].name}? [Y/N]');
            String lixinho = stdin.readLineSync()!;

            if(lixinho == 'Y') user.removeAt(i);
            else{
              print('Usuário não removido');
              break;
            } 
          }
        }
    }
  }


  void buscador(){
    int escolha;
    String lixo;
    bool existo = true;
    print('[1] -> Buscar por usuário');
    print('[2] -> Buscar por projeto.');
    print('[3] -> Buscar por atividade');

    escolha = int.parse(stdin.readLineSync()!);

    switch(escolha){
      case(1):
        print('Digite o usuário.');
        lixo = stdin.readLineSync()!;
        for(int i = 0; i < user.length;i++){
          if(user[i].nome == lixo){
            print('Nome: ${user[i].name}\n Email: ${user[i].email}\n Senha: ${user[i].password}');
            existo = false;
          }
        }

        if(existo == true){
          print('Usuário não encontrado!');
        }
    }
  }

  void refazer_senha(){
    String lixo;
    bool existo = true;

    while(existo == true){
      print('digite o email da sua conta.');
      lixo = stdin.readLineSync()!;
      var result = user.where((lixo) => user[i].email == lixo);
      print('O resultado é esse: $result');
      
    
      
      /*for(int i = 0; i < user.length;i++){
        if(lixo == user[i].endereco){
          print('Digite a nova senha');
          lixo = stdin.readLineSync()!;
          user[i].password = lixo;
          existo = false;
        }
      }

      if(existo == true) print('Não achamos o seu email. Repita até achar seu email.');
      */
    }
  }

  void cadastro(){
    String lixo1, lixo2, lixo3;

    print('Digite o nome de usuario.');
    lixo1 = stdin.readLineSync()!;
    
    print('Digite o email.');
    lixo2 = stdin.readLineSync()!;

    print('Digite a senha.');
    lixo3 = stdin.readLineSync()!;

    this.user.add(User(lixo1, lixo2, lixo3));
  }
  

  void program (){
    while(application == true){
      print('[1] -> Cadastrar usuário.');
      print('[2] -> Recuperar senha.');
      print('[3] -> Buscador');
      print('[4] -> Removedor');
      


      escolha = int.parse(stdin.readLineSync()!);
     
      switch(escolha){
        case(1): cadastro(); break;
        case(2): refazer_senha(); break;
        case(3): buscador(); break;
        case(4): removedor(); break;
      }
    }
  }
}


void main()
{
  Runner runner = new Runner();
  runner.program();
}
