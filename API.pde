//DOT X Y MODE
void DOT(int X, int Y, boolean MODE) {
  display[Y][X]=MODE;
}
//RECT X Y WIDTH HEIGHT
void RECT(int X, int Y, int WIDTH, int HEIGHT) {
  for (int y = Y; y<Y+HEIGHT; y++) {
    for (int x = X; x<X+WIDTH; x++) {
      display[y][x]=true;
    }
  }
}

//CLEAR
void CLEAR() {
  for (int y = 0; y < 32; y++) {
    for (int x = 0; x < 32; x++) {
      display[y][x]=false;
    }
  }
}

//LINE X Y X2 Y2
void LINE(float X, float Y, float X2, float Y2) {
  float x, y;
  x=X;
  y=Y;
  display[int(y)][int(x)]=true;
  while ((int)x!=(int)X2 && (int)y!=(int)Y2) {
    x+=((X2-X+1)/dist(X, Y, X2, Y2));
    y+=((Y2-Y+1)/dist(X, Y, X2, Y2));
    display[int(y)][int(x)]=true;
  }
  x+=((X2-X+1)/dist(X, Y, X2, Y2));
  y+=((Y2-Y+1)/dist(X, Y, X2, Y2));
  display[int(y)][int(x)]=true;
}

//VAR NAME MEANING
void VAR(String NAME, String MEANING) {
  vars.put(NAME, vars.getOrDefault(MEANING, MEANING));
}

//ADD
void ADD(String A, String B, String C) {
  vars.put(A, str(int(vars.getOrDefault(B, B))+int(vars.getOrDefault(C, C))));
}
//SUB
void SUB(String A, String B, String C) {
  vars.put(A, str(int(vars.getOrDefault(B, B))-int(vars.getOrDefault(C, C))));
}
//MUL
void MUL(String A, String B, String C) {
  vars.put(A, str(int(vars.getOrDefault(B, B))*int(vars.getOrDefault(C, C))));
}
//DIV
void DIV(String A, String B, String C) {
  vars.put(A, str(int(vars.getOrDefault(B, B))/int(vars.getOrDefault(C, C))));
}
//AND
void AND(String A, String B, String C) {
  vars.put(A, str(int(boolean(int(vars.getOrDefault(B, B))) && boolean(int(vars.getOrDefault(C, C))))));
}
//OR
void OR(String A, String B, String C) {
  vars.put(A, str(int(boolean(int(vars.getOrDefault(B, B))) || boolean(int(vars.getOrDefault(C, C))))));
}
//NOT
void NOT(String A, String B) {
  vars.put(A, str(int(!boolean(int(vars.getOrDefault(B, B))))));
}
//DELAY
void DELAY(int MILLIS) {
  if (!del)
  now = millis();
  if (millis()-now<MILLIS)
  {
    numCom--;
    del=true;
  } else
    del=false;
}
//SQR
void SQR(String A, String B) {
  vars.put(A, str(int(vars.getOrDefault(B, B))*int(vars.getOrDefault(B, B))));
}
//SQRT
//POW
void POW(String A, String B) {
  vars.put(A, str(pow(int(vars.getOrDefault(B, B)), int(vars.getOrDefault(B, B)))));
}
//FAC
//ABS
void ABS(String A, String B) {
  vars.put(A, str(abs(int(vars.getOrDefault(B, B)))));
}
//ARR
//GET
//CMP
//GOTO
void GOTO(String M){
  for(int i = 0; i < Program.length; i++){
    if(Program[i].equals(M))
    numCom=i-1;
  }
}
//BEGIN
//END
//INC
//DEC
//SET - установка элемента массива или уже созданной переменной (2 функции)
//RND
//PRESS
void PRESS(String KEY, String M){
  char realkey = KEY.charAt(0);
  if(keyPressed && key==realkey){
    GOTO(M);
  }
}
