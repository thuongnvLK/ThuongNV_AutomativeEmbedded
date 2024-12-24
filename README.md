## Lesson 01: Setting Up Your First Keil µVision Project

This guide outlines the basic steps for creating a new project in Keil µVision, a popular Integrated Development Environment (IDE) for embedded systems development.

**1. Install Keil C ARM Package for STM32**

Visit the following link to download the package:

https://www.keil.arm.com/packs/stm32f1xx_dfp-keil/boards/

Tài liệu tham khảo: Datasheet, Reference Manual của MCU.

ST-Link driver.

**2. µVision Software Packs Download and Install**

*   Open the Pack Installer by clicking on its icon: refer to the below image.
![Alt text](images/setup4.png)
*   A Pack Installer Welcome screen will open. Read and close it.: refer to the below image.
![Alt text](images/setup5.png)
*   Import the required software packs for your target microcontroller.
![Alt text](images/setup6.png)
*   Choose and click **0K**.
![Alt text](images/setup7.png)

**3. Create a New Project**

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
![Alt text](images/setup8.png)
*   Highlight the upper-left icon: C file (.c). And enter your source file’s name. I called it as **main.c**. Please refer to the below image.
![Alt text](images/setup9.png)
*   Click on Add to close this window.

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
```
## Lesson 02: General-purpose I/Os (GPIO)

**1. What is GPIO ?**

*   GPIO (General-Purpose Input/Output) là một trong những thuật ngữ thường gặp nhất mà bạn có thể gặp phải trong lĩnh vực nhúng. GPIO là một chân tín hiệu trên một mạch tích hợp hoặc bo mạch có thể được sử dụng để thực hiện các chức năng đầu vào hoặc đầu ra kỹ thuật số. Hành vi của GPIO (đầu vào hoặc đầu ra) được điều khiển tại thời điểm chạy bởi phần mềm ứng dụng/firmware bằng cách thiết lập một số thanh ghi. Ứng dụng điển hình bao gồm đọc/ghi giá trị từ/đến cảm biến/thiết bị analog hoặc kỹ thuật số, điều khiển đèn LED, điều khiển xung nhịp cho giao tiếp I2C, tạo xung kích hoạt cho các thành phần bên ngoài, phát sinh ngắt (interrupt), v.v.
*   Tất cả các vi điều khiển sẽ có một số thanh ghi để điều khiển các chức năng GPIO. Tên của các thanh ghi này sẽ khác nhau tùy thuộc vào vi điều khiển.

**2. What is the GPIO port ?**

* Cổng GPIO (General Purpose Input/Output) trên vi điều khiển STM32F103C8 là một nhóm các chân (pin) đa năng, có thể được cấu hình để thực hiện các chức năng đầu vào hoặc đầu ra kỹ thuật số. Tưởng tượng chúng như những "cánh tay" của vi điều khiển, giúp thiết bị này tương tác với thế giới bên ngoài. Mỗi chân trong một cổng GPIO có thể được cá nhân hóa để đọc dữ liệu từ các cảm biến, điều khiển các thiết bị ngoại vi, hoặc tham gia vào các giao tiếp khác nhau. Việc nhóm các chân thành các cổng không chỉ giúp đơn giản hóa việc quản lý mà còn tăng hiệu quả trong việc cấu hình và sử dụng. Các cổng GPIO thường được đặt tên như GPIOA, GPIOB, GPIOC,... và mỗi cổng thường bao gồm 16 chân. Nhờ sự linh hoạt này, các vi điều khiển như STM32F103C8 có thể được ứng dụng trong vô số các dự án điện tử, từ những dự án đơn giản như điều khiển đèn LED đến những hệ thống tự động phức tạp.

**3. GPIO Modes**

*   **GPIO Output:** 
![Alt text](images/setup10.png)

*   **GPIO Input:** 
![Alt text](images/setup11.png)