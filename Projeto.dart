import 'dart:convert';
import 'dart:io';
import 'dart:core';

enum classes { ADMIN, DEFAULT }

class Activity {
  late String name;
  late String description;
  DateTime time_i, time_f;
  late String coordenation;
  late List<String> users;
  late Map<String, String> activity;

  Activity(
      {required this.name,
      required this.description,
      required this.time_i,
      required this.time_f,
      required this.coordenation,
      required this.users,
      required this.activity});

  String get nome => this.name;
  void set nome(String value) => this.name = value;

  String get descricao => this.description;
  void set descricao(String value) => this.description = value;

  DateTime get hora_i => this.time_i;
  void set hora_i(DateTime value) => this.time_i = value;

  DateTime get hora_f => this.time_f;
  void set hora_f(DateTime value) => this.time_f = value;

  String get coordenacao => this.coordenation;
  void set coordenacao(String value) => this.coordenation = value;

  List<String> get usuario => this.users;
  void set usuario(List<String> value) => this.users = value;

  Map<String, String> get atividade => this.activity;
  void set atividade(Map<String, String> value) => this.activity = value;
}

class Project {
  late String name;
  late String description;
  late String coordenation;
  late List<String> professionals;
  late int stocks;
  late int duration;
  DateTime time_i, time_f;

  Project(
      {required this.name,
      required this.description,
      required this.coordenation,
      required this.professionals,
      required this.time_i,
      required this.time_f,
      required this.stocks,
      required this.duration});

  String get nome => this.name;
  void set nome(String value) => this.name = value;

  String get descricao => this.description;
  void set descricao(String value) => this.description = value;

  String get coordenacao => this.coordenation;
  void set coordenacao(String value) => this.coordenation = value;

  List<String> get profissionais => this.professionals;
  void set profissionais(List<String> value) => this.professionals = value;

  DateTime get hora_i => this.time_i;
  void set hora_i(DateTime value) => this.time_i = value;

  DateTime get hora_f => this.time_f;
  void set hora_f(DateTime value) => this.time_f = value;

  int get bolsa => this.stocks;
  void set bolsa(int value) => this.stocks = value;

  int get vigencia => this.duration;
  void set vigencia(int value) => this.duration = value;
}

class User {
  List<Project>? projetinho;
  late String name;
  late String email;
  late String password;

  User(
      {required this.name,
      required this.email,
      required this.password,
      this.projetinho});

  String get nome => this.name;
  void set nome(String value) => this.name = value;

  String get endereco => this.email;
  void set endereco(String value) => this.email = value;

  String get senha => this.email;
  void set senha(String value) => this.email = value;

  List<Project> get projeto => this.projetinho = [];
  void set projeto(List<Project> value) => this.projetinho = value;
}

class Runner {
  List<User> user = [];
  List<Project> project = [];

  bool application = true, loginho = false;
  late int escolha;
  int i = 0;

  void criar_projeto() {
    List<String> usuarios = [];
    String project_name, description, coordenation;
    int bolsa, vigencia, hour_i, hour_f, mes, year, day, j = 0;
    DateTime hora_i = DateTime.now(), hora_f = DateTime.now();

    print('Digite o nome do projeto.');
    project_name = stdin.readLineSync()!;

    print('Digite a descrição do projeto.');
    description = stdin.readLineSync()!;

    print('Digite o coordenador do projeto.');
    coordenation = user[this.i].name;

    print('Escolha os seus usuários para o projeto');
    for (int i = 0; i < user.length; i++) {
      print('Usuário: ${user[i].name}');
    }

    print('(Caso queira parar de escolher usuários escreva [N]');

    while (1 != 0) {
      String users = stdin.readLineSync()!;
      if (users == 'N')
        break;
      else {
        for (int i = 0; i < user.length; i++) {
          if (users == user[i].name) {
            usuarios.add(users);
          }
        }
      }
    }

    print('Digite a hora inicial do projeto');
    hour_i = int.parse(stdin.readLineSync()!);

    hora_i =
        DateTime(hora_i.year, hora_i.month, hora_i.day, hour_i, hora_i.minute);

    print('Digite o ano final do projeto.');
    year = int.parse(stdin.readLineSync()!);

    print('Digite o mês final do projeto.');
    mes = int.parse(stdin.readLineSync()!);

    print('Digite o dia final do projeto.');
    day = int.parse(stdin.readLineSync()!);

    print('Digite a hora final do projeto.');
    hour_f = int.parse(stdin.readLineSync()!);

    hora_f = DateTime(year, mes, day, hour_f, hora_f.minute);

    print('Digite o valor da bolsa do projeto');
    bolsa = int.parse(stdin.readLineSync()!);

    print('Digite a duração da bolsa(Em meses)');
    vigencia = int.parse(stdin.readLineSync()!);

    this.project.add(Project(
        name: project_name,
        description: description,
        coordenation: coordenation,
        professionals: usuarios,
        time_i: hora_i,
        time_f: hora_f,
        stocks: bolsa,
        duration: vigencia));

    this.user[this.i].projetinho = project;
  }

  void removedor() {
    int escolha;
    print('[1] -> Remover usuário');
    print('[2] -> Remover projeto.');
    print('[3] -> Remover atividade');

    escolha = int.parse(stdin.readLineSync()!);

    switch (escolha) {
      case (1):
        String usuario, email;
        print('Digite o usuário.');
        usuario = stdin.readLineSync()!;

        print('Digite o email do usuário');
        email = stdin.readLineSync()!;

        for (int i = 0; i < user.length; i++) {
          if (user[i].name == usuario && user[i].email == email) {
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

        break;

      case (2):
        String project_name, coordenation, decisao;
        bool existo = false;

        print('Digite o nome do projeto.');
        project_name = stdin.readLineSync()!;

        print('Digite o nome do coordenador do projeto.');
        coordenation = stdin.readLineSync()!;

        for (int i = 0; i < project.length; i++) {
          if (project_name == project[i].name &&
              coordenation == project[i].coordenation) {
            print(
                'Deseja excluir esse projeto? ${project[i].name} com esse coordenador? ${project[i].name} [Y/N]');
            decisao = stdin.readLineSync()!;

            if (decisao == 'Y')
              project.removeAt(i);
            else
              print('Projeto não excluído!');
            existo = true;
          }
        }

        if (existo == false) {
          print('Projeto não encontrado, Deseja tentar novamente?[Y/N]');
          decisao = stdin.readLineSync()!;

          if (decisao == 'Y') removedor();
        }

        break;
    }
  }

  void buscador() {
    int escolha;

    print('[1] -> Buscar por usuário');
    print('[2] -> Buscar por projeto.');
    print('[3] -> Buscar por atividade');

    escolha = int.parse(stdin.readLineSync()!);

    switch (escolha) {
      case (1):
        String usuario;
        bool existo = true;

        print('Digite o usuário.');
        usuario = stdin.readLineSync()!;
        for (int i = 0; i < user.length; i++) {
          if (user[i].name == usuario) {
            print(
                'Nome: ${user[i].name}\n Email: ${user[i].email}\n Senha: ${user[i].password}');
            if (user[i].projetinho != null) {
              print('Projeto.\n${user[i].projetinho?[i].name}');
              print(
                  'Descrição do projeto: ${user[i].projetinho?[i].description}');
              print(
                  'Coordenador do projeto: ${user[i].projetinho?[i].coordenation}');
              print(
                  'Usuários do projeto: ${user[i].projetinho?[i].professionals}');
              print(
                  'Horario inicial do projeto: ${user[i].projetinho?[i].time_i}');
              print(
                  'Horario final do projeto: ${user[i].projetinho?[i].time_f}');
              print(
                  'Valor da bolsa do projeto: ${user[i].projetinho?[i].stocks}');
              print(
                  'Vigencia da bolsa do projeto: ${user[i].projetinho?[i].duration}');
            }
            existo = false;
          }
        }

        if (existo == true) {
          print('Usuário não encontrado!');
        }

        break;

      case (2):
        String project_name, coordenation;
        bool existo = false;

        print('Digite o nome do projeto');
        project_name = stdin.readLineSync()!;

        print('Digite o nome do coordenador');
        coordenation = stdin.readLineSync()!;

        for (int i = 0; i < project.length; i++) {
          if (project_name == project[i].name &&
              coordenation == project[i].coordenation) {
            print('Nome do projeto: ${project[i].name}');
            print('Descrição do projeto: ${project[i].description}');
            print('Coordenador do projeto: ${project[i].coordenation}');
            print('Usuários do projeto: ${project[i].professionals}');
            print('Horario inicial do projeto: ${project[i].time_i}');
            print('Horario final do projeto: ${project[i].time_f}');
            print('Valor da bolsa do projeto: ${project[i].stocks}');
            print('Vigencia da bolsa do projeto: ${project[i].duration}');
            existo = true;
          }
        }

        if (existo == false)
          print(
              'Não existe projeto com esse nome($coordenation) e esse coordenador($project_name)');

        break;
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
    String user, email, password;

    print('Digite o nome de usuario.');
    user = stdin.readLineSync()!;

    print('Digite o email.');
    email = stdin.readLineSync()!;

    print('Digite a senha.');
    password = stdin.readLineSync()!;

    this.user.add(User(name: user, email: email, password: password));
  }

  void program() {
    while (application == true) {
      if (this.loginho == true) print('Bem-vindo usuário(a) ${user[i].name}');

      print('[1] -> Cadastrar usuário.');
      print('[2] -> Fazer login.');
      print('[3] -> Recuperar senha.');
      print('[4] -> Sair do programa.');

      if (this.loginho == true) {
        print('[5] -> Buscador.');
        print('[6] -> Removedor.');
        print('[7] -> Criar projeto.');
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
        case (4):
          return;
      }

      if (this.loginho == true) {
        switch (escolha) {
          case (5):
            buscador();
            break;
          case (6):
            removedor();
            break;
          case (7):
            criar_projeto();
            break;
        }
      }
    }
  }
}

void main() {
  Runner runner = new Runner();
  runner.program();
}
