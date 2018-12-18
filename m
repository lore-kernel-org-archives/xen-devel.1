From: Vikram K <vikram.k@pathpartnertech.com>
Subject: [XEN][ARM64] PV DRM failing to convert virtual to
 physical address
Date: Tue, 18 Dec 2018 10:56:12 +0530
Message-ID: <CAFsJcmYMd_S4wONZ8DZfRVb5joh-KrGqnWAcXpH8Tn6n62OySQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2724559828386227710=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FqKG=O3=pathpartnertech.com=vikram.k@srs-us1.protection.inumbo.net>)
 id 1gZ7tm-0000ms-Cc
 for xen-devel@lists.xenproject.org; Tue, 18 Dec 2018 05:26:30 +0000
Received: by mail-lj1-x232.google.com with SMTP id u89-v6so2377495lje.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Dec 2018 21:26:25 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============2724559828386227710==
Content-Type: multipart/alternative; boundary="0000000000006721d9057d452392"

--0000000000006721d9057d452392
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

When PV DRM is enabled and Domain-U is started xen is not able to converted
virtual address to physical. Please provide input on resolving this issue.

Please find the details below.

   - We are using 64 bit arm platform.
   - Linux 4.20 Kernel in DomU with PV DRM front-end drivers.
   - Xen-4.12 unstable version.
   - Able to build displ_be application and also its dependencies.

Added below configuration in Domain-U config file.
*vdispl =3D [ 'backend=3DDomD,be-alloc=3D0,connectors=3DHDMI-A-1:1920x1080'=
]*

Before launching the application ran the displ_be application in the
background.
 $ displ_be -m DRM -v *:Debug

Started Domain-U.
$ xl create -c debian.cfg

Getting below logs.
Welcome to Debian GNU/Linux 9 (stretch)!

(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c050
flags=3D0x1 par=3D0x809
[    2.601162] systemd[1]: Set hostname to <hikey960>.
[    2.613526] random: systemd: uninitialized urandom read (16 bytes
re(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
ad)
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
[    3.006492] systemd[1]: Reached target Remote File Systems.
[  OK  ] Reached target Remote File Systems.
[    3.007179] systemd[1]: Started Dispatch Password Requests to Console
Directory Watch.
[  OK  ] Started Dispatch Password Requests to Console Directory Watch.
[    3.007477] systemd[1]: Listening on Journal Socket.
[  OK  ] Listening on Journal Socket.
[    3.007742] systemd[1]: Listening on LVM2 metadata daemon socket.
[  OK  ] Listening on LVM2 metadata daemon socket.
[    3.007966] systemd[1]: Listening on Device-mapper event daemon FIFOs.
[  OK  ] Listening on Device-mapper event daemon FIFOs.
[    3.008161] systemd[1]: Listening on Syslog Socket.
[  OK  ] Listening on Syslog Socket.
[  OK  ] Listening on Journal Audit Socket.
[  OK  ] Listening on /dev/initctl Compatibility Named Pipe.
[  OK  ] Created slice System Slice.
         Starting Remount Root and Kernel File Systems...
         Starting Monitoring of LVM2 mirrors=E2=80=A6ng dmeventd or progres=
s
polling...
[(XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed va=3D0xffff80003df8305f
flags=3D0x1 par=3D0x809
  (XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed va=3D0xffff80003df83050
flags=3D0x1 par=3D0x809
OK  ] Created slice system-serial\x2dgetty.slice.
         Mounting Huge Pages File System...
         Starting Uncomplic(XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed
va=3D0xffff80003df8305f flags=3D0x1 par=3D0x809
ated firewall...
[  OK  ] Listening on LVM2 poll daemon socket.
         Starting Create Static Device Nodes in /d(XEN) p2m.c:1456: d2v3:
gvirt_to_maddr failed va=3D0xffff80003df8305f flags=3D0x1 par=3D0x809
ev(XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed va=3D0xffff80003df83050
flags=3D0x1 par=3D0x809
...
[  OK  ] Created slice User and Session Slice.
[  OK  ] Reached target Slices.
[  OK  ](XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed va=3D0xffff80003df830=
5f
flags=3D0x1 par=3D0x809
 Reached target Swap.
[  OK  ] Started Forward Password Requests to Wall Directory Watch.
[  OK  ] Reac(XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed
va=3D0xffff80003df8305f flags=3D0x1 par=3D0x809
he(XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed va=3D0xffff80003df83050
flags=3D0x1 par=3D0x809
d target Paths.
         Mounting Debug File System...
[  OK  ] Listening on udev Control Socket.
         Starti(XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed
va=3D0xffff80003df8305f flags=3D0x1 par=3D0x809
ng Load Kernel Modules...
[  OK  ] Listening on Journal Socket (/dev/log).
         Starting Journal Service...
[(XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed va=3D0xffff80003df8305f
flags=3D0x1 par=3D0x809
[  266.802137] mXEN) p2m.c:1456: d2v3: gvirt_to_maddr failed
va=3D0xffff80003df83050 flags=3D0x1 par=3D0x809
mcblk0: timed ou0;32m  OK  ] Created slice system-getty.slice.
         Mounting POSIX Message Queue File System...
[  OK  ] R(XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed
va=3D0xffff80003df8305f flags=3D0x1 par=3D0x809
t sending r/w cmeached target User and Group Name Lookups.
[  OK  ] Reached target Encrypted Volumes.
[  OK  ] Listenind command, card g status 0x900
on udev Kernel Socket.
[  OK  ] Mounted Debug File System.
[  OK  ] Mounted Huge Pages File System.
[  OK  ] Mounted POSIX Message Queue File System.
[  OK  ] Started Remount Root and Kernel File Systems.
[  OK  ] Started Uncomplicated firewall.
         Starting Load/Save Random Seed...
         Starting udev Coldplug all Devices...
[  OK  ] Started Load Kernel Modules.
         Starting Apply Kernel Variables...
         Mounting Configuration File System...
[  OK  ] Mounted Configuration File System.
[  OK  ] Started Journal Service.
         Starting Flush Journal to Persistent Storage...
[  OK  ] Started Apply Kernel Variables.
[  OK  ] Started LVM2 metadata daemon.
[  OK  ] Started Load/Save Random Seed.
[  OK  ] Started udev Cold[  266.934658] mplug all Devices.
mc_host mmc0: Bus speed (slot 0) =3D 400000Hz (slot req 400000Hz, actual
400000HZ div =3D 0)
[  267.276187] dwmmc_k3 ff37f000.dwmmc1: Unexpected command timeout, state =
7
[  267.288881] mmc_host mmc0: Bus speed (slot 0) =3D 200000000Hz (slot req
200000000Hz, actual 200000000HZ div =3D 0)
[  267.679850] dwmmc_k3 ff37f000.dwmmc1: tuning ok best_clksmpl 18
tuning_sample_flag cdfff9ff
[    4.249292] systemd-journald[1503]: Received request to flush runtime
journal from PID 1
[  OK  ] Started Create Static Device Nodes in /dev.
         Starting udev Kernel Device Manager...
[  OK  ] Started Flush Journal to Persistent Storage.
[  OK  ] Started udev Kernel Device Manager.
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f
flags=3D0x1 par=3D0x809
[  OK  ] Started Monitoring of LVM2 mirrors,=E2=80=A6sing dmeventd or progr=
ess
polling.
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f
flags=3D0x1 par=3D0x809
[  OK  ] Reached target Local File Systems (Pre).
[  OK  ] Reached target Local File Systems.
         (XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed
va=3D0xffff80003df9a050 flags=3D0x1 par=3D0x809
Starting Create Volatile Files and Directories...
         Starting ebtables ruleset management...
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f
flags=3D0x1 par=3D0x809
[  OK  ] Found device /dev/hvc0.
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f
flags=3D0x1 par=3D0x809
[  268.122975] m(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed
va=3D0xffff80003df9a050 flags=3D0x1 par=3D0x809
mcblk0: timed ou(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed
va=3D0xffff80003df9a05f flags=3D0x1 par=3D0x809
t sending r/w cmd command, card status 0x900
[  268.222656] mmc_host mmc0: Bus speed (slot 0) =3D 400000Hz (slot req
400000Hz, actual 400000HZ div =3D 0)
[  268.452176] dwmmc_k3 ff37f000.dwmmc1: Unexpected command timeout, state =
7
[  268.464809] mmc_host mmc0: Bus speed (slot 0) =3D 200000000Hz (slot req
200000000Hz, actual 200000000HZ div =3D 0)
[  268.855781] dwmmc_k3 ff37f000.dwmmc1: tuning ok best_clksmpl 18
tuning_sample_flag c9fff9ff
[  OK  ] Started Create Volatile Files and Directories.
         Starting Update UTMP about System Boot/Shutdown...
         Starting Network Time Synchronization...
[  OK  ] Started Update UTMP about System Boot/Shutdown.
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
[  OK  ] Started ebtables ruleset management.
[  OK  ] Reached target Network (Pre).
         Starting Raise network interfaces...
[FAILED] Failed to start Raise network interfaces.
See 'systemctl status networking.service' for details.
[  OK  ] Started Network Time Synchronization.
[  OK  ] Reached target System Initialization.
[  OK  ] Listening on Avahi mDNS/DNS-SD Stack Activation Socket.
[  OK  ] Listening on D-Bus System Message Bus Socket.
[  OK  ] Reached target Sockets.
[XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v5: gvirt_to_maddr failed va=3D0xffff80003dfb105f
flags=3D0x1 par=3D0x809
2m(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v5: gvirt_to_maddr failed va=3D0xffff80003dfb1050
flags=3D0x1 par=3D0x809
  OK  ] Started Daily Cleanup of Temporary Directories.
[  OK  ] Reached target Basic System.
         Startin(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed
va=3D0xffff80003df6c05f flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v5: gvirt_to_maddr failed va=3D0xffff80003dfb105f
flags=3D0x1 par=3D0x809
g xendeamon.service...
         Starting Login Service...
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v5: gvirt_to_maddr failed va=3D0xffff80003dfb105f
flags=3D0x1 par=3D0x809
[  OK  ] Started Regular background program processing daemon.
         Starting Accounts Service...
         Star(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed
va=3D0xffff80003df6c050 flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v5: gvirt_to_maddr failed va=3D0xffff80003dfb1050
flags=3D0x1 par=3D0x809
ting LSB: Speech Dispatcher...
         Starting LSB: Start/stop xen-watchdog...
         Starting LSB: Start/stop xenstored (XEN) p2m.c:1456: d2v2:
gvirt_to_maddr failed va=3D0xffff80003df6c05f flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v5: gvirt_to_maddr failed va=3D0xffff80003dfb105f
flags=3D0x1 par=3D0x809
an(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
d xenconsoled...
         Starting System Logging Service...
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c050
flags=3D0x1 par=3D0x809
         Starting Avahi mDNS/DNS-SD Stack...
[  OK  ] Started D-Bus System Message Bus.
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
[  OK  ] Started Avahi mDNS/DNS-SD Stack.
         Starting Network Manager...
[  OK  ] Reached target System Time Synchronized.
[  OK  ] Started Daily apt download activities.
[  OK  ] Started Daily apt upgrade and clean activities.(XEN) p2m.c:1456:
d2v1: gvirt_to_maddr failed va=3D0xffff80003df5505f flags=3D0x1 par=3D0x809

[  OK  ] Started Trigger anacron every hour.
[  OK  ] Reached target Timers.
[  OK  ] Star(XEN) p2m.c:1456: d2v1: gvirt_to_maddr failed
va=3D0xffff80003df55050 flags=3D0x1 par=3D0x809
te(XEN) p2m.c:1456: d2v1: gvirt_to_maddr failed va=3D0xffff80003df5505f
flags=3D0x1 par=3D0x809
d Run anacron jobs.
(XEN) p2m.c:1456: d2v1: gvirt_to_maddr failed va=3D0xffff80003df5505f
flags=3D0x1 par=3D0x809
[  269.705640] m[  OK  ] Started System Logging Service.
(XEN) p2m.c:1456: d2v1: gvirt_to_maddr failed va=3D0xffff80003df55050
flags=3D0x1 par=3D0x809
mcblk0: timed ou(XEN) p2m.c:1456: d2v1: gvirt_to_maddr failed
va=3D0xffff80003df5505f flags=3D0x1 par=3D0x809
t sending r/w cm[FAILED] Failed to start xendeamon.service.
See 'systemctl status xendeamon.service' for details.
d command, card [  OK  ] Started LSB: Start/stop xenstored and xenconsoled.
status 0x900
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f
flags=3D0x1 par=3D0x809
[  OK  ] Started Login Service.
(XEN) p2m.c:1456: d2v5: gvirt_to_maddr failed va=3D0xffff80003dfb105f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc8050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v5: gvirt_to_maddr failed va=3D0xffff80003dfb1050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v5: gvirt_to_maddr failed va=3D0xffff80003dfb105f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f
flags=3D0x1 par=3D0x809
         Starting LSB: Wrapper to start/stop secondary xen domains...
(XEN) p2m.c:1456: d2v5: gvirt_to_maddr failed va=3D0xffff80003dfb105f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc8050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v5: gvirt_to_maddr failed va=3D0xffff80003dfb1050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v5: gvirt_to_maddr failed va=3D0xffff80003dfb105f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f
flags=3D0x1 par=3D0x809
[  269.863692] m(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed
va=3D0xffff80003dfc8050 flags=3D0x1 par=3D0x809
mc_host mmc0: Bu(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed
va=3D0xffff80003dfc805f flags=3D0x1 par=3D0x809
s speed (slot 0)(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed
va=3D0xffff80003dfc805f flags=3D0x1 par=3D0x809
 =3D 400000Hz (slo(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed
va=3D0xffff80003dfc8050 flags=3D0x1 par=3D0x809
t req 400000Hz, (XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed
va=3D0xffff80003dfc805f flags=3D0x1 par=3D0x809
actual 400000HZ div =3D 0)
[  270.140189] dwmmc_k3 ff37f000.dwmmc1: Unexpected command timeout, state =
7
[  270.152889] mmc_host mmc0: Bus speed (slot 0) =3D 200000000Hz (slot req
200000000Hz, actual 200000000HZ div =3D 0)
[  270.543959] dwmmc_k3 ff37f000.dwmmc1: tuning ok best_clksmpl 18
tuning_sample_flag c9fff9ff
[  OK  ] Started LSB: Speech Dispatcher.
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc8050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc8050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc8050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f
flags=3D0x1 par=3D0x809
[  OK  ] Started LSB: Start/stop xen-watchdog.
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc8050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc8050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc8050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f
flags=3D0x1 par=3D0x809
[  OK  ] Started LSB: Wrapper to start/stop secondary xen domains.
         Starting Authorization Manager...
(XEN) p2m.c:1456: d2v0: gvirt_to_maddr failed va=3D0xffff80003df3e05f
flags=3D0x1 par=3D0x809
[  OK  ] Started Authorization Manager.
(XEN) p2m.c:1456: d2v0: gvirt_to_maddr failed va=3D0xffff80003df3e050
flags=3D0x1 par=3D0x809
[  OK  ] Started Accounts Service.
(XEN) p2m.c:1456: d2v0: gvirt_to_maddr failed va=3D0xffff80003df3e05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v0: gvirt_to_maddr failed va=3D0xffff80003df3e05f
flags=3D0x1 par=3D0x809
[  271.237540] m(XEN) p2m.c:1456: d2v0: gvirt_to_maddr failed
va=3D0xffff80003df3e050 flags=3D0x1 par=3D0x809
mcblk0: timed ou(XEN) p2m.c:1456: d2v0: gvirt_to_maddr failed
va=3D0xffff80003df3e05f flags=3D0x1 par=3D0x809
t sending r/w cmd command, card status 0x900
[  271.334639] mmc_host mmc0: Bus speed (slot 0) =3D 400000Hz (slot req
400000Hz, actual 400000HZ div =3D 0)
[  271.564175] dwmmc_k3 ff37f000.dwmmc1: Unexpected command timeout, state =
7
[  271.576795] mmc_host mmc0: Bus speed (slot 0) =3D 200000000Hz (slot req
200000000Hz, actual 200000000HZ div =3D 0)
[  271.967997] dwmmc_k3 ff37f000.dwmmc1: tuning ok best_clksmpl 18
tuning_sample_flag c9fff9ff
[  OK  ] Started Network Manager.
         Starting Network Manager Wait Online...
[  OK  ] Reached target Network.
[  OK  ] Started Unattended Upgrades Shutdown.
         Starting Permit User Sessions...
         Starting OpenBSD Secure Shell server...
[  OK  ] Started Permit User Sessions.
[  OK  ] Started Getty on tty1.
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f
flags=3D0x1 par=3D0x809
[  OK  ] Started Serial Getty on hvc0.
[  OK  ] Reached target Login Prompts.
         Starting Light D(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed
va=3D0xffff80003dfc8050 flags=3D0x1 par=3D0x809
isplay Manager...
         Starting Network Manager Script Dispatcher Service...
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v5: gvirt_to_maddr failed va=3D0xffff80003dfb105f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc8050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v5: gvirt_to_maddr failed va=3D0xffff80003dfb1050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v5: gvirt_to_maddr failed va=3D0xffff80003dfb105f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v5: gvirt_to_maddr failed va=3D0xffff80003dfb105f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf05f
flags=3D0x1 par=3D0x809
[  OK  ] Started Network Manager Script Dispatcher Service.
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc8050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v5: gvirt_to_maddr failed va=3D0xffff80003dfb1050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v5: gvirt_to_maddr failed va=3D0xffff80003dfb105f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f
flags=3D0x1 par=3D0x809
[  OK  ] Started OpenBSD Secure Shell server.
(XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed va=3D0xffff80003df8305f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc8050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed va=3D0xffff80003df83050
flags=3D0x1 par=3D0x809
[  OK  ] Started Light Display Manager.
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed va=3D0xffff80003df8305f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed va=3D0xffff80003df8305f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed va=3D0xffff80003df83050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed va=3D0xffff80003df8305f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed va=3D0xffff80003df8305f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed va=3D0xffff80003df83050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed va=3D0xffff80003df8305f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed va=3D0xffff80003df8305f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed va=3D0xffff80003df83050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed va=3D0xffff80003df8305f
flags=3D0x1 par=3D0x809
[  OK  ] Stopped Light Display Manager.
         Starting Light Display Manager...
         Starting Hostname Service...
[  OK  ] Started Light Display Manager.
[  OK  ] Started Hostname Service.
[  OK  ] Started Network Manager Wait Online.
(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc8050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf05f
flags=3D0x1 par=3D0x809
[  OK  ] Reached target Network is Online.
         Starting LSB: Advanced IEEE 802.11 management daemon...
      (XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf050
flags=3D0x1 par=3D0x809
   Starting LSB: Starts or stops the xinetd daemon....
[  OK  ] Stopped Light Display Manager.
         Starting L(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed
va=3D0xffff80003dfc8050 flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf05f
flags=3D0x1 par=3D0x809
ig(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf05f
flags=3D0x1 par=3D0x809
ht Display Manager...
[  OK  ] Started Light Display Manager.
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf050
flags=3D0x1 par=3D0x809
[  OK  ] Started LSB: Advanced IEEE 802.11 management daemon.
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c050
flags=3D0x1 par=3D0x809
[  OK  ] Started LSB: Starts or stops the xinetd daemon..
(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
[  OK  ] Reached target Multi-User System.
[  OK  ] Reached target Graphical Interface.
(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f
flags=3D0x1 par=3D0x809
         Starting Update UTMP about System Runlevel Changes...
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f
flags=3D0x1 par=3D0x809
[  OK  ] Started Update UTMP about System Runlevel Changes.
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a050
flags=3D0x1 par=3D0x809
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f
flags=3D0x1 par=3D0x809


--=20
Thanks & Regards
Vikram KS

--=20






This
message contains confidential information and is intended only=20
for the
individual(s) named. If you are not the intended
recipient, you are=20
notified that disclosing, copying, distributing or taking any
action in=20
reliance on the contents of this mail and attached file/s is strictly

prohibited. Please notify the
sender immediately and delete this e-mail=20
from your system. E-mail transmission
cannot be guaranteed to be secured or=20
error-free as information could be
intercepted, corrupted, lost, destroyed,=20
arrive late or incomplete, or contain
viruses. The sender therefore does=20
not accept liability for any errors or
omissions in the contents of this=20
message, which arise as a result of e-mail
transmission.

--0000000000006721d9057d452392
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hello,</div><div><b=
r></div><div>When PV DRM is enabled and Domain-U is started xen is not able=
 to converted virtual address to physical. Please provide input on resolvin=
g this issue.</div><div><br></div><div>Please find the details below.<br></=
div><ul><li>We are using 64 bit arm platform. <br></li><li>Linux 4.20 Kerne=
l in DomU with PV DRM front-end drivers. </li><li>Xen-4.12 unstable version=
. </li><li>Able to build displ_be application and also its dependencies.</l=
i></ul><div>Added below configuration in Domain-U config file.<font size=3D=
"2"><span style=3D"font-family:arial,helvetica,sans-serif"><b><code><br></c=
ode></b></span></font></div><div><span style=3D"font-family:arial black,san=
s-serif"><font size=3D"2"><b><code>vdispl =3D [ &#39;backend=3DDomD,be-allo=
c=3D0,connectors=3DHDMI-A-1:1920x1080&#39;]</code></b></font></span></div><=
div></div><div><br></div><div>Before launching the application ran the disp=
l_be application in the background.</div><div>=C2=A0$ displ_be -m DRM -v *:=
Debug</div><div><br></div><div>Started Domain-U.</div><div>$ xl create -c d=
ebian.cfg</div><div><br></div><div>Getting below logs.</div><div>Welcome to=
 Debian GNU/Linux 9 (stretch)!<br><br>(XEN) p2m.c:1456: d2v2: gvirt_to_madd=
r failed va=3D0xffff80003df6c050 flags=3D0x1 par=3D0x809<br>[=C2=A0=C2=A0=
=C2=A0 2.601162] systemd[1]: Set hostname to &lt;hikey960&gt;.<br>[=C2=A0=
=C2=A0=C2=A0 2.613526] random: systemd: uninitialized urandom read (16 byte=
s re(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f f=
lags=3D0x1 par=3D0x809<br>ad)<br>(XEN) p2m.c:1456: d2v2: gvirt_to_maddr fai=
led va=3D0xffff80003df6c05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2=
v2: gvirt_to_maddr failed va=3D0xffff80003df6c050 flags=3D0x1 par=3D0x809<b=
r>(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f fla=
gs=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D=
0xffff80003df6c05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v2: gvirt=
_to_maddr failed va=3D0xffff80003df6c050 flags=3D0x1 par=3D0x809<br>(XEN) p=
2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f flags=3D0x1 =
par=3D0x809<br>(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff800=
03df6c05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v2: gvirt_to_maddr=
 failed va=3D0xffff80003df6c050 flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456=
: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f flags=3D0x1 par=3D0x8=
09<br>(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f=
 flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed v=
a=3D0xffff80003df6c050 flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v2: g=
virt_to_maddr failed va=3D0xffff80003df6c05f flags=3D0x1 par=3D0x809<br>(XE=
N) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f flags=3D=
0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xfff=
f80003df6c050 flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v2: gvirt_to_m=
addr failed va=3D0xffff80003df6c05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:=
1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f flags=3D0x1 par=
=3D0x809<br>(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003d=
f6c050 flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v2: gvirt_to_maddr fa=
iled va=3D0xffff80003df6c05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d=
2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f flags=3D0x1 par=3D0x809<=
br>(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c050 fl=
ags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=
=3D0xffff80003df6c05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v2: gv=
irt_to_maddr failed va=3D0xffff80003df6c05f flags=3D0x1 par=3D0x809<br>(XEN=
) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c050 flags=3D0=
x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff=
80003df6c05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v2: gvirt_to_ma=
ddr failed va=3D0xffff80003df6c05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1=
456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c050 flags=3D0x1 par=3D=
0x809<br>(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c=
05f flags=3D0x1 par=3D0x809<br>[=C2=A0=C2=A0=C2=A0 3.006492] systemd[1]: Re=
ached target Remote File Systems.<br>[=C2=A0 OK=C2=A0 ] Reached target Remo=
te File Systems.<br>[=C2=A0=C2=A0=C2=A0 3.007179] systemd[1]: Started Dispa=
tch Password Requests to Console Directory Watch.<br>[=C2=A0 OK=C2=A0 ] Sta=
rted Dispatch Password Requests to Console Directory Watch.<br>[=C2=A0=C2=
=A0=C2=A0 3.007477] systemd[1]: Listening on Journal Socket.<br>[=C2=A0 OK=
=C2=A0 ] Listening on Journal Socket.<br>[=C2=A0=C2=A0=C2=A0 3.007742] syst=
emd[1]: Listening on LVM2 metadata daemon socket.<br>[=C2=A0 OK=C2=A0 ] Lis=
tening on LVM2 metadata daemon socket.<br>[=C2=A0=C2=A0=C2=A0 3.007966] sys=
temd[1]: Listening on Device-mapper event daemon FIFOs.<br>[=C2=A0 OK=C2=A0=
 ] Listening on Device-mapper event daemon FIFOs.<br>[=C2=A0=C2=A0=C2=A0 3.=
008161] systemd[1]: Listening on Syslog Socket.<br>[=C2=A0 OK=C2=A0 ] Liste=
ning on Syslog Socket.<br>[=C2=A0 OK=C2=A0 ] Listening on Journal Audit Soc=
ket.<br>[=C2=A0 OK=C2=A0 ] Listening on /dev/initctl Compatibility Named Pi=
pe.<br>[=C2=A0 OK=C2=A0 ] Created slice System Slice.<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Remount Root and Kernel File System=
s...<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Monitorin=
g of LVM2 mirrors=E2=80=A6ng dmeventd or progress polling...<br>[(XEN) p2m.=
c:1456: d2v3: gvirt_to_maddr failed va=3D0xffff80003df8305f flags=3D0x1 par=
=3D0x809<br>=C2=A0 (XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed va=3D0xfff=
f80003df83050 flags=3D0x1 par=3D0x809<br>OK=C2=A0 ] Created slice system-se=
rial\x2dgetty.slice.<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mo=
unting Huge Pages File System...<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Starting Uncomplic(XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed v=
a=3D0xffff80003df8305f flags=3D0x1 par=3D0x809<br>ated firewall...<br>[=C2=
=A0 OK=C2=A0 ] Listening on LVM2 poll daemon socket.<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Create Static Device Nodes in /d(XE=
N) p2m.c:1456: d2v3: gvirt_to_maddr failed va=3D0xffff80003df8305f flags=3D=
0x1 par=3D0x809<br>ev(XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed va=3D0xf=
fff80003df83050 flags=3D0x1 par=3D0x809<br>...<br>[=C2=A0 OK=C2=A0 ] Create=
d slice User and Session Slice.<br>[=C2=A0 OK=C2=A0 ] Reached target Slices=
.<br>[=C2=A0 OK=C2=A0 ](XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed va=3D0=
xffff80003df8305f flags=3D0x1 par=3D0x809<br>=C2=A0Reached target Swap.<br>=
[=C2=A0 OK=C2=A0 ] Started Forward Password Requests to Wall Directory Watc=
h.<br>[=C2=A0 OK=C2=A0 ] Reac(XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed =
va=3D0xffff80003df8305f flags=3D0x1 par=3D0x809<br>he(XEN) p2m.c:1456: d2v3=
: gvirt_to_maddr failed va=3D0xffff80003df83050 flags=3D0x1 par=3D0x809<br>=
d target Paths.<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mountin=
g Debug File System...<br>[=C2=A0 OK=C2=A0 ] Listening on udev Control Sock=
et.<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starti(XEN) p2m.c:1=
456: d2v3: gvirt_to_maddr failed va=3D0xffff80003df8305f flags=3D0x1 par=3D=
0x809<br>ng Load Kernel Modules...<br>[=C2=A0 OK=C2=A0 ] Listening on Journ=
al Socket (/dev/log).<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 S=
tarting Journal Service...<br>[(XEN) p2m.c:1456: d2v3: gvirt_to_maddr faile=
d va=3D0xffff80003df8305f flags=3D0x1 par=3D0x809<br>[=C2=A0 266.802137] mX=
EN) p2m.c:1456: d2v3: gvirt_to_maddr failed va=3D0xffff80003df83050 flags=
=3D0x1 par=3D0x809<br>mcblk0: timed ou0;32m=C2=A0 OK=C2=A0 ] Created slice =
system-getty.slice.<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mou=
nting POSIX Message Queue File System...<br>[=C2=A0 OK=C2=A0 ] R(XEN) p2m.c=
:1456: d2v3: gvirt_to_maddr failed va=3D0xffff80003df8305f flags=3D0x1 par=
=3D0x809<br>t sending r/w cmeached target User and Group Name Lookups.<br>[=
=C2=A0 OK=C2=A0 ] Reached target Encrypted Volumes.<br>[=C2=A0 OK=C2=A0 ] L=
istenind command, card g status 0x900<br>on udev Kernel Socket.<br>[=C2=A0 =
OK=C2=A0 ] Mounted Debug File System.<br>[=C2=A0 OK=C2=A0 ] Mounted Huge Pa=
ges File System.<br>[=C2=A0 OK=C2=A0 ] Mounted POSIX Message Queue File Sys=
tem.<br>[=C2=A0 OK=C2=A0 ] Started Remount Root and Kernel File Systems.<br=
>[=C2=A0 OK=C2=A0 ] Started Uncomplicated firewall.<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Load/Save Random Seed...<br>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting udev Coldplug all Devic=
es...<br>[=C2=A0 OK=C2=A0 ] Started Load Kernel Modules.<br>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Apply Kernel Variables...<br>=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mounting Configuration File S=
ystem...<br>[=C2=A0 OK=C2=A0 ] Mounted Configuration File System.<br>[=C2=
=A0 OK=C2=A0 ] Started Journal Service.<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Starting Flush Journal to Persistent Storage...<br>[=C2=
=A0 OK=C2=A0 ] Started Apply Kernel Variables.<br>[=C2=A0 OK=C2=A0 ] Starte=
d LVM2 metadata daemon.<br>[=C2=A0 OK=C2=A0 ] Started Load/Save Random Seed=
.<br>[=C2=A0 OK=C2=A0 ] Started udev Cold[=C2=A0 266.934658] mplug all Devi=
ces.<br>mc_host mmc0: Bus speed (slot 0) =3D 400000Hz (slot req 400000Hz, a=
ctual 400000HZ div =3D 0)<br>[=C2=A0 267.276187] dwmmc_k3 ff37f000.dwmmc1: =
Unexpected command timeout, state 7<br>[=C2=A0 267.288881] mmc_host mmc0: B=
us speed (slot 0) =3D 200000000Hz (slot req 200000000Hz, actual 200000000HZ=
 div =3D 0)<br>[=C2=A0 267.679850] dwmmc_k3 ff37f000.dwmmc1: tuning ok best=
_clksmpl 18 tuning_sample_flag cdfff9ff<br>[=C2=A0=C2=A0=C2=A0 4.249292] sy=
stemd-journald[1503]: Received request to flush runtime journal from PID 1<=
br>[=C2=A0 OK=C2=A0 ] Started Create Static Device Nodes in /dev.<br>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting udev Kernel Device Mana=
ger...<br>[=C2=A0 OK=C2=A0 ] Started Flush Journal to Persistent Storage.<b=
r>[=C2=A0 OK=C2=A0 ] Started udev Kernel Device Manager.<br>(XEN) p2m.c:145=
6: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f flags=3D0x1 par=3D0x=
809<br>(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05=
0 flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed =
va=3D0xffff80003df9a05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v4: =
gvirt_to_maddr failed va=3D0xffff80003df9a05f flags=3D0x1 par=3D0x809<br>(X=
EN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a050 flags=
=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0x=
ffff80003df9a05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v4: gvirt_t=
o_maddr failed va=3D0xffff80003df9a05f flags=3D0x1 par=3D0x809<br>(XEN) p2m=
.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a050 flags=3D0x1 pa=
r=3D0x809<br>(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003=
df9a05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v4: gvirt_to_maddr f=
ailed va=3D0xffff80003df9a05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: =
d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a050 flags=3D0x1 par=3D0x809=
<br>(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f f=
lags=3D0x1 par=3D0x809<br>[=C2=A0 OK=C2=A0 ] Started Monitoring of LVM2 mir=
rors,=E2=80=A6sing dmeventd or progress polling.<br>(XEN) p2m.c:1456: d2v4:=
 gvirt_to_maddr failed va=3D0xffff80003df9a05f flags=3D0x1 par=3D0x809<br>[=
=C2=A0 OK=C2=A0 ] Reached target Local File Systems (Pre).<br>[=C2=A0 OK=C2=
=A0 ] Reached target Local File Systems.<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 (XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xfff=
f80003df9a050 flags=3D0x1 par=3D0x809<br>Starting Create Volatile Files and=
 Directories...<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Startin=
g ebtables ruleset management...<br>(XEN) p2m.c:1456: d2v4: gvirt_to_maddr =
failed va=3D0xffff80003df9a05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456:=
 d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f flags=3D0x1 par=3D0x80=
9<br>(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a050 =
flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=
=3D0xffff80003df9a05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v4: gv=
irt_to_maddr failed va=3D0xffff80003df9a05f flags=3D0x1 par=3D0x809<br>[=C2=
=A0 OK=C2=A0 ] Found device /dev/hvc0.<br>(XEN) p2m.c:1456: d2v4: gvirt_to_=
maddr failed va=3D0xffff80003df9a050 flags=3D0x1 par=3D0x809<br>(XEN) p2m.c=
:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f flags=3D0x1 par=
=3D0x809<br>(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003d=
f9a05f flags=3D0x1 par=3D0x809<br>[=C2=A0 268.122975] m(XEN) p2m.c:1456: d2=
v4: gvirt_to_maddr failed va=3D0xffff80003df9a050 flags=3D0x1 par=3D0x809<b=
r>mcblk0: timed ou(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff=
80003df9a05f flags=3D0x1 par=3D0x809<br>t sending r/w cmd command, card sta=
tus 0x900<br>[=C2=A0 268.222656] mmc_host mmc0: Bus speed (slot 0) =3D 4000=
00Hz (slot req 400000Hz, actual 400000HZ div =3D 0)<br>[=C2=A0 268.452176] =
dwmmc_k3 ff37f000.dwmmc1: Unexpected command timeout, state 7<br>[=C2=A0 26=
8.464809] mmc_host mmc0: Bus speed (slot 0) =3D 200000000Hz (slot req 20000=
0000Hz, actual 200000000HZ div =3D 0)<br>[=C2=A0 268.855781] dwmmc_k3 ff37f=
000.dwmmc1: tuning ok best_clksmpl 18 tuning_sample_flag c9fff9ff<br>[=C2=
=A0 OK=C2=A0 ] Started Create Volatile Files and Directories.<br>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Update UTMP about System B=
oot/Shutdown...<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Startin=
g Network Time Synchronization...<br>[=C2=A0 OK=C2=A0 ] Started Update UTMP=
 about System Boot/Shutdown.<br>(XEN) p2m.c:1456: d2v2: gvirt_to_maddr fail=
ed va=3D0xffff80003df6c05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v=
2: gvirt_to_maddr failed va=3D0xffff80003df6c050 flags=3D0x1 par=3D0x809<br=
>(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f flag=
s=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0=
xffff80003df6c05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v2: gvirt_=
to_maddr failed va=3D0xffff80003df6c050 flags=3D0x1 par=3D0x809<br>(XEN) p2=
m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f flags=3D0x1 p=
ar=3D0x809<br>[=C2=A0 OK=C2=A0 ] Started ebtables ruleset management.<br>[=
=C2=A0 OK=C2=A0 ] Reached target Network (Pre).<br>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 Starting Raise network interfaces...<br>[FAILED] F=
ailed to start Raise network interfaces.<br>See &#39;systemctl status netwo=
rking.service&#39; for details.<br>[=C2=A0 OK=C2=A0 ] Started Network Time =
Synchronization.<br>[=C2=A0 OK=C2=A0 ] Reached target System Initialization=
.<br>[=C2=A0 OK=C2=A0 ] Listening on Avahi mDNS/DNS-SD Stack Activation Soc=
ket.<br>[=C2=A0 OK=C2=A0 ] Listening on D-Bus System Message Bus Socket.<br=
>[=C2=A0 OK=C2=A0 ] Reached target Sockets.<br>[XEN) p2m.c:1456: d2v2: gvir=
t_to_maddr failed va=3D0xffff80003df6c05f flags=3D0x1 par=3D0x809<br>(XEN) =
p2m.c:1456: d2v5: gvirt_to_maddr failed va=3D0xffff80003dfb105f flags=3D0x1=
 par=3D0x809<br>2m(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff=
80003df6c050 flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v5: gvirt_to_ma=
ddr failed va=3D0xffff80003dfb1050 flags=3D0x1 par=3D0x809<br>=C2=A0 OK=C2=
=A0 ] Started Daily Cleanup of Temporary Directories.<br>[=C2=A0 OK=C2=A0 ]=
 Reached target Basic System.<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 Startin(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff8000=
3df6c05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v5: gvirt_to_maddr =
failed va=3D0xffff80003dfb105f flags=3D0x1 par=3D0x809<br>g xendeamon.servi=
ce...<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Login Se=
rvice...<br>(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003d=
f6c05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v5: gvirt_to_maddr fa=
iled va=3D0xffff80003dfb105f flags=3D0x1 par=3D0x809<br>[=C2=A0 OK=C2=A0 ] =
Started Regular background program processing daemon.<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Accounts Service...<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Star(XEN) p2m.c:1456: d2v2: gvirt_to_m=
addr failed va=3D0xffff80003df6c050 flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:=
1456: d2v5: gvirt_to_maddr failed va=3D0xffff80003dfb1050 flags=3D0x1 par=
=3D0x809<br>ting LSB: Speech Dispatcher...<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 Starting LSB: Start/stop xen-watchdog...<br>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting LSB: Start/stop xenstored =
(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f flags=
=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v5: gvirt_to_maddr failed va=3D0x=
ffff80003dfb105f flags=3D0x1 par=3D0x809<br>an(XEN) p2m.c:1456: d2v2: gvirt=
_to_maddr failed va=3D0xffff80003df6c05f flags=3D0x1 par=3D0x809<br>d xenco=
nsoled...<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Syst=
em Logging Service...<br>(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=
=3D0xffff80003df6c050 flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v2: gv=
irt_to_maddr failed va=3D0xffff80003df6c05f flags=3D0x1 par=3D0x809<br>(XEN=
) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f flags=3D0=
x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff=
80003df6c050 flags=3D0x1 par=3D0x809<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Starting Avahi mDNS/DNS-SD Stack...<br>[=C2=A0 OK=C2=A0 ] S=
tarted D-Bus System Message Bus.<br>(XEN) p2m.c:1456: d2v2: gvirt_to_maddr =
failed va=3D0xffff80003df6c05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456:=
 d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f flags=3D0x1 par=3D0x80=
9<br>(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c050 =
flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=
=3D0xffff80003df6c05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v2: gv=
irt_to_maddr failed va=3D0xffff80003df6c05f flags=3D0x1 par=3D0x809<br>(XEN=
) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c050 flags=3D0=
x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff=
80003df6c05f flags=3D0x1 par=3D0x809<br>[=C2=A0 OK=C2=A0 ] Started Avahi mD=
NS/DNS-SD Stack.<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starti=
ng Network Manager...<br>[=C2=A0 OK=C2=A0 ] Reached target System Time Sync=
hronized.<br>[=C2=A0 OK=C2=A0 ] Started Daily apt download activities.<br>[=
=C2=A0 OK=C2=A0 ] Started Daily apt upgrade and clean activities.(XEN) p2m.=
c:1456: d2v1: gvirt_to_maddr failed va=3D0xffff80003df5505f flags=3D0x1 par=
=3D0x809<br><br>[=C2=A0 OK=C2=A0 ] Started Trigger anacron every hour.<br>[=
=C2=A0 OK=C2=A0 ] Reached target Timers.<br>[=C2=A0 OK=C2=A0 ] Star(XEN) p2=
m.c:1456: d2v1: gvirt_to_maddr failed va=3D0xffff80003df55050 flags=3D0x1 p=
ar=3D0x809<br>te(XEN) p2m.c:1456: d2v1: gvirt_to_maddr failed va=3D0xffff80=
003df5505f flags=3D0x1 par=3D0x809<br>d Run anacron jobs.<br>(XEN) p2m.c:14=
56: d2v1: gvirt_to_maddr failed va=3D0xffff80003df5505f flags=3D0x1 par=3D0=
x809<br>[=C2=A0 269.705640] m[=C2=A0 OK=C2=A0 ] Started System Logging Serv=
ice.<br>(XEN) p2m.c:1456: d2v1: gvirt_to_maddr failed va=3D0xffff80003df550=
50 flags=3D0x1 par=3D0x809<br>mcblk0: timed ou(XEN) p2m.c:1456: d2v1: gvirt=
_to_maddr failed va=3D0xffff80003df5505f flags=3D0x1 par=3D0x809<br>t sendi=
ng r/w cm[FAILED] Failed to start xendeamon.service.<br>See &#39;systemctl =
status xendeamon.service&#39; for details.<br>d command, card [=C2=A0 OK=C2=
=A0 ] Started LSB: Start/stop xenstored and xenconsoled.<br>status 0x900<br=
>(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f flag=
s=3D0x1 par=3D0x809<br>[=C2=A0 OK=C2=A0 ] Started Login Service.<br>(XEN) p=
2m.c:1456: d2v5: gvirt_to_maddr failed va=3D0xffff80003dfb105f flags=3D0x1 =
par=3D0x809<br>(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff800=
03dfc8050 flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v5: gvirt_to_maddr=
 failed va=3D0xffff80003dfb1050 flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456=
: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f flags=3D0x1 par=3D0x8=
09<br>(XEN) p2m.c:1456: d2v5: gvirt_to_maddr failed va=3D0xffff80003dfb105f=
 flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed v=
a=3D0xffff80003dfc805f flags=3D0x1 par=3D0x809<br>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 Starting LSB: Wrapper to start/stop secondary xen =
domains...<br>(XEN) p2m.c:1456: d2v5: gvirt_to_maddr failed va=3D0xffff8000=
3dfb105f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v6: gvirt_to_maddr =
failed va=3D0xffff80003dfc8050 flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456:=
 d2v5: gvirt_to_maddr failed va=3D0xffff80003dfb1050 flags=3D0x1 par=3D0x80=
9<br>(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f =
flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v5: gvirt_to_maddr failed va=
=3D0xffff80003dfb105f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v6: gv=
irt_to_maddr failed va=3D0xffff80003dfc805f flags=3D0x1 par=3D0x809<br>[=C2=
=A0 269.863692] m(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff8=
0003dfc8050 flags=3D0x1 par=3D0x809<br>mc_host mmc0: Bu(XEN) p2m.c:1456: d2=
v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f flags=3D0x1 par=3D0x809<b=
r>s speed (slot 0)(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff=
80003dfc805f flags=3D0x1 par=3D0x809<br>=C2=A0=3D 400000Hz (slo(XEN) p2m.c:=
1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc8050 flags=3D0x1 par=
=3D0x809<br>t req 400000Hz, (XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed v=
a=3D0xffff80003dfc805f flags=3D0x1 par=3D0x809<br>actual 400000HZ div =3D 0=
)<br>[=C2=A0 270.140189] dwmmc_k3 ff37f000.dwmmc1: Unexpected command timeo=
ut, state 7<br>[=C2=A0 270.152889] mmc_host mmc0: Bus speed (slot 0) =3D 20=
0000000Hz (slot req 200000000Hz, actual 200000000HZ div =3D 0)<br>[=C2=A0 2=
70.543959] dwmmc_k3 ff37f000.dwmmc1: tuning ok best_clksmpl 18 tuning_sampl=
e_flag c9fff9ff<br>[=C2=A0 OK=C2=A0 ] Started LSB: Speech Dispatcher.<br>(X=
EN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f flags=
=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0x=
ffff80003dfc8050 flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v6: gvirt_t=
o_maddr failed va=3D0xffff80003dfc805f flags=3D0x1 par=3D0x809<br>(XEN) p2m=
.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f flags=3D0x1 pa=
r=3D0x809<br>(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003=
dfc8050 flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v6: gvirt_to_maddr f=
ailed va=3D0xffff80003dfc805f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: =
d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f flags=3D0x1 par=3D0x809=
<br>(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc8050 f=
lags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=
=3D0xffff80003dfc805f flags=3D0x1 par=3D0x809<br>[=C2=A0 OK=C2=A0 ] Started=
 LSB: Start/stop xen-watchdog.<br>(XEN) p2m.c:1456: d2v6: gvirt_to_maddr fa=
iled va=3D0xffff80003dfc805f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d=
2v6: gvirt_to_maddr failed va=3D0xffff80003dfc8050 flags=3D0x1 par=3D0x809<=
br>(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f fl=
ags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=
=3D0xffff80003dfc805f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v6: gv=
irt_to_maddr failed va=3D0xffff80003dfc8050 flags=3D0x1 par=3D0x809<br>(XEN=
) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f flags=3D0=
x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff=
80003dfc805f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v6: gvirt_to_ma=
ddr failed va=3D0xffff80003dfc8050 flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1=
456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f flags=3D0x1 par=3D=
0x809<br>[=C2=A0 OK=C2=A0 ] Started LSB: Wrapper to start/stop secondary xe=
n domains.<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Aut=
horization Manager...<br>(XEN) p2m.c:1456: d2v0: gvirt_to_maddr failed va=
=3D0xffff80003df3e05f flags=3D0x1 par=3D0x809<br>[=C2=A0 OK=C2=A0 ] Started=
 Authorization Manager.<br>(XEN) p2m.c:1456: d2v0: gvirt_to_maddr failed va=
=3D0xffff80003df3e050 flags=3D0x1 par=3D0x809<br>[=C2=A0 OK=C2=A0 ] Started=
 Accounts Service.<br>(XEN) p2m.c:1456: d2v0: gvirt_to_maddr failed va=3D0x=
ffff80003df3e05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v0: gvirt_t=
o_maddr failed va=3D0xffff80003df3e05f flags=3D0x1 par=3D0x809<br>[=C2=A0 2=
71.237540] m(XEN) p2m.c:1456: d2v0: gvirt_to_maddr failed va=3D0xffff80003d=
f3e050 flags=3D0x1 par=3D0x809<br>mcblk0: timed ou(XEN) p2m.c:1456: d2v0: g=
virt_to_maddr failed va=3D0xffff80003df3e05f flags=3D0x1 par=3D0x809<br>t s=
ending r/w cmd command, card status 0x900<br>[=C2=A0 271.334639] mmc_host m=
mc0: Bus speed (slot 0) =3D 400000Hz (slot req 400000Hz, actual 400000HZ di=
v =3D 0)<br>[=C2=A0 271.564175] dwmmc_k3 ff37f000.dwmmc1: Unexpected comman=
d timeout, state 7<br>[=C2=A0 271.576795] mmc_host mmc0: Bus speed (slot 0)=
 =3D 200000000Hz (slot req 200000000Hz, actual 200000000HZ div =3D 0)<br>[=
=C2=A0 271.967997] dwmmc_k3 ff37f000.dwmmc1: tuning ok best_clksmpl 18 tuni=
ng_sample_flag c9fff9ff<br>[=C2=A0 OK=C2=A0 ] Started Network Manager.<br>=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Network Manager W=
ait Online...<br>[=C2=A0 OK=C2=A0 ] Reached target Network.<br>[=C2=A0 OK=
=C2=A0 ] Started Unattended Upgrades Shutdown.<br>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 Starting Permit User Sessions...<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting OpenBSD Secure Shell server..=
.<br>[=C2=A0 OK=C2=A0 ] Started Permit User Sessions.<br>[=C2=A0 OK=C2=A0 ]=
 Started Getty on tty1.<br>(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=
=3D0xffff80003dfc805f flags=3D0x1 par=3D0x809<br>[=C2=A0 OK=C2=A0 ] Started=
 Serial Getty on hvc0.<br>[=C2=A0 OK=C2=A0 ] Reached target Login Prompts.<=
br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Light D(XEN) p=
2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc8050 flags=3D0x1 =
par=3D0x809<br>isplay Manager...<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Starting Network Manager Script Dispatcher Service...<br>(XEN) p2=
m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f flags=3D0x1 p=
ar=3D0x809<br>(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff8000=
3dfc805f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v5: gvirt_to_maddr =
failed va=3D0xffff80003dfb105f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456:=
 d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf05f flags=3D0x1 par=3D0x80=
9<br>(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc8050 =
flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v5: gvirt_to_maddr failed va=
=3D0xffff80003dfb1050 flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v7: gv=
irt_to_maddr failed va=3D0xffff80003dfdf050 flags=3D0x1 par=3D0x809<br>(XEN=
) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f flags=3D0=
x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v5: gvirt_to_maddr failed va=3D0xffff=
80003dfb105f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v7: gvirt_to_ma=
ddr failed va=3D0xffff80003dfdf05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1=
456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f flags=3D0x1 par=3D=
0x809<br>(XEN) p2m.c:1456: d2v5: gvirt_to_maddr failed va=3D0xffff80003dfb1=
05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v7: gvirt_to_maddr faile=
d va=3D0xffff80003dfdf05f flags=3D0x1 par=3D0x809<br>[=C2=A0 OK=C2=A0 ] Sta=
rted Network Manager Script Dispatcher Service.<br>(XEN) p2m.c:1456: d2v6: =
gvirt_to_maddr failed va=3D0xffff80003dfc8050 flags=3D0x1 par=3D0x809<br>(X=
EN) p2m.c:1456: d2v5: gvirt_to_maddr failed va=3D0xffff80003dfb1050 flags=
=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0x=
ffff80003dfdf050 flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v6: gvirt_t=
o_maddr failed va=3D0xffff80003dfc805f flags=3D0x1 par=3D0x809<br>(XEN) p2m=
.c:1456: d2v5: gvirt_to_maddr failed va=3D0xffff80003dfb105f flags=3D0x1 pa=
r=3D0x809<br>(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003=
dfdf05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v6: gvirt_to_maddr f=
ailed va=3D0xffff80003dfc805f flags=3D0x1 par=3D0x809<br>[=C2=A0 OK=C2=A0 ]=
 Started OpenBSD Secure Shell server.<br>(XEN) p2m.c:1456: d2v3: gvirt_to_m=
addr failed va=3D0xffff80003df8305f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:=
1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc8050 flags=3D0x1 par=
=3D0x809<br>(XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed va=3D0xffff80003d=
f83050 flags=3D0x1 par=3D0x809<br>[=C2=A0 OK=C2=A0 ] Started Light Display =
Manager.<br>(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003d=
fc805f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v3: gvirt_to_maddr fa=
iled va=3D0xffff80003df8305f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d=
2v3: gvirt_to_maddr failed va=3D0xffff80003df8305f flags=3D0x1 par=3D0x809<=
br>(XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed va=3D0xffff80003df83050 fl=
ags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed va=
=3D0xffff80003df8305f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v3: gv=
irt_to_maddr failed va=3D0xffff80003df8305f flags=3D0x1 par=3D0x809<br>(XEN=
) p2m.c:1456: d2v3: gvirt_to_maddr failed va=3D0xffff80003df83050 flags=3D0=
x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed va=3D0xffff=
80003df8305f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v3: gvirt_to_ma=
ddr failed va=3D0xffff80003df8305f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1=
456: d2v3: gvirt_to_maddr failed va=3D0xffff80003df83050 flags=3D0x1 par=3D=
0x809<br>(XEN) p2m.c:1456: d2v3: gvirt_to_maddr failed va=3D0xffff80003df83=
05f flags=3D0x1 par=3D0x809<br>[=C2=A0 OK=C2=A0 ] Stopped Light Display Man=
ager.<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting Light Di=
splay Manager...<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starti=
ng Hostname Service...<br>[=C2=A0 OK=C2=A0 ] Started Light Display Manager.=
<br>[=C2=A0 OK=C2=A0 ] Started Hostname Service.<br>[=C2=A0 OK=C2=A0 ] Star=
ted Network Manager Wait Online.<br>(XEN) p2m.c:1456: d2v7: gvirt_to_maddr =
failed va=3D0xffff80003dfdf05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456:=
 d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f flags=3D0x1 par=3D0x80=
9<br>(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f =
flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=
=3D0xffff80003dfdf050 flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v6: gv=
irt_to_maddr failed va=3D0xffff80003dfc8050 flags=3D0x1 par=3D0x809<br>(XEN=
) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c050 flags=3D0=
x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff=
80003dfdf05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v6: gvirt_to_ma=
ddr failed va=3D0xffff80003dfc805f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1=
456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f flags=3D0x1 par=3D=
0x809<br>(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf=
05f flags=3D0x1 par=3D0x809<br>[=C2=A0 OK=C2=A0 ] Reached target Network is=
 Online.<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting LSB: =
Advanced IEEE 802.11 management daemon...<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 (XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xffff80003dfc805f flag=
s=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0=
xffff80003df6c05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v7: gvirt_=
to_maddr failed va=3D0xffff80003dfdf050 flags=3D0x1 par=3D0x809<br>=C2=A0=
=C2=A0 Starting LSB: Starts or stops the xinetd daemon....<br>[=C2=A0 OK=C2=
=A0 ] Stopped Light Display Manager.<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Starting L(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=
=3D0xffff80003dfc8050 flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v2: gv=
irt_to_maddr failed va=3D0xffff80003df6c050 flags=3D0x1 par=3D0x809<br>(XEN=
) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf05f flags=3D0=
x1 par=3D0x809<br>ig(XEN) p2m.c:1456: d2v6: gvirt_to_maddr failed va=3D0xff=
ff80003dfc805f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v2: gvirt_to_=
maddr failed va=3D0xffff80003df6c05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c=
:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf05f flags=3D0x1 par=
=3D0x809<br>ht Display Manager...<br>[=C2=A0 OK=C2=A0 ] Started Light Displ=
ay Manager.<br>(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff800=
03df6c05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v7: gvirt_to_maddr=
 failed va=3D0xffff80003dfdf050 flags=3D0x1 par=3D0x809<br>[=C2=A0 OK=C2=A0=
 ] Started LSB: Advanced IEEE 802.11 management daemon.<br>(XEN) p2m.c:1456=
: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c050 flags=3D0x1 par=3D0x8=
09<br>(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf05f=
 flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed v=
a=3D0xffff80003df6c05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v7: g=
virt_to_maddr failed va=3D0xffff80003dfdf05f flags=3D0x1 par=3D0x809<br>(XE=
N) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f flags=3D=
0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xfff=
f80003dfdf050 flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v2: gvirt_to_m=
addr failed va=3D0xffff80003df6c050 flags=3D0x1 par=3D0x809<br>[=C2=A0 OK=
=C2=A0 ] Started LSB: Starts or stops the xinetd daemon..<br>(XEN) p2m.c:14=
56: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf05f flags=3D0x1 par=3D0=
x809<br>(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a0=
5f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed=
 va=3D0xffff80003df6c05f flags=3D0x1 par=3D0x809<br>[=C2=A0 OK=C2=A0 ] Reac=
hed target Multi-User System.<br>[=C2=A0 OK=C2=A0 ] Reached target Graphica=
l Interface.<br>(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80=
003dfdf05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v4: gvirt_to_madd=
r failed va=3D0xffff80003df9a050 flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:145=
6: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f flags=3D0x1 par=3D0x=
809<br>(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf05=
0 flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed =
va=3D0xffff80003df9a05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v2: =
gvirt_to_maddr failed va=3D0xffff80003df6c050 flags=3D0x1 par=3D0x809<br>(X=
EN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf05f flags=
=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0x=
ffff80003df9a05f flags=3D0x1 par=3D0x809<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Starting Update UTMP about System Runlevel Changes...<br=
>(XEN) p2m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f flag=
s=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0=
xffff80003dfdf05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v4: gvirt_=
to_maddr failed va=3D0xffff80003df9a050 flags=3D0x1 par=3D0x809<br>(XEN) p2=
m.c:1456: d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c05f flags=3D0x1 p=
ar=3D0x809<br>(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff8000=
3dfdf050 flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v4: gvirt_to_maddr =
failed va=3D0xffff80003df9a05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456:=
 d2v2: gvirt_to_maddr failed va=3D0xffff80003df6c050 flags=3D0x1 par=3D0x80=
9<br>(XEN) p2m.c:1456: d2v7: gvirt_to_maddr failed va=3D0xffff80003dfdf05f =
flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=
=3D0xffff80003df9a05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v2: gv=
irt_to_maddr failed va=3D0xffff80003df6c05f flags=3D0x1 par=3D0x809<br>(XEN=
) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a050 flags=3D0=
x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff=
80003df9a05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v4: gvirt_to_ma=
ddr failed va=3D0xffff80003df9a05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1=
456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a050 flags=3D0x1 par=3D=
0x809<br>(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a=
05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v4: gvirt_to_maddr faile=
d va=3D0xffff80003df9a05f flags=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v4=
: gvirt_to_maddr failed va=3D0xffff80003df9a050 flags=3D0x1 par=3D0x809<br>=
(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f flags=
=3D0x1 par=3D0x809<br>(XEN) p2m.c:1456: d2v4: gvirt_to_maddr failed va=3D0x=
ffff80003df9a05f flags=3D0x1 par=3D0x809<br>[=C2=A0 OK=C2=A0 ] Started Upda=
te UTMP about System Runlevel Changes.<br>(XEN) p2m.c:1456: d2v4: gvirt_to_=
maddr failed va=3D0xffff80003df9a050 flags=3D0x1 par=3D0x809<br>(XEN) p2m.c=
:1456: d2v4: gvirt_to_maddr failed va=3D0xffff80003df9a05f flags=3D0x1 par=
=3D0x809<br><br></div><div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signa=
ture"><div dir=3D"ltr"><div><div dir=3D"ltr"><span>Thanks &amp; Regards<br>=
Vikram KS<br></span><span style=3D"color:rgb(19,79,92)"></span></div></div>=
</div></div></div></div></div></div>

<br>




<p><span lang=3D"EN-IN">This
message contains confidential information and is intended only for the
individual(s) named.</span><span lang=3D"EN-IN"> </span>If you are not the =
intended
recipient, you are notified that disclosing, copying, distributing or takin=
g any
action in reliance on the contents of this mail and attached file/s is stri=
ctly
prohibited<span lang=3D"EN-IN">. Please notify the
sender immediately and delete this e-mail from your system. E-mail transmis=
sion
cannot be guaranteed to be secured or error-free as information could be
intercepted, corrupted, lost, destroyed, arrive late or incomplete, or cont=
ain
viruses. The sender therefore does not accept liability for any errors or
omissions in the contents of this message, which arise as a result of e-mai=
l
transmission.</span></p>
--0000000000006721d9057d452392--


--===============2724559828386227710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2724559828386227710==--
