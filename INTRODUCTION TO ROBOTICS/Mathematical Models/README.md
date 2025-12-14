
# Kinematic Structure

## Robot Joints and Kinematic Structure
The robot is designed as a **PPP manipulator**, meaning it has three prismatic joints arranged orthogonally.  
This configuration enables simple translational motion in the three independent directions \((X, Y, Z)\), ensuring that the end-effector can reach any point within a rectangular workspace.

### Reasoning for Design
- Three prismatic joints were selected because they provide the minimum degrees of freedom required for full translational positioning in 3D space.  
- The absence of rotational joints simplifies kinematic equations, avoids singularities, and reduces control complexity.  
- This structure is ideal for pick-and-place tasks, material handling, and environments where end-effector orientation is fixed or non-critical.

---

## Joint Types, Axes, and Limits
- **Joint 1 (\(q_1\))**: Prismatic along the Y axis (vertical). Critical due to gravitational load.  
  Limits: \(q_1 \in [q_{1,\min}, q_{1,\max}]\).
- **Joint 2 (\(q_2\))**: Prismatic along the X axis (horizontal). Provides lateral positioning.  
  Limits: \(q_2 \in [q_{2,\min}, q_{2,\max}]\).
- **Joint 3 (\(q_3\))**: Prismatic along the Z axis (depth). Provides forward/backward positioning.  
  Limits: \(q_3 \in [q_{3,\min}, q_{3,\max}]\).

---

## Forward Kinematic Model
**Frame assignments:**
- Base frame \(\{0\}\) fixed at the origin.  
- Frame \(\{1\}\) translates along Y.  
- Frame \(\{2\}\) translates along X.  
- Frame \(\{3\}\) translates along Z.  
- End-effector frame attached to the gripper.  

**End-effector position:**
\[
x = q_2, \quad y = q_1, \quad z = q_3
\]

**Homogeneous transformation:**
\[
T_{0\,EE} =
\begin{bmatrix}
1 & 0 & 0 & q_2 \\
0 & 1 & 0 & q_1 \\
0 & 0 & 1 & q_3 \\
0 & 0 & 0 & 1
\end{bmatrix}
\]

---

## Modified DH Parameters
For a PPP robot:
- All twist angles \(\alpha_i = 0\).  
- All link lengths \(a_i = 0\).  
- \(\theta_i\) values are constant.  
- \(d_i\) corresponds to \(q_1, q_2, q_3\).

---

## Inverse Kinematic Model
Direct IK:
\[
q_1 = y_d, \quad q_2 = x_d, \quad q_3 = z_d
\]

**Constraints:**
\[
q_i \in [q_{i,\min}, q_{i,\max}]
\]

Velocity and acceleration limits:
\[
|\dot{q}_i| \le \dot{q}_{i,\max}, \qquad |\ddot{q}_i| \le \ddot{q}_{i,\max}
\]

Gravity compensation on \(q_1\):
\[
F_{g,1} = m_{\mathrm{eff},1} \cdot g
\]

---

## Extended Inverse Kinematic (IK) Model
For PPP manipulators, orientation is fixed and motion is purely translational.  
The IK solution is direct and exact.

### Analytical Solution
Given target \((x_d, y_d, z_d)\):
\[
q_1 = y_d, \qquad q_2 = x_d, \qquad q_3 = z_d
\]

This yields a closed-form, globally valid solution with no singularities.

### Joint Priorities and Physical Considerations
- **\(q_1\) (vertical axis):** Most critical due to gravitational load. Requires smoother trajectories and torque/force considerations.  
- **\(q_2, q_3\) (horizontal axes):** Less restrictive, can sustain higher velocities and accelerations.  
- Priorities may be implemented via weighted objective functions.

### IK Constraints
**Joint limits:**
\[
q_1 \in [q_{1,\min}, q_{1,\max}], \quad q_2 \in [q_{2,\min}, q_{2,\max}], \quad q_3 \in [q_{3,\min}, q_{3,\max}]
\]

**Velocity/acceleration limits:**
\[
|\dot{q}_i| \leq \dot{q}_{i,\max}, \qquad |\ddot{q}_i| \leq \ddot{q}_{i,\max}
\]

**Collision/safety:** Avoid operating near hard limits or obstacles; use safe margins.

### Stability and Robustness
- Filtering and anti-jitter (low-pass filters, spline interpolation).  
- Soft saturations to avoid discontinuities.  
- Task-space control stability: constant, full-rank Jacobian allows PID/PD with feedforward.  
- Gravity compensation improves accuracy.

---

## Differential Kinematic Model
Jacobian:
\[
J = \begin{bmatrix}
0 & 1 & 0 \\
1 & 0 & 0 \\
0 & 0 & 1
\end{bmatrix}, \quad
x = [x,y,z]^T, \quad q = [q_1,q_2,q_3]^T
\]

**Velocities:**
\[
\dot{x} = J \dot{q}, \qquad \dot{q} = J^{-1}\dot{x}
\]

**Accelerations:**
\[
\ddot{x} = J \ddot{q}
\]

Since \(J\) is constant and full rank, inversion is stable.

### Differential Control with Priorities
Weighted mapping:
\[
W_x = \mathrm{diag}(w_x, w_y, w_z)
\]

### Limits and Stability
- Saturate \(\dot{q}, \ddot{q}\) to respect actuator limits.  
- Constant full-rank \(J\) ensures numerical stability.

**Forward differential kinematics:**
\[
\dot{x} = J \dot{q}
\]

**Inverse differential kinematics:**
\[
\dot{q} = J^{-1} \dot{x}
\]

## 📐 Direct Kinematic Model (DKM)

### 1. Input Variables

- `q1`: vertical displacement (Z-axis moving along Y)
- `q2`: horizontal displacement (Y-axis moving along X)
- `q3`: depth displacement (X-axis moving along Z)

### 2. End-Effector Position


<img width="147" height="79" alt="image" src="https://github.com/user-attachments/assets/4cd83773-96e0-4125-adaa-607896ac5491" />

### 3. Homogeneous Transformation Matrix

  <img width="220" height="110" alt="image" src="https://github.com/user-attachments/assets/5f5b2800-8dd3-463f-93cf-b40afcebc7d5" />


## 🔁 Inverse Kinematic Model (IKM)

Given a desired target point \((x_d, y_d, z_d)\), the required joint displacements are:

<img width="282" height="29" alt="image" src="https://github.com/user-attachments/assets/30c780b8-460f-469d-b569-23b892ae4e46" />

---

## 📊 Jacobian Matrix

The Jacobian relates joint velocities to the linear velocity of the end-effector:

<img width="216" height="81" alt="image" src="https://github.com/user-attachments/assets/6a0144c3-3519-44f4-b839-e77c05eec57d" />

---

## ⚙️ Dynamic Model 

For a simplified dynamic model (neglecting friction and coupling), using either the Newton-Euler or Lagrangian formulation:

Where:

<img width="514" height="275" alt="image" src="https://github.com/user-attachments/assets/d11ca8bc-e564-4eb0-b4d5-6966d0bd6f3f" />


### Simplified Example

<img width="368" height="95" alt="image" src="https://github.com/user-attachments/assets/3539a1a7-109a-4b86-9d38-bbe5d135164f" />


## 📁 Folder Structure 
PPP_Robot/
├── README.md

├── main.m

├── gui_ppp_sim.m

├── ppp_fk.m

├── plot_ppp.m

├── animate_pick_and_place.m

├── move_to_position.m

├── ppp_dynamics.m


## Workspace
<img width="474" height="425" alt="image" src="https://github.com/user-attachments/assets/ed1970de-5639-4122-ba22-46ae3408226f" />

 
