int renew = 30;
class lands{
    int birProb = 50;
    int dieProb = 2000;
    PVector loc;
    PVector size;
    int ballNum;
    int landNo;
    
    lands(int l) {
        landNo = l;
        getLand(landNo);//根据编号得到作用范围
    }
    
    void update() {
        if (frameCount % 30 ==  0) {
            ballCount();//根据编数范围内的ball/每10s？刷新一次
            
        }
    }
    
    void getLand(int i) {
        switch(i) {
            case 0 : loc = new PVector(0,0); size = new PVector(180,280); break;
            case 1 : loc = new PVector(270,0); size = new PVector(250,280); break;
            case 2 : loc = new PVector(600,0); size = new PVector(200,280); break;
            case 3 : loc = new PVector(0,300); size = new PVector(200,280); break;
            case 4 : loc = new PVector(270,300); size = new PVector(200,280); break;
            case 5 : loc = new PVector(600,300); size = new PVector(200,280); break;
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
        if (ballNum > 30) {
            birProb = 80;
        }else if(ballNum < 3){
            birProb = 10;
            //println("dangers");
        }else if(ballNum>150){
            birProb = 200;
            println("full");
        }else{
            birProb = 60;
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
