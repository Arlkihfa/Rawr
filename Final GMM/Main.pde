import processing.sound.*;

SoundFile sceneOneSound;
SoundFile sceneTwoSound;
SoundFile sceneThreeSound;
SoundFile sceneFourSound;
SoundFile sceneFiveSound;
SoundFile sceneSixSound;
SoundFile sceneSevenSound;
SoundFile sceneEightSound;

int currentScene = 1;
SceneOne sceneOne;
SceneTwo sceneTwo;
SceneThree sceneThree;
SceneFour sceneFour;
SceneFive sceneFive;
SceneSix sceneSix;
SceneSeven sceneSeven;
SceneEight sceneEight;
int transitionDuration = 60; // Number of frames for transition
int transitionCounter = 0;
boolean transitioning = false;
int nextScene = 1;

void setup() {
  size(1920, 1080);
  sceneOne = new SceneOne();
  sceneTwo = new SceneTwo();
  sceneThree = new SceneThree();
  sceneFour = new SceneFour();
  sceneFive = new SceneFive();
  sceneSix = new SceneSix();
  sceneSeven = new SceneSeven();
  sceneEight = new SceneEight();
  
  sceneOne.setup();
  sceneTwo.setup();
  sceneThree.setup();
  sceneFour.setup();
  sceneFive.setup();
  sceneSix.setup();
  sceneSeven.setup();
  sceneEight.setup();
  
  sceneOneSound = new SoundFile(this, "openning.mp3");
  sceneTwoSound = new SoundFile(this, "pari.mp3");
  sceneThreeSound = new SoundFile(this, "pari funfact.mp3");
  sceneFourSound = new SoundFile(this, "paus.mp3");
  sceneFiveSound = new SoundFile(this, "paus funfact.mp3");
  sceneSixSound = new SoundFile(this, "penyu.mp3");
  sceneSevenSound = new SoundFile(this, "penyu funfact.mp3");
  sceneEightSound = new SoundFile(this, "ending.mp3");
  
  sceneOneSound.play();
}

void draw() {
  if (transitioning) {
    transition();
  } else {
    drawCurrentScene();
    checkSoundStatus();
  }
}

void checkSoundStatus() {
  SoundFile currentSound = getCurrentSound();
  if (currentSound != null && !currentSound.isPlaying()) {
    initiateTransition(currentScene + 1);
  }
}

SoundFile getCurrentSound() {
  switch (currentScene) {
    case 1:
      return sceneOneSound;
    case 2:
      return sceneTwoSound;
    case 3:
      return sceneThreeSound;
    case 4:
      return sceneFourSound;
    case 5:
      return sceneFiveSound;
    case 6:
      return sceneSixSound;
    case 7:
      return sceneSevenSound;
    case 8:
      return sceneEightSound;
    default:
      return null;
  }
}

void initiateTransition(int targetScene) {
  transitioning = true;
  transitionCounter = 0;
  nextScene = targetScene > 8 ? 1 : targetScene; // Loop back to scene 1 if exceeding 8
  
  // Stop all sounds
  sceneOneSound.stop();
  sceneTwoSound.stop();
  sceneThreeSound.stop();
  sceneFourSound.stop();
  sceneFiveSound.stop();
  sceneSixSound.stop();
  sceneSevenSound.stop();
  sceneEightSound.stop();
}

void transition() {
  float alpha = map(transitionCounter, 0, transitionDuration, 0, 255);

  if (transitionCounter <= transitionDuration / 2) {
    drawCurrentScene();
  } else {
    drawNextScene();
  }

  fill(0, alpha);
  noStroke();
  rect(0, 0, width, height);

  transitionCounter++;

  if (transitionCounter > transitionDuration) {
    transitioning = false;
    currentScene = nextScene;
    
    // Play the appropriate sound for the next scene after transition
    switch (nextScene) {
      case 1:
        sceneOneSound.play();
        break;
      case 2:
        sceneTwoSound.play();
        break;
      case 3:
        sceneThreeSound.play();
        break;  
      case 4:
        sceneFourSound.play();
        break; 
      case 5:
        sceneFiveSound.play();
        break; 
      case 6:
        sceneSixSound.play();
        break; 
      case 7:
        sceneSevenSound.play();
        break; 
      case 8:
        sceneEightSound.play();
        break; 
    }
  }
}

void drawCurrentScene() {
  switch (currentScene) {
    case 1:
      sceneOne.draw();
      break;
    case 2:
      sceneTwo.draw();
      break;
    case 3:
      sceneThree.draw();
      break;
    case 4:
      sceneFour.draw();
      break;
    case 5:
      sceneFive.draw();
      break;
    case 6:
      sceneSix.draw();
      break;
    case 7:
      sceneSeven.draw();
      break;
    case 8:
      sceneEight.draw();
      break;
  }
}

void drawNextScene() {
  switch (nextScene) {
    case 1:
      sceneOne.draw();
      break;
    case 2:
      sceneTwo.draw();
      break;
    case 3:
      sceneThree.draw();
      break;
    case 4:
      sceneFour.draw();
      break;
    case 5:
      sceneFive.draw();
      break;
    case 6:
      sceneSix.draw();
      break;
    case 7:
      sceneSeven.draw();
      break;
    case 8:
      sceneEight.draw();
      break;
  }
}
