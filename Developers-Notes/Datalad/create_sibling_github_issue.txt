ISSUE: sometimes the command

datalad create-sibling-github

has problems picking up accurate credentials to log in to github.  

WORKAROUND:

1) Create local repository as normal with

datalad create

2) Independently create a repository of the same name at github

3) Copy some starter files into the local repository, such as README.md and DATS.json 

4) Push these to the github repository manually:

  git add README.md
  git commit -m "first commit"
  git branch -M main
  git remote add origin https://github.com/emmetaobrien/tempexample.git
  git push -u origin main
