BRANCH := $(shell git rev-parse --abbrev-ref HEAD)

check-master:
ifneq ($(BRANCH),master)
	@echo "Must be on master branch to push to wiki"
endif

push-wiki:
ifneq ($(BRANCH),master)
	@echo "Must be on master branch to push to wiki"
else
	cd wiki && \
	git init && \
	git remote add origin git@github.com:danielmessiasFC/wikidemo.wiki.git && \
	git fetch origin && \
	git add --all && git commit -m "wiki change" && \
	git pull --rebase -X theirs origin master && \
	git push origin master && \
	rm -rf .git
endif