VERSION := $(shell cargo metadata --no-deps --format-version 1 | jq -r '.packages[0].version')

.PHONY: release
release:
	git checkout -b release-$(VERSION)
	git cliff --bump -o
	git add .
	git commit -sm "chore(release): release version v$(VERSION)"
	git tag "v$(VERSION)"
	git push && git push --tags
