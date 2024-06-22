# copr-build-test

This is a test repository for using [Github Actions](https://github.com/features/actions) to trigger [Copr-builds](https://copr.fedorainfracloud.org/). It was inspired these instructions [github push actions and copr] (https://pavel.raiskup.cz/blog/github-push-actions-and-copr.html). 

---

The basic steps are:

1. Create the (target) project at Copr
2. Setup the Github Actions Workflow
   - A YAML file in *.github/workflows/* is the minimum
   - Additional shell scripts are not very unlikely
   - You will need to reference your Copr credentials (see next point)
3. Store your Copr credentials as an Actions Secret
4. Upload/test/fix/improve

Add 2: The tricky part is to push the changed files from Github to Copr. I use the local runner as my local working area for that.

- creation an Copr credential file on the runner (see Settings -> Secrets -> Actions -> Repository Secret)
- setting up an SRPM package build environment (here is where shell scripts become handy to keep the YAML files small and clean)
- copying over the changed files from the local clone of the repo (which is created automatically) to the RPMtree-SOURCES directory

At this stage only two steps are missing: upload the changed context to Copr and trigger the package build. You could both as part of the shell script but I decided to keep it out and have added these steps to the workflow file. Plus, my favourite way of providing the source to Copr is the usage of SRPMS. 

For detailed information about these steps please refer to the corresponding documention on OBS and Github, respectively. Here are the links for this particular setup

1. [Copr Project dummy](https://copr.fedorainfracloud.org/coprs/useidel/dummy/)
2. [Github Action Workflow](https://github.com/useidel/copr-build-test/blob/main/.github/workflows/rpmbuild_copr.yml)
3. [Github Action Secret](https://github.com/useidel/copr-build-test/settings/secrets/actions)

---

Here I use a dummy RPM package which should be rebuild once the SPEC file changes. For pure technical reasons I store the source code of that package in this repo but it could be very well somewhere else. I have not included fancy things like patching the source while building the package. Plus, right now the automation is triggered by *git push*. I plan to change this, since even updates to any other file in this repo will kick of the Github Actions workflow. The plan is to use the creation of new [releases](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository) as trigger.

Update: Now changes to the README file will not trigger Github Actions. See [Github Action Workflow](https://github.com/useidel/copr-build-test/blob/main/.github/workflows/rpmbuild_copr.yml) 

