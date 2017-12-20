From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Problem with IOMEM and domain reboot
Date: Wed, 20 Dec 2017 18:27:02 +0200
Message-ID: <ebf78aec-dcfd-72d9-dac2-06b29e4a66ae@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------D5801BDF1013BA325F9C5294"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ttav=dq=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1eRhD2-0002E5-J4
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2017 16:27:08 +0000
Received: by mail-lf0-x22f.google.com with SMTP id j124so24715006lfg.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2017 08:27:06 -0800 (PST)
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, ian.jackson@eu.citrix.com, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

This is a multi-part message in MIME format.
--------------D5801BDF1013BA325F9C5294
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi, all!

While trying to reboot a domain which has iomem configured
(we are passing through some devices), I found an issue,
that after domain reboot those iomem's are incorrectly re-mapped,
e.g. for the configuration snippet below fe960 -> 0.

Part of the domain config I use:
iomem=[
     "0xfd010,1@0xfd000",
     "fe960,8",
]

During domain creation:
libxl_create.c:210:libxl__domain_build_info_setdefault: iomem gfn fd000 
start fd010
libxl_create.c:210:libxl__domain_build_info_setdefault: iomem gfn 
ffffffffffffffff start fe960

which means that for fe960 initial value was set to LIBXL_INVALID_GFN
and then on domain configuration, 
tools/libxl/libxl_create.c:libxl__domain_build_info_setdefault:

     for (i = 0 ; i < b_info->num_iomem; i++)
         if (b_info->iomem[i].gfn == LIBXL_INVALID_GFN)
             b_info->iomem[i].gfn = b_info->iomem[i].start;

made that GFN for fe960 to be set to the correct value.

But during domain reboot I see that 
tools/xl/xl_vmcontrol.c:reload_domain_config
tries to replicate configuration from the original domain config
being rebooted, but that leads to iomem's GFN to be set to 0 (if configured
in form [IOMEM_START,NUM_PAGES], but for [IOMEM_START,NUM_PAGES[@GFN] it 
is ok):

iomem gfn fd000 start fd010
iomem gfn 0 start fe960

Thus, further domain restart procedure leads to invalid mapping, e.g. 
fe960 -> 0.

I created a patch which allowed me to reboot the domain, but I would love
to hear comments on what would be the proper fix.

Thank you,
Oleksandr


--------------D5801BDF1013BA325F9C5294
Content-Type: text/x-patch;
 name="0001-HACK-Reset-iomem-s-gfn-to-LIBXL_INVALID_GFN-on-reboo.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-HACK-Reset-iomem-s-gfn-to-LIBXL_INVALID_GFN-on-reboo.pa";
 filename*1="tch"

>From aa1f20af73a5a3c8f2c904b857a79334d18d41ff Mon Sep 17 00:00:00 2001
From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Date: Wed, 20 Dec 2017 17:51:18 +0200
Subject: [PATCH] [HACK] Reset iomem's gfn to LIBXL_INVALID_GFN on reboot

During domain reboot its configuration is partially reused
to re-create a new domain, but iomem's GFN field for the
iomem is only restored for those memory ranges, which are
configured in form of [IOMEM_START,NUM_PAGES[@GFN], but not for
those in form of [IOMEM_START,NUM_PAGES], e.g. without GFN.
For the latter GFN is reset to 0, but while mapping ranges
to a domain during reboot there is a check that GFN treated
as valid if it is not equal to LIBXL_INVALID_GFN, thus making
Xen to map IOMEM_START to address 0 in the guest's address space.

Workaround it by resseting GFN to LIBXL_INVALID_GFN, so xl
can set proper values for mapping on reboot.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 tools/libxl/libxl_domain.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/libxl/libxl_domain.c b/tools/libxl/libxl_domain.c
index ef1a0927b00d..2678ad2ad54f 100644
--- a/tools/libxl/libxl_domain.c
+++ b/tools/libxl/libxl_domain.c
@@ -1647,6 +1647,15 @@ int libxl_retrieve_domain_configuration(libxl_ctx *ctx, uint32_t domid,
         }
     }
 
+    /* reset IOMEM's GFN to initial value */
+    {
+        int i;
+
+        for (i = 0; i < d_config->b_info.num_iomem; i++)
+            if (d_config->b_info.iomem[i].gfn == 0)
+                d_config->b_info.iomem[i].gfn = LIBXL_INVALID_GFN;
+    }
+
     /* Devices: disk, nic, vtpm, pcidev etc. */
 
     /* The MERGE macro implements following logic:
-- 
2.7.4


--------------D5801BDF1013BA325F9C5294
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------D5801BDF1013BA325F9C5294--
