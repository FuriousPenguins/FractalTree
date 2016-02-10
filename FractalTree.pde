private double fractionLength = .81; 
private int smallestBranch = 5;
private double branchAngle = PI/8;  
public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	background(0, 204, 204);   
	stroke(30,100,15);
	strokeWeight(70);
	line(320,480,320,380);   //StrokeWeight Decreasing as the branches get shorter
	drawBranches(320,380,100,3*Math.PI/2,50,51,0);  //will add later 
}
void mousePressed() {
	redraw();
}
public void drawBranches(int x,int y, double branchLength, double angle, float branchSize,int red, int blue) 
{   
	double angle0 = angle - branchAngle + (Math.random()-.5);
	double angle1 = angle + branchAngle + (Math.random()-.5);
	branchLength = branchLength * fractionLength;
	strokeWeight(branchSize);
	branchSize = branchSize / 2;
	
	stroke(red,100,blue);
	red = red - 2;
	blue = blue + 3;

	int endX1 = (int)(branchLength*Math.cos(angle0) + x);
	int endY1 = (int)(branchLength*Math.sin(angle0) + y);

	int endX2 = (int)(branchLength*Math.cos(angle1) + x);
	int endY2 = (int)(branchLength*Math.sin(angle1) + y);

	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2);
	
	if(branchLength > smallestBranch){
		drawBranches(endX1,endY1,branchLength,angle0,branchSize,red,blue);
		drawBranches(endX2,endY2,branchLength,angle1,branchSize,red,blue);
	}
} 
