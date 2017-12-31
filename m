From: Bruno Alvisio <bruno.alvisio@gmail.com>
Subject: Problem creating x86_64 PVH mini-os domain
Date: Sun, 31 Dec 2017 15:19:20 +0000
Message-ID: <CADNMjEBvi8P9OxeVfYH8nev+kwsGne=wjSeUQ0T=meUi20kTsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5799778690924265769=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=/xgp=d3=gmail.com=bruno.alvisio@srs-us1.protection.inumbo.net>)
 id 1eVfOX-0000fH-EO
 for xen-devel@lists.xenproject.org; Sun, 31 Dec 2017 15:19:25 +0000
Received: by mail-yw0-x235.google.com with SMTP id r205so10725320ywb.3
 for <xen-devel@lists.xenproject.org>; Sun, 31 Dec 2017 07:19:22 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============5799778690924265769==
Content-Type: multipart/alternative; boundary="001a11429284d937820561a463f3"

--001a11429284d937820561a463f3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,



I was trying to create mini-os PVH instances both x86_32 and x86_64. I have
no issue with x86_32 but when trying to =E2=80=98xl create=E2=80=99 x86_64 =
type I get the
following error:


root@debianxen:/home/balvisio# xl -vvv create minios_pvh.cfg

Parsing config from minios_pvh.cfg

libxl: debug: libxl_create.c:1646:do_domain_create: Domain 0:ao
0x558d17c32c70: create: how=3D(nil) callback=3D(nil) poller=3D0x558d17c32b3=
0

libxl: debug: libxl_create.c:987:initiate_domain_create: Domain 24:running
bootloader

libxl: debug: libxl_bootloader.c:335:libxl__bootloader_run: Domain 24:no
bootloader configured, using user supplied kernel

libxl: debug: libxl_event.c:686:libxl__ev_xswatch_deregister: watch
w=3D0x558d17c33d20: deregister unregistered

domainbuilder: detail: xc_dom_allocate: cmdline=3D"", features=3D""

domainbuilder: detail: xc_dom_kernel_file:
filename=3D"/home/balvisio/mini-os/mini-os"

domainbuilder: detail: xc_dom_malloc_filemap    : 2367 kB

domainbuilder: detail: xc_dom_boot_xen_init: ver 4.10, caps xen-3.0-x86_64
xen-3.0-x86_32p hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-3.0-x86_64

domainbuilder: detail: xc_dom_parse_image: called

domainbuilder: detail: xc_dom_find_loader: trying multiboot-binary loader
...

domainbuilder: detail: loader probe failed

domainbuilder: detail: xc_dom_find_loader: trying HVM-generic loader ...

domainbuilder: detail: loader probe OK

xc: error: panic: xc_dom_hvmloader.c:113: xc_dom_parse_hvm_kernel: ELF
image is not 32bit: Invalid kernel

libxl: error: libxl_dom.c:718:libxl__build_dom: xc_dom_parse_image failed:
No such file or directory

domainbuilder: detail: xc_dom_release: called

libxl: error: libxl_create.c:1246:domcreate_rebuild_done: Domain 24:cannot
(re-)build domain: -3

libxl: debug: libxl_domain.c:1138:devices_destroy_cb: Domain 24:Forked pid
23698 for destroy of domain

libxl: debug: libxl_create.c:1683:do_domain_create: Domain 0:ao
0x558d17c32c70: inprogress: poller=3D0x558d17c32b30, flags=3Di

libxl: debug: libxl_event.c:1869:libxl__ao_complete: ao 0x558d17c32c70:
complete, rc=3D-3

libxl: debug: libxl_event.c:1838:libxl__ao__destroy: ao 0x558d17c32c70:
destroy

libxl: debug: libxl_domain.c:868:libxl_domain_destroy: Domain 24:ao
0x558d17c32c70: create: how=3D(nil) callback=3D(nil) poller=3D0x558d17c32b3=
0

libxl: error: libxl_domain.c:1000:libxl__destroy_domid: Domain
24:Non-existant domain

libxl: error: libxl_domain.c:959:domain_destroy_callback: Domain 24:Unable
to destroy guest

libxl: error: libxl_domain.c:886:domain_destroy_cb: Domain 24:Destruction
of domain failed

libxl: debug: libxl_event.c:1869:libxl__ao_complete: ao 0x558d17c32c70:
complete, rc=3D-21

libxl: debug: libxl_domain.c:877:libxl_domain_destroy: Domain 24:ao
0x558d17c32c70: inprogress: poller=3D0x558d17c32b30, flags=3Dic

libxl: debug: libxl_event.c:1838:libxl__ao__destroy: ao 0x558d17c32c70:
destroy

xencall:buffer: debug: total allocations:78 total releases:78

xencall:buffer: debug: current allocations:0 maximum allocations:3

xencall:buffer: debug: cache current size:3

xencall:buffer: debug: cache hits:64 misses:3 toobig:11

xencall:buffer: debug: total allocations:0 total releases:0

xencall:buffer: debug: current allocations:0 maximum allocations:0

xencall:buffer: debug: cache current size:0

xencall:buffer: debug: cache hits:0 misses:0 toobig:0



The config file used is:



type=3D"pvh"

memory=3D1024

vcpu=3D2

name=3D"minios"

kernel=3D"/home/balvisio/mini-os/mini-os"



The minios elf file header is:



root@debianxen:/home/balvisio/mini-os# readelf -a mini-os

ELF Header:

  Magic:   7f 45 4c 46 02 01 01 00 00 00 00 00 00 00 00 00

  Class:                             ELF64

  Data:                              2's complement, little endian

  Version:                           1 (current)

  OS/ABI:                            UNIX - System V

  ABI Version:                       0

  Type:                              EXEC (Executable file)

  Machine:                           Advanced Micro Devices X86-64

  Version:                           0x1

  Entry point address:               0x0

  Start of program headers:          64 (bytes into file)

  Start of section headers:          2422464 (bytes into file)

  Flags:                             0x0

  Size of this header:               64 (bytes)

  Size of program headers:           56 (bytes)

  Number of program headers:         2

  Size of section headers:           64 (bytes)

  Number of section headers:         22

  Section header string table index: 21



Is there any extra setup needed to launch this type of domain?

Just in case, my host system is an x86_64 system.



Happy New Year!



Cheers,



Bruno

--001a11429284d937820561a463f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">
















<p class=3D"gmail-MsoNormal" style=3D"line-height:16pt;margin:0in 0in 0.000=
1pt;font-family:Calibri"><span style=3D"font-family:&quot;Helvetica Neue&qu=
ot;;color:black">Hi all,</span></p>

<p class=3D"gmail-MsoNormal" style=3D"line-height:16pt;margin:0in 0in 0.000=
1pt;font-family:Calibri"><span style=3D"font-family:&quot;Helvetica Neue&qu=
ot;;color:black"><span>=C2=A0</span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"line-height:16pt;margin:0in 0in 0.000=
1pt;font-family:Calibri"><span style=3D"font-family:&quot;Helvetica Neue&qu=
ot;;color:black">I was trying to create
mini-os PVH instances both x86_32 and x86_64. I have no issue with x86_32 b=
ut
when trying to =E2=80=98xl create=E2=80=99 x86_64 type I get the following =
error:<span></span></span></p><p class=3D"gmail-MsoNormal" style=3D"line-he=
ight:16pt;margin:0in 0in 0.0001pt;font-family:Calibri"><span style=3D"font-=
family:&quot;Helvetica Neue&quot;;color:black"><br></span></p>

<p class=3D"gmail-MsoNormal" style=3D"line-height:16pt;margin:0in 0in 0.000=
1pt;font-family:Calibri"><span style=3D"color:black;font-family:Menlo">root=
@debianxen:/home/balvisio# xl -vvv create minios_pvh.cfg</span></p><p class=
=3D"gmail-MsoNormal" style=3D"line-height:16pt;margin:0in 0in 0.0001pt;font=
-family:Calibri"><span style=3D"color:black;font-family:Menlo">Parsing conf=
ig from
minios_pvh.cfg</span><br></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">libxl: debug:
libxl_create.c:1646:do_domain_create: Domain 0:ao 0x558d17c32c70: create:
how=3D(nil) callback=3D(nil) poller=3D0x558d17c32b30<span></span></span></p=
>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">libxl: debug:
libxl_create.c:987:initiate_domain_create: Domain 24:running bootloader<spa=
n></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">libxl: debug:
libxl_bootloader.c:335:libxl__bootloader_run: Domain 24:no bootloader
configured, using user supplied kernel<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">libxl: debug:
libxl_event.c:686:libxl__ev_xswatch_deregister: watch w=3D0x558d17c33d20:
deregister unregistered<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">domainbuilder: detail=
:
xc_dom_allocate: cmdline=3D&quot;&quot;, features=3D&quot;&quot;<span></spa=
n></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">domainbuilder: detail=
:
xc_dom_kernel_file: filename=3D&quot;/home/balvisio/mini-os/mini-os&quot;<s=
pan></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">domainbuilder: detail=
:
xc_dom_malloc_filemap=C2=A0=C2=A0=C2=A0 : 2367 kB<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">domainbuilder: detail=
:
xc_dom_boot_xen_init: ver 4.10, caps xen-3.0-x86_64 xen-3.0-x86_32p
hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-3.0-x86_64 <span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">domainbuilder: detail=
:
xc_dom_parse_image: called<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">domainbuilder: detail=
:
xc_dom_find_loader: trying multiboot-binary loader ... <span></span></span>=
</p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">domainbuilder: detail=
:
loader probe failed<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">domainbuilder: detail=
:
xc_dom_find_loader: trying HVM-generic loader ... <span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">domainbuilder: detail=
:
loader probe OK<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">xc: error: panic:
xc_dom_hvmloader.c:113: xc_dom_parse_hvm_kernel: ELF image is not 32bit:
Invalid kernel<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">libxl: error:
libxl_dom.c:718:libxl__build_dom: xc_dom_parse_image failed: No such file o=
r
directory<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">domainbuilder: detail=
:
xc_dom_release: called<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">libxl: error:
libxl_create.c:1246:domcreate_rebuild_done: Domain 24:cannot (re-)build dom=
ain:
-3<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">libxl: debug:
libxl_domain.c:1138:devices_destroy_cb: Domain 24:Forked pid 23698 for dest=
roy
of domain<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">libxl: debug:
libxl_create.c:1683:do_domain_create: Domain 0:ao 0x558d17c32c70: inprogres=
s:
poller=3D0x558d17c32b30, flags=3Di<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">libxl: debug:
libxl_event.c:1869:libxl__ao_complete: ao 0x558d17c32c70: complete, rc=3D-3=
<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">libxl: debug:
libxl_event.c:1838:libxl__ao__destroy: ao 0x558d17c32c70: destroy<span></sp=
an></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">libxl: debug:
libxl_domain.c:868:libxl_domain_destroy: Domain 24:ao 0x558d17c32c70: creat=
e:
how=3D(nil) callback=3D(nil) poller=3D0x558d17c32b30<span></span></span></p=
>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">libxl: error:
libxl_domain.c:1000:libxl__destroy_domid: Domain 24:Non-existant domain<spa=
n></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">libxl: error:
libxl_domain.c:959:domain_destroy_callback: Domain 24:Unable to destroy gue=
st<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">libxl: error:
libxl_domain.c:886:domain_destroy_cb: Domain 24:Destruction of domain faile=
d<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">libxl: debug:
libxl_event.c:1869:libxl__ao_complete: ao 0x558d17c32c70: complete, rc=3D-2=
1<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">libxl: debug:
libxl_domain.c:877:libxl_domain_destroy: Domain 24:ao 0x558d17c32c70:
inprogress: poller=3D0x558d17c32b30, flags=3Dic<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">libxl: debug:
libxl_event.c:1838:libxl__ao__destroy: ao 0x558d17c32c70: destroy<span></sp=
an></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">xencall:buffer: debug=
:
total allocations:78 total releases:78<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">xencall:buffer: debug=
:
current allocations:0 maximum allocations:3<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">xencall:buffer: debug=
:
cache current size:3<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">xencall:buffer: debug=
:
cache hits:64 misses:3 toobig:11<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">xencall:buffer: debug=
:
total allocations:0 total releases:0<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">xencall:buffer: debug=
:
current allocations:0 maximum allocations:0<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">xencall:buffer: debug=
:
cache current size:0<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"line-height:16pt;margin:0in 0in 0.000=
1pt;font-family:Calibri"><span style=3D"font-family:Menlo;color:black">xenc=
all:buffer: debug: cache hits:0 misses:0
toobig:0<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"line-height:16pt;margin:0in 0in 0.000=
1pt;font-family:Calibri"><span style=3D"font-family:Menlo;color:black"><spa=
n>=C2=A0</span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"line-height:16pt;margin:0in 0in 0.000=
1pt;font-family:Calibri"><span style=3D"font-family:Menlo;color:black">The =
config file used is:<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"line-height:16pt;margin:0in 0in 0.000=
1pt;font-family:Calibri"><span style=3D"font-family:Menlo;color:black"><spa=
n>=C2=A0</span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">type=3D&quot;pvh&quot=
;<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">memory=3D1024<span></=
span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">vcpu=3D2<span></span>=
</span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">name=3D&quot;minios&q=
uot;<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">kernel=3D&quot;/home/=
balvisio/mini-os/mini-os&quot;<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"line-height:16pt;margin:0in 0in 0.000=
1pt;font-family:Calibri"><span style=3D"font-family:&quot;Helvetica Neue&qu=
ot;;color:black"><span>=C2=A0</span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"line-height:16pt;margin:0in 0in 0.000=
1pt;font-family:Calibri"><span style=3D"font-family:&quot;Helvetica Neue&qu=
ot;;color:black">The minios elf file header
is:<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"line-height:16pt;margin:0in 0in 0.000=
1pt;font-family:Calibri"><span style=3D"font-family:&quot;Helvetica Neue&qu=
ot;;color:black"><span>=C2=A0</span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">root@debianxen:/home/=
balvisio/mini-os#
readelf -a mini-os<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">ELF Header:<span></sp=
an></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0 Magic:=C2=A0=
=C2=A0
7f 45 4c 46 02 01 01 00 00 00 00 00 00 00 00 00 <span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0 Class:=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ELF64<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0 Data:=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 2&#39;s complement,
little endian<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0 Version:=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 1 (current)<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0 OS/ABI:=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 UNIX - System V<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0 ABI Version:=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A00<span></span></s=
pan></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0 Type:=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 EXEC (Executable
file)<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0 Machine:=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 Advanced Micro
Devices X86-64<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0 Version:=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x1<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0 Entry point ad=
dress:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0x0<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0 Start of progr=
am headers:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 64 (bytes=
 into file)<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0 Start of secti=
on headers:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2422464 (=
bytes into file)<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0 Flags:=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 0x0<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0 Size of this h=
eader:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 64 (bytes)<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0 Size of progra=
m headers:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 56 (=
bytes)<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0 Number of prog=
ram headers:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2<span></span>=
</span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0 Size of sectio=
n headers:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 64 (=
bytes)<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-family:C=
alibri"><span style=3D"font-family:Menlo;color:black">=C2=A0 Number of sect=
ion headers:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 22<span></span=
></span></p>

<p class=3D"gmail-MsoNormal" style=3D"line-height:16pt;margin:0in 0in 0.000=
1pt;font-family:Calibri"><span style=3D"font-family:Menlo;color:black">=C2=
=A0
Section header string table index: 21<span></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"line-height:16pt;margin:0in 0in 0.000=
1pt;font-family:Calibri"><span style=3D"font-family:Menlo;color:black"><spa=
n>=C2=A0</span></span><span style=3D"color:black;font-family:Menlo">=C2=A0<=
/span></p>

<p class=3D"gmail-MsoNormal" style=3D"line-height:16pt;margin:0in 0in 0.000=
1pt"><span style=3D"color:black"><font face=3D"arial, helvetica, sans-serif=
">Is there any extra setup needed to launch
this type of domain?<span></span></font></span></p>

<p class=3D"gmail-MsoNormal" style=3D"line-height:16pt;margin:0in 0in 0.000=
1pt"><span style=3D"color:black"><span><font face=3D"arial, helvetica, sans=
-serif">Just in case, my host system is an x86_64 system.</font></span></sp=
an></p><p class=3D"gmail-MsoNormal" style=3D"line-height:16pt;margin:0in 0i=
n 0.0001pt"><span style=3D"color:black"><span><font face=3D"arial, helvetic=
a, sans-serif">=C2=A0</font></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"line-height:16pt;margin:0in 0in 0.000=
1pt"><span style=3D"color:black"><font face=3D"arial, helvetica, sans-serif=
">Happy New Year!<span></span></font></span></p>

<p class=3D"gmail-MsoNormal" style=3D"line-height:16pt;margin:0in 0in 0.000=
1pt"><span style=3D"color:black"><span><font face=3D"arial, helvetica, sans=
-serif">=C2=A0</font></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"line-height:16pt;margin:0in 0in 0.000=
1pt"><span style=3D"color:black"><font face=3D"arial, helvetica, sans-serif=
">Cheers,<span></span></font></span></p>

<p class=3D"gmail-MsoNormal" style=3D"line-height:16pt;margin:0in 0in 0.000=
1pt"><span style=3D"color:black"><span><font face=3D"arial, helvetica, sans=
-serif">=C2=A0</font></span></span></p>

<p class=3D"gmail-MsoNormal" style=3D"line-height:16pt;margin:0in 0in 0.000=
1pt"><span style=3D"color:black"><font face=3D"arial, helvetica, sans-serif=
">Bruno</font></span><span style=3D"font-family:&quot;Helvetica Neue&quot;;=
font-size:12pt;color:black"><span></span></span></p>

</div>

--001a11429284d937820561a463f3--


--===============5799778690924265769==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5799778690924265769==--
