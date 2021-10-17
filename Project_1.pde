PImage backImg;
int ballStart = 20;
Mover ball;
ArrayList<Mover> baList = new ArrayList<Mover>();
lands[] land;

void setup() {
    size(800,600);
    backImg = loadImage("BGI.png"); //background image
    setBallarray();
    setLandarray();
    setbackImg();
}

void draw() {
    setbackImg(); 
    fill(200);  
    textSize(50);
    text("Population: "+baList.size(),50,300);
    for (int i = 0;i < 6;i++) {
        land[i].update();
    } 
    for (int i = 0;i < baList.size();i++) {
        baList.get(i).update(i);
    }
    ArrayList<Mover> tempList = new ArrayList<Mover>();
    for (int i = 0;i < baList.size();i++) {
        if(baList.get(i).alive){
            tempList.add(baList.get(i));
        }
    }
    baList=tempList;
    if (frameCount%30==0){
        ball = new Mover();
        baList.add(ball);
        ball.target = new PVector(ball.location.x + int(random( -20,20)),ball.location.y + int(random( -20,20)));
    }
}

void setbackImg() {
    background(backImg);
    for (int i = 0;i < 6;i++){
        tint(255, land[i].transparency);
        image(land[i].landImg,0,0);
    }
}
