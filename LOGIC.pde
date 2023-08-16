HashMap<String, String> vars = new HashMap<String, String>();


void Execute() {
  try {
    //здесь выполняется программа
    String elements[] = Program[numCom].split(" ");
    switch(elements[0]) {
    case "DOT":
      DOT(int(vars.getOrDefault(elements[1], elements[1])), int(vars.getOrDefault(elements[2], elements[2])), boolean(int(vars.getOrDefault(elements[3], elements[3]))));
      break;
    case "RECT":
      RECT(int(vars.getOrDefault(elements[1], elements[1])), int(vars.getOrDefault(elements[2], elements[2])), int(vars.getOrDefault(elements[3], elements[3])), int(vars.getOrDefault(elements[4], elements[4])));
      break;
    case "RND":
      RND(elements[1]);
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

    case "CMP":
      CMP(elements[1], elements[2]);
      break;
    case "CMPB":
      CMPB(elements[1], elements[2]);
      break;
    case "CMPS":
      CMPS(elements[1], elements[2]);
      break;
    case "CMPN":
      CMPN(elements[1], elements[2]);
      break;
    case "SQRT":
      SQRT(elements[1], elements[2]);
      break;

    case "POW":
      POW(elements[1], elements[2], elements[3]);
      break;

    case "ABS":
      ABS(elements[1], elements[2]);
      break;

    case "SHOW":
      SHOW();
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
  catch(Exception ex) {
    var output = createWriter("Error.log");
    output.println("ERROR OCCURED IN LINE "+numCom);
    output.println("Exception text: "+ex.getMessage());
    output.close();
    LINE(2, 2, 5, 2);
    LINE(2, 4, 5, 4);
    LINE(2, 6, 5, 6);
    LINE(2, 4, 2, 2);
    LINE(2, 4, 2, 6);
    LINE(5, 4, 5, 7);
    LINE(5, 4, 7, 4);
    LINE(8, 4, 8, 7);
    LINE(8, 4, 10, 4);
  }
}
