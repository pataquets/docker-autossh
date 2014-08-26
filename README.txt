AutoSSH tunnel Docker image
---------------------------
This Docker image will expose AutoSSH created tunnels ready to map them
to the container's host via Docker port mappings.

Usage (lines are split using BASH "\" line separator):
$ docker run \
  -p <hostport>:<containerport> \
  [ -v /home/hostuser/.ssh/:/root/.ssh/ ] \
  [ -v /home/hostuser/autossh/:/opt/autossh/ ] \
  pataquets/autossh <autossh-config-filename> [username@]<server>

Use the Docker -p parameter to specify the local port mappings.
If you don't specify local address binding, Docker will bind them to all
local interfaces.

You can also use the Docker -v parameter to bind mount the container host
SSH keys and AutoSSH config files.

As container parameters, you should specify the SSH command config file
in ssh_config format (see 'man ssh_config') without the .conf extension
as the first parameter. The config file will be looked for in the
container's /opt/autossh directory.
You can either bind mount your own AutoSSH config files directory or build
a new image with its own built-in files.

The connection will be made to the destination server hostname or IP
specified in the second 'autossh' parameter.
You can also specify the user name to login as in the ususal SSH syntax
'username@server' or specify it in the ssh_config file.

AutoSSH will be started with monitoring turned off. You can enable it by
passing the AUTOSSH_PORT environment variable when starting your Docker
container (see 'man autossh' for details).

You can pass additional parameters to SSH as usual by adding them after the
required ones.

The example below will expose a MySQL server in the default port 3306 and
make it available via the host port 4000 on the local interface only, for
security reasons.

Example:
$ docker run -p 127.0.0.1:4000:3306 pataquets/autossh \
  <autossh-config-filename> [username@]<server>
