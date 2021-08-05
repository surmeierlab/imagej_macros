saveAs("Tiff", "/Users/kastout/Desktop/nDUFS2 dLight/7720 KO female p30/BrightnessOverTime-09242018-7718-SNr -085/a.tif");
run("Stack Splitter", "number=2");
saveAs("Tiff", "/Users/kastout/Desktop/nDUFS2 dLight/7720 KO female p30/BrightnessOverTime-09242018-7718-SNr -085/green.tif");
selectWindow("stk_0001_a.tif");
saveAs("Tiff", "/Users/kastout/Desktop/nDUFS2 dLight/7720 KO female p30/BrightnessOverTime-09242018-7718-SNr -085/red.tif");

selectWindow("red.tif");
run("Gaussian Blur...", "sigma=2 stack");
run("Subtract Background...", "rolling=50 stack");
run("Gaussian Blur...", "sigma=2 stack");
run("Subtract Background...", "rolling=20 stack");
setAutoThreshold("Triangle dark");
//run("Threshold...");
run("Make Binary", "method=Default background=Default calculate black");
run("Dilate", "stack");

selectWindow("green.tif");
run("Median...", "radius=.5 stack");
run("Subtract Background...", "rolling=50 stack");
setAutoThreshold("Huang dark");
imageCalculator("Multiply create 32-bit stack", "red.tif","green.tif");

//run("Close All");

