# Preview

Follow this steps to run blohg locally in preview-mode, while
writing posts.

1. Start the preview container with
  * Run `bash scripts/run-local-preview.sh`
2. Allow TCP port 5000 temporarily with
  * Run `sudo ufw allow 5000/tcp`
3. Set up a timer to close the port after 30 minutes
  * Run `echo "ufw delete allow 5000/tcp" | sudo at now + 30 minutes`

And if you need more commands from the `at` tool, you can do:

* List jobs: `sudo at -l`
* See a job command: `sudo at -c 3`
* Remove a given job number (without running the command): `sudo atrm 3`

