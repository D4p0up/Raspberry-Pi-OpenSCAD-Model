//everything in mm
//RPI 3

use <pin_headers.scad>;

width = 56;
length = 85.6;
height = 1.5;


module ethernet ()
	{
	//ethernet port
	color("silver")
	translate([length-20,2.75,height]) cube([21.2,16,13.3]); 
	}


module usb ()
	{
	//usb port
	color("silver")
	translate([length-16,22.5,height]) cube([17.3,13.3,16]);
	translate([length-16,40,height]) cube([17.3,13.3,16]);        
	}

module gpio ()
	{
	//headers
	rotate([0,0,180])
	translate([-7,-width+6,height])
	off_pin_header(rows = 20, cols = 2);
	}

module hdmi ()
	{
	color ("silver")
	translate ([25,-1,height])
	cube([15.1,11.7,8-height]);
	}

module audio ()
	{
	color ([.2,.2,.2])
	translate ([51,0,height])
	cube([6.5,12.8,6.5]);
    translate ([54.25,0,height+3.25]) color ([.2,.2,.2])
    rotate([90,0,0])
    cylinder(r=2.75,h=2,$fn=50);
	}    

module power ()
	{
	color("silver")
	translate ([7,-0.8,height])
	cube ([8, 5.6,4.4-height]);
	}

module cpu ()
	{
	color ([.3,.3,.3])
	translate ([22.3,23.7,1.5])
	cube ([15, 15, 1] );
	}
    
module controller ()
	{
	color ([.3,.3,.3])
	translate ([50.3,28.7,1.5])
	cube ([9, 9, .8] );
	}

module mhole ()
	{
	cylinder (r=1.375, h=height+.2, $fs=0.1);
	}

module pcb ()
	{
		difference ()
		{
		color([0.2,0.5,0])
		linear_extrude(height = height)
		square([length,width]); //pcb
		translate ([3.5, 3.5,-0.1]) mhole (); 
        translate ([3.5, 52.5,-0.1]) mhole ();        
		translate ([61.5, 3.5,-0.1]) mhole (); 
        translate ([61.5, 52.5,-0.1]) mhole ();    
		}
	}

module leds()
	{
		// act
		color([0.9,0.9,0,0.6])
		translate([1.5,47,height]) led();
		// pwr
		color([0.1,0.8,0,0.6])
		translate([1.5,44,height]) led();
	}
module led()
	{
		cube([1.0,1.6,0.7]);
	}

module videon ()
    {
        color([0.2,0.16,0.2])
		translate([1.5,16.5,height])
        cube([4,21,1.5]);
        color([0.2,0.16,0.2])
        translate([44,0.5,height])
        cube([4,21,1.5]);        
    }


module rpi ()
	{
		pcb ();
		ethernet ();
		usb (); 
		gpio (); 
		hdmi ();
		power ();
		cpu ();
        controller ();
        audio ();
		leds ();
        videon ();
	}

rpi (); 
