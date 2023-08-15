HashMap<String, String> vars = new HashMap<String, String>();


void Execute() {

  //здесь выполняется программа
  String elements[] = Program[numCom].split(" ");
  switch(elements[0]) {
  case "DOT":
    DOT(int(vars.getOrDefault(elements[1], elements[1])), int(vars.getOrDefault(elements[2], elements[2])), boolean(int(vars.getOrDefault(elements[3], elements[3]))));
    break;
  case "RECT":
    RECT(int(vars.getOrDefault(elements[1], elements[1])), int(vars.getOrDefault(elements[2], elements[2])), int(vars.getOrDefault(elements[3], elements[3])), int(vars.getOrDefault(elements[4], elements[4])));
    break;
  case "LINE":
    LINE(int(vars.getOrDefault(elements[1], elements[1])), int(vars.getOrDefault(elements[2], elements[2])), int(vars.getOrDefault(elements[3], elements[3])), int(vars.getOrDefault(elements[4], elements[4])));
    break;
  case "CLEAR":
    CLEAR();
    break;
  case "DELAY":
    DELAY(int(elements[1]));
    break;
  case "GOTO":
    GOTO(elements[1]);
    break;
  case "PRESS":
    PRESS(elements[1], elements[2]);
    break;
  case "ADD":
    ADD(elements[1], elements[2], elements[3]);
    break;
  case "SUB":
    SUB(elements[1], elements[2], elements[3]);
    break;
  case "MUL":
    MUL(elements[1], elements[2], elements[3]);
    break;
  case "DIV":
    DIV(elements[1], elements[2], elements[3]);
    break;
  case "AND":
    AND(elements[1], elements[2], elements[3]);
    break;

  case "OR":
    OR(elements[1], elements[2], elements[3]);
    break;

  case "NOT":
    NOT(elements[1], elements[2]);
    break;


  case "SQR":
    SQR(elements[1], elements[2]);
    break;


  case "POW":
    POW(elements[1], elements[2]);
    break;

  case "ABS":
    ABS(elements[1], elements[2]);
    break;


  case "VAR":
    VAR(elements[1], elements[2]);
    break;
  }
  numCom++;
  if (numCom==Program.length) {
    loaded = false;
  }
}
