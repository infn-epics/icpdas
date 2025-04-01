## Overview

This project is designed to control ICPDAS devices using EPICS. It includes:
- **Database Templates:** Define EPICS records for various ICPDAS modules.
- **Substitution Files:** Provide device-specific configurations for the templates.
- **Source Code:** Implements the IOC logic and initialization.
- **Startup Scripts:** Configure and start the IOC.

---

## Database Files

### Templates
- **`FwdRevPulse.template`**: Defines forward and reverse pulse logic.
- **`icpai.template`**: Analog input template for ICPDAS devices.
- **`icpao.template`**: Analog output template for ICPDAS devices.
- **`ICPDASAIO.template`**: Combined analog input/output template.
- **`ICPDASGV.template`**: General-purpose variables for ICPDAS devices.
- **`ICPDASRly.template`**: Relay control template.
- **`ICPDASRlyPulse.template`**: Relay pulse control template.
- **`icpdasVersion.template`**: Template for device version information.
- **`icpdi.template`**: Digital input template.
- **`icpdo.template`**: Digital output template.
- **`icprtd.template`**: RTD (Resistance Temperature Detector) template.
- **`icprtdsensor.template`**: RTD sensor template.

### Substitution Files
- **`icp7026.substitutions`**: Configuration for the ICPDAS 7026 module.
- **`icp7060.substitutions`**: Configuration for the ICPDAS 7060 module.
- **`icp7215.substitutions`**: Configuration for the ICPDAS 7215 module.
- **`icp7226.substitutions`**: Configuration for the ICPDAS 7226 module.
- **`icp7250.substitutions`**: Configuration for the ICPDAS 7250 module.
- **`icp7267.substitutions`**: Configuration for the ICPDAS 7267 module.

---

## Source Code

### `icpdasMain.cpp`
The main entry point for the IOC. It initializes the EPICS environment and registers the necessary components.

### `initTrace.c`
Implements tracing and debugging utilities for the IOC.

---

## Startup Script

### `ioc-icpdas7060.cmd`
This script configures and starts the IOC for the ICPDAS 7060 module. Key steps include:
1. Loading the environment variables from `envPaths`.
2. Registering the EPICS database and device drivers.
3. Configuring the Asyn IP port for Modbus communication.
4. Defining Modbus ports for reading and writing data.
5. Loading the EPICS records database (`icp7060.db`) with appropriate parameters.
6. Initializing the IOC.

#### Example Configuration:
- **IP Address:** `10.16.4.33`
- **Port:** `502` (Modbus default port)
- **Modbus Ports:**
  - `ICP_get_port`: Reads holding registers.
  - `ICP_set_port`: Writes to coils.
  - `ICP_DI`: Reads digital inputs.
  - `ICP_DICNT`: Reads digital input counters.
  - `ICP_info_port`: Reads device information.

---

## Prerequisites

1. **EPICS Base:** Ensure EPICS Base is installed and configured.
2. **AsynDriver:** Install the EPICS AsynDriver module.
3. **Modbus Support:** Install the EPICS Modbus support module.

---
## Database Files

### Templates
- **`FwdRevPulse.template`**: Defines forward and reverse pulse logic.
- **`icpai.template`**: Analog input template for ICPDAS devices.
- **`icpao.template`**: Analog output template for ICPDAS devices.
- **`ICPDASAIO.template`**: Combined analog input/output template.
- **`ICPDASGV.template`**: General-purpose variables for ICPDAS devices.
- **`ICPDASRly.template`**: Relay control template.
- **`ICPDASRlyPulse.template`**: Relay pulse control template.
- **`icpdasVersion.template`**: Template for device version information.
- **`icpdi.template`**: Digital input template.
- **`icpdo.template`**: Digital output template.
- **`icprtd.template`**: RTD (Resistance Temperature Detector) template.
- **`icprtdsensor.template`**: RTD sensor template.

### Substitution Files
- **`icp7026.substitutions`**: Configuration for the ICPDAS 7026 module.
- **`icp7060.substitutions`**: Configuration for the ICPDAS 7060 module.
- **`icp7215.substitutions`**: Configuration for the ICPDAS 7215 module.
- **`icp7226.substitutions`**: Configuration for the ICPDAS 7226 module.
- **`icp7250.substitutions`**: Configuration for the ICPDAS 7250 module.
- **`icp7267.substitutions`**: Configuration for the ICPDAS 7267 module.

---

## Source Code

### `icpdasMain.cpp`
The main entry point for the IOC. It initializes the EPICS environment and registers the necessary components.

### `initTrace.c`
Implements tracing and debugging utilities for the IOC.

---

## Startup Script

### `ioc-icpdas7060.cmd`
This script configures and starts the IOC for the ICPDAS 7060 module. Key steps include:
1. Loading the environment variables from `envPaths`.
2. Registering the EPICS database and device drivers.
3. Configuring the Asyn IP port for Modbus communication.
4. Defining Modbus ports for reading and writing data.
5. Loading the EPICS records database (`icp7060.db`) with appropriate parameters.
6. Initializing the IOC.

#### Example Configuration
- **IP Address:** `10.16.4.33`
- **Port:** `502` (Modbus default port)
- **Modbus Ports:**
  - `ICP_get_port`: Reads holding registers.
  - `ICP_set_port`: Writes to coils.
  - `ICP_DI`: Reads digital inputs.
  - `ICP_DICNT`: Reads digital input counters.
  - `ICP_info_port`: Reads device information.

---

## Prerequisites

1. **EPICS Base:** Ensure EPICS Base is installed and configured.
2. **AsynDriver:** Install the EPICS AsynDriver module.
3. **Modbus Support:** Install the EPICS Modbus support module.

---
## Files

### `ioc-icpdas7060.cmd`
This is the main startup script for the IOC. It performs the following tasks:
- Loads the required EPICS database definitions.
- Configures the Asyn IP port for communication with the ICPDAS device.
- Configures Modbus Asyn ports for reading and writing data.
- Loads the EPICS records database for the ICPDAS device.
- Initializes the IOC.

### `envPaths`
This file defines the environment variables required by the IOC, such as paths to binaries and database files.

### `icpdas.dbd`
The database definition file for the ICPDAS IOC, which includes all the necessary record types and device support.

### `icp7060.db`
The EPICS database file that defines the records for interacting with the ICPDAS device.

## Configuration

### Device Information
The IOC is configured to communicate with the ICPDAS device at the following IP address and port:
- **IP Address:** `10.16.4.33`
- **Port:** `502` (Modbus default port)

### Modbus Configuration
The following Modbus configurations are defined in the `ioc-icpdas7060.cmd` file:
- **Input Registers (Read):**
  - `ICP_DI`: Reads digital input states.
  - `ICP_DICNT`: Reads digital input counters.
  - `ICP_info_port`: Reads device information.
- **Coils (Write):**
  - `ICP_set_port`: Writes to digital outputs.
- **Holding Registers:**
  - `ICP_get_port`: Reads holding registers.

### Database Records
The `icp7060.db` file defines the EPICS records for interacting with the ICPDAS device. These records are loaded with the following parameters:
- **Prefix (`P`):** `ICPDAS`
- **Record Suffix (`R`):** `Test7060`
- **Ports:**
  - `get_port`: `ICP_get_port`
  - `set_port`: `ICP_set_port`
  - `CNTPORT`: `ICP_DICNT`
  - `DIPORT`: `ICP_DI`
  - `PORT`: `ICP_info_port`

## Prerequisites

- **EPICS Base:** Ensure EPICS Base is installed and configured.
- **AsynDriver:** Install the EPICS AsynDriver module.
- **Modbus Support:** Install the EPICS Modbus support module.

## Running the IOC

1. Set up the environment variables by sourcing the `envPaths` file:
   ```bash
   source envPaths