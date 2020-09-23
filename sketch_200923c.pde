int lines = 64;
int width = 128*8;
int height = 64*8;
int[][] arr = new int[lines][lines];
void setup() {
  size(1024,512);
  for(int i = 0; i <= lines; i++){
    line(i*width/lines,0,i*width/lines,height);
    line(0,i*height/lines,width,i*height/lines);
  }
  for(int i = 0; i < lines; i++){
    for(int k = 0; k < lines; k++){
      arr[i][k]=0;    
    }
  } 
  arr[lines-1][(lines-1)/2]=1;
  //primo numero rida secondo colonna
  colour();
  frameRate(2);
}

void draw() {
  next();
  colour();
}

void next() {
  int[] old = calculate(arr[lines-1]);
  for(int i = 0; i < lines-1; i++){
    for(int k = 0; k < lines; k++){
      arr[i][k] = arr[i+1][k];
    }
  }
  arr[lines-1] = old;
}

int[] calculate(int[] mono){
  int[] result = new int[lines]; 
  for(int i = 0; i < lines; i++){
    if(i==0){result[i]=rule(0,mono[i],mono[i+1]);}
    else if(i==lines-1){result[i]=rule(mono[i-1],mono[i],0);}
    else{result[i]=rule(mono[i-1],mono[i],mono[i+1]);}
  }
  return result;
}

void colour() {
  for(int i = 0; i < lines; i++){
    for(int k = 0; k < lines; k++){
      if(arr[k][i]==1){fill(10);}
      else{fill(125,125,125);}
      rect(i*width/lines,k*height/lines,width/lines,height/lines);
    }
  }
}

int rule(int sx, int cx, int dx){
  if(sx==1&&cx==1&&dx==1){return 0;}
  if(sx==1&&cx==1&&dx==0){return 0;}
  if(sx==1&&cx==0&&dx==1){return 0;}
  if(sx==0&&cx==0&&dx==0){return 0;}
  if(sx==1&&cx==0&&dx==0){return 1;}
  if(sx==0&&cx==1&&dx==1){return 1;}
  if(sx==0&&cx==1&&dx==0){return 1;}
  if(sx==0&&cx==0&&dx==1){return 1;}
  return -1;
}
