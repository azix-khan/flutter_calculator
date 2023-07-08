import 'package:calculator/components/my_buttons.dart';
import 'package:calculator/constant.dart';
// import 'package:calculator/constant.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            userInput.toString(),
                            style: const TextStyle(
                                fontSize: 50, color: Colors.white),
                          )),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          answer.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white),
                        ),
                      ),
                      const Divider(
                        color: orangeColor,
                        thickness: 2.5,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MYButton(
                          title: 'AC',
                          onPress: () {
                            userInput = '';
                            answer = '';
                            setState(() {});
                          },
                          color: const Color(0xffC0C0C0),
                        ),
                        MYButton(
                          title: '+/-',
                          onPress: () {
                            userInput += '+/-';
                            setState(() {});
                          },
                        ),
                        MYButton(
                          title: '%',
                          onPress: () {
                            userInput += '%';
                            setState(() {});
                          },
                        ),
                        MYButton(
                          title: '/',
                          onPress: () {
                            userInput += '/';
                            setState(() {});
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MYButton(
                          title: '7',
                          onPress: () {
                            userInput += '7';
                            setState(() {});
                          },
                        ),
                        MYButton(
                          title: '8',
                          onPress: () {
                            userInput += '8';
                            setState(() {});
                          },
                        ),
                        MYButton(
                          title: '0',
                          onPress: () {
                            userInput += '0';
                            setState(() {});
                          },
                        ),
                        MYButton(
                          title: 'x',
                          onPress: () {
                            userInput += 'x';
                            setState(() {});
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MYButton(
                          title: '4',
                          onPress: () {
                            userInput += '4';
                            setState(() {});
                          },
                        ),
                        MYButton(
                          title: '5',
                          onPress: () {
                            userInput += '5';
                            setState(() {});
                          },
                        ),
                        MYButton(
                          title: '6',
                          onPress: () {
                            userInput += '6';
                            setState(() {});
                          },
                        ),
                        MYButton(
                          title: '-',
                          onPress: () {
                            userInput += '-';
                            setState(() {});
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MYButton(
                          title: '1',
                          onPress: () {
                            userInput += '1';
                            setState(() {});
                          },
                        ),
                        MYButton(
                          title: '2',
                          onPress: () {
                            userInput += '2';
                            setState(() {});
                          },
                        ),
                        MYButton(
                          title: '3',
                          onPress: () {
                            userInput += '3';
                            setState(() {});
                          },
                        ),
                        MYButton(
                          title: '+',
                          onPress: () {
                            userInput += '+';
                            setState(() {});
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MYButton(
                          title: '0',
                          onPress: () {
                            userInput += '0';
                            setState(() {});
                          },
                        ),
                        MYButton(
                          title: '.',
                          onPress: () {
                            userInput += '.';
                            setState(() {});
                          },
                        ),
                        MYButton(
                          title: 'DEL',
                          onPress: () {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                            setState(() {});
                          },
                          color: const Color(0xff800000),
                        ),
                        MYButton(
                          title: '=',
                          onPress: () {
                            equalPress();
                            setState(() {});
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalPress() {
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
