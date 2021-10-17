PImage bgi;
Mover ball;
int ballAll = 20;
ArrayList<Mover> baList = new ArrayList<Mover>();
lands[] land;

void setup() {
    size(800,600);
    bgi = loadImage("BGI.png");  
    setBallarray();
    setLandarray();
    bgiDemo();
}

void draw() {
    bgiDemo();
    for (int i = 0;i < 6;i++) {
        land[i].update();
    } 
    for (int i = 0;i < baList.size();i++) {
        baList.get(i).update(i);
    }   
    textSize(100);
    text(baList.size(),100,300);
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

void bgiDemo() {
    background(bgi);
    for (int i = 0;i < 6;i++){
        tint(255, land[i].imgColor);
        image(land[i].landImg,0,0);
    }
}
