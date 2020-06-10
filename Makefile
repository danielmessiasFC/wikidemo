push-wiki:
	cd wiki && \
	git init && \
	git remote add origin git@github.com:danielmessiasFC/wikidemo.wiki.git && \
	git fetch origin && \
	git add --all && git commit -m "wiki change" && \
	git pull --rebase -X theirs origin master && \
	git push origin master && \
	rm -rf .git