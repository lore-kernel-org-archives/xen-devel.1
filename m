From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [Xen 4.12 bug] HVM/PVH boot confusion
Date: Tue, 29 Jan 2019 19:49:51 +0000
Message-ID: <5c7ab977-8b31-4266-188e-e0bb045ca085@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1267455176270907943=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel List <xen-devel@lists.xen.org>
Cc: Juergen Gross <JGross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============1267455176270907943==
Content-Type: multipart/alternative;
	boundary="------------4A9A24F9D43D1E0071E12AD2"
Content-Language: en-GB

--------------4A9A24F9D43D1E0071E12AD2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hello,

Given the following vm.cfg file:

name="vm"
type="hvm"

vcpus=4
memory=1024

firmware_override="/root/xen-syms"

kernel="/boot/vmlinuz-4.4-xen"
ramdisk="/boot/initrd-4.4.0+10.img"

cmdline="console=xen,pv dom0=pv --- earlyprintk=xen"

Xen crashes with the following trace:

(d15) (XEN) Xen BUG at pvh-boot.c:82
(d15) (XEN) ----[ Xen-4.12.0-rc  x86_64  debug=y   Not tainted ]----
(d15) (XEN) CPU:    0
(d15) (XEN) RIP:    e008:[<ffff82d0804331f2>] pvh_init+0x27d/0x2fe
<snip>
(d15) (XEN) Xen call trace:
(d15) (XEN)    [<ffff82d0804331f2>] pvh_init+0x27d/0x2fe
(d15) (XEN)    [<ffff82d080429000>] __start_xen+0x14c/0x28f6
(d15) (XEN)    [<ffff82d0802000f3>] __high_start+0x53/0x55
(d15) (XEN)
(d15) (XEN)
(d15) (XEN) ****************************************
(d15) (XEN) Panic on CPU 0:
(d15) (XEN) Xen BUG at pvh-boot.c:82
(d15) (XEN) ****************************************

The problem is that Xen is started at its PVH entrypoint (contrary to
the instructions in the vm config file), and Xen unconditionally expects
RSDP to be passed.

There are at least two bugs here.

1) RSDP was a late addition to the PVH boot protocol.  Xen's PVH
entrypoint must not mandate its existence, because there are releases of
the domain builder which don't provide it.

2) The HVM/PVH boot confusion.  This think this is a still-outstanding
bug around the broken assumption that the hvmloader binary speaks the
PVH protocol without advertising itself appropriately (I really regret
not objecting to those patches before they went in).  At the least, that
needs fixing by putting a proper ELF note in hvmloader, and the domain
builder needs to be updated to build all PVH-boot-ABI images consistently.

I don't have time to look into this at the moment, if anyone fancies
trying to fix these issues.

~Andrew

--------------4A9A24F9D43D1E0071E12AD2
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hello,<br>
    <br>
    Given the following vm.cfg file:<br>
    <br>
    name="vm"<br>
    type="hvm"<br>
    <br>
    vcpus=4<br>
    memory=1024<br>
    <br>
    firmware_override="/root/xen-syms"<br>
    <br>
    kernel="/boot/vmlinuz-4.4-xen"<br>
    ramdisk="/boot/initrd-4.4.0+10.img"<br>
    <br>
    cmdline="console=xen,pv dom0=pv --- earlyprintk=xen"<br>
    <br>
    Xen crashes with the following trace:<br>
    <br>
    <pre>(d15) (XEN) Xen BUG at pvh-boot.c:82
(d15) (XEN) ----[ Xen-4.12.0-rc  x86_64  debug=y   Not tainted ]----
(d15) (XEN) CPU:    0
(d15) (XEN) RIP:    e008:[&lt;ffff82d0804331f2&gt;] pvh_init+0x27d/0x2fe
&lt;snip&gt;
(d15) (XEN) Xen call trace:
(d15) (XEN)    [&lt;ffff82d0804331f2&gt;] pvh_init+0x27d/0x2fe
(d15) (XEN)    [&lt;ffff82d080429000&gt;] __start_xen+0x14c/0x28f6
(d15) (XEN)    [&lt;ffff82d0802000f3&gt;] __high_start+0x53/0x55
(d15) (XEN)
(d15) (XEN)
(d15) (XEN) ****************************************
(d15) (XEN) Panic on CPU 0:
(d15) (XEN) Xen BUG at pvh-boot.c:82
(d15) (XEN) ****************************************

</pre>
    The problem is that Xen is started at its PVH entrypoint (contrary
    to the instructions in the vm config file), and Xen unconditionally
    expects RSDP to be passed.<br>
    <br>
    There are at least two bugs here.<br>
    <br>
    1) RSDP was a late addition to the PVH boot protocol.  Xen's PVH
    entrypoint must not mandate its existence, because there are
    releases of the domain builder which don't provide it.<br>
    <br>
    2) The HVM/PVH boot confusion.  This think this is a
    still-outstanding bug around the broken assumption that the
    hvmloader binary speaks the PVH protocol without advertising itself
    appropriately (I really regret not objecting to those patches before
    they went in).  At the least, that needs fixing by putting a proper
    ELF note in hvmloader, and the domain builder needs to be updated to
    build all PVH-boot-ABI images consistently.<br>
    <br>
    I don't have time to look into this at the moment, if anyone fancies
    trying to fix these issues.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------4A9A24F9D43D1E0071E12AD2--


--===============1267455176270907943==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1267455176270907943==--
