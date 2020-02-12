final float max_depth = 4;
final float len = 50;
final int base_color = 50;

double bias = 0;
double bias_velocity = 0;
double bias_acceleration = 0;
double maximum_velocity = 1;

public void setup() {   
	size(800,800);    
} 

public void draw() {
	bias_acceleration = -0.01 * bias;
	bias_velocity += (Math.random() - 0.5) / 1000.0 + bias_acceleration;

	bias_velocity = Math.max(-maximum_velocity, Math.min(maximum_velocity, bias_velocity));

    bias += bias_velocity;

	background(0);   
	stroke(0,255,0);   
	tree(width / 2.0, 2.0 * height / 3.0, 3.0 * PI / 2.0, 0); 
} 

void tree(float x, float y, float theta, int depth) {
  final float endX = x + len * cos(theta);
  final float endY = y + len * sin(theta);
  
  final float col = (255 - base_color) * (depth / max_depth) + base_color;
  
  if (depth < max_depth) {
      tree(endX, endY, theta - PI / 5.0d, depth + 1);
      tree(endX, endY, theta + PI / 5.0d, depth + 1);
      tree(endX, endY, theta - PI / 10.0d, depth + 1);
      tree(endX, endY, theta + PI / 10.0d, depth + 1);
  }
  stroke(col, 50, 50);

  line(x, y, endX, endY);
}

void tree(float x, float y, double theta, int depth) {
	tree(x, y, (float) (theta + bias), depth);
}
