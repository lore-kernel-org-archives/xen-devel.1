Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4E3C5516F
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2026 15:33:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1379322.1624031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wppE7-0000iV-HI; Fri, 31 Jul 2026 15:32:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1379322.1624031; Fri, 31 Jul 2026 15:32:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wppE7-0000iO-DK; Fri, 31 Jul 2026 15:32:47 +0000
Received: by outflank-mailman (input) for mailman id 1379322;
 Fri, 31 Jul 2026 15:32:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fb8ce47f6000e099@swg.vates.tech>)
 id 1wppE6-0000iI-E0
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 15:32:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wppE0-00Emcu-2a
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 17:32:40 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fb8ce47f6000e099@swg.vates.tech>)
 id 6a6cc00f-5cb7-0a2a0a5109dd-0a2a450ac398-10
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 17:32:40 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fb8ce47f6000e099@swg.vates.tech>)
 id 6a6cc017-f2d2-0a2a450a0019-b9ff1c229b09-3
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 17:32:39 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fb8ce47f6000e099.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 31 Jul 2026 15:32:34 +0000
Received: from l14.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id A2E4B8310E;
 Fri, 31 Jul 2026 17:32:33 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=E74rtg7xvJElw5aFZgAvQQASAvQyMsRJ5/BdWO3+NuM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=OXXqSlzdt6viKU+J7nfRqMblI2u3zBF4aslkCWfaoUYgp20l3sWe6GtWLVmTNlMOK6q1yPZIE
 cn8IwoJmr487pe9scHjs9Fh5qEKnXkvsFd6+jAPTZp6F9PF0jv7IOCd2QoWHCF4Jm7zC6ccU4qP
 b5WLmxuJ+YWjvwr/mO/yU8OsXVSSjssFuAXE53vWQ+87BiZaQqt0EadmpKddlz4NoUU3x5APcXK
 2dyE8rtP0dhbbamFEEKNhgwr89scFkgS6GGeK4AUPsOR3M/zdjkJcsvidTr2NyT+CN1lU1j/cCg
 AbXmB47PxdmJiCWJ7L5oRo/E/xNMrjBrUGGixPfAcP6g==
X-Zone-Loop: 8faac2d88c4b1d02410f20e0c5670957f9367f422bbd
x-campaign-type: default
x-transaction-id: 9f909b2e-e8c8-4401-a03f-22e9c3d40a6f
x-swg-uid: 01-3633f46f-e195-40f0-917d-8641eb31be36
X-Mailer: Sweego
Message-ID:
 <1785511954.8631fc262581453bbf619ec5b2062170.19fb8ce47f6000e099@vates.tech>
x-swg-bid: 1785511954.8631fc262581453bbf619ec5b2062170.19fb8ce47f6000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Anthony PERARD <anthony.perard@vates.tech>
To: qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH] hw/xen-pt: Rework mapping of MSI-X related page
Date: Fri, 31 Jul 2026 17:32:05 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.190d.85dbe06311ba886a.19fb8ce456c.58c1da0940306110=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1785511953773
X-purgate-ID: tlsNG-4011c0/1785511960-5A7DACFC-51A1F1CF/0/0
X-purgate-type: clean
X-purgate-size: 3874

---=Part.190d.85dbe06311ba886a.19fb8ce456c.58c1da0940306110=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The mmap() call appears to only map the MSI-X entries but mmap will
map full pages, make that evident with ROUND_UP()=2E

pci_msix_read() will read past the current length given to mmap() as
the memory region "xen-pci-pt-msix" is been given a whole page as
size=2E

Also adjust the munmap() call to use the same length as used in
mmap()=2E And fix the pointer phys_iomem_base as it has been adjusted
with table_offset_adjust after the mmap() call=2E

Lastly, adjust the memory region "xen-pci-pt-msix" size with
msix->table_offset_adjust in case the offset isn't 0, and use ROUND_UP
instead of open coding it=2E

Signed-off-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>
---
 hw/xen/xen_pt_msi=2Ec | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/hw/xen/xen_pt_msi=2Ec b/hw/xen/xen_pt_msi=2Ec
index df15ccf0d030=2E=2Ef94f1adcd576 100644
--- a/hw/xen/xen_pt_msi=2Ec
+++ b/hw/xen/xen_pt_msi=2Ec
@@ -561,12 +561,6 @@ int xen_pt_msix_init(XenPCIPassthroughState *s, uint3=
2_t base)
         msix->msix_entry[i]=2Epirq =3D XEN_PT_UNASSIGNED_PIRQ;
     }
=20
-    memory_region_init_io(&msix->mmio, OBJECT(s), &pci_msix_ops,
-                          s, "xen-pci-pt-msix",
-                          (total_entries * PCI_MSIX_ENTRY_SIZE
-                           + XC_PAGE_SIZE - 1)
-                          & XC_PAGE_MASK);
-
     rc =3D xen_host_pci_get_long(hd, base + PCI_MSIX_TABLE, &table_off);
     if (rc) {
         XEN_PT_ERR(d, "Failed to read PCI_MSIX_TABLE field\n");
@@ -588,7 +582,9 @@ int xen_pt_msix_init(XenPCIPassthroughState *s, uint32=
_t base)
     msix->table_offset_adjust =3D table_off & 0x0fff;
     msix->phys_iomem_base =3D
         mmap(NULL,
-             total_entries * PCI_MSIX_ENTRY_SIZE + msix->table_offset_adj=
ust,
+             ROUND_UP(total_entries * PCI_MSIX_ENTRY_SIZE
+                      + msix->table_offset_adjust,
+                      XC_PAGE_SIZE),
              PROT_READ,
              MAP_SHARED | MAP_LOCKED,
              fd,
@@ -605,6 +601,13 @@ int xen_pt_msix_init(XenPCIPassthroughState *s, uint3=
2_t base)
     XEN_PT_LOG(d, "mapping physical MSI-X table to %p\n",
                msix->phys_iomem_base);
=20
+    memory_region_init_io(&msix->mmio, OBJECT(s), &pci_msix_ops,
+                          s, "xen-pci-pt-msix",
+                          ROUND_UP(total_entries * PCI_MSIX_ENTRY_SIZE
+                                   + msix->table_offset_adjust,
+                                   XC_PAGE_SIZE)
+                          - msix->table_offset_adjust);
+
     memory_region_add_subregion_overlap(&s->bar[bar_index], table_off,
                                         &msix->mmio,
                                         2); /* Priority: pci default + 1 =
*/
@@ -629,8 +632,10 @@ void xen_pt_msix_unmap(XenPCIPassthroughState *s)
     if (msix->phys_iomem_base) {
         XEN_PT_LOG(&s->dev, "unmapping physical MSI-X table from %p\n",
                    msix->phys_iomem_base);
-        munmap(msix->phys_iomem_base, msix->total_entries * PCI_MSIX_ENTR=
Y_SIZE
-               + msix->table_offset_adjust);
+        munmap(msix->phys_iomem_base - msix->table_offset_adjust,
+               ROUND_UP(msix->total_entries * PCI_MSIX_ENTRY_SIZE
+                        + msix->table_offset_adjust,
+                        XC_PAGE_SIZE));
     }
=20
     memory_region_del_subregion(&s->bar[msix->bar_index], &msix->mmio);


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.190d.85dbe06311ba886a.19fb8ce456c.58c1da0940306110=---

