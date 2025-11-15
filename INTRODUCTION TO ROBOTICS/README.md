# 🤖 PPP Robot: Port Crane-Style Prismatic Robot

This repository contains the kinematic and (optionally) dynamic models for a custom 3-DOF PPP robot with a port crane-style architecture and a two-finger gripper.

---

## 🧠 Robot Assumptions and Description

- **Type:** PPP (3 prismatic joints)
- **Structure:** Port crane-style configuration:
  - First axis (**Z**) translates along the **Y-axis** (vertical motion)
  - Second axis (**Y**) translates along the **X-axis** (horizontal motion)
  - Third axis (**X**) translates along the **Z-axis** (depth motion)

<img width="499" height="494" alt="image" src="https://github.com/user-attachments/assets/89ffa2b1-af5e-40ec-b161-73b38fb10e99" />

 
- **End-effector:** Two-finger gripper  
  > *Note: The gripper does not affect direct kinematics but may influence dynamics if its mass is modeled.*

---
