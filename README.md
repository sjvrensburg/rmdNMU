### **📘 rmdNMU: R Markdown Templates for Nelson Mandela University**  

[![Lifecycle: Experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)  
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)  

#### **📌 Overview**  
**`rmdNMU`** provides **custom R Markdown templates** tailored for **Nelson Mandela University**. These templates incorporate NMU’s branding guidelines, fonts, and formatting for professional-looking documents.  

---

### **📥 Installation**  
#### **1️⃣ Install from GitHub**  
```r
# Install remotes if needed
if (!requireNamespace("remotes", quietly = TRUE)) install.packages("remotes")

# Install rmdNMU
remotes::install_github("sjvrensburg/rmdNMU")
```

#### **2️⃣ Install Required Fonts**  
```r
rmdNMU::install_fonts()
```
> ⚠️ **Ensure that LuaLaTeX is installed** for proper PDF rendering.

#### **3️⃣ Install TinyTeX (if needed)**  
```r
install.packages("tinytex")
tinytex::install_tinytex()
```
> 🛠 TinyTeX is a lightweight LaTeX distribution recommended for R Markdown users.

---

### **📄 Available Templates**  
| 📌 Template | 📄 Purpose | 🖥️ Output Formats |
|------------|-----------|----------------|
| **Practical/Lab** | Assignments & lab exercises | PDF, HTML |
| **Short Notes** | Lecture notes & handouts | PDF |
| **Test** | Examinations & tests | PDF |

#### **🔹 Usage Example**  
In your RMarkdown document’s YAML header, specify the desired template:  
```yaml
output: rmdNMU::short_notes
```

#### **📝 Custom Options** (Example for `prac_or_lab`)  
```yaml
student_number: "123456789"
name: "John"
surname: "Doe"
module: "STAT312"
type: "Practical"
number: 1
```

---

### **🎨 NMU Branding & Colors**  
The templates **use official NMU colors** for consistency. You can apply these colors in LaTeX documents:  

```latex
\color{nmuprimaryblue}{Primary Blue}
\color{nmusecondaryyellow}{Secondary Yellow}
```
> 🎨 **Custom faculty-specific colors** are also available!

---

### **💡 Features & Highlights**
✅ **NNMU-like Branding**  
✅ **Built-in Theorem & Example Boxes**  
✅ **Cross-referencing & Citations**  
✅ **Support for Math & Code Blocks**

---

### **🛠️ Development & Contribution**
Want to improve `rmdNMU`? 🚀 Feel free to:  
- **Submit issues & feature requests**  
- **Create pull requests**  

📧 **Author**: Stéfan Janse van Rensburg  
📜 **License**: GPL-3  

> 💬 *Questions? Suggestions? Let’s make academic documents look amazing together!* 🎓  
