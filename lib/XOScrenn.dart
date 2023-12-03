import 'package:flutter/material.dart';


class XOScreen extends StatefulWidget {
  @override
  _XOScreenState createState() => _XOScreenState();
}

class _XOScreenState extends State<XOScreen> {
  List<String> board = List.filled(9, '');
  bool isPlayerOneTurn = true;
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    backgroundColor: Colors.red,
    title: Text("X O"),


  ),
  body: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
        (crossAxisCount:3
      ),
  itemCount: 9,
    itemBuilder: (BuildContext contex,int index){
        return GestureDetector(
          onTap: (){
            if(board[index]==''){
              setState(() {
                board[index] =isPlayerOneTurn? 'X' : 'O';isPlayerOneTurn = !isPlayerOneTurn;
                checkWinner();
              });
            }
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
              color: Colors.blue,
              width: 50,
              ),
            ),
            child: Center(
              child: Text(
                board[index],
                style: TextStyle(
                  fontSize:100,
                )
              ),
            ),
          ),
        );
    },
  ),
);
  }
  void checkWinner(){
    for (int i=0;i<3;i++){
      if (board[i*3]!='' &&
          board[i*3] == board[i*3+1] &&
          board[i*3+1] == board[i*3+2]) {
        showWinnerDialog(board[i*3]);
        return;
      }
      if (board[i] !='' &&
          board[i] == board[i+3] &&
          board[i+3] == board[i+6]){
        showWinnerDialog(board[i]);
        return;
      }


    }
    if (board[0] != '' && board[0] == board[4] && board[4] == board[8]){
      showWinnerDialog(board[0]);
      return;
    }
    if (board[2]!= '' && board[2] == board[4] && board[4] == board[6]){
      showWinnerDialog(board[2]);
      return;
    }
    if (!board.contains('')){
      showDrawDialog();
    }
  }
  void showWinnerDialog(String winner) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Finish Game'),
          content: Text('Player $winner wins!'),
          actions: [
            TextButton(
              onPressed: () {
                resetGame();
                Navigator.of(context).pop();
              },
              child: Text('Play Again'),
            ),
          ],
        );
      },
    );
  }

  void showDrawDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Finish Game'),
          content: Text('It\'s a draw!'),
          actions: [
            TextButton(
              onPressed: () {
                resetGame();
                Navigator.of(context).pop();
              },
              child: Text('Play Again'),
            ),
          ],
        );
      },
    );
  }

  void resetGame() {
    setState(() {
      board = List.filled(9, '');
      isPlayerOneTurn = true;
    });
  }
}
