PImage bgi;
Mover ball;
int ballAll = 20;
ArrayList<Mover> baList = new ArrayList<Mover>();
lands[] land;

void setup() {
    size(800,600);
    bgi = loadImage("BGI.png");  
    bgiDemo();
    setBallarray();
    setLandarray();
}

void draw() {
    bgiDemo();
    measure();
    for (int i = 0;i < baList.size();i++) {
        baList.get(i).update(i);
        //textSize(20);
        //fill(250);
        //text(i,baList.get(i).location.x-10,baList.get(i).location.y+10);
    }
    for (int i = 0;i < 3;i++) {
        land[i].update();
    }    
    textSize(100);
    text(baList.size(),100,300);
}

void bgiDemo() {
    background(bgi);
    noFill();
    rect(0, 0, 180, 280);
    noFill();
    rect(270, 0, 250,280);
    noFill();
    rect(600,0, 200, 280);
}
void measure() {
    if (mousePressed) {
        bgiDemo();
        textSize(50);
        text(mouseX,mouseX,mouseY + 30);
        textSize(50);
        text(mouseY,mouseX + 100,mouseY + 30);
        //出现lands的信息
    }
}
