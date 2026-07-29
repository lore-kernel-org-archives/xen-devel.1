Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEF9C53200
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 10:02:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375405.1622583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp17M-0005HW-A1; Wed, 29 Jul 2026 10:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375405.1622583; Wed, 29 Jul 2026 10:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp17M-0005GA-2B; Wed, 29 Jul 2026 10:02:28 +0000
Received: by outflank-mailman (input) for mailman id 1375405;
 Wed, 29 Jul 2026 10:02:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fad5345fc000e099@swg.vates.tech>)
 id 1wp17L-0004zi-2g
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 10:02:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp17K-007PyJ-Fk
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 12:02:26 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fad5345fc000e099@swg.vates.tech>)
 id 6a69cfb2-e002-0a2a0a5209dd-0a2a450bc730-0
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 12:02:26 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fad5345fc000e099@swg.vates.tech>)
 id 6a69cfb1-b7e8-0a2a450b0019-b9ff1c129c6d-5
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 12:02:26 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fad5345fc000e099.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 29 Jul 2026 10:02:23 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id AE84C8312C;
 Wed, 29 Jul 2026 12:02:22 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=96NWkxxoch+1tQ+w60+vezT9Zo68h4fHDKbXLcZcY90=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=VJRfeON/55NZj5XXICjtpRABtAImkmzuM0Mn7tl7U9vRDkiyYPoLP03ktG+oWYnV+FGwriyZB
 xOzI18PY65Sk62tVErtSC/9SMUuRyy20mfmKVfoUGhblhbiE2PjMNluE5QzdF7NkbxVjhaW8OpF
 oYBXfXL6hwMPhGDr2LORBsLDsIbkhwHCbQCMG7MZJIZPiqJmj77u5CMVIn0NUQK9P8zVXpcGxKr
 Y5ZR8+0lU/0bx7QdyIHoZvkNt4Z2DPgY3voCMNg9OyaaM4F4kLKvFQIL6rQvrJgiSRcCNM5+1ir
 2jYLBTgHD07nFfFei8QVPZHshzfk4ZITinCLTrrU0/1A==
X-Zone-Loop: dad82f4b7fba7d10c50f1c2840ddd18f50d62d11570d
x-campaign-type: default
x-transaction-id: edbbe2e1-6242-47b9-890b-dfa50c2f7f3c
x-swg-uid: 01-ced710f2-afb7-4de8-a08c-f954404b2a7f
X-Mailer: Sweego
Message-ID:
 <1785319343.8631fc262581453bbf619ec5b2062170.19fad5345fc000e099@vates.tech>
x-swg-bid: 1785319343.8631fc262581453bbf619ec5b2062170.19fad5345fc000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>
Subject: [PATCH 5/5] vtd: Move intremap table to xenheap
Date: Wed, 29 Jul 2026 11:59:47 +0200
In-Reply-To: <1785319236.8631fc262581453bbf619ec5b2062170.19fad51a4be000e099@vates.tech>
References: <1785319236.8631fc262581453bbf619ec5b2062170.19fad51a4be000e099@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1661.b7e19c699866e3d7.19fad534300.d10821a32adda283=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1785319342849
X-purgate-ID: tlsNG-42698a/1785319346-192CC9EA-4C0FA44B/0/0
X-purgate-type: clean
X-purgate-size: 13722

---=Part.1661.b7e19c699866e3d7.19fad534300.d10821a32adda283=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Interrupt remapping entries often needs to be accessed, and we're creating
pointers to it on demand, which brings a lot of complexity (e=2Eg
GET_IREMAP_ENTRY() macro), move it to xenheap such that it's persistently
mapped and we won't have to worry about mapping and unmapping individual
intremap table pages=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/drivers/passthrough/vtd/intremap=2Ec | 61 +++++++++-----------------
 xen/drivers/passthrough/vtd/iommu=2Eh    | 16 +------
 xen/drivers/passthrough/vtd/utils=2Ec    | 22 +++-------
 3 files changed, 26 insertions(+), 73 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/intremap=2Ec b/xen/drivers/passth=
rough/vtd/intremap=2Ec
index dd2788efd7=2E=2Efc683516cb 100644
--- a/xen/drivers/passthrough/vtd/intremap=2Ec
+++ b/xen/drivers/passthrough/vtd/intremap=2Ec
@@ -17,6 +17,7 @@
  * Copyright (C) Xiaohui Xin <xiaohui=2Exin@intel=2Ecom>
  */
=20
+#include <xen/mm=2Eh>
 #include <xen/irq=2Eh>
 #include <xen/sched=2Eh>
 #include <xen/iommu=2Eh>
@@ -208,21 +209,19 @@ static void update_irte(struct vtd_iommu *iommu, str=
uct iremap_entry *entry,
 /* Mark specified intr remap entry as free */
 static void free_remap_entry(struct vtd_iommu *iommu, int index)
 {
-    struct iremap_entry *iremap_entry =3D NULL, *iremap_entries, new_ire =
=3D { };
+    struct iremap_entry *iremap_entry =3D NULL, new_ire =3D { };
=20
     if ( index < 0 || index > IREMAP_ENTRY_NR - 1 )
         return;
=20
     ASSERT(spin_is_locked(&iommu->intremap=2Elock));
=20
-    GET_IREMAP_ENTRY(iommu->intremap=2Emaddr, index,
-                     iremap_entries, iremap_entry);
+    iremap_entry =3D &iommu->intremap=2Eentries[index];
=20
     update_irte(iommu, iremap_entry, &new_ire, false);
     iommu_sync_cache(iremap_entry, sizeof(*iremap_entry));
     iommu_flush_iec_index(iommu, 0, index);
=20
-    unmap_vtd_domain_page(iremap_entries);
     iommu->intremap=2Enum--;
 }
=20
@@ -232,25 +231,13 @@ static void free_remap_entry(struct vtd_iommu *iommu=
, int index)
  */
 static unsigned int alloc_remap_entry(struct vtd_iommu *iommu, unsigned i=
nt nr)
 {
-    struct iremap_entry *iremap_entries =3D NULL;
     unsigned int i, found;
=20
     ASSERT(spin_is_locked(&iommu->intremap=2Elock));
=20
     for ( found =3D i =3D 0; i < IREMAP_ENTRY_NR; i++ )
     {
-        struct iremap_entry *p;
-        if ( i % (1 << IREMAP_ENTRY_ORDER) =3D=3D 0 )
-        {
-            /* This entry across page boundry */
-            if ( iremap_entries )
-                unmap_vtd_domain_page(iremap_entries);
-
-            GET_IREMAP_ENTRY(iommu->intremap=2Emaddr, i,
-                             iremap_entries, p);
-        }
-        else
-            p =3D &iremap_entries[i % (1 << IREMAP_ENTRY_ORDER)];
+        struct iremap_entry *p =3D &iommu->intremap=2Eentries[i];
=20
         if ( p->val ) /* not a free entry */
             found =3D 0;
@@ -258,9 +245,6 @@ static unsigned int alloc_remap_entry(struct vtd_iommu=
 *iommu, unsigned int nr)
             break;
     }
=20
-    if ( iremap_entries )
-        unmap_vtd_domain_page(iremap_entries);
-
     if ( i < IREMAP_ENTRY_NR )
         iommu->intremap=2Enum +=3D nr;
=20
@@ -270,7 +254,7 @@ static unsigned int alloc_remap_entry(struct vtd_iommu=
 *iommu, unsigned int nr)
 static int remap_entry_to_ioapic_rte(
     struct vtd_iommu *iommu, int index, struct IO_APIC_route_entry *old_r=
te)
 {
-    struct iremap_entry *iremap_entry =3D NULL, *iremap_entries;
+    struct iremap_entry *iremap_entry =3D NULL;
     unsigned long flags;
=20
     if ( index < 0 || index > IREMAP_ENTRY_NR - 1 )
@@ -283,15 +267,13 @@ static int remap_entry_to_ioapic_rte(
=20
     spin_lock_irqsave(&iommu->intremap=2Elock, flags);
=20
-    GET_IREMAP_ENTRY(iommu->intremap=2Emaddr, index,
-                     iremap_entries, iremap_entry);
+    iremap_entry =3D &iommu->intremap=2Eentries[index];
=20
     if ( iremap_entry->val =3D=3D 0 )
     {
         dprintk(XENLOG_ERR VTDPREFIX,
                 "IO-APIC index (%d) has an empty entry\n",
                 index);
-        unmap_vtd_domain_page(iremap_entries);
         spin_unlock_irqrestore(&iommu->intremap=2Elock, flags);
         return -EFAULT;
     }
@@ -309,7 +291,6 @@ static int remap_entry_to_ioapic_rte(
         old_rte->dest=2Elogical=2Elogical_dest =3D iremap_entry->remap=2E=
dst >> 8;
     }
=20
-    unmap_vtd_domain_page(iremap_entries);
     spin_unlock_irqrestore(&iommu->intremap=2Elock, flags);
=20
     return 0;
@@ -319,7 +300,7 @@ static int ioapic_rte_to_remap_entry(struct vtd_iommu =
*iommu,
     int apic, unsigned int ioapic_pin, struct IO_APIC_route_entry *old_rt=
e,
     struct IO_APIC_route_entry new_rte)
 {
-    struct iremap_entry *iremap_entry =3D NULL, *iremap_entries;
+    struct iremap_entry *iremap_entry =3D NULL;
     struct iremap_entry new_ire;
     struct IO_APIC_route_remap_entry *remap_rte;
     int index;
@@ -347,8 +328,7 @@ static int ioapic_rte_to_remap_entry(struct vtd_iommu =
*iommu,
         return -EFAULT;
     }
=20
-    GET_IREMAP_ENTRY(iommu->intremap=2Emaddr, index,
-                     iremap_entries, iremap_entry);
+    iremap_entry =3D &iommu->intremap=2Eentries[index];
=20
     new_ire =3D *iremap_entry;
=20
@@ -388,7 +368,6 @@ static int ioapic_rte_to_remap_entry(struct vtd_iommu =
*iommu,
     iommu_sync_cache(iremap_entry, sizeof(*iremap_entry));
     iommu_flush_iec_index(iommu, 0, index);
=20
-    unmap_vtd_domain_page(iremap_entries);
     spin_unlock_irqrestore(&iommu->intremap=2Elock, flags);
     return 0;
 }
@@ -500,7 +479,7 @@ static int msi_msg_to_remap_entry(
     struct vtd_iommu *iommu, struct pci_dev *pdev,
     struct msi_desc *msi_desc, struct msi_msg *msg)
 {
-    struct iremap_entry *iremap_entry =3D NULL, *iremap_entries, new_ire =
=3D { };
+    struct iremap_entry *iremap_entry =3D NULL, new_ire =3D { };
     struct msi_msg_remap_entry *remap_rte;
     unsigned int index, i, nr =3D 1;
     unsigned long flags;
@@ -556,8 +535,7 @@ static int msi_msg_to_remap_entry(
         return -EFAULT;
     }
=20
-    GET_IREMAP_ENTRY(iommu->intremap=2Emaddr, index,
-                     iremap_entries, iremap_entry);
+    iremap_entry =3D &iommu->intremap=2Eentries[index];
=20
     if ( !pi_desc )
     {
@@ -604,7 +582,6 @@ static int msi_msg_to_remap_entry(
     iommu_sync_cache(iremap_entry, sizeof(*iremap_entry));
     iommu_flush_iec_index(iommu, 0, index);
=20
-    unmap_vtd_domain_page(iremap_entries);
     spin_unlock_irqrestore(&iommu->intremap=2Elock, flags);
=20
     return alloc;
@@ -628,7 +605,7 @@ int __init cf_check intel_setup_hpet_msi(struct msi_de=
sc *msi_desc)
     unsigned long flags;
     int rc =3D 0;
=20
-    if ( !iommu->intremap=2Emaddr )
+    if ( !iommu->intremap=2Eentries )
         return 0;
=20
     spin_lock_irqsave(&iommu->intremap=2Elock, flags);
@@ -663,7 +640,7 @@ int enable_intremap(struct vtd_iommu *iommu, int eim)
     sts =3D dmar_readl(iommu->reg, DMAR_GSTS_REG);
=20
     /* Return if already enabled by Xen */
-    if ( (sts & DMA_GSTS_IRES) && iommu->intremap=2Emaddr )
+    if ( (sts & DMA_GSTS_IRES) && iommu->intremap=2Eentries )
         return 0;
=20
     if ( !(sts & DMA_GSTS_QIES) )
@@ -679,16 +656,18 @@ int enable_intremap(struct vtd_iommu *iommu, int eim=
)
                " Compatibility Format Interrupts permitted on IOMMU #%u:"
                " Device pass-through will be insecure\n", iommu->index);
=20
-    if ( iommu->intremap=2Emaddr =3D=3D 0 )
+    if ( !iommu->intremap=2Eentries )
     {
-        iommu->intremap=2Emaddr =3D alloc_pgtable_maddr(IREMAP_ARCH_PAGE_=
NR,
-                                                    iommu->node);
-        if ( iommu->intremap=2Emaddr =3D=3D 0 )
+        iommu->intremap=2Eentries =3D
+            alloc_xenheap_pages(get_order_from_pages(IREMAP_ARCH_PAGE_NR)=
,
+                                                     MEMF_node(iommu->nod=
e));
+        if ( !iommu->intremap=2Eentries )
         {
             dprintk(XENLOG_WARNING VTDPREFIX,
-                    "Cannot allocate memory for ir_ctrl->iremap_maddr\n")=
;
+                    "Cannot allocate memory for iommu->intremap=2Eentries=
\n");
             return -ENOMEM;
         }
+        memset(iommu->intremap=2Eentries, 0, IREMAP_ARCH_PAGE_NR * PAGE_S=
IZE);
=20
         iommu->intremap=2Enum =3D 0;
     }
@@ -700,7 +679,7 @@ int enable_intremap(struct vtd_iommu *iommu, int eim)
      * Interrupt Mode=2E
      */
     dmar_writeq(iommu->reg, DMAR_IRTA_REG,
-                iommu->intremap=2Emaddr | IRTA_REG_TABLE_SIZE |
+                virt_to_maddr(iommu->intremap=2Eentries) | IRTA_REG_TABLE=
_SIZE |
                 (eim ? IRTA_EIME : 0));
=20
     /* set SIRTP */
diff --git a/xen/drivers/passthrough/vtd/iommu=2Eh b/xen/drivers/passthrou=
gh/vtd/iommu=2Eh
index ccb00889d7=2E=2E0cd2c2ef3a 100644
--- a/xen/drivers/passthrough/vtd/iommu=2Eh
+++ b/xen/drivers/passthrough/vtd/iommu=2Eh
@@ -357,20 +357,6 @@ struct iremap_entry {
 #define iremap_set_present(v) do {(v)=2Elo |=3D 1;} while(0)
 #define iremap_clear_present(v) do {(v)=2Elo &=3D ~1;} while(0)
=20
-/*
- * Get the intr remap entry:
- * maddr   - machine addr of the table
- * index   - index of the entry
- * entries - return addr of the page holding this entry, need unmap it
- * entry   - return required entry
- */
-#define GET_IREMAP_ENTRY(maddr, index, entries, entry)                   =
     \
-do {                                                                     =
     \
-    entries =3D (struct iremap_entry *)map_vtd_domain_page(              =
       \
-              (maddr) + (( (index) >> IREMAP_ENTRY_ORDER ) << PAGE_SHIFT =
) ); \
-    entry =3D &entries[(index) % (1 << IREMAP_ENTRY_ORDER)];             =
       \
-} while(0)
-
 /* queue invalidation entry */
 struct qinval_entry {
     union {
@@ -491,7 +477,7 @@ struct vtd_iommu {
     uint64_t qinval_maddr;   /* queue invalidation page machine address *=
/
=20
     struct {
-        uint64_t maddr;   /* interrupt remap table machine address */
+        struct iremap_entry *entries; /* interrupt remap table entries */
         unsigned int num; /* total num of used interrupt remap entry */
         spinlock_t lock;  /* lock for irq remapping table */
     } intremap;
diff --git a/xen/drivers/passthrough/vtd/utils=2Ec b/xen/drivers/passthrou=
gh/vtd/utils=2Ec
index 7c4d032f4f=2E=2E3ae4d35e2d 100644
--- a/xen/drivers/passthrough/vtd/utils=2Ec
+++ b/xen/drivers/passthrough/vtd/utils=2Ec
@@ -187,11 +187,12 @@ void cf_check vtd_dump_iommu_info(unsigned char key)
         {
             /* Dump interrupt remapping table=2E */
             uint64_t irta =3D dmar_readq(iommu->reg, DMAR_IRTA_REG);
-            uint64_t iremap_maddr =3D irta & PAGE_MASK;
             unsigned int nr_entry =3D 1 << ((irta & 0xF) + 1);
-            struct iremap_entry *iremap_entries =3D NULL;
             unsigned int print_cnt =3D 0;
=20
+            /* Hardware must be using the same table as us=2E */
+            ASSERT((irta & PAGE_MASK) =3D=3D virt_to_maddr(iommu->intrema=
p=2Eentries));
+
             printk("  Interrupt remapping table (nr_entry=3D%#x=2E "
                 "Only dump P=3D1 entries here):\n", nr_entry);
             printk("R means remapped format, P means posted format=2E\n")=
;
@@ -199,18 +200,7 @@ void cf_check vtd_dump_iommu_info(unsigned char key)
             printk("P:       SVT  SQ   SID  V  AVL FPD              PDA  =
URG P\n");
             for ( i =3D 0; i < nr_entry; i++ )
             {
-                struct iremap_entry *p;
-                if ( i % (1 << IREMAP_ENTRY_ORDER) =3D=3D 0 )
-                {
-                    /* This entry across page boundry */
-                    if ( iremap_entries )
-                        unmap_vtd_domain_page(iremap_entries);
-
-                    GET_IREMAP_ENTRY(iremap_maddr, i,
-                                     iremap_entries, p);
-                }
-                else
-                    p =3D &iremap_entries[i % (1 << IREMAP_ENTRY_ORDER)];
+                struct iremap_entry *p =3D &iommu->intremap=2Eentries[i];
=20
                 if ( !p->remap=2Ep )
                     continue;
@@ -231,8 +221,6 @@ void cf_check vtd_dump_iommu_info(unsigned char key)
=20
                 print_cnt++;
             }
-            if ( iremap_entries )
-                unmap_vtd_domain_page(iremap_entries);
             if ( iommu->intremap=2Enum !=3D print_cnt )
                 printk("Warning: Print %u IRTE (actually have %u)!\n",
                         print_cnt, iommu->intremap=2Enum);
@@ -251,7 +239,7 @@ void cf_check vtd_dump_iommu_info(unsigned char key)
         {
             iommu =3D ioapic_to_iommu(mp_ioapics[apic]=2Empc_apicid);
=20
-            if ( !iommu->intremap=2Emaddr || !iommu->intremap=2Enum )
+            if ( !iommu->intremap=2Eentries || !iommu->intremap=2Enum )
                 continue;
=20
             printk( "\nRedirection table of IOAPIC %x:\n", apic);
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.1661.b7e19c699866e3d7.19fad534300.d10821a32adda283=---

