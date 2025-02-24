### Git Config

```sh
Host github.com-sankar
	HostName github.com
	User git
	IdentityFile ~/.ssh/sankar

Host github.com-orgname
	HostName github.com
	User git
	IdentityFile ~/.ssh/orgname
```
Here’s a list of essential Git commands categorized by their purpose:

---

### **1. Configuration**
- **Set user name:**  
  ```bash
  git config --global user.name "Your Name"
  ```
- **Set user email:**  
  ```bash
  git config --global user.email "you@example.com"
  ```
- **Check configuration:**  
  ```bash
  git config --list
  ```

---

### **2. Repository Management**
- **Initialize a new Git repository:**  
  ```bash
  git init
  ```
- **Clone an existing repository:**  
  ```bash
  git clone <repo_url>
  ```

---

### **3. Basic Snapshotting**
- **Check the status of files:**  
  ```bash
  git status
  ```
- **Track new files:**  
  ```bash
  git add <file>
  ```
- **Add all changes:**  
  ```bash
  git add .
  ```
- **Commit changes:**  
  ```bash
  git commit -m "Commit message"
  ```

---

### **4. Branching and Merging**
- **List branches:**  
  ```bash
  git branch
  ```
- **Create a new branch:**  
  ```bash
  git branch <branch_name>
  ```
- **Switch to a branch:**  
  ```bash
  git checkout <branch_name>
  ```
- **Create and switch to a new branch:**  
  ```bash
  git checkout -b <branch_name>
  ```
- **Merge a branch into the current branch:**  
  ```bash
  git merge <branch_name>
  ```

---

### **5. Remote Repositories**
- **Show remotes:**  
  ```bash
  git remote -v
  ```
- **Add a remote:**  
  ```bash
  git remote add origin <url>
  ```
- **Push changes to remote:**  
  ```bash
  git push origin <branch_name>
  ```
- **Pull changes from remote:**  
  ```bash
  git pull origin <branch_name>
  ```

---

### **6. Inspection and Comparison**
- **Show commit history:**  
  ```bash
  git log
  ```
- **Show changes between commits, branches, or working directory:**  
  ```bash
  git diff
  ```

---

### **7. Undoing Changes**
- **Unstage a file:**  
  ```bash
  git reset HEAD <file>
  ```
- **Discard changes in a file:**  
  ```bash
  git checkout -- <file>
  ```
- **Reset to a previous commit:**  
  ```bash
  git reset --hard <commit_hash>
  ```

---

### **8. Stashing Changes**
- **Stash changes:**  
  ```bash
  git stash
  ```
- **Apply stashed changes:**  
  ```bash
  git stash apply
  ```
- **List stashes:**  
  ```bash
  git stash list
  ```

---

### **9. Tagging**
- **Create a tag:**  
  ```bash
  git tag <tag_name>
  ```
- **Push tags to remote:**  
  ```bash
  git push origin <tag_name>
  ```

---

Would you like more advanced Git workflows or specific scenarios explained?