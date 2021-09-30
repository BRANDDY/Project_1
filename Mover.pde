class Mover{    
    PVector location;
    PVector target;
    int birProb;
    int dieProb=2000;
    int colorB;
    int landsNo;
    int dieCount = 0;
    int birCount = 0;
    
    Mover() {
        int r = int(random(0,6));
        switch(r) {
            case 0 : 
                colorB = #1675D8;
                location = new PVector(random(20,160),random(20,260));
                break;
            case 1 : 
                colorB = #0F9845;
                location = new PVector(random(290,500),random(20,260));
                break;
            case 2 : 
                colorB = #C18F0E;
                location = new PVector(random(620,780),random(20,260));
                break;
            case 3 : 
                colorB = #C18F0E;
                location = new PVector(random(20,160),random(280,560));
                break;
            case 4 : 
                colorB = #A71125;
                location = new PVector(random(290,500),random(320,560));
                break;
            case 5 : 
                colorB = #1675D8;
                location = new PVector(random(620,780),random(320,560));
                break;
        }
    }
    void update(int i) {
        getRules();
        death(i);
        birth(i);
        fight(i);
        move(i);
        fill(colorB,180);
        noStroke();
        ellipseMode(CENTER);
        circle(location.x,location.y,25); 
    }
    
    void move(int i) {
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
    void getRules(){
        birProb = land[landsNo].setRules();
    }
    void death(int i) {
        dieCount++;
        if (dieCount > dieProb) {
            baList.remove(i);
        }
    }
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
        if (bir && (baList.size()<1000) &&  frameCount>200) {
            ball = new Mover();
            ball.target = new PVector(ball.location.x + int(random( -20,20)),ball.location.y + int(random( -20,20)));
            ball.location = baList.get(i).location.copy();
            ball.colorB = baList.get(i).colorB;
            baList.add(ball);
        }
    }
    
    void fight(int i) {
        for (int t = 0;t < baList.size();t++) {
            if ((baList.get(i).colorB!=baList.get(t).colorB) && 
               ((location.x < baList.get(t).location.x + 10) && (location.x>baList.get(t).location.x)) && 
               ((location.y<baList.get(t).location.y + 10) && (location.y>baList.get(t).location.y)))
            {
                int r = int(random(0,2));
                switch(r) {
                    case 0 : baList.remove(i); break;
                    case 1 : baList.remove(t); break;
                }
            
            }
        }
    }
}

void setBallarray() {
    for (int i = 0;i < ballAll;i++) {
        ball = new Mover();
        baList.add(ball);
        ball.target = new PVector(ball.location.x + int(random( -20,20)),ball.location.y + int(random( -20,20)));
        
    }
}
