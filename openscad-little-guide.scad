// Testes
// Rubriks Cube with a resume of interesting things in open scad
/*
    MODULE  =>  PROCEDURE
    FUNCTION    =>  FUNCTION

    VARIABLES => DUCK_TYPING == PYTHON STILE
    $ SYSTEM_VARIABLES
    # ??????_VARIABLES

    RANGE => [begin:end:incremento]

    FOR(*list*)
    *list*  =   For in openscad iterates in a list

    IF(*condition*) / ELSE / ELSE-IF / CASE ??? IDK IF THERES A CASE
    *condition* = Dispense a how to

    SQUARE(*Lado*, *center*)
    *Lado*      =   Lado size
    *center*    =   Center_Bool

    CIRCLE(*Raio*, *center*)
    *Raio*  =   Raio size
    *center*    =   Center_Bool

    CUBE(*coord*, *center*)
    *coord*     =   Coordenada_Array
                    [x, y, z]
    *center*    =   Center_Bool

    CYLINDER(*Height*, *Bot*, *Top*, *center*)
    *Height*    =   Height Size
    *Bot*       =   Bottom size
    *Top*       =   Top size
    *center*    =   Center_Bool

    SPHERE(*Raio*, *Center*)
    *Raio*  =   Raio size
    *Center*    =   Center_Bool

    POLYHEDRON(*Points*, *Triangles*)
    *Points*    =   Points_Array
                    [x,y,z]
    *Triangles* = Triangles_Matrix
                    [qtd] > [x,y,z] <- faces

    POLYGON(*Points*)
    *Points*    =   Points_Array
                    [x,y]

    >> The structs below iterates with other structures
    SCALE(*size*)
    *size*  =   Size ué

    TRANSLATE(*coord*)
    *coord*     =   Coordenada_Array
                    [x, y, z]

    ROTATE(*angle*, *coord*)
    *angle*     =   Angle size
    *coord*     =   Coordenada_Array_Bool
                    [x, y, z] > (x[0/1], y[0/1], z[0/1])

    RENDER(*Convexity*)
    *Convexity* = Convexity size
                    Don't know yet

    LINEAR_EXTRUDE(*Height*, *Center*, *Convexity*, *Twist*)
    *Height*    =   Height Size
    *center*    =   Center_Bool
    *Convexity* = Convexity size    
    *Twist*     =   Twist size

    >> You could combine two or more 

    DIFFERENCE(*UNKNOWN*){*put the structures here*}
                    Diference from the structures before the first

    UNION(*UNKNOWN*){*put the structures here*}
                    Union between structures

    INTERSECTION(*UNKNOWN*){*put the structures here*}
                    Intersection between structures

    >> You could use ECHO FUNCTION TO PRINT SOME IMPORTANT INFORMATIONS
    ECHO(*info1*, *info2*, ..., *infoN*)
    *infoN* =   Could be everything

*/

//edges_bool    = true;
center      = false;

difference(){
    if(edges_bool){
        union(){
            translate([-0.5, -0.5, -0.5]) 
                cube([11, 11, 11], center);
            translate([-2.5, 1.5, 1.5])
                cube([15, 7, 7], center);
            translate([1.5, -2.5, 1.5])
                cube([7, 15, 7], center);
            translate([1.5, 1.5, -2.5])
                cube([7, 7, 15], center);
        }
    }
    else{
        translate([-0.5, -0.5, -0.5]) 
            cube([11, 11, 11], center);
    }

    translate([-3, 2.5, 2.5])
        cube([16, 5, 5], center);
    translate([2.5, -3, 2.5])
        cube([5, 16, 5], center);
    translate([2.5, 2.5, -3])
        cube([5, 5, 16], center);
}
