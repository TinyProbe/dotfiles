vim.cmd([[

iabbrev $<startApp>
\ import 'package:flutter/material.dart';
\<nl>
\<nl>void main() {
\<nl>  runApp(const App());
\<nl>}
\<nl>
\<nl>class App extends StatelessWidget {
\<nl>  const App({super.key});
\<nl>  @override
\<nl>  Widget build(BuildContext context) {
\<nl>    return MaterialApp(
\<nl>      debugShowCheckedModeBanner: false,
\<nl>      initialRoute: '/initial',
\<nl>      routes: {
\<nl>        '/initial': (context) => Initial();
\<nl>      },
\<nl>    );
\<nl>  }
\<nl>}
\<esc>v18k=

iabbrev $<stateless>
\ class name extends StatelessWidget {
\<nl>  const name({super.key});
\<nl>  @override
\<nl>  Widget build(BuildContext context) {
\<nl>    return Container();
\<nl>  }
\<nl>}
\<esc>v6k=

iabbrev $<stateful>
\ class name extends StatefulWidget {
\<nl>  const name({super.key});
\<nl>  @override
\<nl>  State<StatefulWidget> createState() => _name();
\<nl>}
\<nl>
\<nl>class _name extends State<name> {
\<nl>  @override
\<nl>  Widget build(BuildContext context) {
\<nl>    return Container();
\<nl>  }
\<nl>}
\<esc>v11k=

]])
