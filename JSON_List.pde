JSONObject json;
button myButton;
String IGN = "";
boolean Clicked = false;
boolean Show = false;

String getIGN = "";
String getMessage = "";

void setup() {
  size(1584,861);
  loadData();
  myButton = new button(width/2-100,height/2-50,200,100,color(54,54,245),"Start", color(0));
  myButton.show();
}

void draw() {
  background(#2FEAE9);
  myButton.update();
  if(myButton.Clicked()){
    delay(100);
    myButton.hide();
    Clicked = true;
  }
  if(Clicked){
    //here is the random thing
    json = loadJSONObject("data.json");
    JSONArray Names = json.getJSONArray("Names");
    int randomName = int(random(0,Names.size()));
    JSONObject Name = Names.getJSONObject(randomName);
    getIGN = Name.getString("Name");
    getMessage = Name.getString("Message");
    println(getIGN);
    println(getMessage);
    Clicked = false;
    Show = true;
  }
  if(Show){
    textSize(50);
    text(getIGN, width/2-50,height/2-250);
    textSize(25);
    text(getMessage,width/2-getMessage.length()/2*12,height/2);
  }
}

void loadData() {
  json = loadJSONObject("data.json");
  JSONArray Names = json.getJSONArray("Names");
  for(int i=0;i<Names.size();i++){
    JSONObject Name = Names.getJSONObject(i);
    IGN = Name.getString("Name");
    for(int i2=0;i2<Names.size();i2++){
      JSONObject Name2 = Names.getJSONObject(i2);
      if(IGN.equals(Name2.getString("Name")) && i!=i2){
        print(Name2.getString("Name"));
        println(" removed!");
        Names.remove(i2);
        if(i2!=0){
          i2--;
        }
        if(i!=0){
          i--;
        }
      }
    }
  }
  saveJSONObject(json,"data/data.json");
}
