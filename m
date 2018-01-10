From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: Re: sidecar (hvm shim) creation script
Date: Wed, 10 Jan 2018 15:41:56 +0000
Message-ID: <23126.13380.315656.733601@mariner.uk.xensource.com>
References: <23123.44604.284781.889416@mariner.uk.xensource.com>
 <20180109194351.mmbmjzwhptlkr5as@citrix.com>
 <20180110083224.cmgr7flxewhx5enf@MacBook-Pro-de-Roger.local>
 <20180110122734.rgut34iw6ltqeipy@citrix.com>
 <23126.4117.777031.227394@mariner.uk.xensource.com>
 <20180110131049.rv6emm32efbczhl2@citrix.com>
 <23126.11606.582758.38945@mariner.uk.xensource.com>
 <23126.13224.18254.699605@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="GhPD4uVW1c"
Content-Transfer-Encoding: 7bit
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=97or=ef=citrix.com=prvs=5411a6c19=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1eZIVw-0002LT-LD
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2018 15:42:04 +0000
In-Reply-To: <23126.13224.18254.699605@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, xen-devel@lists.xenproject.org, committers@xenproject.org, security@xenproject.org, Jan Beulich <JBeulich@suse.com>, Dario Faggioli <raistlin@linux.it>
List-Id: xen-devel@lists.xenproject.org

--GhPD4uVW1c
Content-Type: text/plain; charset="us-ascii"
Content-Description: message body text
Content-Transfer-Encoding: 7bit

Ian Jackson writes ("Re: sidecar (hvm shim) creation script"):
> And here is one which handles the guest console correctly.  Vixen
> sends the L2 guest console to the emulated serial, along with the
> shim's own output.

Some debugging stuff removed again.


--GhPD4uVW1c
Content-Type: text/plain; name="pvshim-converter"
Content-Description: this time for real
Content-Disposition: inline; filename="pvshim-converter"
Content-Transfer-Encoding: 7bit

#!/usr/bin/perl -w
#
# usage:
#   pvshim-converter [OPTIONS] OLD-CONFIG NEW-CONFIG
#
# options:
#   --sidecars-directory DIR   default is /var/lib/xen/pvshim-sidecars
#   --shim SHIM                overrides domain config file
#   --debug                    verbose, and leaves sidecar prep dir around
#
# What we do
#
#  read existing config file using python
#  determine kernel, ramdisk and cmdline
#  use them to produce sidecar and save it under domain name
#  mess with the things that need to be messed with
#  spit out new config file

use strict;

use Getopt::Long;
use JSON;
use IO::Handle;
use POSIX;
use Fcntl qw(:flock);

our $debug;

sub runcmd {
    print STDERR "+ @_\n" if $debug;
    $!=0; $?=0; system @_ and die "$_[0]: $! $?";
}

our $shim;
our $sidecars_dir = '/var/lib/xen/pvshim-sidecars';

GetOptions('sidecars-directory=s' => \$sidecars_dir,
           'shim=s' => \$shim,
           'debug' => \$debug)
    or die "pvshim-converter: bad options\n";

@ARGV==2 or die "pvshim-converter: need old and new config filenames";

our ($in,$out) = @ARGV;

our $indata;

if ($in ne '-') {
    open I, '<', "$in" or die "open input config file: $!\n";
} else {
    open I, '<&STDIN' or die $!;
}
{
    local $/;
    $indata = <I>;
}
I->error and die $!;
close I;

open P, "-|", qw(python -c), <<END, $indata or die $!;
import sys
import json
l = {}
exec sys.argv[1] in l
for k in l.keys():
	if k.startswith("_"):
		del l[k]
print json.dumps(l)
END

our $c;

{
    local $/;
    $_ = <P>;
    $!=0; $?=0; close P or die "$! $?";
    $c = decode_json $_;
}

die "no domain name ?" unless exists $c->{name};
die "bootloader not yet supported" if $c->{bootloader};
die "no kernel" unless $c->{kernel};

our $sidecar = $c->{pvshim_sidecar_path} || "$sidecars_dir/$c->{name}.iso";
our $dmwrap = $c->{pvshim_sidecar_path} || "$sidecars_dir/$c->{name}.dm";

$shim ||= $c->{pvshim_path};
$shim ||= '/usr/local/lib/xen/boot/xen-shim';

our $shim_cmdline = $c->{pvshim_cmdline} || 'console=com1 com1=115200n1';
$shim_cmdline .= ' '.$c->{pvshim_extra} if $c->{pvshim_extra};

our $kernel_cmdline = $c->{cmdline} || '';
$kernel_cmdline .= ' root='.$c->{root} if $c->{root};
$kernel_cmdline .= ' '.$c->{extra} if $c->{extra};

print "pvshim-converter: creating sidecar in $sidecar\n";

runcmd qw(mkdir -m700 -p --), $sidecars_dir;

open L, ">", "$sidecar.lock" or die "$sidecar.lock: open $!";
flock L, LOCK_EX or die "$sidecar.lock: lock: $!";

my $sd = "$sidecar.dir";

system qw(rm -rf --), $sd;
mkdir $sd, 0700;

runcmd qw(cp --), $shim, "$sd/shim";
runcmd qw(cp --), $c->{kernel}, "$sd/kernel";
runcmd qw(cp --), $c->{ramdisk}, "$sd/ramdisk" if $c->{ramdisk};

my $grubcfg = <<END;
serial --unit=0 --speed=9600 --word=8 --parity=no --stop=1
terminal_input serial
terminal_output serial

set timeout=0

menuentry 'Xen shim' {
	insmod gzio
	insmod xzio
        multiboot (cd)/shim placeholder $shim_cmdline
        module (cd)/kernel placeholder $kernel_cmdline
        module (cd)/ramdisk
}
END

runcmd qw(mkdir -p --), "$sd/boot/grub";
open G, ">", "$sd/boot/grub/grub.cfg" or die "$sd, grub.cfg: $!";
print G $grubcfg or die $!;
close G or die $!;

unlink "$sidecar.new" or $!==ENOENT or die "$sidecar.new: rm: $!";
runcmd qw(grub-mkrescue -o), "$sidecar.new", "$sidecar.dir";
if (!stat "$sidecar.new") {
    $!==ENOENT or die "$sidecar.new: stat: $!";

    print STDERR <<END;
pvshim-converter: grub-mkrescue exited with status zero but failed to make iso.
NB that grub-mkrescue has a tendency to lie in its error messages.
END
    my $missing;
    foreach my $check (qw(xorriso mformat)) {
        $missing |= system qw(sh -c), "type $check";
    }

    if ($missing) {
        print STDERR <<END;
You seem to have some program(s) missing which grub-mkrescue depends on,
see above.  ("mformat" is normally in the package "mtools".)
Installing those programs will probably help.
END
    } else {
        print STDERR <<END;
And older grub-mkrescue has a tendency not to notice certain problems.
Maybe strace will tell you what is wrong.  :-/
END
    }
    die "pvshim-converter: grub-mkrescue did not make iso\n";
}

runcmd qw(rm -rf --), "$sidecar.dir" unless $debug;

open Q, ">", "$dmwrap.new" or die "$dmwrap: $!";
print Q <<'END_DMWRAP';
#!/bin/bash

set -x
: "$@"
set +x

newargs=()

newarg () {
    newargs+=("$1")
}

while [ $# -gt 1 ]; do
    case "$1" in
	-no-shutdown|-nodefaults|-no-user-config)
	    newarg "$1"; shift
	    ;;
	-xen-domid|-chardev|-mon|-display|-boot|-m|-machine)
	    newarg "$1"; shift
	    newarg "$1"; shift
	    ;;
        -name)
            newarg "$1"; shift
            name="$1"; shift
            newarg "$name"
            ;;
	-netdev|-cdrom)
	    : fixme
	    newarg "$1"; shift
	    newarg "$1"; shift
	    ;;
	-drive|-kernel|-initrd|-append|-vnc)
	    shift; shift
	    ;;
	-device)
	    shift
	    case "$1" in
		XXXrtl8139*)
		    newarg "-device"
		    newarg "$1"; shift
		    ;;
		*)
		    shift
		    ;;
	    esac
	    ;;
	*)
	    echo >&2 "warning: unexpected argument $1 being passed through"
	    newarg "$1"; shift
	    ;;
    esac
done

#if [ "x$name" != x ]; then
#    logdir=/var/log/xen
#    logfile="$logdir/shim-$name.log"
#    savelog "$logfile" ||:
#    newarg -serial
#    newarg "file:$logfile"
#fi

set -x
exec /usr/local/lib/xen/bin/qemu-system-i386 "${newargs[@]}"
END_DMWRAP

chmod 0755, "$dmwrap.new" or die "$dmwrap: chmod: $!";

close Q or die $!;

rename "$sidecar.new", $sidecar or die "$sidecar: install: $!";
rename "$dmwrap.new",  $dmwrap  or die "$dmwrap: install: $!";

print STDERR <<END;
pvshim-converter: wrote qemu wrapper to $dmwrap
pvshim-converter: wrote sidecar to $sidecar
END

my $append = <<END;
builder='hvm'
type='hvm'
device_model_version='qemu-xen'
device_model_override='$dmwrap'
device_model_args_hvm=['-cdrom','$sidecar']
boot='c'
serial='pty'
END

if ($out ne '-') {
    open O, ">", "$out.tmp" or die "open output config temp: $out.tmp: $!\n";
} else {
    open O, ">&STDOUT" or die $!;
}

print O $indata, "\n", $append or die "write output: $!";
close O or die "close output: $!";

if ($out ne '-') {
    rename "$out.tmp", $out or die "install output: $!";
    print STDERR "pvshim-converter: wrote new guest config to $out\n";
} else {
    print STDERR "pvshim-converter: wrote new guest config to stdout\n";
}

--GhPD4uVW1c
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--GhPD4uVW1c--
