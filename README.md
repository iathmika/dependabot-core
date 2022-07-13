This branch contains the code for adding Leiningen (Clojure) support to dependabot.


To run dependabot for a clojure project locally, follow the given steps-

- Clone this repository and switch to branch feature/clojure-spport

- Pull the docker image for dependabot from - https://hub.docker.com/r/athmika/dependabot-core-development and run the development container -

```shell
$ docker pull athmika/dependabot-core-development:latest 
$ docker tag athmika/dependabot-core-development dependabot/dependabot-core-development
$ bin/docker-dev-shell
=> running docker development shell
[dependabot-core-dev] ~/dependabot-core $
```
- Run the dry-run script to generate dependancy upgrades. Please note, you will need to pass the package name followed by the repository name in the format `repo-owner/repo-name`.

```shell
[dependabot-core-dev] ~/dependabot-core $ bin/dry-run.rb lein pcsanwald/kaggle-titanic

```

This will generate dependancy upgrades and store the repository with bump commits in tmp/ folder.
Please note this does not generate the pull request on github. This is only a dry-run of dependabot for clojure projects and will generate the bump commits locally. You can then choose to push them to your own repo or generate pull request of it.
