import 'dart:convert';
import 'dart:io';
import 'dart:core';

class Project {
  late String name;
  late String description;
  late String coordenation;
  late int stocks;
  late int duration;
  var time_i, time_f;

  // var time_i = DateTime.utc()

  Project(this.name, this.description, this.coordenation, this.stocks,
      this.duration);

  // DateTime(bool inicial){
  //  int hour = int.parse(stdin.readLineSync()!);
  //  this.time_i = DateTime.now();
  //}

  String get nome => this.name;
  void set nome(String value) => this.name = value;

  String get descricao => this.description;
  void set descricao(String value) => this.description = value;

  // String get hora_i => this.time_i;
  // void set hora_i(final value) => this.time_i = value;

  String get coordenacao => this.coordenation;
  void set coordenacao(String value) => this.coordenation = value;

  int get bolsa => this.stocks;
  void set bolsa(int value) => this.stocks = value;

  int get vigencia => this.duration;
  void set vigencia(int value) => this.duration = value;
}

class User {
  late String name;
  late String email;
  late String password;

  User(this.name, this.email, this.password);

  String get nome => this.name;
  void set nome(String value) => this.name = value;

  String get endereco => this.email;
  void set endereco(String value) => this.email = value;

  String get senha => this.email;
  void set senha(String value) => this.email = value;
}

class Runner {
  List<User> user = [];
  List<Project> project = [];

  bool application = true, loginho = false;
  late int escolha;
  int i = 0;

  void criar_projeto(){
    String lixo1, lixo2, lixo3;
    int bolsa, vigencia;
    print('Digite o nome do projeto.');
    lixo1 = stdin.readLineSync()!;

    print('Digite a descrição do projeto.');
    lixo2 = stdin.readLineSync()!;
    
    print('Digite o coordenador do projeto.');
    lixo3 = stdin.readLineSync()!;
    
    print('Digite o valor da bolsa do projeto');
    bolsa = int.parse(stdin.readLineSync()!);
    
    print('Digite a duração da bolsa(Em meses)');
    vigencia = int.parse(stdin.readLineSync()!);

    this.project.add(Project(lixo1,lixo2,lixo3,bolsa,vigencia));
  }
  

  void removedor() {
    int escolha;
    String lixo, lixo2;
    print('[1] -> Remover usuário');
    print('[2] -> Remover projeto.');
    print('[3] -> Remover atividade');

    escolha = int.parse(stdin.readLineSync()!);

    switch (escolha) {
      case (1):
        print('Digite o usuário.');
        lixo = stdin.readLineSync()!;

        print('Digite o email do usuário');
        lixo2 = stdin.readLineSync()!;

        for (int i = 0; i < user.length; i++) {
          if (user[i].name == lixo && user[i].email == lixo2) {
            print(
                'Tem certeza que deseja remover o usuário: ${user[i].name}? [Y/N]');
            String lixinho = stdin.readLineSync()!;

            if (lixinho == 'Y') {
              if (this.i == i) this.loginho = false;
              this.i = 0;
              user.removeAt(i);
              print('Usuário removido com sucesso.');
            } else {
              print('Usuário não removido');
              break;
            }
          }
        }
    }
  }

  void buscador() {
    int escolha, i;
    String lixo;
    bool existo = true;

    print('[1] -> Buscar por usuário');
    print('[2] -> Buscar por projeto.');
    print('[3] -> Buscar por atividade');

    escolha = int.parse(stdin.readLineSync()!);

    switch (escolha) {
      case (1):
        print('Digite o usuário.');
        lixo = stdin.readLineSync()!;
        for (int i = 0; i < user.length; i++) {
          if (user[i].nome == lixo) {
            print(
                'Nome: ${user[i].name}\n Email: ${user[i].email}\n Senha: ${user[i].password}');
            existo = false;
          }
        }

        if (existo == true) {
          print('Usuário não encontrado!');
        }
    }
  }

  void refazer_senha() {
    String lixo;
    bool existo = true;

    while (existo == true) {
      print('digite o email da sua conta.');
      lixo = stdin.readLineSync()!;

      for (int i = 0; i < user.length; i++) {
        if (lixo == user[i].endereco) {
          print('Digite a nova senha');
          lixo = stdin.readLineSync()!;
          user[i].password = lixo;
          existo = false;
        }
      }
      if (existo == true)
        print('Não achamos o seu email. Repita até achar seu email.');
    }
  }

  void login() {
    String lixo1, lixo2;
    bool existo = false;

    print('Digite o email.');
    lixo1 = stdin.readLineSync()!;

    print('Digite a senha.');
    lixo2 = stdin.readLineSync()!;

    for (int i = 0; i < user.length; i++) {
      if (lixo1 == user[i].email && lixo2 == user[i].password) {
        this.loginho = true;
        this.i = i;
        existo = true;
      }
    }

    if (existo == false) {
      String teste;
      print(
          'Nao existe esse login, deseja tentar fazer o login novamente?[Y/N]');
      teste = stdin.readLineSync()!;
      if (teste == 'Y') login();
    }
  }

  void cadastro() {
    String lixo1, lixo2, lixo3;

    print('Digite o nome de usuario.');
    lixo1 = stdin.readLineSync()!;

    print('Digite o email.');
    lixo2 = stdin.readLineSync()!;

    print('Digite a senha.');
    lixo3 = stdin.readLineSync()!;

    this.user.add(User(lixo1, lixo2, lixo3));
  }

  void program() {
    while (application == true) {
      if (this.loginho == true) print('Bem-vindo usuário(a) ${user[i].name}');

      print('[1] -> Cadastrar usuário.');
      print('[2] -> Fazer login.');
      print('[3] -> Recuperar senha.');

      if (this.loginho == true) {
        print('[4] -> Buscador.');
        print('[5] -> Removedor.');
        print('[6] -> Criar projeto.');
      }

      escolha = int.parse(stdin.readLineSync()!);

      switch (escolha) {
        case (1):
          cadastro();
          break;
        case (2):
          login();
          break;
        case (3):
          refazer_senha();
          break;
      }

      if (this.loginho == true) {
        switch (escolha) {
          case (4):
            buscador();
            break;
          case (5):
            removedor();
            break;
          // case(6): criar_projeto(); break;
        }
      }
    }
  }
}

void main() {
  Runner runner = new Runner();
  runner.program();
}
