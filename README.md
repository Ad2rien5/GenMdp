# GenMdp

**GenMdp** is a simple and customizable password generator built with **PowerShell** and executed via a **.bat launcher**.  
It allows users to quickly generate secure passwords based on selected criteria.

---

## Features

GenMdp allows you to choose the specifications of the generated password :  
- Choose the **length**  
- Include or exclude **numbers**  
- Include or exclude **uppercase letters**  
- Include or exclude **special characters**
- **Error logging system**  

This makes it flexible for different security requirements (websites, enterprise policies, local tools, etc.).

---

## Technologies Used

- **PowerShell** — Core password generation logic  
- **Batch (.bat)** — Simple launcher for easy execution on Windows  

---

## How to Use

1. Download or clone the repository.  
2. Double-click the `.bat` file.  
3. Follow the prompts:  
   - Enter the desired password length.  
   - Choose whether to include:  
     - Numbers  
     - Uppercase letters  
     - Special characters  
4. The generated password will be displayed in the console.  

If an error occurs, details will be written to a log file.  

---

##  Requirements

- Windows OS  
- PowerShell installed (default on modern Windows systems)  
    - *PowerShell version recent enough to support `Get-SecureRandom`* (PowerShell 7+ recommended)  

> If script execution is disabled, you may need to allow PowerShell script execution:  
>  
> ```powershell  
> Set-ExecutionPolicy RemoteSigned  
> ```  

---

## Contributor
Séac'h Adrien
