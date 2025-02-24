Here’s a list of **advanced Git commands and workflows** that go beyond the basics:

---

### **1. Advanced Branching and Merging**

- **Rebase a branch (replay commits on another base):**  
  ```bash
  git rebase <branch>
  ```
- **Interactive rebase (edit, squash, or reorder commits):**  
  ```bash
  git rebase -i <commit_hash>
  ```
- **Abort a rebase in progress:**  
  ```bash
  git rebase --abort
  ```
- **Continue after resolving conflicts during a rebase:**  
  ```bash
  git rebase --continue
  ```

- **Merge with conflict resolution (for large merges):**  
  ```bash
  git merge --no-ff <branch>
  ```

---

### **2. Cherry-Picking Commits**  
Pick specific commits from one branch and apply them to another:

```bash
git cherry-pick <commit_hash>
```

---

### **3. Resetting Commits**  
- **Soft reset (keep changes staged):**  
  ```bash
  git reset --soft <commit_hash>
  ```
- **Mixed reset (unstage changes but keep them locally):**  
  ```bash
  git reset --mixed <commit_hash>
  ```
- **Hard reset (delete all changes after a commit):**  
  ```bash
  git reset --hard <commit_hash>
  ```

---

### **4. Git Tags for Releases**  
- **Create annotated tags (with metadata):**  
  ```bash
  git tag -a v1.0 -m "Version 1.0 release"
  ```
- **Push all tags to remote:**  
  ```bash
  git push --tags
  ```

---

### **5. Advanced Log and History Analysis**  
- **Graphical representation of commit history:**  
  ```bash
  git log --oneline --graph --all --decorate
  ```
- **Show commit history for a specific file:**  
  ```bash
  git log -- <file>
  ```

---

### **6. Bisecting to Find Bugs**  
Use **binary search** to find the commit that introduced a bug:
```bash
git bisect start
git bisect bad            # Mark current commit as bad
git bisect good <commit>  # Mark a known good commit
# Git checks out commits in between for testing
git bisect reset          # Reset to original HEAD after finishing
```

---

### **7. Submodules**  
For managing repositories inside another repository:  
- **Add a submodule:**  
  ```bash
  git submodule add <repo_url> <path>
  ```
- **Initialize submodules:**  
  ```bash
  git submodule init
  git submodule update
  ```

---

### **8. Stashing for Complex Workflows**  
- **Stash with a message:**  
  ```bash
  git stash save "WIP: refactoring feature X"
  ```
- **Apply the last stash and drop it from the stash list:**  
  ```bash
  git stash pop
  ```
- **Apply a specific stash:**  
  ```bash
  git stash apply stash@{2}
  ```

---

### **9. Aliases for Efficiency**  
Create custom Git shortcuts:
```bash
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.lg "log --oneline --graph --all --decorate"
```

---

### **10. Cleaning Up Repositories**  
- **Remove untracked files:**  
  ```bash
  git clean -f
  ```
- **Remove untracked directories as well:**  
  ```bash
  git clean -fd
  ```

---

### **11. Working with Remotes (Advanced)**  
- **Rename a remote:**  
  ```bash
  git remote rename <old_name> <new_name>
  ```
- **Fetch from all remotes and prune deleted branches:**  
  ```bash
  git fetch --all --prune
  ```

- **Force push with lease (safer than `--force`):**  
  ```bash
  git push --force-with-lease
  ```

---

### **12. Squashing Commits Before Merging**  
Squash commits interactively:
```bash
git rebase -i HEAD~<number_of_commits>
```
Replace `pick` with `squash` (or `s`) for the commits you want to combine.

---

### **13. Amend the Last Commit**  
- **Modify the last commit message or add staged changes:**  
  ```bash
  git commit --amend
  ```

---

### **14. Blame for Debugging**  
Identify who last modified a particular line in a file:
```bash
git blame <file>
```

---

### **15. Advanced Diff Usage**  
- **Compare two branches:**  
  ```bash
  git diff <branch1>..<branch2>
  ```
- **Compare working directory with the last commit:**  
  ```bash
  git diff HEAD
  ```

---

### **16. Patching and Applying Changes**  
- **Create a patch file from commits:**  
  ```bash
  git format-patch -k -1 --stdout > patchfile.patch
  ```
- **Apply a patch:**  
  ```bash
  git apply patchfile.patch
  ```

---

### **17. Rebasing vs Merging Strategy**  
- **Rebase for a cleaner, linear history:**  
  ```bash
  git pull --rebase origin main
  ```
- **Merge for keeping full history with context:**  
  ```bash
  git merge main
  ```

---

### **18. Force Push for Updated History (Use with Caution!)**  
When rebasing or rewriting history:
```bash
git push --force-with-lease origin <branch>
```

---

### **19. Sparse Checkout (Working with Large Repos)**  
- **Enable sparse-checkout:**  
  ```bash
  git sparse-checkout init --cone
  git sparse-checkout set <path_to_directory>
  ```

---

### **20. Hooks for Automation**  
Git hooks can automate tasks like running tests before commits:
- Located in `.git/hooks/`. For example:
  ```bash
  .git/hooks/pre-commit
  ```
- Write shell scripts in these hook files to automate processes.

---

### ⚡ **Bonus: Graphical Visualization of Branches**
```bash
git log --graph --abbrev-commit --decorate --date=relative --all
```

---

### **Suggested Advanced Workflows**  
- **Feature branching workflow**: Create feature-specific branches that merge into `develop`.  
- **Git Flow**: Uses `master`, `develop`, `feature/*`, `release/*`, and `hotfix/*` branches.  
- **Forking workflow**: Great for open-source projects where pull requests are reviewed.

---

💬 *Would you like deep dives into workflows like GitFlow, trunk-based development, or advanced CI/CD integrations with Git?*