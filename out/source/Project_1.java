/* autogenerated by Processing revision 1276 on 2021-09-17 */
import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

public class Project_1 extends PApplet {

PImage bgi;
Mover ball;
int ballAll = 20;
ArrayList<Mover> baList = new ArrayList<Mover>();
//Mover[] baList = new Mover[10];

 public void setup() {
    /* size commented out by preprocessor */;
    bgi = loadImage("BGI.png");  
    bgiDemo();
    //ball = new Mover();
    for (int i = 0;i < ballAll;i++) {
        ball = new Mover();
        baList.add(ball);
    }
}

 public void draw() {
    bgiDemo();
    measure();
    for (int i = 0;i < baList.size();i++) {
        baList.get(i).move();
    }
    textSize(100);
    text(baList.get(0).dieCount,100,300);
    //ball.move();
}

 public void bgiDemo() {
    background(bgi);
    noFill();
    rect(0, 0, 180, 280);
    noFill();
    rect(270, 0, 250,280);
    noFill();
    rect(600,0, 200, 280);
}
 public void measure() {
    if (mousePressed) {
        bgiDemo();
        textSize(50);
        text(mouseX,mouseX,mouseY + 30);
        textSize(50);
        text(mouseY,mouseX + 100,mouseY + 30);
    }
}

//双胞胎。。。。。。。。。。

int birProb = 500;
int dieProb = 800;

class Mover{    
    PVector location;
    int colorB;
    int birCount = 0;
    int dieCount = 0;

    Mover() {
        int r = PApplet.parseInt(random(0,3));
        switch(r) {
            case 0 : 
                colorB = 0xFF1675D8;
                location = new PVector(random(0,180),random(0,280));
                break;
            case 1 : 
                colorB = 0xFFDE0B27;
                location = new PVector(random(270,520),random(0,280));
                break;
            case 2 : 
                colorB = 0xFFC18F0E;
                location = new PVector(random(600,800),random(0,280));
                break;
        }
        fill(colorB);
        circle(location.x, location.y,25);
    }
    
     public void move() {
        int dirX = PApplet.parseInt(random( -3,3));
        int dirY = PApplet.parseInt(random( -3,3));
        location.x += dirX;
        location.y += dirY;
        fill(colorB);
        circle(location.x,location.y,25);  
        birth();
        death();
    }

     public void death(){
        dieCount++;
        if(dieCount>dieProb){
            baList.remove(this);
            println(baList.size());
        }
    }




}

 public void birth() {
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


  public void settings() { size(800, 600); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Project_1" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
