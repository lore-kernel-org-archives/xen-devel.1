Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA32DC55172
	for <xen-devel@archiver.kernel.org>; Sat,  1 Aug 2026 00:18:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1379722.1624165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpxQK-0001ob-Pw; Sat, 01 Aug 2026 00:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1379722.1624165; Sat, 01 Aug 2026 00:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpxQK-0001oU-Mc; Sat, 01 Aug 2026 00:17:56 +0000
Received: by outflank-mailman (input) for mailman id 1379722;
 Sat, 01 Aug 2026 00:17:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brchuckz@aol.com>) id 1wpxQJ-0001mv-Oj
 for xen-devel@lists.xenproject.org; Sat, 01 Aug 2026 00:17:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpxQJ-00AjYh-5k
 for xen-devel@lists.xenproject.org; Sat, 01 Aug 2026 02:17:55 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brchuckz@aol.com>)
 id 6a6d3ac2-5cb7-0a2a0a5109dd-0a2a4508975c-34
 for <xen-devel@lists.xenproject.org>; Sat, 01 Aug 2026 02:17:55 +0200
Received: from [98.137.65.31] (helo=sonic315-55.consmr.mail.gq1.yahoo.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brchuckz@aol.com>)
 id 6a6d3b31-f659-0a2a45080019-6289411f9b38-3
 for <xen-devel@lists.xenproject.org>; Sat, 01 Aug 2026 02:17:54 +0200
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.gq1.yahoo.com with HTTP; Sat, 1 Aug 2026 00:17:53 +0000
Received: by hermes--production-bf1-54b5569bdc-h5zdx (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 655a093bcead2c5289eeab02aa189b76; 
 Sat, 01 Aug 2026 00:17:48 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=a2048 header.d=aol.com header.i="@aol.com" header.h="From:To:Cc:Subject:Date:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1785543473; bh=ffO8qrCy0LABWluXubgddMD+88wzPHM657OWh8V4ys8=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=jBEsPlsKDZ9k3OFUK2pNIuuFEyLSfjnjdOdeflcM4v+Iuc+0ClVkgXoYY/svRgtXdwNMMOj5MxOZzCh8OmgbY05QVK7S0EQVGjXbA/z0TYifQ6HcBjHU7kgvrYZlcXXUgcasTrSMBef8IPLNQJzA1c3dZrOwwfT1GUOxrxpIcdH68v/rVwh3X5dg2DoRJ0B5ELph6O7Xw/uWzQnlZhJCUP57DHZOhKlwU2ZBnNVw54WnfS/rG6B0KSefzZ1+LQpi19a8OptFY2UaizDVK2r97xYvtolsNxAvwQSgzXcTksXj6WSi89UqeAOw+Je11P3+Sn5RlyEgAWTRoMOXhhcYAA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1785543473; bh=kuDA4OeFX9PVEeDeut7LzAaV7cmzKLjJEjtDq8yrl7C=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=ah8qZSRF+83WizDbIeD1p/nOf1ufgUYy9ODrru1BhoHk1bID+XlbapZJlK3nbaEjkGYa2JYpJIwmpq9KS64VbJ/kRqruWPxXwU4P+SEaNXeBgQ+4ujW25yJyAZo2Las9zn+Gv7l9naY5dgBtpGhC45RjRiQcyEeASAkrn0bBPySmU4VARCFcruGUBwELyWmhgZkAcp9Bm0ms3qFO5tGQWGildXOTgCOnvgNsSA0rRYoFR8t86XxCI5elBvaGeb4Q1ccTAbd9eMk6gWXZoQQwvYUTx4udbL6DgKjwCX6WbogjCfnmMo79/UF67QimBgljSOZVEJuypPLTvnrpRK9oCQ==
X-YMail-OSG: .NpycOsVM1n53CI.4.B7xsmBIgwyCi_2EPd5rWydy.y4Jx4SOCYE2eEJ5PUQZ3k
 yPsyl_7JvTWTXRpTdq4LYYGUNXjMQfAv4eKdwrpnKtHYCo9PNJntOrIFdkkgXGsJtYUHf_EFo4Wg
 t6_b.9REPKN9Hm8ov46q5b584SuQyo8V38u.VHTBAZ3sNd6Lsv32a2e_N9gmiap71hcSlLyPZRVD
 LdR5O6wdUt8cYkVbHcwLOO2ql6UXi0E3ecZ_4VPh1IS708crJmcrx3_4H9Zqx0Er5q6ypDOdoy6a
 aB4De4X7.PzHhxyLJwAB4D1oDsZkpppMk34TXVQXj7XsD0NZSQSTBAg7fdHAVMHMUYiWTtD1aay1
 _Z.Inm.TPl60eZ5wWeiIgkUtHe666jIny9S0LE6yB0X35ItXpNdJtbopxSh3wOp8Hzlw32vbrOCi
 Gr0O6QCHO4oEVKigOtlnOPuGYPuKAyYT9VQgZl3qzPcZBQFzpqdNXrx_8Uuy00TwSaav9RDQCG6N
 48m6jAN8aO2lzlYf6Nh62C9N3WeR78QfkOEuNFGEkIeHAn3hi3Sm2Q100c0.tm11pVQZ09c7UB40
 _YTZ5r2xqzelhc9iuNUXCQYCJWdSWQgrK4.SODSIRj5eeeW5jB9R2MC7CuVuEHRGp0BUqC1MFKgc
 eBULYVninRRrVEfHDzm8hU7TBPWoYB4ymiaW6RTPBegJpUH_nTvnNFrII2hi8ueffnmYmNzdivVU
 qA4TyibE0TGsUrDZImr6iGUwDqLFXuZHHdllEadGvzviJ2TDKgzhRy.L9UFzfXa65caBkZ6C6OfS
 lWtNV0ffqmVniZm8X3kh7JrZaenOVtYzE0u9SI8NZJd9QNFLiO3Fvw1OLXaV1RSc8tGcuDb4R.AH
 nfmmyIuUyMiTzUmHPhn4s3ila.2ot0DURu264JPjWLml2UL6p2XBJ1RvgHeTPErCiX8._cMVQHfb
 MBQQljgrx1dSJHxiMwqQWaC.8QKbUm1lYSm7Vh50bACkhzRiN.JOCaM5PhLxhKjjJ4Ovgbk.mJUu
 PtyobS.4uknqGkrFWSuQakYOtqcMxw2oxYaM5bp5auSwk7ExnLjSfB_RYp2CxeK3wQwlDKWYXfLT
 v8iiCd67R2vGvmu.f166JZqfHc3H4OE9Ua8yfmchOC8liPHIPBC6BrunMUh59oRphcDWfuKk4CLS
 ZONTkXuq.XcUoxVEj2TpZT.3WMvu2Sg3S2qfAs4U6oPkuZRK0UQL5KzsTPd99c8mgbLlBAp0K80E
 0k.LoaSq_sAvOXmBg.XNgRlKL2eVIih2lLaduFxuSnGrH9mLF5yRWqP21gIkZIS_JMQkln1E91aa
 nO8J6qUi5B3ZttmOcfniCcGld1Liwpjv6UZpeDNRBMg5IMM.iCZGGEEdr2w8pWtcALGTPo_goGEy
 UzIPXclVB3DRKqykBe0uJ6IEJauEGYpXj2CRww33kMFdSDvwriLv_iTZviDcHNTmyUyKJyDNUaQW
 X0OUJtLngRa04ZxAv4hQdTFqptK2TC2AAT9YKvPFFQATKbrgkY7QQq.EAGLnNazUJ.m37uk75DNY
 Gox2hTs2DiaD2RoDYYF1KmNUuKfu39Wy6oD_.rFp6lqXzx.n0QA.x6pVw7.CzirBwsjzYx2x4fxK
 TzPnMTcgZ2MqCJsGY.uqXi1RiuGuaqR53dglmzCnPKUM9KLkGBSHGWN9tKzcYAP3BaqDXffHMTIl
 RLxHrI9OJ3f1OYSYXPf2qIHEZIwPAFkikqhQRJNu04VvZV4PHdnFT2KA6gmRe4YApZbqP1w2TQAJ
 oOotujPdAIY4S.Mu6v6ojACnWD1o4iSlt.ATJkQMZm9pED4Vqm.SoZs4c_sWNhDckPfHJi8ZdR_K
 7KowPOpIlyz.vCu49qlDW6PWXl2iZkgsQQVprcFk03OgBldqz9EG6sc3btedLB2opDobiBH4aDx_
 gbWOOCXYEr9MmkbU9KZ60_5tuVxx7y79oR3Kua6giOCegMdtbd9YYLOuRFkg.UStCnnlyuSZgcZy
 vvIakHp9bk7rndw7SC9Y44sI.2HibJATn1Je6GSJfE5BEUSVmNtWsyqV83rqBcBPm9Dzj2oEkpdh
 _7E_mFC4M0xtu7U01UdOSHT0Dj5aqXBzK8N3KeQUD7ORBN3HptKdarioYdt5grFMFdfHdcfsm.o_
 uFz9HFDHN0X8bbi8t4wUYXn0GzUbbROQZgCUYerUBa6dzOQWPh3UA9dTyc8ksssz_h20Fpa_ZIzd
 lEwaKmNTiKXf.GliX5Y4OCHMCKabx_u3I482.U2XSexQKndZxRw--
X-Sonic-MF: <brchuckz@aol.com>
X-Sonic-ID: 8c31a32f-648a-4935-9991-1504277b6dc1
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Tomita Moeko <tomitamoeko@gmail.com>
Subject: [PATCH v4 5/6] xen/igd: implement support for extended VBT
Date: Fri, 31 Jul 2026 20:17:29 -0400
Message-ID: <20260801001737.16509-6-brchuckz@aol.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260801001737.16509-1-brchuckz@aol.com>
References: <20260801001737.16509-1-brchuckz@aol.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1785543475-D457487B-AEE13D86/0/0
X-purgate-type: clean
X-purgate-size: 14963

Newer devices with versions of the OpRegion >= 2 require an
extended bios table (VBT) in some cases and also in some cases
require modifications to the OpRegion for proper operation in
the guest. This is in contrast to legacy devices in which the
VBT is always embedded within the OpRegion.

This makes the current approach of providing only the unmodified
host OpRegion to the guest with no guest access to the VBT
insufficient for proper support of devices with OpRegion version
2 or higher and an extended VBT.

Support for extended VBT also depends on compatible support in
hvmloader. If such support is lacking in hvmloader, fall back to
the current protocol that does not provide support for extended VBT.

To implement support for extended VBT:

Instead of configuring the guest with access to the unmodified
host OpRegion via hypervisor mapping of the OpRegion from
the host to the guest, temporarily map the host OpRegion and
VBT into the guest, allowing the guest (hvmloader) to get copies
of the host OpRegion and VBT which hvmloader can modify as needed
to support cases that require modifications to the OpRegion.

In xen_pt_unregister_vga_regions(), do not try to unmap the OpRegion
in cases when the OpRegion is not mapped during normal operation of
the guest, and replace the constant '3' with the macro
XEN_PCI_INTEL_OPREGION_PAGES which is defined to be 3.
To implement this:

Use 'done = true' to end further processing when the OpRegion does
not need to be unmapped in xen_pt_unregister_vga_regions(), and use
'guest_supports_opregion2 = false' to end further processing when the
OpRegion does need to be unmapped in xen_pt_unregister_vga_regions().

The OpRegion 2+ support that can be provided by this patch and a
compatible patch to hvmloader is required to fix code 43 errors in
Windows guests that have an Intel IGD with extended VBT passed
through to the guest.

Link: https://lore.kernel.org/kvm/20211012124855.52463-1-colin.xu@gmail.com/
Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
---
Changes in v4:
  - v4 is the first version of the series that has this patch

The companion patch to hvmloader that is needed to make this patch take
effect is available here:

https://lore.kernel.org/qemu-devel/20260801000354.16446-1-brchuckz@aol.com/

 hw/xen/xen_pt_graphics.c | 231 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 223 insertions(+), 8 deletions(-)

diff --git a/hw/xen/xen_pt_graphics.c b/hw/xen/xen_pt_graphics.c
index a124233..3d2a94c 100644
--- a/hw/xen/xen_pt_graphics.c
+++ b/hw/xen/xen_pt_graphics.c
@@ -12,7 +12,26 @@
 static unsigned long igd_guest_opregion;
 static unsigned long igd_host_opregion;
 
+/*
+ * These are true until they are set to false when the guest first
+ * accesses the OpRegion address register for a read or write,
+ * respectively.
+ */
+static bool first_guest_opregion_read = true;
+static bool first_guest_opregion_write = true;
+
+static uint32_t guest_opregion_extra_writes;
+static bool guest_supports_opregion2 = false;
+static bool done = false;
+static unsigned long rvda; /* absolute host VBT address */
+static unsigned long vbt_guest_pgbase;
+static uint32_t vbt_nr_pages;
+
 #define XEN_PCI_INTEL_OPREGION_MASK 0xfff
+#define XEN_PCI_INTEL_OPREGION_PAGES 0x3
+#define XEN_PCI_INTEL_OPREGION_ENABLE_ACCESSED 0x1
+#define XEN_PCI_INTEL_OPREGION_DISABLE_ACCESS 0x0
+#define XEN_PCI_INTEL_OPREGION2_SUPPORT_MASK 0x1
 
 typedef struct VGARegion {
     int type;           /* Memory or port I/O */
@@ -117,11 +136,11 @@ int xen_pt_unregister_vga_regions(XenHostPCIDevice *dev)
         }
     }
 
-    if (igd_guest_opregion) {
+    if (!guest_supports_opregion2 && igd_guest_opregion) {
         ret = xc_domain_memory_mapping(xen_xc, xen_domid,
                 (unsigned long)(igd_guest_opregion >> XC_PAGE_SHIFT),
                 (unsigned long)(igd_host_opregion >> XC_PAGE_SHIFT),
-                3,
+                XEN_PCI_INTEL_OPREGION_PAGES,
                 DPCI_REMOVE_MAPPING);
         if (ret) {
             return ret;
@@ -239,7 +258,30 @@ void xen_pt_setup_vga(XenPCIPassthroughState *s, XenHostPCIDevice *dev,
 
 uint32_t igd_read_opregion(XenPCIPassthroughState *s)
 {
+    if (!igd_host_opregion)
+        /* We just work with LE. */
+        xen_host_pci_get_block(&s->real_device, XEN_PCI_INTEL_OPREGION,
+                               (uint8_t *)&igd_host_opregion, 4);
+
+    /*
+     * By returning igd_host_opregion here instead of 0, we can
+     * indicate to hvmloader that we support OpRegion 2.
+     *
+     * The conditions are there to prevent returning igd_host_opregion
+     * to guests that have a version of hvmloader that lacks support
+     * for OpRegion 2. We do this to maintain backward compatibility for
+     * guests with earlier versions of hvmloader that always expect us
+     * to return 0 instead of igd_host_opregion when igd_guest_opregion
+     * is not yet set to a non-zero value.
+     */
+    if (first_guest_opregion_read && !igd_guest_opregion &&
+        first_guest_opregion_write) {
+        first_guest_opregion_read = false;
+        return igd_host_opregion;
+    }
+
     uint32_t val = 0;
+    first_guest_opregion_read = false;
 
     if (!igd_guest_opregion) {
         return val;
@@ -251,21 +293,194 @@ uint32_t igd_read_opregion(XenPCIPassthroughState *s)
     return val;
 }
 
-#define XEN_PCI_INTEL_OPREGION_PAGES 0x3
-#define XEN_PCI_INTEL_OPREGION_ENABLE_ACCESSED 0x1
 void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val)
 {
     int ret;
 
-    if (igd_guest_opregion) {
+    /* hvmloader with OpRegion 2 support uses lsb of val to indicate support */
+    if ((val & XEN_PCI_INTEL_OPREGION2_SUPPORT_MASK) &&
+        first_guest_opregion_write) {
+        guest_supports_opregion2 = true;
+    } else if (first_guest_opregion_write) {
+        XEN_PT_LOG(&s->dev, "hvmloader lacks extended VBT support, "
+                   "continuing with legacy support only\n");
+    }
+
+    if ((!guest_supports_opregion2 && igd_guest_opregion) || done) {
         XEN_PT_LOG(&s->dev, "opregion register already been set, ignoring %x\n",
                    val);
         return;
     }
 
-    /* We just work with LE. */
-    xen_host_pci_get_block(&s->real_device, XEN_PCI_INTEL_OPREGION,
-            (uint8_t *)&igd_host_opregion, 4);
+    if (guest_supports_opregion2 && !first_guest_opregion_write) {
+        /*
+         * OpRegion 2 is supported and we are processing
+         * additional writes that the legacy protocol ignores.
+         *
+         * We should always return from this if block to prevent
+         * executing code below which is only for the first write
+         * when we map the host OpRegion into the guest.
+         */
+        guest_opregion_extra_writes++;
+        switch (guest_opregion_extra_writes) {
+        case 1:
+            /*
+             * Hvmloader expects us to store the value as the least
+             * significant DWORD of rvda.
+             */
+            rvda = (unsigned long)val;
+            break;
+        case 2:
+            /*
+             * Hvmloader expects us to store the value as the most
+             * significant DWORD of rvda and unmap the OpRegion if
+             * rvda is not equal to zero.
+             *
+             * If the unmapping fails, hvmloader will fall back to the
+             * behavior of older versions which simply map the OpRegion
+             * from the host to the guest without trying to configure
+             * the guest with OpRegion 2 with extended VBT support.
+             */
+            rvda |= (unsigned long)(val) << 32;
+            if (rvda) {
+                ret = xc_domain_memory_mapping(xen_xc, xen_domid,
+                                               (unsigned long)
+                                               (igd_guest_opregion >> XC_PAGE_SHIFT),
+                                               (unsigned long)
+                                               (igd_host_opregion >> XC_PAGE_SHIFT),
+                                               XEN_PCI_INTEL_OPREGION_PAGES,
+                                               DPCI_REMOVE_MAPPING);
+                if (ret) {
+                    XEN_PT_ERR(&s->dev, "[%d]:Can't unmap IGD host opregion:0x%lx"
+                               " from guest opregion:0x%lx.\n", ret,
+                               (unsigned long)(igd_host_opregion >> XC_PAGE_SHIFT),
+                               (unsigned long)(igd_guest_opregion >> XC_PAGE_SHIFT));
+                    rvda = 0;
+                    guest_supports_opregion2 = false;
+                }
+                ret = xc_domain_iomem_permission(xen_xc, xen_domid,
+                                                 (unsigned long)
+                                                 (igd_host_opregion >> XC_PAGE_SHIFT),
+                                                 XEN_PCI_INTEL_OPREGION_PAGES,
+                                                 XEN_PCI_INTEL_OPREGION_DISABLE_ACCESS);
+                if (ret) {
+                    XEN_PT_WARN(&s->dev, "[%d]:Can't disable access to IGD host"
+                                " OpRegion: 0x%x.\n", ret,
+                                (unsigned long)(igd_host_opregion >> XC_PAGE_SHIFT));
+                }
+            } else {
+                guest_supports_opregion2 = false;
+            }
+            break;
+        case 3:
+            /*
+             * Hvmloader expects us to store the value as the address
+             * to map the VBT to in the guest and to map the VBT at the
+             * provided address in the guest. Hvmloader encodes the number
+             * of pages to map in the least significant 12 bits of the
+             * provided address.
+             *
+             * If VBT verification fails, hvmloader can't determine if the
+             * VBT is mapped but corrupted or unmapped, so it crashes the
+             * guest as an unrecoverable error.
+             */
+
+            /* address (gfn) to map VBT to in the guest */
+            vbt_guest_pgbase = val >> XC_PAGE_SHIFT;
+            vbt_nr_pages = val & XEN_PCI_INTEL_OPREGION_MASK;
+            ret = xc_domain_iomem_permission(xen_xc, xen_domid,
+                                             (unsigned long)(rvda >> XC_PAGE_SHIFT),
+                                             vbt_nr_pages,
+                                             XEN_PCI_INTEL_OPREGION_ENABLE_ACCESSED);
+            if (ret) {
+                XEN_PT_ERR(&s->dev, "[%d]:Can't enable access to IGD host VBT:"
+                           " 0x%lx.\n", ret,
+                           (unsigned long)(rvda >> XC_PAGE_SHIFT)),
+                rvda = 0;
+                vbt_guest_pgbase = 0;
+                vbt_nr_pages = 0;
+                done = true;
+                break;
+            }
+            ret = xc_domain_memory_mapping(xen_xc, xen_domid,
+                                           (unsigned long)vbt_guest_pgbase,
+                                           (unsigned long)(rvda >> XC_PAGE_SHIFT),
+                                           vbt_nr_pages, DPCI_ADD_MAPPING);
+            if (ret) {
+                XEN_PT_ERR(&s->dev, "[%d]:Can't map IGD host VBT:0x%lx to"
+                           " guest VBT:0x%lx.\n", ret,
+                           (unsigned long)(rvda >> XC_PAGE_SHIFT),
+                           (unsigned long)vbt_guest_pgbase);
+                rvda = 0;
+                vbt_guest_pgbase = 0;
+                vbt_nr_pages = 0;
+                done = true;
+                break;
+            }
+            XEN_PT_LOG(&s->dev, "Map VBT: 0x%lx -> 0x%lx\n",
+                       (unsigned long)(rvda >> XC_PAGE_SHIFT),
+                       (unsigned long)vbt_guest_pgbase);
+            XEN_PT_LOG(&s->dev, "VBT host address: 0x%lx\n", rvda);
+            break;
+        case 4:
+            /*
+             * Hvmloader expects us to store the given value as the
+             * final value for the register that stores the OpRegion
+             * address in the guest. We also unmap the VBT since the
+             * guest now has its own copy of both it and the OpRegion.
+             *
+             * If the unmapping fails the VBT will be mapped where
+             * hvmloader needs to place the OpRegion plus VBT in the
+             * guest E820 map. In this case, hvmloader will crash with
+             * BUG() rather than try to use the mapped VBT with the
+             * guest's copy of the OpRegion.
+             */
+            igd_guest_opregion = val;
+            ret = xc_domain_memory_mapping(xen_xc, xen_domid,
+                                           (unsigned long)vbt_guest_pgbase,
+                                           (unsigned long)(rvda >> XC_PAGE_SHIFT),
+                                           vbt_nr_pages, DPCI_REMOVE_MAPPING);
+            if (ret) {
+                XEN_PT_ERR(&s->dev, "[%d]:Can't unmap IGD host VBT:0x%lx from"
+                           " guest VBT:0x%lx.\n", ret,
+                           (unsigned long)(rvda >> XC_PAGE_SHIFT),
+                           (unsigned long)vbt_guest_pgbase);
+                rvda = 0;
+                done = true;
+                break;
+            }
+
+            ret = xc_domain_iomem_permission(xen_xc, xen_domid,
+                                             (unsigned long)(rvda >> XC_PAGE_SHIFT),
+                                             vbt_nr_pages,
+                                             XEN_PCI_INTEL_OPREGION_DISABLE_ACCESS);
+            if (ret) {
+                XEN_PT_WARN(&s->dev, "[%d]:Can't disable access to IGD host"
+                            " VBT: 0x%x.\n", ret,
+                            (unsigned long)(rvda >> XC_PAGE_SHIFT));
+            }
+
+            done = true;
+            break;
+        default:
+            break;
+        }
+        return;
+    }
+
+    /*
+     * This code handles the first write to the register from the guest.
+     * It maps the host OpRegion into the guest.
+     *
+     * Set first_guest_opregion_write to false to enable more writes
+     * if OpRegion 2 is supported.
+     */
+    first_guest_opregion_write = false;
+
+    if (!igd_host_opregion)
+        /* We just work with LE. */
+        xen_host_pci_get_block(&s->real_device, XEN_PCI_INTEL_OPREGION,
+                               (uint8_t *)&igd_host_opregion, 4);
     igd_guest_opregion = (unsigned long)(val & ~XEN_PCI_INTEL_OPREGION_MASK)
                             | (igd_host_opregion & XEN_PCI_INTEL_OPREGION_MASK);
 
-- 
2.52.0


