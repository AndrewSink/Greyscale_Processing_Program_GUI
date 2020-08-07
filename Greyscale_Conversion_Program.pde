import controlP5.*;

static final String RENDERER = P2D; // JAVA2D, FX2D, P2D, P3D, OPENGL
PImage canvas;
PImage canvas2;

ControlP5 cp5;

boolean displayImage = false;
boolean convertImage = false;



void setup() {
  size(1000, 600);
  cp5 = new ControlP5(this);
  cp5.addButton("Select_File")
    .setBroadcast(false)
    .setValue(0)
    .setPosition(10, 20)
    .setSize(200, 20)
    .setBroadcast(true)
    ;
  cp5.addButton("Convert")
    .setBroadcast(false)
    .setValue(0)
    .setPosition(10, 45)
    .setSize(200, 20)
    .setBroadcast(true)
    ;
  cp5.addButton("Save")
    .setBroadcast(false)
    .setValue(0)
    .setPosition(10, 70)
    .setSize(200, 20)
    .setBroadcast(true)
    ;
  cp5.addButton("Exit")
    .setBroadcast(false)
    .setValue(0)
    .setPosition(10, 95)
    .setSize(200, 20)
    .setBroadcast(true);
  ;
}

public void Select_File() {
  selectInput("Please select canvas picture:", "selectImage");
  print("Please select a picture to modify.\n");
}  


void selectImage(final File f) {
  if (f == null || f.isDirectory()) {
    println("Window was closed or the user hit cancel.");
    //System.exit(0);
  }

  final String canvasPath = f.getPath();
  println(canvasPath);
  print("Picture loaded successfully.\n");


  if ((canvas = loadImage(canvasPath)) == null) {
    println("is an invalid image file. Try again...\n");
    selectInput("Please select canvas picture:", "selectImage");
  }

  displayImage = true;
  convertImage = false;
}  

public void Convert() {
  convertImage = true;
}

public void Save() {
  PImage partialSave = get(250, 0, canvas.width, canvas.height);
  partialSave.save("Greyscale_Image.png");
  print("File saved successfully\n");
}

public void Exit() {
  println("Closing Program");
  exit();
}  


void draw() {

  if (canvas != null & convertImage  == false) {
    background(204);
    canvas.resize(0, 500);
    image(canvas, 250, 0);
  }

  if (canvas != null & convertImage  == true) {
    background(204);
    canvas.resize(0, 500);
    image(canvas, 250, 0);
    filter(GRAY);
    displayImage = false;
  }
}
