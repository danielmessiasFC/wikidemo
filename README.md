
# GitHub Wikis: The Good, The Bad and the Ugly


## The Good
- GitHub wiki's keep docs close to code
- GitHub wiki pages are Markdown files
- GitHub wiki's support a homepage, sidebar and footer
- GitHub wiki's are actually repo's in their own right

## The Bad
- You can't PR against the GitHub wiki repo
- You can't view other branches for the GitHub wiki repo in the web UI
- You have to clone another repo to access the folder structure of the wiki

## The Ugly
- Either you write changes straight to master via the web UI
- Or you clone the wiki locally, push changes to a branch, and ask somebody to check your branch on their machine to 'review'
- Either way you lose nice things like the PR diff

# Solution?

Keep wiki files in the main project repo under `wiki/` directory. Then somehow sync this with the
actual wiki repo. The `wiki/` directory in the main project is the 'source-of-truth', consider the
wiki repo a 'read-only-view'.

## wiki-push
Small script in Makefile that pushes changes to the wiki. I've set something functional up in this
repo (n.b. I suck at shell/git commands though, I'm sure it could be written better).

Workflow would be:
1) Open feature branch on project repo and make some wiki page changes
2) Open a PR, get changes reviewed and merge
3) Author runs  `> make push-wiki` locally to sync the wiki

This is a bit like the workflow of pushing a git release/tag

## Sync with CI

Could setup the CI to do this sync process after merges to master. I haven't tried this because
it involves setting up GitHub access tokens, but it'd be basically the same steps as above, except
3) would happen 'automagically'

