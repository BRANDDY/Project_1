PImage bgi;
Mover ball;
int ballAll = 20;
ArrayList<Mover> baList = new ArrayList<Mover>();
//Mover[] baList = new Mover[10];

void setup() {
    size(800,600);
    bgi = loadImage("BGI.png");  
    bgiDemo();
    //ball = new Mover();
    for (int i = 0;i < ballAll;i++) {
        ball = new Mover();
        baList.add(ball);
    }
}

void draw() {
    bgiDemo();
    measure();
    for (int i = 0;i < baList.size();i++) {
        baList.get(i).move();
    }
    textSize(100);
    text(baList.get(0).dieCount,100,300);
    //ball.move();
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
    }
}
