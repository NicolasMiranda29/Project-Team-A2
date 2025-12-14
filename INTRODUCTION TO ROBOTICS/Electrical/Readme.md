Torque calculations and electrical design

Modeling Method
The dynamic modeling of the PPP Cartesian robot is carried out using a Newton–Euler formulation applied independently to each prismatic axis. Due to the orthogonal and decoupled structure of the Cartesian robot, coupling terms between axes are negligible, allowing each joint to be modeled as a translational mass subjected to inertial, gravitational, frictional, and external forces.
This approach is widely adopted in industrial gantry and Cartesian robots due to its computational simplicity and sufficient accuracy for actuator sizing


  Asumptions: 
	Payload: m_payload=5.00" kg" .
	Extra assembly masses: m_z=6.00" kg" (Z carriage + screw + gripper), m_y=4.00" kg" (Y carriage & structure), m_x=2.00" kg" (X extras).
	Linear maximum speeds: v_xy=0.50" m/s" (X & Y), v_z=0.20" m/s" (Z).
	Accelerations: a_xy=1.00" " 〖"m/s" 〗^2, a_z=1.00" " 〖"m/s" 〗^2.
	Pulley effective radius: r_p=0.020" m" (20 mm).
	Ball-screw lead: "lead"=0.010" m/rev" (10 mm per rev).
	Screw efficiency: η_screw=0.90.
	Drive efficiency (belts/gear): η_drive=0.90.
	Linear guide friction coefficient: μ=0.02.
	Gravity: g=9.81" " 〖"m/s" 〗^2.
	Safety factors: SF_XY=3.0for X/Y peaks; SF_Z=6.0for Z (holding + safety).

The results of the calculations and results are shown in images
