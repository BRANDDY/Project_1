class Mover{    
    PVector location;
    PVector target;//moving target
    boolean alive = true;
    int birProb;//limit get new balls
    int dieProb = 2000;//nature death
    int ballColor;
    int transparency;
    int onLandNo;//the land that the ball is on right now impact birProb
    int ageCount = 0;//count balls "age"
    
    Mover() {
        int r = int(random(0,6));
        switch(r) {
            case 0 : 
                ballColor = #1675D8;
                location = new PVector(random(20,160),random(20,260));
                break;
            case 1 : 
                ballColor = #0F9845;
                location = new PVector(random(290,500),random(20,260));
                break;
            case 2 : 
                ballColor = #C18F0E;
                location = new PVector(random(620,780),random(20,260));
                break;
            case 3 : 
                ballColor = #C18F0E;
                location = new PVector(random(20,160),random(280,560));
                break;
            case 4 : 
                ballColor = #A71125;
                location = new PVector(random(290,500),random(320,560));
                break;
            case 5 : 
                ballColor = #1675D8;
                location = new PVector(random(620,780),random(320,560));
                break;
        }
    }
    void update(int i) {
        getRules();
        death();
        birth(i);
        fight();
        move();
        setTrans();
        fill(ballColor,transparency);
        noStroke();
        ellipseMode(CENTER);
        circle(location.x,location.y,25); 
    }
    
    void move() {
        if (PVector.dist(target,location)>1 ||  PVector.dist(target,location)<- 1) {
            PVector dir = PVector.sub(target,location);
            dir.normalize(); 
            dir.mult(1);
            location.add(dir);
        } else{
            target = new PVector(location.x + int(random( -20,20)),location.y + int(random( -20,20)));
            while((target.x<20 ||  target.x>780) && (target.y<20 ||  target.y>580)) {
                target = new PVector(location.x + int(random( -20,20)),location.y + int(random( -20,20)));    
            }
        }
    }
    void getRules() {
        birProb = land[onLandNo].setRules();
    }

    //depend on bithProb to get new ball
    //depend on the distance of balls around(distance=birthprob)
    void birth(int i) {
        boolean bir = true;
        for (int t = 0;t < baList.size();t++) {
            if (((i!= t) && (baList.size()<1000)) && 
               ((location.x - birProb<baList.get(t).location.x + 10) && (location.x + birProb>baList.get(t).location.x - 10)) && 
               ((location.y - birProb<baList.get(t).location.y + 10) && (location.y + birProb>baList.get(t).location.y - 10)))
            {
                bir = false;
            }
        }
        if (bir && (baList.size()<1000) &&  ageCount>200) {//limit balls(in the case)
            ball = new Mover();
            ball.target = new PVector(ball.location.x + int(random( -20,20)),ball.location.y + int(random( -20,20)));
            ball.location = this.location.copy();
            ball.ballColor = this.ballColor;
            baList.add(ball);
        }
    }
    void death() {
        ageCount++;
        if (ageCount > dieProb) {
            this.alive = false;
        }
    }
    //make like growing up
    void setTrans(){
        if (ageCount>200){
            transparency=180;
        }else{
            transparency=180*ageCount/200;
        }
    }

    //when two ball are closing, one will be die
    void fight() {
        for (int t = 0;t < baList.size();t++) {
            if ((ballColor!= baList.get(t).ballColor) && 
               ((location.x < baList.get(t).location.x + 10) && (location.x>baList.get(t).location.x)) && 
               ((location.y<baList.get(t).location.y + 10) && (location.y>baList.get(t).location.y)))
            {
                int r = int(random(0,2));
                switch(r) {
                    case 0 : alive = false; break;
                    case 1 : baList.get(t).alive = false; break;
                }
                
            }
        }
    }
}

void setBallarray() {
    for (int i = 0;i < ballStart;i++) {
        ball = new Mover();
        baList.add(ball);
        ball.target = new PVector(ball.location.x + int(random( -20,20)),ball.location.y + int(random( -20,20)));
        
    }
}

