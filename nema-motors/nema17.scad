include <timing_pulley.scad>

// Some values
height_size 	= 41;
length_size 	= 42.3;
corner_size	= 5.65;

rotor_base_Z	= 2;
rotor_base_R	= 22;
rotor_length	= 34;
rotor_thick	= 5;

m3_diameter	= 3.3;

module holes_m3(){
	translate([corner_size, corner_size, 0])
		cylinder(height_size/4, m3_diameter/2, m3_diameter/2, $fn=30);	

	translate([length_size - corner_size, corner_size, 0])
		cylinder(height_size/4, m3_diameter/2, m3_diameter/2, $fn=30);

	translate([corner_size, length_size - corner_size, 0])
		cylinder(height_size/4, m3_diameter/2, m3_diameter/2, $fn=30);

	translate([length_size - corner_size, length_size - corner_size, 0])
		cylinder(height_size/4, m3_diameter/2, m3_diameter/2, $fn=30);
}

module box_canto(lado, espacamento, altura){
	x1 = espacamento;
	x2 = lado - espacamento;
	x3 = lado;

	linear_extrude(height = altura)
		polygon([[x1, 0],
					[x2, 0],
					[x3, x1],
					[x3, x2],
					[x2, x3],
					[x1, x3],
					[0, x2],
					[0, x1]],
					[[0, 1, 2, 3, 4, 5, 6, 7]]);
}

module rotor(rotor_base_Z, rotor_base_R, rotor_length, rotor_thick){
	union(){
		color("Gainsboro") translate([0,0,rotor_base_Z])
			difference(){
				union(){
					cylinder(rotor_length, rotor_thick, rotor_thick, $fn=30);
					translate([0, 0, rotor_length])
						cylinder(1, rotor_thick, rotor_thick/2, $fn=30);
				}
				
				translate([rotor_thick/2, -rotor_thick, 0.05])
					cube([rotor_thick/2, rotor_thick*2, rotor_length + 5]);
			}

		color("DarkGray")
			cylinder(rotor_base_Z, rotor_base_R/2, rotor_base_R/2);
		}
}

module base_motor(height_size, length_size, corner_size){
	height_pad  	= height_size/4;

	translate([0.05, 0.05, 0])
		color("Silver")
			difference(){
				union(){
					translate([0, 0, height_size - height_pad])
						box_canto(length_size, corner_size, height_pad);
	
					box_canto(length_size, corner_size, height_pad);
				}
				
				translate([0, 0, height_size - (height_size/4) + 0.05])
					holes_m3();
				translate([0, 0, -0.05])
					holes_m3();
			}

	translate([0, 0, height_pad - (corner_size / 2)])
		color("Black")
			box_canto(length_size + 0.1,
						 corner_size * 1.7,
						 height_pad * 2 + corner_size);
}

module 	motor_nema17(){
	base_motor(height_size, length_size, corner_size);
	
	translate([length_size/2, length_size/2, height_size])
		rotor(rotor_base_Z, rotor_base_R, rotor_length, rotor_thick);
}

module nema17_w_tpulley(){
	motor_nema17();
	translate([length_size/2, length_size/2, height_size+rotor_base_Z+12])
		timing_pulley(pitch_diameter);
}

// nema17_w_tpulley();

// motor_nema17();

// ANIMATION rotate([0,0,$t*360,0])
