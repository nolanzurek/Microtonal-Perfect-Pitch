import processing.sound.*;

void setup() {
  
   size(1040, 720);
   background(255);
   textAlign(CENTER, CENTER);
   textSize(30);
   
}

//variables that store what tones are played and what tones are selected

int tonePlayed;
int tonePicked;

//"timing" variables

boolean selection;
boolean playReady = true;

//indicator variables

color indicator = color(188, 255, 136);
String indicatorText = "";

//mouse workaround variable

boolean mouseIsClicked = false;

//list of frequencies to feed into the triOsc (synthesizer)

int frequencies[] = {262, 269, 277, 285, 294, 302, 311, 320, 330, 339, 349, 359, 370, 381, 392, 403, 415, 427, 440, 453, 466, 480, 494, 508};
TriOsc triangle;

//button colors

color r = color(250, 104, 114);
color p = color(220, 88, 250);
color b = color(100, 218, 250);

//function that plays the tone

//hopefully replace the shitty wave synthesizer with piano samples but I'm too lazy

void playTone () {

  if (playReady == true) {
  
    playReady = false;
    tonePlayed = ceil(random(24));
    triangle = new TriOsc(this);
    triangle.freq(frequencies[tonePlayed-1]);
    triangle.play();
    
  }

};

//button function

//add darker colors when button is pressed for some sort of feedback

void button(int x, int y, int w, int h, int tone, String noteName, color background) {

  fill(background);
  rect(x, y, w, h); 
  fill(0);
  text(noteName, x+w/2, y+h/2);
  
  if(mouseIsClicked) {
      
      if(mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h) {
        
        tonePicked = tone;
        selection  = true;
        mouseIsClicked = false;
        triangle.stop(); 
        
    }
   
   }
}

//turning the mouseClicked() function into a boolean

void mouseClicked() {

  mouseIsClicked = true;

};

//looping function

void draw () {
  
  playTone();
  
  //code for indicator appearance
  
  fill(indicator);
  rect(40, 560, 960, 120);
  fill(0);
  text(indicatorText, 40, 560, 960, 120);
  
  //mother of god
  
  //look at all the rect
  
  //(buttons)
  
  button(050, 40, 160, 120, 1, "C", b);
  button(200, 40, 160, 120, 2, "C½#\nD¾b", p);
  button(360, 40, 160, 120, 3, "C#\nDb", r);
  button(520, 40, 160, 120, 4, "C¾#\nD½b", p);
  button(680, 40, 160, 120, 5, "D", b);
  button(840, 40, 160, 120, 6, "D½#\nE¾b", p);
  
  button(050, 160, 160, 120, 7, "D#\nEb", r);
  button(200, 160, 160, 120, 8, "D¾#\nE½b", p);
  button(360, 160, 160, 120, 9, "E", b);
  button(520, 160, 160, 120, 10, "E½#\nF½b", p);
  button(680, 160, 160, 120, 11, "F", b);
  button(840, 160, 160, 120, 12, "F½#\nG¾b", p);
  
  button(050, 280, 160, 120, 13, "F#\nGb", r);
  button(200, 280, 160, 120, 14, "F¾#\nG½b", p);
  button(360, 280, 160, 120, 15, "G", b);
  button(520, 280, 160, 120, 16, "G½#\nA¾b", p);
  button(680, 280, 160, 120, 17, "G#\nAb", r);
  button(840, 280, 160, 120, 18, "G¾#\nA½b", p);
  
  button(050, 400, 160, 120, 19, "A", b);
  button(200, 400, 160, 120, 20, "A½#\nB¾b", p);
  button(360, 400, 160, 120, 21, "A#\nBb", r);
  button(520, 400, 160, 120, 22, "A¾#\nB½b", p);
  button(680, 400, 160, 120, 23, "B", b);
  button(840, 400, 160, 120, 24, "B½#\nC½b", p);
  
  //matches the tone played with the tone picked
  
  //include function where you can have multiple tries for a note
  
  if (selection == true) {
    
    if (tonePicked == tonePlayed) {
    
      selection = false;
      playReady = true;
      indicator = color(188, 255, 136);
      indicatorText = "CORRECT!\nJacob Collier material over here";
      
    } else {
    
      selection = false;
      playReady = true;
      indicator = color(250, 166, 105);
      indicatorText = "INCORRECT : " + tonePlayed;
    
    }
  
  }
  
};

//INCLUSION LIST

//piano samples
//responsive buttons (color)
//unicode symbols
//multiple tries for wrong note
//timer
//statistics

//note names from array for corrections
