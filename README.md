## Lesson 01 Setting Up Your First Keil µVision Project

This guide outlines the basic steps for creating a new project in Keil µVision, a popular Integrated Development Environment (IDE) for embedded systems development.

https://www.keil.arm.com/packs/stm32f1xx_dfp-keil/boards/

**1. µVision Software Packs Download and Install**

*   Open the Pack Installer by clicking on its icon: refer to the below image.
![Alt text](images/setup4.png)
*   A Pack Installer Welcome screen will open. Read and close it.: refer to the below image.
![Alt text](images/setup5.png)

**2. Create a New Project**

*   Open Keil µVision.
*   Go to **Project** -> **New µVision Project**.
![Alt text](images/setup1.png)
*   Create a new folder and provide the desired project name and click the save button in the window as shown below image. I called it the first_project. You can name anything.
![Alt text](images/setup2.png)
*   Select the target microcontroller (e.g., STM32F103C8T6) from the device database.
![Alt text](images/setup3.png)
*   Click **OK**.

**2. Add Source Files**

*   In the **Project** window, right-click on "Source Group 1" and select **Add Files to Group 'Source Group 1'**.
*   Browse to the location where you have saved your source code files (e.g., `.c` files).
*   Select the files and click **Add**.

**3. Configure Project Options**

*   In the **Project** window, double-click on **Target 1**.
*   Go to **Options for Target 'Target 1'**.
*   **Device:** Verify that the correct device is selected.
*   **Target:** 
    *   **Code Generation:** Configure compiler options (optimization level, warnings, etc.).
    *   **Linker:** Configure linker options (output file name, memory map, etc.).
    *   **Debug:** Configure debug settings (debugger type, communication interface, etc.).
*   **Output:** Configure output options (output file directory, create HEX file, etc.).

**4. Build the Project**

*   Click on the **Build** button (or press **F7**) to compile and link your project.
*   Check the **Build Output** window for any errors or warnings.

**5. Debug (Optional)**

*   If you have a hardware debugger connected, you can debug your project.
*   Set breakpoints in your code.
*   Step through the code line by line.
*   Inspect variables and memory.

**6. Download (Optional)**

*   If you have a hardware target, you can download the compiled code to the target device.

**Note:**

* This is a basic guide. The specific steps and options may vary depending on the microcontroller you are using and your project requirements.
* Refer to the Keil µVision documentation for detailed information and advanced features.

**Example Source Code (main.c):**

```c
#include <stdio.h>

int main(void)
{
    // Your code here
    printf("Hello, world!\n");

    while(1); // Infinite loop

    return 0;
}