# Ziegler–Nichols PID Tuning  
## Two-Area Load Frequency Control System

---

## 1. Ultimate Gain and Period

From sustained oscillations of the proportional-only system:

- Ultimate gain (Area 1):  
  **Ku₁ = 0.25**

- Ultimate gain (Area 2):  
  **Ku₂ = 0.05**

- Ultimate period (measured):  
  **Pu = 62.93 s**

---

## 2. Ziegler–Nichols PID Formulae

For a PID controller:

- Kp = 0.6 Ku  
- Ti = 0.5 Pu  
- Td = 0.125 Pu  

---

## 3. Area-1 PID Parameters

- Kp₁ = 0.6 × 0.25 = **0.15**
- Ti₁ = 0.5 × 62.93 = **31.46 s**
- Td₁ = 0.125 × 62.93 = **7.87 s**

Derived gains:

- Ki₁ = Kp₁ / Ti₁ = **0.00477**
- Kd₁ = Kp₁ × Td₁ = **1.18**

---

## 4. Area-2 PID Parameters

Using same Pu assumption:

- Kp₂ = 0.6 × 0.05 = **0.03**
- Ti₂ = 31.46 s
- Td₂ = 7.87 s

Derived gains:

- Ki₂ = Kp₂ / Ti₂ = **0.00095**
- Kd₂ = Kp₂ × Td₂ = **0.236**

---

## 5. Remarks

- ZN tuning results in faster response but sustained oscillations
- High overshoot observed in both frequency deviation and tie-line power
- Motivates need for optimized or intelligent controllers