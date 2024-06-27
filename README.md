# GameChat Automation Test

## Project Description

This archive is one of my freelance projects and it was approved for public posting (no sensitive data) as a testament to my efforts. It is built using Robot Framework and Selenium for the [**Torn City**](https://www.torn.com/) game. 

If you are worried about the authenticity of this project, you can ask me any question about any line of code during an interview. I developed it from scratch, so I can explain everything to you.
(Actually, after getting permission for private use, I just posted it recently)

## Repository Structure
- **common/**: Contains common libraries and resources used across multiple test scripts.
- **resources/**: Holds resource files like variables, keywords, and other reusable components.
- **testscripts/**: Includes the actual test scripts written in Robot Framework.
- **red.xml**: Configuration for RED - Robot Editor.
- **requirements.txt**: Lists the dependencies required to run the automation tests.

## Getting Started

### Prerequisites
- Python 3.x
- Robot Framework
- BrowserStack (optional, for cross-browser testing)

### Installation
1. Clone the repository:
    ```sh
    git clone https://github.com/ntlinh8/gamechat-automation-test.git
    ```
2. Navigate to the project directory:
    ```sh
    cd gamechat-automation-test
    ```
3. Install the required dependencies:
    ```sh
    pip install -r requirements.txt
    ```

### Running Tests
To run the tests, use the following command:
```sh
robot testscripts/FileScript.robot
Example: robot testscripts/PrivateChat.robot

