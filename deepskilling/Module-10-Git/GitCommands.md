# Module 10 - Git Hands-on Commands

## 1. Git Setup and First Commit

```bash
git --version
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
git config --global core.editor "code --wait"
mkdir GitDemo
cd GitDemo
git init
echo "Welcome to Git" > welcome.txt
git status
git add welcome.txt
git commit -m "Add welcome file"
git branch -M main
git remote add origin <remote-url>
git pull origin main --allow-unrelated-histories
git push -u origin main
```

## 2. Ignore Files and Folders

```bash
echo "*.log" > .gitignore
echo "log/" >> .gitignore
mkdir log
echo "debug" > app.log
git status
git add .gitignore
git commit -m "Ignore logs"
```

## 3. Branching and Merging

```bash
git switch -c GitNewBranch
echo "Branch work" > branch-file.txt
git add branch-file.txt
git commit -m "Add branch work"
git switch main
git diff main GitNewBranch
git merge GitNewBranch
git log --oneline --graph --decorate
git branch -d GitNewBranch
```

## 4. Conflict Resolution

```bash
git switch -c GitWork
echo "<message>branch</message>" > hello.xml
git add hello.xml
git commit -m "Add branch hello"
git switch main
echo "<message>master</message>" > hello.xml
git add hello.xml
git commit -m "Add main hello"
git merge GitWork
# edit hello.xml to resolve conflict
git add hello.xml
git commit -m "Resolve hello.xml conflict"
echo "*.orig" >> .gitignore
git add .gitignore
git commit -m "Ignore merge backup files"
git branch -d GitWork
```

## 5. Cleanup and Push

```bash
git status
git branch
git pull origin main
git push origin main
git remote -v
```

## 6. Useful Git Commands

```bash
git status
git log --oneline --decorate --graph
git stash
git stash pop
git revert <commit-hash>
```
