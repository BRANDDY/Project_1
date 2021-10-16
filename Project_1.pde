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
    for (int i = 0;i < baList.size();i++) {
        baList.get(i).update(i);
    }
    for (int i = 0;i < 6;i++) {
        land[i].update();
    }    
    textSize(100);
    text(baList.size(),100,300);
}

void bgiDemo() {
    background(bgi);
    for (int i = 0;i < 6;i++){
        tint(255, land[i].imgColor);
        image(land[i].landImg,0,0);
    }
}
