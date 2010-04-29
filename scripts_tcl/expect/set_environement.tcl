proc set_environment {} {
   set improved_path {PATH=$PATH:/sbin:/usr/sbin:/usr/cluster/bin:/usr/bin:/usr/xpg4/bin/:/usr/sfw/bin/:/usr/local/bin/:/tmp/mindcti/gnutools/bin/:/usr/ucb:/etc/:/usr/platform/sun4u/sbin/:/usr/platform/$(uname -i)/sbin/}
    return [expr [ssh_launch_cmd "cd $::bkp_rem_dir"] && [ssh_launch_cmd "export $improved_path"] && [ssh_launch_cmd "export LC_ALL=C ;export LANGUAGE=C;export LANG=C"]]
}