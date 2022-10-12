# nerdctl.fish - nerdctl completions for fish shell
#

function __fish_nerdctl_no_subcommand --description 'Test if nerdctl has yet to be given the subcommand'
    for i in (commandline -opc)
        if contains -- $i attach build commit cp create diff events exec export history images import info inspect kill load login logout logs network pause port ps pull push rename restart rm rmi run save search start stop tag top trust unpause version wait stats
            return 1
        end
    end
    return 0
end

function __fish_print_nerdctl_containers --description 'Print a list of nerdctl containers' -a select
    switch $select
        case running
            nerdctl ps -a --no-trunc --filter status=running --format "{{.ID}}\n{{.Names}}" | tr ',' '\n'
        case stopped
            nerdctl ps -a --no-trunc --filter status=exited --format "{{.ID}}\n{{.Names}}" | tr ',' '\n'
        case all
            nerdctl ps -a --no-trunc --format "{{.ID}}\n{{.Names}}" | tr ',' '\n'
    end
end

function __fish_print_nerdctl_networks --description 'Print a list of nerdctl networks'
    nerdctl network ls --format "{{.ID}}\n{{.Name}}" | tr ',' '\n'
end


function __fish_nerdctl_no_subcommand_trust --description 'Test if nerdctl has yet to be given the trust subcommand'
    if __fish_seen_subcommand_from trust
        for i in (commandline -opc)
            if contains -- $i inspect key revoke sign signer
                return 1
            end
        end
        return 0
    end
    return 1
end

function __fish_nerdctl_subcommand_path --description 'Test if command has all arguments in any order'
    set -l cmd (commandline -poc)
    set -e cmd[1]
    for sub in $argv
        if not contains -- $sub $cmd
            return 1
        end
    end
    return 0
end

function __fish_nerdctl_subcommand_path_without --description 'Test if command has all arguments in any order'
    set -l cmd (commandline -poc)
    set -e cmd[1]
    for sub in $argv
        if contains -- $sub $cmd
            return 1
        end
    end
    return 0
end

function __fish_print_nerdctl_images --description 'Print a list of nerdctl images'
    nerdctl images --format "{{.Repository}}:{{.Tag}}" | command grep -v '<none>'
end

function __fish_print_nerdctl_repositories --description 'Print a list of nerdctl repositories'
    nerdctl images --format "{{.Repository}}" | command grep -v '<none>' | command sort | command uniq
end

# common options
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -l api-cors-header -d "Set CORS headers in the Engine API. Default is cors disabled"
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -s b -l bridge -d 'Attach containers to a pre-existing network bridge'
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -l bip -d "Use this CIDR notation address for the network bridge's IP, not compatible with -b"
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -s D -l debug -d 'Enable debug mode'
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -s d -l daemon -d 'Enable daemon mode'
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -l dns -d 'Force Docker to use specific DNS servers'
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -l dns-opt -d 'Force Docker to use specific DNS options'
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -l dns-search -d 'Force Docker to use specific DNS search domains'
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -l exec-opt -d 'Set runtime execution options'
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -l fixed-cidr -d 'IPv4 subnet for fixed IPs (e.g. 10.20.0.0/16)'
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -l fixed-cidr-v6 -d 'IPv6 subnet for fixed IPs (e.g.: 2001:a02b/48)'
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -s G -l group -d 'Group to assign the unix socket specified by -H when running in daemon mode'
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -s g -l graph -d 'Path to use as the root of the Docker runtime'
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -s H -l host -d 'The socket(s) to bind to in daemon mode or connect to in client mode, specified using one or more tcp://host:port, unix:///path/to/socket, fd://* or fd://socketfd.'
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -s h -l help -d 'Print usage'
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -l icc -d 'Allow unrestricted inter-container and Docker daemon host communication'
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -l insecure-registry -d 'Enable insecure communication with specified registries (no certificate verification for HTTPS and enable HTTP fallback) (e.g., localhost:5000 or 10.20.0.0/16)'
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -l ip -d 'Default IP address to use when binding container ports'
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -l ip-forward -d 'Enable net.ipv4.ip_forward and IPv6 forwarding if --fixed-cidr-v6 is defined. IPv6 forwarding may interfere with your existing IPv6 configuration when using Router Advertisement.'
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -l ip-masq -d "Enable IP masquerading for bridge's IP range"
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -l iptables -d "Enable Docker's addition of iptables rules"
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -l ipv6 -d 'Enable IPv6 networking'
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -s l -l log-level -d 'Set the logging level ("debug", "info", "warn", "error", "fatal")'
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -l label -d 'Set key=value labels to the daemon (displayed in `nerdctl info`)'
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -l mtu -d 'Set the containers network MTU'
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -s p -l pidfile -d 'Path to use for daemon PID file'
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -l registry-mirror -d 'Specify a preferred registry mirror'
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -s s -l storage-driver -d 'Force the Docker runtime to use a specific storage driver'
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -l selinux-enabled -d 'Enable selinux support. SELinux does not presently support the BTRFS storage driver'
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -l storage-opt -d 'Set storage driver options'
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -l tls -d 'Use TLS; implied by --tlsverify'
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -l tlscacert -d 'Trust only remotes providing a certificate signed by the CA given here'
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -l tlscert -d 'Path to TLS certificate file'
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -l tlskey -d 'Path to TLS key file'
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -l tlsverify -d 'Use TLS and verify the remote (daemon: verify client, client: verify daemon)'
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -s v -l version -d 'Print version information and quit'

# subcommands
# attach
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a attach -d 'Attach local standard input, output, and error streams to a running container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from attach' -l detach-keys -d 'Override the key sequence for detaching a container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from attach' -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from attach' -l no-stdin -d 'Do not attach STDIN'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from attach' -l sig-proxy -d 'Proxy all received signals to the process'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from attach' -a '(__fish_print_nerdctl_containers running)' -d "Container"

# build
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a build -d 'Build an image from a Dockerfile'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from build' -l add-host -d 'Add a custom host-to-IP mapping (host:ip)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from build' -l build-arg -d 'Set build-time variables'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from build' -l cache-from -d 'Images to consider as cache sources'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from build' -l cgroup-parent -d 'Optional parent cgroup for the container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from build' -l compress -d 'Compress the build context using gzip'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from build' -l cpu-period -d 'Limit the CPU CFS (Completely Fair Scheduler) period'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from build' -l cpu-quota -d 'Limit the CPU CFS (Completely Fair Scheduler) quota'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from build' -s c -l cpu-shares -d 'CPU shares (relative weight)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from build' -l cpuset-cpus -d 'CPUs in which to allow execution (0-3, 0,1)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from build' -l cpuset-mems -d 'MEMs in which to allow execution (0-3, 0,1)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from build' -l disable-content-trust -d 'Skip image verification'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from build' -s f -l file -d "Name of the Dockerfile (Default is ‘PATH/Dockerfile’)"
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from build' -l force-rm -d 'Always remove intermediate containers'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from build' -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from build' -l iddfile -d 'Write the image ID to the file'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from build' -l isolation -d 'Container isolation technology'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from build' -l label -d 'Set metadata for an image'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from build' -s m -l memory -d 'Memory limit'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from build' -l memory-swap -d 'Swap limit equal to memory plus swap: ‘-1’ to enable unlimited swap'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from build' -l network -d 'Set the networking mode for the RUN instructions during build'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from build' -l no-cache -d 'Do not use cache when building the image'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from build' -l pull -d 'Always attempt to pull a newer version of the image'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from build' -s q -l quiet -d 'Suppress the build output and print image ID on success'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from build' -l rm -d 'Remove intermediate containers after a successful build'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from build' -l security-opt -d 'Security options'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from build' -l shm-size -d 'Size of /dev/shm'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from build' -s t -l tag -d 'Name and optionally a tag in the ‘name:tag’ format'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from build' -l target -d 'Set the target build stage to build'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from build' -l ulimit -d 'Ulimit options'

# commit
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a commit -d "Create a new image from a container's changes"
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from commit' -s a -l author -d 'Author (e.g., "John Hannibal Smith <hannibal@a-team.com>")'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from commit' -s c -l change -d 'Apply Dockerfile instruction to the created image'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from commit' -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from commit' -s m -l message -d 'Commit message'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from commit' -s p -l pause -d 'Pause container during commit'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from commit' -a '(__fish_print_nerdctl_containers all)' -d "Container"

# compose
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a compose -d "Compose"
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from compose' -s f -l file -r -d 'Specify an alternate compose file'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from compose' -s p -l project-name -x -d 'Specify an alternate project name'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from compose' -l env-file -r -d 'Specify an alternate environment file (default: .env)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from compose' -l verbose -d 'Show more output'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from compose' -s H -l host -x -d 'Daemon socket to connect to'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from compose' -l tls -d 'Use TLS; implied by --tlsverify'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from compose' -l tlscacert -r -d 'Trust certs signed only by this CA'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from compose' -l tlscert -r -d 'Path to TLS certificate file'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from compose' -l tlskey -r -d 'Path to TLS key file'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from compose' -l tlsverify -d 'Use TLS and verify the remote'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from compose' -l skip-hostname-check -d "Don't check the daemon's hostname against the name specified in the client certificate (for example if your docker host is an IP address)"
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from compose' -l no-ansi -d 'Do not print ANSI control characters'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from compose' -l ansi -a 'never always auto' -d 'Control when to print ANSI control characters'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from compose' -s h -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from compose' -s v -l version -d 'Print version and exit'

# cp
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a cp -d "Copy files/folders between a container and the local filesystem"
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from cp' -s a -l archive -d 'Archive mode (copy all uid/gid information)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from cp' -s L -l follow-link -d 'Always follow symbol link in SRC_PATH'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from cp' -l help -d 'Print usage'

# create
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a create -d 'Create a new container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l add-host -d 'Add a custom host-to-IP mapping (host:ip)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -s a -l attach -d 'Attach to STDIN, STDOUT or STDERR.'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l blkio-weight -d 'Block IO (relative weight), between 10 and 1000, or 0 to disable (default 0)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l blkio-weight-device -d 'Block IO weight (relative device weight)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l cap-add -d 'Add Linux capabilities'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l cap-drop -d 'Drop Linux capabilities'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l cgroupns -d 'Cgroup namespace mode to use'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l cgroup-parent -d 'Optional parent cgroup for the container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l cidfile -d 'Write the container ID to the file'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l cpu-count -d 'CPU count (Windows only)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l cpu-percent -d 'CPU percent (Windows only)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l cpu-period -d 'Limit CPU CFS (Completely Fair Scheduler) period'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l cpu-quota -d 'Limit CPU CFS (Completely Fair Scheduler) quota'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l cpu-rt-period -d 'Limit CPU real-time period in microseconds'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l cpu-rt-runtime -d 'Limit CPU real-time runtime in microseconds'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l cpu-shares -d 'CPU shares (relative weight)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l cpus -d 'Number of CPUs'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l cpuset-cpus -d 'CPUs in which to allow execution (0-3, 0,1)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l cpuset-mems -d 'MEMs in which to allow execution (0-3, 0,1)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l device -d 'Add a host device to the container (e.g. --device=/dev/sdc:/dev/xvdc:rwm)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l device-cgroup-rule -d 'Add a rule to the cgroup allowed devices list'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l device-read-bps -d 'Limit read rate (bytes per second) from a device'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l device-read-iops -d 'Limit read rate (IO per second) from a device'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l device-write-bps -d 'Limit write rate (bytes per second) to a device'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l device-write-iops -d 'Limit write rate (IO per second) to a device'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l disable-content-trust -d 'Skip image verification'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l dns -d 'Set custom DNS servers'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l dns-opt -d 'Set DNS options'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l dns-option -d 'Set DNS options'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l dns-search -d 'Set custom DNS search domains'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -s e -l env -d 'Set environment variables'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l entrypoint -d 'Overwrite the default ENTRYPOINT of the image'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l env-file -d 'Read in a line delimited file of environment variables'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l expose -d 'Expose a port or a range of ports'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l group-add -d 'Add additional groups to join'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l health-cmd -d 'Command to run to check health'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l health-interval -d 'Time between running the check (ms|s|m|h) (default 0s)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l health-retries -d 'Consecutive failures needed to report unhealthy'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l health-start-period -d 'Start period for the container to initialize before starting health-retries countdown (ms|s|m|h) (default 0s)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l health-timeout -d 'Maximum time to allow one check to run (ms|s|m|h) (default 0s)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -s h -l hostname -d 'Container host name'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l init -d 'Run an init inside the container that forwards signals and reaps processes'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -s i -l interactive -d 'Keep STDIN open even if not attached'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l io-maxbandwidth -d 'Maximum IO bandwidth limit for the system drive (Windows only)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l io-maxiops -d 'Maximum IOps limit for the system drive (Windows only)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l ip -d 'IPv4 address (e.g., 172.30.100.104)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l ip6 -d 'IPv6 address (e.g., 2001:db8::33)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l ipc -d 'IPC mode to use'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l isolation -d 'Container isolation technology'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l kernel-memory -d 'Kernel memory limit'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -s l -l label -d 'Set meta data on a container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l label-file -d 'Read in a line delimited file of labels'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l link -d 'Add link to another container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l link-local-ip -d 'Container IPv4/IPv6 link-local addresses'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l log-driver -d 'Logging driver for the container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l log-opt -d 'Log driver options'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l mac-address -d 'Container MAC address (e.g., 92:d0:c6:0a:29:33)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -s m -l memory -d 'Memory limit'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l memory-reservation -d 'Memory soft limit'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l memory-swap -d 'Swap limit equal to memory plus swap: ‘-1’ to enable unlimited swap'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l memory-swappiness -d 'Tune container memory swappiness (0 to 100)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l mount -d 'Attach a filesystem mount to the container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l name -d 'Assign a name to the container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -s net -l network -d 'Connect a container to a network'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -s net-alias -l network-alias -d 'Add network-scoped alias for the container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l no-healthcheck -d 'Disable any container-specified HEALTHCHECK'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l oom-kill-disable -d 'Disable OOM Killer'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l oom-score-adj -d 'Tune host’s OOM preferences (-1000 to 1000)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l pid -d 'PID namespace to use'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l pids-limit -d 'Tune container pids limit (set -1 for unlimited  )'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l privileged -d 'Give extended privileges to this container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -s p -l publish -d "Publish a container’s port(s) to the host"
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -s P -l publish-all -d 'Publish all exposed ports to random ports'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l read-only -d "Mount the container's root filesystem as read only"
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l restart -d 'Restart policy to apply when a container exits'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l rm -d 'Automatically remove the container when it exits'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l runtime -d 'Runtime to use for this container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l security-opt -d 'Security Options'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l shm-size -d 'Size of /dev/shm'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l stop-signal -d 'Signal to stop a container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l stop-timeout -d 'Timeout (in seconds) to stop a container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l storage-opt -d 'Storage driver options for the container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l sysctl -d 'Sysctl options'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l tmpfs -d 'Mount a tmpfs directory'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -s t -l tty -d 'Allocate a pseudo-TTY'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l ulimit -d 'Ulimit options'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -s u -l user -d '  Username or UID (format: <name|uid>[:<group|gid>])'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l userns -d 'User namespace to use'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l uts -d 'UTS namespace to use'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -s v -l volume -d 'Bind mount a volume'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l volume-driver -d 'Optional volume driver for the container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l volumes-from -d 'Mount volumes from the specified container(s)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -s w -l workdir -d 'Working directory inside the container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -a '(__fish_print_nerdctl_images)' -d "Image"

# diff
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a diff -d "Inspect changes on a container's filesystem"
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from diff' -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from diff' -a '(__fish_print_nerdctl_containers all)' -d "Container"

# events
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a events -d 'Get real time events from the server'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from events' -s f -l filter -d "Filter output based on conditions provided"
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from events' -l format -d 'Format the output using the given Go template'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from events' -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from events' -l since -d 'Show all events created since timestamp'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from events' -l until -d 'Stream events until this timestamp'

# exec
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a exec -d 'Run a command in a running container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from exec' -s d -l detach -d 'Detached mode: run command in the background'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from exec' -l detach-keys -d 'Override the key sequence for detaching a container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from exec' -s e -l env -d 'Set environment variables'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from exec' -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from exec' -s i -l interactive -d 'Keep STDIN open even if not attached'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from exec' -l privileged -d 'Give extended privileges to the command'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from exec' -s t -l tty -d 'Allocate a pseudo-TTY'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from exec' -s u -l user -d 'Username or UID (format: <name|uid>[:<group|gid>])'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from exec' -s w -l workdir -d 'Working directory inside the container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from exec' -a '(__fish_print_nerdctl_containers running)' -d "Container"

# export
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a export -d 'Stream the contents of a container as a tar archive'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from export' -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from export' -s o -l output -d 'Write to a file, instead of STDOUT'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from export' -a '(__fish_print_nerdctl_containers all)' -d "Container"

# history
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a history -d 'Show the history of an image'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from history' -l format -d 'Pretty-print images using a Go template'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from history' -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from history' -s H -l human -d 'Print sizes and dates in human readable format'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from history' -l no-trunc -d "Don't truncate output"
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from history' -s q -l quiet -d 'Only show image IDs'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from history' -a '(__fish_print_nerdctl_images)' -d "Image"

# images
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a images -d 'List images'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from images' -s a -l all -d 'Show all images (default hides intermediate images)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from images' -l digests -d 'Show digests'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from images' -s f -l filter -d 'Filter output based on conditions provided'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from images' -l format -d 'Pretty-print images using a Go template'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from images' -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from images' -l no-trunc -d "Don't truncate output"
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from images' -s q -l quiet -d 'Only show image IDs'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from images' -a '(__fish_print_nerdctl_repositories)' -d "Repository"

# import
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a import -d 'Create a new filesystem image from the contents of a tarball'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from import' -s c -l change -d 'Apply Dockerfile instruction to the created image'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from import' -s m -l message -d 'Set commit message for imported image'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from import' -l help -d 'Print usage'

# info
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a info -d 'Display system-wide information'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from info' -s f -l format  -d 'Format the output using the given go template'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from info' -l help -d 'Print usage'

# inspect
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a inspect -d 'Return low-level information on a container or image'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from inspect' -s f -l format -d 'Format the output using the given go template.'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from inspect' -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from inspect' -s s -l size -d 'Display total file sizes if the type is container.'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from inspect' -l type -d 'Return JSON for specified type'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from inspect' -a '(__fish_print_nerdctl_images)' -d "Image"
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from inspect' -a '(__fish_print_nerdctl_containers all)' -d "Container"

# kill
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a kill -d 'Kill a running container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from kill' -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from kill' -s s -l signal -d 'Signal to send to the container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from kill' -a '(__fish_print_nerdctl_containers running)' -d "Container"

# load
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a load -d 'Load an image from a tar archive'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from load' -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from load' -s i -l input -d 'Read from a tar archive file, instead of STDIN'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from load' -s q -l quiet -d 'Suppress the load output'

# login
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a login -d 'Log in to a Docker registry server'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from login' -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from login' -s p -l password -d 'Password'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from login' -l password-stdin -d 'Take the password from stdin'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from login' -s u -l username -d 'Username'

# logout
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a logout -d 'Log out from a Docker registry server'

# logs
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a logs -d 'Fetch the logs of a container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from logs' -s f -l follow -d 'Follow log output'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from logs' -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from logs' -s t -l timestamps -d 'Show timestamps'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from logs' -l since -d 'Show logs since timestamp'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from logs' -s n -l tail -d 'Output the specified number of lines at the end of logs (defaults to all logs)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from logs' -a '(__fish_print_nerdctl_containers running)' -d "Container"

# network
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a network -d 'Manage networks'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from network' -a connect -d 'Connect a container to a network'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from network' -a create -d 'Create a network'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from network' -a disconnect -d 'Disconnect a container from a network'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from network' -a inspect -d 'Display detailed information on one or more networks'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from network' -a ls -d 'List networks'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from network' -a prune -d 'Remove all unused networks'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from network' -a rm -d 'Remove one or more networks'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from network' -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from network rm' -a '(__fish_print_nerdctl_networks)' -d "Network"
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from network connect' -a '(__fish_print_nerdctl_networks)' -d "Network"
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from network disconnect' -a '(__fish_print_nerdctl_networks)' -d "Network"
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from network inspect' -a '(__fish_print_nerdctl_networks)' -d "Network"

# port
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a port -d 'Lookup the public-facing port that is NAT-ed to PRIVATE_PORT'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from port' -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from port' -a '(__fish_print_nerdctl_containers running)' -d "Container"

# pause
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a pause -d 'Pause all processes within a container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from pause' -a '(__fish_print_nerdctl_containers running)' -d "Container"

# ps
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a ps -d 'List containers'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from ps' -s a -l all -d 'Show all containers. Only running containers are shown by default.'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from ps' -l before -d 'Show only container created before Id or Name, include non-running ones.'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from ps' -s f -l filter -d 'Provide filter values. Valid filters:'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from ps' -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from ps' -s l -l latest -d 'Show only the latest created container, include non-running ones.'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from ps' -s n -d 'Show n last created containers, include non-running ones.'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from ps' -l no-trunc -d "Don't truncate output"
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from ps' -s q -l quiet -d 'Only display container IDs'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from ps' -s s -l size -d 'Display total file sizes'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from ps' -l since -d 'Show only containers created since Id or Name, include non-running ones.'

# pull
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a pull -d 'Pull an image or a repository from a Docker registry server'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from pull' -s a -l all-tags -d 'Download all tagged images in the repository'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from pull' -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from pull' -a '(__fish_print_nerdctl_images)' -d "Image"
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from pull' -a '(__fish_print_nerdctl_repositories)' -d "Repository"

# push
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a push -d 'Push an image or a repository to a Docker registry server'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from push' -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from push' -a '(__fish_print_nerdctl_images)' -d "Image"
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from push' -a '(__fish_print_nerdctl_repositories)' -d "Repository"

# rename
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a rename -d 'Rename an existing container'

# restart
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a restart -d 'Restart a container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from restart' -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from restart' -s t -l time -d 'Number of seconds to try to stop for before killing the container. Once killed it will then be restarted. Default is 10 seconds.'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from restart' -a '(__fish_print_nerdctl_containers running)' -d "Container"

# rm
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a rm -d 'Remove one or more containers'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from rm' -s f -l force -d 'Force the removal of a running container (uses SIGKILL)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from rm' -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from rm' -s l -l link -d 'Remove the specified link and not the underlying container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from rm' -s v -l volumes -d 'Remove anonymous volumes associated with the container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from rm' -a '(__fish_print_nerdctl_containers stopped)' -d "Container"
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from rm' -s f -l force -a '(__fish_print_nerdctl_containers all)' -d "Container"

# rmi
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a rmi -d 'Remove one or more images'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from rmi' -s f -l force -d 'Force removal of the image'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from rmi' -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from rmi' -l no-prune -d 'Do not delete untagged parents'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from rmi' -a '(__fish_print_nerdctl_images)' -d "Image"

# run
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a run -d 'Run a command in a new container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -s a -l attach -d 'Attach to STDIN, STDOUT or STDERR.'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -l add-host -d 'Add a custom host-to-IP mapping (host:ip)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -s c -l cpu-shares -d 'CPU shares (relative weight)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -l cap-add -d 'Add Linux capabilities'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -l cap-drop -d 'Drop Linux capabilities'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -l cidfile -d 'Write the container ID to the file'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -l cgroupns -d 'Cgroup namespace mode to use'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -l cpuset -d 'CPUs in which to allow execution (0-3, 0,1)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -s d -l detach -d 'Detached mode: run the container in the background and print the new container ID'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -l device -d 'Add a host device to the container (e.g. --device=/dev/sdc:/dev/xvdc:rwm)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l device-cgroup-rule -d 'Add a rule to the cgroup allowed devices list (e.g. --device-cgroup-rule="c 13:37 rwm")'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -l dns -d 'Set custom DNS servers'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -l dns-opt -d "Set custom DNS options (Use --dns-opt='' if you don't wish to set options)"
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -l dns-search -d "Set custom DNS search domains (Use --dns-search=. if you don't wish to set the search domain)"
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -s e -l env -d 'Set environment variables'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -l entrypoint -d 'Overwrite the default ENTRYPOINT of the image'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -l env-file -d 'Read in a line delimited file of environment variables'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -l expose -d 'Expose a port or a range of ports (e.g. --expose=3300-3310) from the container without publishing it to your host'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from create' -l group-add -d 'Add additional groups to run as'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -s h -l hostname -d 'Container host name'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -s i -l interactive -d 'Keep STDIN open even if not attached'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -l ipc -d 'Default is to create a private IPC namespace (POSIX SysV IPC) for the container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -l link -d 'Add link to another container in the form of <name|id>:alias'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -s m -l memory -d 'Memory limit (format: <number>[<unit>], where unit = b, k, m or g)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -l mac-address -d 'Container MAC address (e.g., 92:d0:c6:0a:29:33)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -l memory-swap -d "Total memory usage (memory + swap), set '-1' to disable swap (format: <number>[<unit>], where unit = b, k, m or g)"
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -l mount -d 'Attach a filesystem mount to the container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -l name -d 'Assign a name to the container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -l net -d 'Set the Network mode for the container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -s P -l publish-all -d 'Publish all exposed ports to random ports on the host interfaces'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -s p -l publish -d "Publish a container's port to the host"
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -l pid -d 'Default is to create a private PID namespace for the container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -l privileged -d 'Give extended privileges to this container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -l read-only -d "Mount the container's root filesystem as read only"
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -l restart -d 'Restart policy to apply when a container exits (no, on-failure[:max-retry], always)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -l rm -d 'Automatically remove the container when it exits (incompatible with -d)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -l security-opt -d 'Security Options'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -l sig-proxy -d 'Proxy received signals to the process (non-TTY mode only). SIGCHLD, SIGSTOP, and SIGKILL are not proxied.'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -l stop-signal -d 'Signal to kill a container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -s t -l tty -d 'Allocate a pseudo-TTY'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -s u -l user -d 'Username or UID'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -l tmpfs -d 'Mount tmpfs on a directory'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -s v -l volume -d 'Bind mount a volume (e.g., from the host: -v /host:/container, from Docker: -v /container)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -l volumes-from -d 'Mount volumes from the specified container(s)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -s w -l workdir -d 'Working directory inside the container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from run' -a '(__fish_print_nerdctl_images)' -d "Image"

# save
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a save -d 'Save an image to a tar archive'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from save' -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from save' -s o -l output -d 'Write to an file, instead of STDOUT'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from save' -a '(__fish_print_nerdctl_images)' -d "Image"

# search
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a search -d 'Search for an image on the registry (defaults to the Docker Hub)'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from search' -l automated -d 'Only show automated builds'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from search' -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from search' -l no-trunc -d "Don't truncate output"
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from search' -s s -l stars -d 'Only displays with at least x stars'

# start
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a start -d 'Start a container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from start' -s a -l attach -d "Attach container's STDOUT and STDERR and forward all signals to the process"
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from start' -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from start' -s i -l interactive -d "Attach container's STDIN"
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from start' -a '(__fish_print_nerdctl_containers stopped)' -d "Container"

# stats
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a stats -d "Display a live stream of one or more containers' resource usage statistics"
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from stats' -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from stats' -l no-stream -d 'Disable streaming stats and only pull the first result'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from stats' -a '(__fish_print_nerdctl_containers running)' -d "Container"

# stop
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a stop -d 'Stop a container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from stop' -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from stop' -s t -l time -d 'Number of seconds to wait for the container to stop before killing it. Default is 10 seconds.'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from stop' -a '(__fish_print_nerdctl_containers running)' -d "Container"

# tag
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a tag -d 'Tag an image into a repository'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from tag' -s f -l force -d 'Force'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from tag' -l help -d 'Print usage'

# top
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a top -d 'Lookup the running processes of a container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from top' -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from top' -a '(__fish_print_nerdctl_containers running)' -d "Container"

#trust
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a trust -d 'Manage trust on Docker images'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from trust' -l help -d 'Print usage'

#trust inspenerdctl
complete -c nerdctl -A -f -n '__fish_nerdctl_no_subcommand_trust' -a inspect -d 'Return low-level information about keys and signatures'
complete -c nerdctl -A -f -n '__fish_nerdctl_subcommand_path trust inspect' -l pretty -d 'Print the information in a human friendly format'

#trust key
complete -c nerdctl -A -f -n '__fish_nerdctl_no_subcommand_trust' -a key -d 'Manage keys for signing Docker images'
complete -c nerdctl -A -f -n '__fish_nerdctl_subcommand_path trust key; and __fish_nerdctl_subcommand_path_without generate load' -a generate -d 'Generate and load a signing key-pair'
complete -c nerdctl -A -f -n '__fish_nerdctl_subcommand_path trust key load' -l dir -d 'Directory to generate key in, defaults to current directory'
complete -c nerdctl -A -f -n '__fish_nerdctl_subcommand_path trust key; and __fish_nerdctl_subcommand_path_without generate load' -a load -d 'Load a private key file for signing'
complete -c nerdctl -A -f -n '__fish_nerdctl_subcommand_path trust key load' -l name -d 'Name for the loaded key (default "signer")'

#trust revoknerdctl
complete -c nerdctl -A -f -n '__fish_nerdctl_no_subcommand_trust' -a revoke -d 'Remove trust for an image'
complete -c nerdctl -A -f -n '__fish_nerdctl_subcommand_path trust revoke' -s y -l yes -d 'Do not prompt for confirmation'

#trust sign
complete -c nerdctl -A -f -n '__fish_nerdctl_no_subcommand_trust' -a sign -d 'Sign an image'
complete -c nerdctl -A -f -n '__fish_nerdctl_subcommand_path trust sign' -l local -d 'Sign a locally tagged image'

#trust signenerdctl
complete -c nerdctl -A -f -n '__fish_nerdctl_no_subcommand_trust' -a signer -d 'Manage entities who can sign Docker images'
complete -c nerdctl -A -f -n '__fish_nerdctl_subcommand_path trust signer; and __fish_nerdctl_subcommand_path_without add remove' -a add -d 'Add a signer'
complete -c nerdctl -A -f -n '__fish_nerdctl_subcommand_path trust signer; and __fish_nerdctl_subcommand_path_without add remove' -a remove -d 'remove a signer'

# unpause
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a unpause -d 'Unpause a paused container'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from unpause' -a '(__fish_print_nerdctl_containers running)' -d "Container"

# version
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a version -d 'Show the Docker version information'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from version' -s f -l format  -d 'Format the output using the given go template'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from version' -l help -d 'Print usage'

# wait
complete -c nerdctl -f -n '__fish_nerdctl_no_subcommand' -a wait -d 'Block until a container stops, then print its exit code'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from wait' -l help -d 'Print usage'
complete -c nerdctl -A -f -n '__fish_seen_subcommand_from wait' -a '(__fish_print_nerdctl_containers running)' -d "Container"
