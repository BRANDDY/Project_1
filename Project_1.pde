//The World of Balls
//have birth, death and fighting system
//"resorce" of each land can be chanaged,  depend on the total amount of balls
//interact with mouse

PImage backImg;
int ballStart = 20;
int ballsMax = 1000;
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
    text("Population: " + baList.size(),50,300);
    for (int i = 0;i < 6;i++) {
        land[i].update();
    } 
    for (int i = 0;i < baList.size();i++) {
        baList.get(i).update(i);
    }
    ArrayList<Mover> tempList = new ArrayList<Mover>();
    for (int i = 0;i < baList.size();i++) {
        if (baList.get(i).alive) {
            tempList.add(baList.get(i));
        }
    }
    baList = tempList;
    if (frameCount % 30 ==  0) {
        ball = new Mover();
        baList.add(ball);
        ball.target = new PVector(ball.location.x + int(random( -20,20)),ball.location.y + int(random( -20,20)));
    }
}

void setbackImg() {
    background(backImg);
    for (int i = 0;i < 6;i++) {
        tint(255, land[i].transparency);
        image(land[i].landImg,0,0);
    }
}

//add new ball when mouse click
void mouseClicked() {
    if (baList.size()<ballsMax) {
        ball = new Mover();
        ball.location = new PVector(mouseX,mouseY);//"borrow" Mover() get mouse's land No
        baList.add(ball);
        for (int i = 0;i < 6;i++) {
            land[i].update();
        } 
        ball.landNo=ball.onLandNo;
        ball.setColor();
        ball.location = new PVector(mouseX,mouseY);//add new ball on mouse location
        ball.target = new PVector(ball.location.x + int(random( -20,20)),ball.location.y + int(random( -20,20)));
    }
}