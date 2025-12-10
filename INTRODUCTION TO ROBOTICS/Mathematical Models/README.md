
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

 
