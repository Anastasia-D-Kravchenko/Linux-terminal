Continuing the documentation of your projects, here is the README summary for your **Operating Systems (SOP) Advanced Bash Scripting, Control Flow, and Real-World Applications** lab.

---

# Project README: Advanced Bash Logic and Specialized Applications

This project covers advanced **Bash shell programming**, focusing on conditional logic, file system validation, and complex mathematical simulations like the Haversine formula.

---

## 🛠 Project Components

The project transitions from basic control structures to professional-grade scripts for data visualization and navigation.

### 1. Conditional Logic & File Validation

* **Numerical Comparison (`script.sh`)**: Demonstrates the use of `if-elif-else` blocks and integer operators like `-gt` (greater than) and `-lt` (less than).
* **Input Validation (`script1.sh`)**: Uses the `-z` flag to detect empty positional parameters, ensuring scripts don't execute with missing data.
* **File System Forensics (`script2.sh`)**: Implements automated checks to distinguish between files (`-f`), directories (`-d`), and general existence (`-e`).

### 2. Geographic & Navigation Simulations (`uranus.sh`)

* **Haversine Formula**: A sophisticated script that calculates the "great-circle" distance between two points on a sphere using latitude and longitude.
* **Performance Metrics**: Calculates the time difference between GPS data points and derives the movement speed using the `bc` (bench calculator) utility for high-precision floating-point math.

### 3. Real-Time Data Visualization (`wifi.sh`, `wifipr.sh`)

* **Concurrent Monitoring**: A two-part system designed to simulate or read WiFi signal strength:
* **`wifi.sh`**: The "backend" script that initializes a hashmap of networks and generates random signal changes.
* **`wifipr.sh`**: The "frontend" visualizer that reads shared data from `/tmp/` and renders a live ASCII bar chart using `printf`.


* **Synchronization**: Uses a `lock()` and `unlock()` mechanism based on file existence to coordinate between the data generator and the display panel.

### 4. Interactive TUI Framework (`hinter4004.sh`)

* **Text User Interface (TUI)**: A feature-rich menu system with an ASCII art header.
* **Navigation Logic**: Supports keyboard-driven interactions (Up/Down for scrolling, PageUp/PageDown) and dynamic content rendering using `head` and `tail` pipes.

---

## 🚀 How to Use

### Basic Logic Testing

```bash
./script.sh 15    # Output: "greater"
./script2.sh /etc # Output: "directory"

```

### Running the WiFi Monitor

1. **Start the Data Source**: Run `./wifi.sh` in one terminal window.
2. **Start the Visualizer**: Run `./wifipr.sh` in a second window to see the live ASCII signal bars.

### Navigational Calculations

* Run `./uranus.sh` to see the step-by-step distance and speed calculations based on the hardcoded coordinate arrays.

---

## 📂 File Manifest

* **`script.sh` / `script1.sh` / `script2.sh**`: Core Bash control flow tutorials.
* **`uranus.sh` / `uranus1.sh**`: Geographic distance and speed calculators.
* **`wifi.sh` / `wifipr.sh**`: Backend and frontend modules for the WiFi signal simulator.
* **`hinter4004.sh`**: Interactive shell-based menu framework.
* **`wifi_data.txt`**: Historical signal data used for simulation testing.
