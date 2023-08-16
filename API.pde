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
    x+=((X2-X)/dist(X, Y, X2, Y2));
    y+=((Y2-Y)/dist(X, Y, X2, Y2));
    display[round(y)][round(x)]=true;
  }
  x+=((X2-X)/dist(X, Y, X2, Y2));
  y+=((Y2-Y)/dist(X, Y, X2, Y2));
  display[round(y)][round(x)]=true;
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
void SQRT(String A, String B) {
  vars.put(A, str(sqrt(int(vars.getOrDefault(B, B)))));
}
//POW
void POW(String A, String B, String C) {
  vars.put(A, str(pow(int(vars.getOrDefault(B, B)), int(vars.getOrDefault(C, C)))));
}
//ABS
void ABS(String A, String B) {
  vars.put(A, str(abs(int(vars.getOrDefault(B, B)))));
}
//CMP
void CMP(String A, String B) {
  if(!vars.getOrDefault(A, A).equals(vars.getOrDefault(B, B))){
    numCom++;
  }
}
void CMPB(String A, String B) {
  if(!(int(vars.getOrDefault(A, A))>int(vars.getOrDefault(B, B)))){
    numCom++;
  }
}
void CMPS(String A, String B) {
  if(!(int(vars.getOrDefault(A, A))<int(vars.getOrDefault(B, B)))){
    numCom++;
  }
}
void CMPN(String A, String B) {
  if(!(int(vars.getOrDefault(A, A))!=int(vars.getOrDefault(B, B)))){
    numCom++;
  }
}
//GOTO
void GOTO(String M){
  for(int i = 0; i < Program.length; i++){
    if(Program[i].equals(M))
    numCom=i-1;
  }
}
//RND
void RND(String A){
  vars.put(A, str(int(random(0,32))));
}
//PRESS
void PRESS(String KEY, String M){
  char realkey = KEY.charAt(0);
  if(keyPressed && key==realkey){
    GOTO(M);
  }
}

void SHOW(){
  drawDisplay();
  FRAME = get(0,0,width,height);
}
