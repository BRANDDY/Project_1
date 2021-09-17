
//双胞胎。。。。。。。。。。

int birProb = 500;
int dieProb = 800;

class Mover{    
    PVector location;
    int colorB;
    int birCount = 0;
    int dieCount = 0;

    Mover() {
        int r = int(random(0,3));
        switch(r) {
            case 0 : 
                colorB = #1675D8;
                location = new PVector(random(0,180),random(0,280));
                break;
            case 1 : 
                colorB = #DE0B27;
                location = new PVector(random(270,520),random(0,280));
                break;
            case 2 : 
                colorB = #C18F0E;
                location = new PVector(random(600,800),random(0,280));
                break;
        }
        fill(colorB);
        circle(location.x, location.y,25);
    }
    
    void move() {
        int dirX = int(random( -3,3));
        int dirY = int(random( -3,3));
        location.x += dirX;
        location.y += dirY;
        fill(colorB);
        circle(location.x,location.y,25);  
        birth();
        death();
    }

    void death(){
        dieCount++;
        if(dieCount>dieProb){
            baList.remove(this);
            println(baList.size());
        }
    }




}

void birth() {
    for (int i = 0;i < baList.size();i++) {
        for (int t = 0;t < baList.size();t++) {
            if (((baList.get(i).location.x < baList.get(t).location.x + 10) && (baList.get(i).location.x + 10>baList.get(t).location.x)) && 
               ((baList.get(i).location.y<baList.get(t).location.y + 10) && (baList.get(i).location.y + 10>baList.get(t).location.y)) && 
               (i!= t) && (baList.size()<100)) {
                
                baList.get(i).birCount ++;
                //ballAll+=1;
                //baList[ballAll] = new Mover();
                if (baList.get(i).birCount>birProb) {
                    ball = new Mover();
                    baList.add(ball);
                    baList.get(i).birCount = 0;
                    println(baList.size());
                } 
            }   
        }
    }
}

