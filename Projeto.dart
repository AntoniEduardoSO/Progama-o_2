import 'dart:convert';
import 'dart:io';
import 'dart:core';

class Activity {
  late String name;
  late String description;
  DateTime time_i;
  DateTime? time_f;
  late String coordenation;
  late List<String> users;
  late Map<String, String> activity;

  Activity(
      {required this.name,
      required this.description,
      required this.time_i,
      this.time_f,
      required this.coordenation,
      required this.users,
      required this.activity});

  String get nome => this.name;
  void set nome(String value) => this.name = value;

  String get descricao => this.description;
  void set descricao(String value) => this.description = value;

  DateTime get hora_i => this.time_i;
  void set hora_i(DateTime value) => this.time_i = value;

  DateTime? get hora_f => this.time_f;
  void set hora_f(DateTime? value) => this.time_f = value;

  String get coordenacao => this.coordenation;
  void set coordenacao(String value) => this.coordenation = value;

  List<String> get usuario => this.users;
  void set usuario(List<String> value) => this.users = value;

  Map<String, String> get atividade => this.activity;
  void set atividade(Map<String, String> value) => this.activity = value;
}

class Project {
  List<User> user;
  Activity? activity;
  late String name;
  late String description;
  late String coordenation;
  late List<String> professionals;
  late int stocks;
  late int duration;
  DateTime time_i;
  DateTime? time_f;

  Project(
      {required this.name,
      required this.description,
      required this.coordenation,
      required this.professionals,
      this.activity,
      required this.time_i,
      this.time_f,
      required this.stocks,
      required this.duration,
      required this.user});

  String get nome => this.name;
  void set nome(String value) => this.name = value;

  String get descricao => this.description;
  void set descricao(String value) => this.description = value;

  String get coordenacao => this.coordenation;
  void set coordenacao(String value) => this.coordenation = value;

  List<String> get profissionais => this.professionals;
  void set profissionais(List<String> value) => this.professionals = value;

  Activity? get atividade => this.activity;
  void set atividade(Activity? value) => this.activity = value;

  DateTime get hora_i => this.time_i;
  void set hora_i(DateTime value) => this.time_i = value;

  DateTime? get hora_f => this.time_f;
  void set hora_f(DateTime? value) => this.time_f = value;

  int get bolsa => this.stocks;
  void set bolsa(int value) => this.stocks = value;

  int get vigencia => this.duration;
  void set vigencia(int value) => this.duration = value;

  List<User> get usuarios => this.user = [];
  void set usuarios(List<User> value) => this.user = value;
}

class User {
  late String name;
  late String email;
  late String password;

  User({required this.name, required this.email, required this.password});

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
  List<Activity> activity = [];

  bool application = true, loginho = false;
  late int escolha;
  int i = 0;

  void criar_projeto() {
    
    List<User> project_user = [];
    List<String> project_professionals = [];
    String project_name, project_description, project_coordenation;
    int project_stocks, project_duration;
    DateTime project_time_i;

    print('------------PROJETOS------------\n');

    print('Digite o nome do projeto');
    project_name = stdin.readLineSync()!;

    print('Digite a descrição do projeto');
    project_description = stdin.readLineSync()!;

    project_coordenation = this.user[this.i].name;

    print('Usuários disponíveis para entrar no projeto:');
    for (int i = 0; i < user.length; i++) print('Usuário: ${user[i].name}');

    print(
        'Digite os usuários que você deseja para o projeto. * Codigo de parada é [N] *');

    for (;;) {
      String input = stdin.readLineSync()!;
      if (input == 'N') break;
      for (int j = 0; j < this.user.length; j++) {
        if (input == user[j].name) {
          project_user.add(User(
              name: this.user[j].name,
              email: this.user[j].email,
              password: this.user[j].password));
        }
      }
    }

    for (int i = 0; i < project_user.length; i++)
      project_professionals.add(project_user[i].name);

    print('Digite o valor da bolsa.');
    project_stocks = int.parse(stdin.readLineSync()!);

    print('Digite a vigência da bolsa(Em meses)');
    project_duration = int.parse(stdin.readLineSync()!);

    print('----------ATIVIDADES----------');

    Map<String, String> activity_jobs = Map();
    List<String> activity_professionals = [];
    String activity_name, activity_description, activity_coordenation;
    DateTime activity_time_i;

    print('Digite o nome da atividade.');
    activity_name = stdin.readLineSync()!;

    print('Digite a descrição da atividade.');
    activity_description = stdin.readLineSync()!;

    print('Digite o coordenador da atividade');
    activity_coordenation = stdin.readLineSync()!;

    print('Usuários disponíveis para a atividade.');
    for (int i = 0; i < project_professionals.length; i++)
      print('Usuário: ${project_professionals[i]}');

    for (;;) {
      String input = stdin.readLineSync()!;
      if (input == 'N') break;
      for (int j = 0; j < project_professionals.length; j++) {
        if (input == project_professionals[j])
          activity_professionals.add(project_professionals[j]);
      }
    }

    print('Usuários disponíveis para os trabalhos');
    for (int i = 0; i < activity_professionals.length; i++)print('Usuário: ${activity_professionals[i]}');

    
    for (int i = 0;i < activity_professionals.length; i++) {
      print('O que o usuário ${activity_professionals[i]} irá fazer?');

      String job = stdin.readLineSync()!;
      activity_jobs.addAll({activity_professionals[i] : job});
    }

    project_time_i = DateTime.now();
    activity_time_i = DateTime.now();
    
    this.activity.add(Activity(
        name: activity_name,
        description: activity_description,
        time_i: activity_time_i,
        coordenation: activity_coordenation,
        users: activity_professionals,
        activity: activity_jobs));

    int activity_index = activity.length - 1;
    
    this.project.add(Project(
        name: project_name,
        description: project_description,
        coordenation: project_coordenation,
        professionals: project_professionals,
        activity: activity[activity_index],
        time_i: project_time_i,
        stocks: project_stocks,
        duration: project_duration,
        user: user
        ));

    print('Projeto e atividade FEITOS!!!!!');
  }

  void editar_usuario(){
    int escolha;
    print('[1] -> Editar o nome de usuário.');
    print('[2] -> Editar o email.');
    print('[3] -> Editar senha.');

    escolha = int.parse(stdin.readLineSync()!);

    switch(escolha){
        case(1):
          String input;
          int activity_users_tam = 0, activity_activity_tam = 0;
        
          print('Digite o nome do usuário que deseja mudar.');
          input = stdin.readLineSync()!;
        
          for(int i = 0; i < user.length;i++){
            if(user[i].name == input){
              String user_name;
              print('Digite o novo nome de usuário para o usuário: ${user[i].name}.');
              user_name = stdin.readLineSync()!;
              user[i].name = user_name;
                  
                for(int k = 0; k < project[j].activity!.users.length; k++){
                  if(project[j].activity?.users[k] == input){
                    project[j].activity?.users[k] = input;
                  }
                  
                }
                
                
                
                for(int k = 0; k < project[j].user.length;k++){
                  if(user[i].name == project[j].user[k].name){
                    project[j].user[k].name = user_name;
                  }
                }
              }


              
              print('Edição feita!');
            }
          }
        
          break;

        case(2):
          String input;
        
          print('Digite o nome do usuário que deseja mudar o email');
          input = stdin.readLineSync()!;

          for(int i = 0; i < user.length;i++){
            if(user[i].name == input){
              String user_email;
              print('Digite o novo email para o usuário: ${user[i].name}.');
              user_email = stdin.readLineSync()!;
              user[i].email = user_email;
              print('Edição feita!');
            }
          }
          
          break;

        case(3):
          String input;
        
          print('Digite o nome do usuário que deseja mudar a senha');
          input = stdin.readLineSync()!;

          for(int i = 0; i < user.length;i++){
            if(user[i].name == input){
              String user_password;
              print('Digite a nova senha para o usuário: ${user[i].name}.');
              user_password = stdin.readLineSync()!;
              user[i].password = user_password;
              print('Edição feita!');
            }
          }
        
          break;
      
    }

  }
  
  void editar() {
    int escolha;
    
    print('[1] -> Editar usuário.');
    print('[2] -> Editar projeto.');
    print('[3] -> Editar atividade.');

    escolha = int.parse(stdin.readLineSync()!);
    switch(escolha){
        case(1): editar_usuario(); break;
        // case(2): editar_projeto(); break;
        // case(3): editar_atividade(); break;
    }
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
        bool existo = false;

        print('Digite o usuário.');
        usuario = stdin.readLineSync()!;
        for (int i = 0; i < user.length; i++) {
          if (user[i].name == usuario) {
            print('Nome: ${user[i].name}\n Email: ${user[i].email}\n Senha: ${user[i].password}');
            for(int j = 0; j < project.length;j++){
              for(int k = 0; k <  project[j].user.length;k++){
                if(user[i].name == project[j].user[k].name){
                  print('-----------------PROJETO: ${project[j].name.toUpperCase()}-----------------\n');
                  print('Nome do projeto: ${project[j].name}');
                  print('Descrição do projeto: ${project[j].description}');
                  print('Coordenador do projeto: ${project[j].coordenation}');
                  print('Usuários do projeto: ${project[j].professionals}');
                  print('Horario inicial do projeto: ${project[j].time_i}');
                  print('Valor da bolsa do projeto: ${project[j].stocks}');
                  print('Vigencia da bolsa do projeto: ${project[j].duration}\n');
                  print('----------------ATIVIDADE: ${project[j].activity?.name.toUpperCase()}----------------\n');
                  print('Nome do projeto: ${project[j].activity?.name}');
                  print('Descrição do projeto: ${project[j].activity?.description}');
                  print('Coordenador do projeto: ${project[j].activity?.coordenation}');
                  print('Usuários do projeto: ${project[j].activity?.users}');
                  print('Horario inicial do projeto: ${project[j].activity?.time_i}');
                  print('Valor da bolsa do projeto: ${project[j].activity?.activity}');
                }
              }
            }
            existo = true;
          }
        }

        if (existo == false) {
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
          if (project_name == project[i].name && coordenation == project[i].coordenation) {
            print('-----------------PROJETO: ${project[i].name.toUpperCase()}-----------------\n');
            print('Nome do projeto: ${project[i].name}');
            print('Descrição do projeto: ${project[i].description}');
            print('Coordenador do projeto: ${project[i].coordenation}');
            print('Usuários do projeto: ${project[i].professionals}');
            print('Horario inicial do projeto: ${project[i].time_i}');
            print('Horario final do projeto: ${project[i].time_f}');
            print('Valor da bolsa do projeto: ${project[i].stocks}');
            print('Vigencia da bolsa do projeto: ${project[i].duration}');
            print('----------------ATIVIDADE: ${project[i].activity?.name.toUpperCase()}----------------\n');
            print('Nome do projeto: ${project[i].activity?.name}');
            print('Descrição do projeto: ${project[i].activity?.description}');
            print('Coordenador do projeto: ${project[i].activity?.coordenation}');
            print('Usuários do projeto: ${project[i].activity?.users}');
            print('Horario inicial do projeto: ${project[i].activity?.time_i}');
            print('Valor da bolsa do projeto: ${project[i].activity?.activity}');
            existo = true;
          }
        }

        if (existo == false)
          print(
              'Não existe projeto com esse nome($project_name) e esse coordenador($coordenation)');

        break;

        case(3):
        
          String activity_name, activity_coordenation;
        
          print('Digite o nome da atividade');
          activity_name = stdin.readLineSync()!;

          print('Digite o nome do coordenador do curso');
          activity_coordenation = stdin.readLineSync()!;

          for(int i = 0; i < this.activity.length;i++){
            if(activity_name == activity[i].name && activity_coordenation == activity[i].coordenation){
              print('----------------ATIVIDADE: ${activity[i].name.toUpperCase()}----------------\n');
            print('Nome do projeto: ${activity[i].name}');
            print('Descrição do projeto: ${activity[i].description}');
            print('Coordenador do projeto: ${activity[i].coordenation}');
            print('Usuários do projeto: ${activity[i].users}');
            print('Horario inicial do projeto: ${activity[i].time_i}');
            print('Valor da bolsa do projeto: ${activity[i].activity}');
            }
          }

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
        print('[8] -> Editar.');
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
          case(8):
            editar();
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
