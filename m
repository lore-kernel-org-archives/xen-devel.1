From: Matt Leinhos <matthew.leinhos@gmail.com>
Subject: Xen 4.11.1: gdbsx fails
Date: Fri, 5 Apr 2019 16:48:16 -0500
Message-ID: <CAFLDOk90XmXO+HF5evXqHNO48-pckHphNRpoMemx0u4L9NFMQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5943872564856398003=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=68b5=SH=gmail.com=matthew.leinhos@srs-us1.protection.inumbo.net>)
 id 1hCWhL-0002D9-6Q
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 21:48:31 +0000
Received: by mail-wm1-x335.google.com with SMTP id q16so8154505wmj.3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Apr 2019 14:48:29 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============5943872564856398003==
Content-Type: multipart/alternative; boundary="00000000000069c4f50585cf7212"

--00000000000069c4f50585cf7212
Content-Type: text/plain; charset="UTF-8"

Greetings:

I've encountered a problem running gdb + gdbsx on Xen 4.11.1, running Linux
kernel 4.18.0-15 on Ubuntu 18.04. Pertinent info is below.

I've observed this behavior with gdb 8.0, 8.1.1 and 8.2. I've also seen it
on Xen 4.9.2. In short, something is broken with my system, but I don't
know how to investigate.

Thanks in advance for any help!

--Matt


Here's my guest config file:

$ cat xen-vms/ub1804-dev.hvm
type = "hvm"
name = "ub18-dev-work"

# Initial and max memory allocation (MB)
memory = 2048
maxmem = 2048

vcpus = 1
acpi = 1
apic = 1
# values: disabled, mixed, external, limited
altp2m = "mixed"
vif = [ 'bridge=xenbr0' ]
disk = [ 'phy:/dev/ubuntu-vg/xen_ubuntu_dev,xvda,w'
        ,'file:/home/matt/iso/ubuntu-18.04.1-desktop-amd64.iso,hdc:cdrom,r'
]
boot = 'c' # hard disk (c) / cdrom (d)
console = 1
on_poweroff = "destroy"
on_reboot   = "restart"
on_crash    = "preserve"


Here are the two usages of gdbsx (both from Dom0). Note that domain 2 is 64
bit.

# xl list
Name                                        ID   Mem VCPUs      State
Time(s)
Domain-0                                     0 30098     8     r-----
8724.5
ub18-dev-work                                2  2040     1     -b----
24.9

This is a sanity check....
# gdbsx -c 2 64 0
===> Context for DOMID:2

--> VCPU:0
rip:ffffffff9b1f52e6 rsp:ffffffff9bc03e10 flags:0000000000000246
rax:ffffffff9b1f4ff0 rbx:0000000000000000 rcx:ffffffff9bc6ff60
rdx:0000000000066e16 rsi:ffffffff9bc2ebc8 rdi:0000000000000000
r08:00000000505563be r09:0000000000000000 r10:0000000000000008
r11:0000000000000008 r12:0000000000000000 r13:0000000000000000
r14:0000000000000000 r15:0000000000000000 rbp:ffffffff9bc03e10
cs:0000000000000010 ds:0000000000000000 fs:0000000000000000
gs:0000000000000000

Call Trace:
   [ffffffff9b1f52e6]
   [ffffffff9bc03e38]
   [ffffffff9b1f5010]
   [ffffffff9be85ee0]
   [ffffffff9bc03e48]
   [ffffffff9a8394c5]
   [ffffffff9bc03e58]
   [ffffffff9b1f544c]
   [ffffffff9bc03ea0]
   [ffffffff9a8c3c84]
   [ffffffff9bf8c920]

This is the actual usage that fails
# gdbsx -a 2 64 3333
Listening on port 3333
Remote debugging from host 127.0.0.1
readchar: Got EOF
Detaching from guest
Exiting.. Remote side has terminated connection


And here's the corresponding usage of gdb that led to the failure in gdbsx
(again, from Dom0):

$ gdb -q
Currently logging to "/home/matt/gdb.log".
Logs will overwrite the log file.
Output will be logged and displayed.
gdb> set architecture i386:x86-64
The target architecture is assumed to be i386:x86-64
gdb> target remote localhost:3333
Remote debugging using localhost:3333
warning: No executable has been specified and target does not support
determining executable automatically.  Try using the "file" command.
Truncated register 26 in remote 'g' packet
gdb> show version
GNU gdb (Ubuntu 8.2-0ubuntu1~18.04) 8.2
Copyright (C) 2018 Free Software Foundation, Inc.

--00000000000069c4f50585cf7212
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Greetings:<br><br>I&#39;ve encountered a problem running g=
db + gdbsx on Xen=20
4.11.1, running Linux kernel 4.18.0-15 on Ubuntu 18.04. Pertinent info=20
is below.<br><div><br></div><div>I&#39;ve observed this behavior with gdb 8=
.0, 8.1.1 and 8.2. I&#39;ve also seen it on Xen 4.9.2. In short, something =
is broken with my system, but I don&#39;t know how to investigate.<br></div=
><div><br></div>Thanks in advance for any help!<br><br>--Matt<br><br><br>He=
re&#39;s my guest config file:<br><br>$ cat xen-vms/ub1804-dev.hvm<br>type =
=3D &quot;hvm&quot;<br>name =3D &quot;ub18-dev-work&quot;<br><br># Initial =
and max memory allocation (MB)<br>memory =3D 2048<br>maxmem =3D 2048<br><br=
>vcpus =3D 1<br>acpi =3D 1<br>apic =3D 1<br># values: disabled, mixed, exte=
rnal, limited<br>altp2m =3D &quot;mixed&quot;=C2=A0 <br>vif =3D [ &#39;brid=
ge=3Dxenbr0&#39; ]<br>disk =3D [ &#39;phy:/dev/ubuntu-vg/xen_ubuntu_dev,xvd=
a,w&#39;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ,&#39;file:/home/mat=
t/iso/ubuntu-18.04.1-desktop-amd64.iso,hdc:cdrom,r&#39; ]<br>boot =3D &#39;=
c&#39; # hard disk (c) / cdrom (d)<br>console =3D 1<br>on_poweroff =3D &quo=
t;destroy&quot;<br>on_reboot=C2=A0=C2=A0 =3D &quot;restart&quot;<br>on_cras=
h=C2=A0=C2=A0=C2=A0 =3D &quot;preserve&quot;<br><br><br>Here are the two us=
ages of gdbsx (both from Dom0). Note that domain 2 is 64 bit.<br><br># xl l=
ist<br>Name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ID=C2=A0=C2=A0 Mem VCPUs=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 State=C2=A0=C2=A0 Time(s)<br>Domain-0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 30098=C2=A0=C2=A0=C2=A0=C2=A0 8=C2=A0=
=C2=A0=C2=A0=C2=A0 r-----=C2=A0=C2=A0=C2=A0 8724.5<br>ub18-dev-work=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2=C2=A0 2040=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0=
=C2=A0=C2=A0=C2=A0 -b----=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 24.9<br><div><br></=
div><div>This is a sanity check....<br></div># gdbsx -c 2 64 0<br>=3D=3D=3D=
&gt; Context for DOMID:2<br><br>--&gt; VCPU:0<br>rip:ffffffff9b1f52e6 rsp:f=
fffffff9bc03e10 flags:0000000000000246<br>rax:ffffffff9b1f4ff0 rbx:00000000=
00000000 rcx:ffffffff9bc6ff60<br>rdx:0000000000066e16 rsi:ffffffff9bc2ebc8 =
rdi:0000000000000000<br>r08:00000000505563be r09:0000000000000000 r10:00000=
00000000008<br>r11:0000000000000008 r12:0000000000000000 r13:00000000000000=
00<br>r14:0000000000000000 r15:0000000000000000 rbp:ffffffff9bc03e10<br>cs:=
0000000000000010 ds:0000000000000000 fs:0000000000000000 gs:000000000000000=
0<br><br>Call Trace:<br>=C2=A0=C2=A0 [ffffffff9b1f52e6]<br>=C2=A0=C2=A0 [ff=
ffffff9bc03e38]<br>=C2=A0=C2=A0 [ffffffff9b1f5010]<br>=C2=A0=C2=A0 [fffffff=
f9be85ee0]<br>=C2=A0=C2=A0 [ffffffff9bc03e48]<br>=C2=A0=C2=A0 [ffffffff9a83=
94c5]<br>=C2=A0=C2=A0 [ffffffff9bc03e58]<br>=C2=A0=C2=A0 [ffffffff9b1f544c]=
<br>=C2=A0=C2=A0 [ffffffff9bc03ea0]<br>=C2=A0=C2=A0 [ffffffff9a8c3c84]<br><=
div>=C2=A0=C2=A0 [ffffffff9bf8c920]</div><div><br></div><div>This is the ac=
tual usage that fails<br></div># gdbsx -a 2 64 3333<br>Listening on port 33=
33<br>Remote debugging from host 127.0.0.1<br>readchar: Got EOF<br>Detachin=
g from guest<br>Exiting.. Remote side has terminated connection<br><br><br>=
And here&#39;s the corresponding usage of gdb that led to the failure in gd=
bsx (again, from Dom0):<br><br>$ gdb -q<br>Currently logging to &quot;/home=
/matt/gdb.log&quot;.<br>Logs will overwrite the log file.<br>Output will be=
 logged and displayed.<br>gdb&gt; set architecture i386:x86-64<br>The targe=
t architecture is assumed to be i386:x86-64<br>gdb&gt; target remote localh=
ost:3333<br>Remote debugging using localhost:3333<br>warning: No executable=
 has been specified and target does not support<br>determining executable a=
utomatically.=C2=A0 Try using the &quot;file&quot; command.<br>Truncated re=
gister 26 in remote &#39;g&#39; packet<br>gdb&gt; show version<br>GNU gdb (=
Ubuntu 8.2-0ubuntu1~18.04) 8.2<br>Copyright (C) 2018 Free Software Foundati=
on, Inc.</div>

--00000000000069c4f50585cf7212--


--===============5943872564856398003==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5943872564856398003==--
