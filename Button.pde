class button {
  float x;
  float y;
  float size;
  float size2;
  int Color;
  String Text;
  int TextColor;
  boolean show = false;
  boolean MouseOver = false;
  boolean ButtonClicked = false;
  
  button(float theX, float theY, float theSize, float theSize2, int theColor, String theText, int theTextColor){
    x = theX;
    y = theY;
    size = theSize;
    size2 = theSize2;
    Color = theColor;
    Text = theText;
    TextColor = theTextColor;
  }
  void show() {
    show = true;
  }
  
  void hide() {
    show = false;
  }
  void update() {
    if(mouseX > x && mouseY > y && mouseX < x+size && mouseY < y+size2){
      MouseOver = true;
    }
    else{
      MouseOver = false;
    }
    if(MouseOver && mousePressed){
      ButtonClicked = true;
    }
    else{
      ButtonClicked = false;
    }
    if(show==true){
      if(MouseOver){
        fill(Color-75);
        cursor(HAND);
      }
      else{
        fill(Color);
        cursor(ARROW);
      }
      if(ButtonClicked){
        strokeWeight(1);
      }
      else{
        strokeWeight(3);
      }
      rect(x,y,size,size2);
      fill(TextColor);
      textSize(size2/2);
      text(Text,x+size/4,y+size2/1.5);
      fill(0);
    }
  }
  boolean Clicked() {
    if(ButtonClicked) {
      return(true);
    }
    else{
      return(false);
    }
  }
}
