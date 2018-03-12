From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 3/3] docs: Remove redundant
	qemu-xen-security document
Date: Mon, 12 Mar 2018 12:09:45 +0000
Message-ID: <c670dbad-3ab1-d53d-380e-94be6afdc6dc@citrix.com>
References: <20180309180356.8067-1-george.dunlap@citrix.com>
 <20180309180356.8067-3-george.dunlap@citrix.com>
 <alpine.DEB.2.10.1803111328210.23583@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------27775601B0269A19D62DD274"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=snkv=gc=citrix.com=prvs=602fbdb5d=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1evMH1-0007Ia-U6
 for xen-devel@lists.xenproject.org; Mon, 12 Mar 2018 12:09:51 +0000
In-Reply-To: <alpine.DEB.2.10.1803111328210.23583@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Lars Kurth <lars.kurth@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--------------27775601B0269A19D62DD274
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 03/11/2018 08:29 PM, Stefano Stabellini wrote:
> On Fri, 9 Mar 2018, George Dunlap wrote:
>> All this information is now covered in SUPPORT.md.
>>
>> Most of the emulated hardware is obvious a couple of the items are
>> worth pointing out specifically.
>>
>> "xen_disk" is listed under "Blkback"
>>
>> "...the PCI host bridge and the PIIX3 chipset...": This statement is
>> redundant -- the PCI host bridge is a part of the piix3 chipset, which
>> is listed as supported.
>>
>> xenfb: The "graphics" side of "xenfb" is listed under "PV Framebuffer
>> (backend)", and the "input" side of "xenfb" (including both keyboard
>> and mouse) is listed under "PV Keyboard (backend)".
>>
>> Backing storage image format is listed in the "Blkback" section.
>>
>> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
> 
> One thing: stdvga is still mispelled in SUPPORT.md.
> Anything else is fine.

So it is.  What about the attached?

 -George

--------------27775601B0269A19D62DD274
Content-Type: text/x-patch;
	name="0001-docs-Remove-redundant-qemu-xen-security-document.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0001-docs-Remove-redundant-qemu-xen-security-document.patch"

>From 6b41d5c33b95f55fd16b259f58a3852a6cce13f9 Mon Sep 17 00:00:00 2001
From: George Dunlap <george.dunlap@citrix.com>
Date: Fri, 9 Mar 2018 11:04:18 +0000
Subject: [PATCH] docs: Remove redundant qemu-xen-security document

All this information is now covered in SUPPORT.md.

Most of the emulated hardware is obvious a couple of the items are
worth pointing out specifically.

"xen_disk" is listed under "Blkback"

"...the PCI host bridge and the PIIX3 chipset...": This statement is
redundant -- the PCI host bridge is a part of the piix3 chipset, which
is listed as supported.

xenfb: The "graphics" side of "xenfb" is listed under "PV Framebuffer
(backend)", and the "input" side of "xenfb" (including both keyboard
and mouse) is listed under "PV Keyboard (backend)".

Backing storage image format is listed in the "Blkback" section.

Fix 'stdvga' spelling while we're here.

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
v2:
- Fix stdvgga spelling.

CC: Ian Jackson <ian.jackson@citrix.com>
CC: Wei Liu <wei.liu2@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Tim Deegan <tim@xen.org>
CC: Konrad Wilk <konrad.wilk@oracle.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien.grall@arm.com>
CC: Anthony Perard <anthony.perard@citrix.com>
CC: Lars Kurth <lars.kurth@citrix.com>
---
 SUPPORT.md                  |  2 +-
 docs/misc/qemu-xen-security | 21 ---------------------
 2 files changed, 1 insertion(+), 22 deletions(-)
 delete mode 100644 docs/misc/qemu-xen-security

diff --git a/SUPPORT.md b/SUPPORT.md
index ee65d45b24..9ac1a40036 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -645,7 +645,7 @@ See the section **Blkback** for image formats supported by QEMU.
 ### x86/Emulated graphics (QEMU):
 
     Status, cirrus-vga: Supported
-    Status, stgvga: Supported
+    Status, stdvga: Supported
 
 ### x86/Emulated audio (QEMU):
 
diff --git a/docs/misc/qemu-xen-security b/docs/misc/qemu-xen-security
deleted file mode 100644
index 496f7eee7a..0000000000
--- a/docs/misc/qemu-xen-security
+++ /dev/null
@@ -1,21 +0,0 @@
-qemu-xen (git://xenbits.xen.org/qemu-xen.git) is only supported for
-security fixes when used together with the Xen hypervisor and only with
-a subset of all the possible QEMU emulators. Specifically:
-
-- network: e1000, rtl8139, virtio-net
-- storage: piix3 ide, ahci, xen_disk
-- backing storage image format: raw, qcow, qcow2, vhd
-- graphics: cirris-vga, stdvga and xenfb
-- audio: sb16, es1370, ac97
-- input: Xen PV keyboard and mouse (part of xenfb), USB and PS/2
-         keyboard and mouse
-- serial cards: UART 16550A
-
-Core components, such as the PCI host bridge and the PIIX3 chipset, are
-supported. All devices of one the above classes, which are not explicitly
-mentioned, are not supported. For example the ne2000 network card is not
-supported. 
-
-If you think that a specific emulated device should be supported, please
-contact the QEMU UPSTREAM maintainer and the Xen Security Team
-(security@xenproject.org).
-- 
2.16.2


--------------27775601B0269A19D62DD274
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------27775601B0269A19D62DD274--
