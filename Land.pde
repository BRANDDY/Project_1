int renew = 30;
class lands{
    int birProb = 50;
    int dieProb = 2000;
    PVector loc;
    PVector size;
    PImage landImg;
    int imgColor=180;
    int ballNum;
    int landNo;
    
    lands(int l) {
        landNo = l;
        getLand(landNo);//depend on No
    }
    
    void update() {
        if (frameCount % 30 ==  0) {
            ballCount();//update infor/50
            //ballAll= 1;
            //setBallarray();//random get a new baby/50
        }
    }
    
    void getLand(int i) {
        switch(i) {
            case 0 : loc = new PVector(0,0); size = new PVector(180,280); landImg = loadImage("BL.png"); break;
            case 1 : loc = new PVector(270,0); size = new PVector(250,280); landImg = loadImage("G.png"); break;
            case 2 : loc = new PVector(600,0); size = new PVector(200,280); landImg = loadImage("YR.png"); break;
            case 3 : loc = new PVector(0,300); size = new PVector(200,280); landImg = loadImage("YL.png"); break;
            case 4 : loc = new PVector(270,300); size = new PVector(200,280); landImg = loadImage("R.png"); break;
            case 5 : loc = new PVector(600,300); size = new PVector(200,280); landImg = loadImage("BR.png"); break;
        }
    }
    
    void ballCount() {
        ballNum = 0;
        for (int i = 0;i < baList.size();i++) {
            if (((baList.get(i).location.x < loc.x + size.x) && (baList.get(i).location.x > loc.x)) && 
               ((baList.get(i).location.y < loc.y + size.y) && (baList.get(i).location.y > loc.y))) 
            {
                ballNum ++;
                baList.get(i).landsNo = landNo;
            }
        }   
    }
    int setRules() {
        if (ballNum > 150) {
            birProb = 60;
            imgColor = 50;
        }else if(ballNum < 3){
            birProb = 10;
            imgColor = 180;
        }else if(ballNum>300){
            birProb = 100;
            imgColor = 0;
            println("full");
        }else{
            birProb = 40;
            imgColor = 120;
        }
        return birProb;
    }
}

void setLandarray() {
    land = new lands[6];
    for (int i = 0;i < 6;i++) {
        land[i] = new lands(i);
        }
}
