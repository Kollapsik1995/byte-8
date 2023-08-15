HashMap<String, String> vars = new HashMap<String, String>();


void Execute() {

    //здесь выполняется программа
    String elements[] = Program[numCom].split(" ");
    switch(elements[0]){
      case "DOT":
      DOT(int(elements[1]),int(elements[2]), boolean(int(elements[3])));
      break;
      case "RECT":
      RECT(int(elements[1]),int(elements[2]), int(elements[3]),int(elements[4]));
      break;
      case "DELAY":
      DELAY(int(elements[1]));
      break;
      case "GOTO":
      GOTO(elements[1]);
      break;
      case "PRESS":
      PRESS(elements[1],elements[2]);
      break;
    }
    numCom++;
    if(numCom==Program.length){
      loaded = false;
    }
}
