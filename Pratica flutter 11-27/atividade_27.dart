import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Aplicativo()));

class Aplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formulário')),
      body: Formulario(),
    );
  }
}

class Formulario extends StatefulWidget {
  @override
  FormularioState createState() => FormularioState();
}

class FormularioState extends State<Formulario> {
  /* Chave global que identifica o formulário e permite a validação.
 * OBS: devemos usar GlobalKey<FormState>,
 * não devemos usar GlobalKey<AplicativoState>.
 */
  final chaveFormulario = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController mensagemController = TextEditingController();
  late FocusNode meuFoco1, meuFoco2, meuFoco3;
  int contador = 0;
  //Método de iniciação:
  @override
  void initState() {
    super.initState();
    this.meuFoco1 = FocusNode();
    this.meuFoco2 = FocusNode();
    this.meuFoco3 = FocusNode();
  }

  //Método de finalização:
  @override
  void dispose() {
    this.meuFoco1.dispose();
    this.meuFoco2.dispose();
    this.meuFoco3.dispose();
    this.emailController.dispose();
    super.dispose();
  }

  Padding mensagem() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      ),
      child: TextFormField(
        minLines: 7,
        maxLines: 7,
        keyboardType: TextInputType.multiline,
        focusNode: this.meuFoco3,
        controller: this.mensagemController,
        validator: (valor) {
          if (valor == null || valor.isEmpty) {
            return 'informe: mensagem.';
          }
          return null;
        },
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () => this.mensagemController.clear(),
            icon: Icon(Icons.clear),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          labelText: 'mensagem',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Form(
        key: this.chaveFormulario,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CampoTexto(
              nome: 'e-mail',
              textoController: this.emailController,
              foco: this.meuFoco1,
              autoFoco: true,
            ),
            SenhaMascara(
              senhaMascaraController: senhaController,
              foco: this.meuFoco2,
            ),
            mensagem(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: Text('Próximo'),
                  focusNode: this.meuFoco2,
                  onPressed: () {
                    this.contador++;
                    switch (this.contador % 3) {
                      case 0:
                        meuFoco1.requestFocus();
                        break;
                      case 1:
                        meuFoco2.requestFocus();
                        break;
                      case 2:
                        meuFoco3.requestFocus();
                        break;
                      default:
                        meuFoco1.requestFocus();
                    }
                  },
                ),
                TextButton(
                  child: Text('Enviar'),
                  focusNode: this.meuFoco3,
                  onPressed: () {
                    if (this.chaveFormulario.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Enviando os dados...'),
                          duration: Duration(milliseconds: 850),
                        ),
                      );
                      this.emailController.clear();
                      meuFoco1.requestFocus();
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SenhaMascara extends StatefulWidget {
  final TextEditingController senhaMascaraController;
  final FocusNode foco;
  SenhaMascara({
    required this.senhaMascaraController,
    required this.foco,
  });
  @override
  SenhaMascaraState createState() => SenhaMascaraState();
}

class SenhaMascaraState extends State<SenhaMascara> {
  late bool _ocultarSenha;
  @override
  void initState() {
    super.initState();
    this._ocultarSenha = true;
  }

  void alternarVisibilidadeSenha() =>
      setState(() => this._ocultarSenha = !this._ocultarSenha);
  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: this.textFormField(),
      );
  Widget textFormField() => TextFormField(
        controller: this.widget.senhaMascaraController,
        focusNode: this.widget.foco,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () => this.alternarVisibilidadeSenha(),
            icon: Icon(
              this._ocultarSenha ? Icons.visibility : Icons.visibility_off,
              color: this._ocultarSenha ? Colors.blue : Colors.grey,
            ),
          ),
          border: OutlineInputBorder(),
          labelText: 'senha',
          hintText: 'informe sua senha',
        ),
        validator: (valor) => valor!.length < 8
            ? 'informe: senha com 8 ou mais caracteres.'
            : null,
        obscureText: this._ocultarSenha,
      );
}

class CampoTexto extends StatelessWidget {
  final String nome;
  final TextEditingController textoController;
  final FocusNode foco;
  final bool autoFoco;
  CampoTexto({
    required this.nome,
    required this.textoController,
    required this.foco,
    required this.autoFoco,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: this.textoController,
        autofocus: this.autoFoco,
        focusNode: this.foco,
        validator: (valor) {
          if (valor == null || valor.isEmpty) {
            return '${this.nome} não informado(a).';
          }
          return null;
        },
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () => this.textoController.clear(),
            icon: Icon(Icons.clear),
          ),
          border: OutlineInputBorder(),
          labelText: this.nome,
        ),
      ),
    );
  }
}