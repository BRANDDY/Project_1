class lands{
    int birProb = 50;
    PVector location;
    PVector size;
    PImage landImg;
    int transparency = 255;
    int ballsTotal;//the total of balls
    int landNo;//the numeral order of lands
    
    lands(int l) {
        landNo = l;
        getLand(landNo);
    }
    
    void update() {
        ballCount();//count the total balls of each land
    }
    
    void getLand(int i) {
        switch(i) {
            case 0 : location = new PVector(0,0); size = new PVector(180,280); landImg = loadImage("BL.png"); break;
            case 1 : location = new PVector(270,0); size = new PVector(250,280); landImg = loadImage("G.png"); break;
            case 2 : location = new PVector(600,0); size = new PVector(200,280); landImg = loadImage("YR.png"); break;
            case 3 : location = new PVector(0,300); size = new PVector(200,280); landImg = loadImage("YL.png"); break;
            case 4 : location = new PVector(270,300); size = new PVector(200,280); landImg = loadImage("R.png"); break;
            case 5 : location = new PVector(600,300); size = new PVector(200,280); landImg = loadImage("BR.png"); break;
        }
    }
    
    void ballCount() {
        ballsTotal = 0;
        for (int i = 0;i < baList.size();i++) {
            if (((baList.get(i).location.x < location.x + size.x) && (baList.get(i).location.x > location.x)) && 
               ((baList.get(i).location.y < location.y + size.y) && (baList.get(i).location.y > location.y))) 
            {
                ballsTotal ++;
                baList.get(i).onLandNo = landNo;//give the current landNo to ball
            }
        }   
    }

    //Set Birth Probability
    //depend on ballsTotal change bitrh rate(birProb)
    //show up as the change of backImg transparency 
    int setRules() {
        transparency = 300 - (600 * ballsTotal / 100);
        if (transparency<0){
            transparency=0;
        }
        birProb = 2* ballsTotal;
        return birProb;
    }
}

void setLandarray() {
    land = new lands[6];
    for (int i = 0;i < 6;i++) {
        land[i] = new lands(i);
        land[i].landImg.resize(800, 600);
    }
}
