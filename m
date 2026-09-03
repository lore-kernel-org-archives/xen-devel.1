Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1346C624A4
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 14:14:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407261.1640390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28D6-0006i3-5b; Thu, 03 Sep 2026 14:14:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407261.1640390; Thu, 03 Sep 2026 14:14:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28D6-0006hK-0o; Thu, 03 Sep 2026 14:14:36 +0000
Received: by outflank-mailman (input) for mailman id 1407261;
 Thu, 03 Sep 2026 14:14:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679ed87d000c4f3@swg.vates.tech>)
 id 1x28D3-0006R8-Tz
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 14:14:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x28D3-001H4c-AX
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 16:14:33 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679ed87d000c4f3@swg.vates.tech>)
 id 6a9980c3-2eae-0a2a0a5409dd-0a2a4506ae08-20
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:14:33 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679ed87d000c4f3@swg.vates.tech>)
 id 6a9980c0-195a-0a2a45060019-b9ff1c238775-8
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:14:33 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0679ed87d000c4f3.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 03 Sep 2026 14:14:18 +0000
Received: from julian.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id CF48B8400F;
 Thu,  3 Sep 2026 16:14:17 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=9x3EXxYPO7WpUDT21fZIhOifLMj2tjMarh2jBk7e3DU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=AeGq01d8R+kU3cs6YUzPsJKWAuirprXqvRt+LyGVvWjb4l6mvOPxQ9l6RXsRf8ML5WFtOhFiE
 k3F64rXkCqM52PeggiU8KCsuMIA4CVf5pbDLeGJOpOB7kJ5BFz7OjakikHFB4hdjMPLViecOXKn
 j8mFKQt6N2Mwrbu/pgcpkYqw0g47UzIIVG8RPKvERoFfbfvgij1k+8HvW9YyAnOFVr6Un4iA/1x
 pyFpzSDhggZDJmTqjkc0ja7Rp19HGFKwwPjd0Djd0DV9mApUFQK8Dn0WJDz1ULOsbXsL8KbXpCN
 Q/acgedcn5WbXGVzb3gTaOPABzJ4bj+Wkm5PFrQiKmjw==
X-Zone-Loop: e2860f3bf6f5c88daf4c29b74384454ffc27abbcc75f
x-campaign-type: default
x-transaction-id: 87ba8cff-7c68-402f-8f6a-a1082e0cd86e
x-swg-uid: 01-480ed2de-1b84-429f-93f3-a1548f6fd399
X-Mailer: Sweego
Message-ID:
 <1788444858.8631fc262581453bbf619ec5b2062170.1a0679ed87d000c4f3@vates.tech>
x-swg-bid: 1788444858.8631fc262581453bbf619ec5b2062170.1a0679ed87d000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH v5 07/11] x86/passthrough: Switch pt_irq_bind_msi() to raw MSI address/data
Date: Thu,  3 Sep 2026 16:14:05 +0200
In-Reply-To: <1788444605.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3@vates.tech>
References: <1788444605.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.35aa.daf7bf3a43bd1d0b.1a0679ed6ce.2c4e65cada2122c3=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788444858062
X-purgate-ID: tlsNG-16d1c6/1788444873-1ECC577B-49595DC8/0/0
X-purgate-type: clean
X-purgate-size: 18045

---=Part.35aa.daf7bf3a43bd1d0b.1a0679ed6ce.2c4e65cada2122c3=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Some hypervisors let a guest use the "Extended Destination ID" field of
the MSI address (and the IO-APIC RTE) to reach APIC IDs beyond the
architectural 8-bit destination field, extending the range from 8 to 15
bits (as supported by Linux since commit ab0f59c6f135)=2E This way an HVM
guest with APIC IDs above 254 can target an MSI or IO-APIC interrupt=2E
This series adds support for it, gated on the guest's device model
opting in=2E

Change pt_irq_bind_msi() (and struct hvm_gmsi_info) to store and operate
on the raw MSI address and data words instead of the pre-decoded
gvec/gflags pair=2E A new MSI_ADDR_DEST() helper extracts the combined
destination ID from an address, including the extended bits (address
11:5)=2E The extended part is always zero for the messages built here and
is only acted upon once the guest opts in=2E

pt_irq_bind_msi() now also rejects (-EINVAL) an address that isn't in
MSI format (0xfeexxxxx), so that every path storing into gmsi=2Eaddr, in
particular the raw-address device-model op, is guaranteed a well-formed
message=2E The function vpci_msi_update() already performed this check=2E

pt_irq_create_bind() keeps working for domctl callers by rebuilding a
raw MSI message from the gflags it is handed=2E vpci_msi_update() now
calls pt_irq_bind_msi() directly and msi_gflags() goes away=2E

The "already mapped" fast path now compares the full stored address and
data rather than just gvec/gflags=2E This is not a behavioural change: the
previous gvec/gflags pair was a loss-free re-encoding of exactly the
destination, delivery-mode, trigger-mode and vector bits that
address/data carry, so any message that would have compared equal before
still does, and messages differing only in bits that were previously
dropped now correctly trigger a re-program=2E

No functional change for existing (8-bit destination ID) guests=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v5:
- Retitled: "Switch pt_irq_bind_msi() to raw MSI address/data"
- struct hvm_gmsi_info stores addr/data, so msi_gflags() is gone and
  vpci_msi_update() calls pt_irq_bind_msi() directly=2E
- MSI_ADDR_DEST() derives its shift from a new MSI_ADDR_DEST_ID_WIDTH=2E
  The original MSI_ADDR_DEST_ID_* lines are left untouched=2E
- Removed the "Intel convention" wording in the comment=2E
- pt_irq_bind_msi() rejects an address that isn't in MSI format
  (0xfeexxxxx) with -EINVAL, so every caller storing into gmsi=2Eaddr is
  guaranteed a well-formed message=2E Per Jan's comment: "cope with
  existing code passing rubbish there =2E=2E=2E e=2Eg=2E in vpci_msi_updat=
e()"=2E
- _hvm_dpci_msi_eoi() dest-mode bug fixed: it tested
  XEN_DOMCTL_VMSI_X86_DM_MASK against a raw address, now uses
  MSI_ADDR_DESTMODE_MASK=2E
- vmsi_deliver_pirq() reads gmsi=2Eaddr/gmsi=2Edata with the standard MSI
  masks (v4 kept XEN_DOMCTL_VMSI_X86_FULL_DEST())=2E
- pt_irq_create_bind()'s PT_IRQ_TYPE_MSI case keeps working here by
  rebuilding a raw message from gflags (v4 rejected it with -EOPNOTSUPP)=
=2E
- Commit message explains why the "already mapped" comparison widened to
  full addr/data=2E
- Use MASK_EXTR/MASK_INSR throughout=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
 xen/arch/x86/hvm/vmsi=2Ec            | 53 +++++++--------------
 xen/arch/x86/include/asm/hvm/irq=2Eh |  4 +-
 xen/arch/x86/include/asm/msi=2Eh     | 19 ++++++++
 xen/drivers/passthrough/x86/hvm=2Ec  | 75 +++++++++++++++++++-----------
 xen/include/xen/iommu=2Eh            |  3 ++
 5 files changed, 91 insertions(+), 63 deletions(-)

diff --git a/xen/arch/x86/hvm/vmsi=2Ec b/xen/arch/x86/hvm/vmsi=2Ec
index 27b1f089e2=2E=2E6966cabfa7 100644
--- a/xen/arch/x86/hvm/vmsi=2Ec
+++ b/xen/arch/x86/hvm/vmsi=2Ec
@@ -43,6 +43,7 @@
 #include <asm/current=2Eh>
 #include <asm/event=2Eh>
 #include <asm/io_apic=2Eh>
+#include <asm/msi=2Eh>
=20
 static void vmsi_inj_irq(
     struct vlapic *target,
@@ -107,12 +108,13 @@ int vmsi_deliver(
=20
 void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq=
_dpci)
 {
-    uint32_t flags =3D pirq_dpci->gmsi=2Egflags;
-    int vector =3D pirq_dpci->gmsi=2Egvec;
-    uint8_t dest =3D (uint8_t)flags;
-    bool dest_mode =3D flags & XEN_DOMCTL_VMSI_X86_DM_MASK;
-    uint8_t delivery_mode =3D MASK_EXTR(flags, XEN_DOMCTL_VMSI_X86_DELIV_=
MASK);
-    bool trig_mode =3D flags & XEN_DOMCTL_VMSI_X86_TRIG_MASK;
+    uint64_t addr =3D pirq_dpci->gmsi=2Eaddr;
+    uint32_t data =3D pirq_dpci->gmsi=2Edata;
+    unsigned int vector =3D MASK_EXTR(data, MSI_DATA_VECTOR_MASK);
+    uint32_t dest =3D MSI_ADDR_DEST(addr);
+    bool dest_mode =3D addr & MSI_ADDR_DESTMODE_MASK;
+    unsigned int delivery_mode =3D MASK_EXTR(data, MSI_DATA_DELIVERY_MODE=
_MASK);
+    bool trig_mode =3D data & MSI_DATA_TRIGGER_MASK;
=20
     HVM_DBG_LOG(DBG_LEVEL_IOAPIC,
                 "msi: dest=3D%x dest_mode=3D%x delivery_mode=3D%x "
@@ -793,27 +795,6 @@ void msix_write_completion(struct vcpu *v)
 }
=20
 #ifdef CONFIG_HAS_VPCI
-static unsigned int msi_gflags(uint16_t data, uint64_t addr, bool masked)
-{
-    /*
-     * We need to use the DOMCTL constants here because the output of thi=
s
-     * function is used as input to pt_irq_create_bind, which also takes =
the
-     * input from the DOMCTL itself=2E
-     */
-    return MASK_INSR(MASK_EXTR(addr, MSI_ADDR_DEST_ID_MASK),
-                     XEN_DOMCTL_VMSI_X86_DEST_ID_MASK) |
-           MASK_INSR(MASK_EXTR(addr, MSI_ADDR_REDIRECTION_MASK),
-                     XEN_DOMCTL_VMSI_X86_RH_MASK) |
-           MASK_INSR(MASK_EXTR(addr, MSI_ADDR_DESTMODE_MASK),
-                     XEN_DOMCTL_VMSI_X86_DM_MASK) |
-           MASK_INSR(MASK_EXTR(data, MSI_DATA_DELIVERY_MODE_MASK),
-                     XEN_DOMCTL_VMSI_X86_DELIV_MASK) |
-           MASK_INSR(MASK_EXTR(data, MSI_DATA_TRIGGER_MASK),
-                     XEN_DOMCTL_VMSI_X86_TRIG_MASK) |
-           /* NB: by default MSI vectors are bound masked=2E */
-           (masked ? 0 : XEN_DOMCTL_VMSI_X86_UNMASKED);
-}
-
 static void vpci_mask_pirq(struct domain *d, int pirq, bool mask)
 {
     unsigned long flags;
@@ -850,17 +831,19 @@ static int vpci_msi_update(const struct pci_dev *pde=
v, uint32_t data,
     {
         uint8_t vector =3D MASK_EXTR(data, MSI_DATA_VECTOR_MASK);
         uint8_t vector_mask =3D 0xff >> (8 - fls(vectors) + 1);
-        struct xen_domctl_bind_pt_irq bind =3D {
-            =2Emachine_irq =3D pirq + i,
-            =2Eirq_type =3D PT_IRQ_TYPE_MSI,
-            =2Eu=2Emsi=2Egvec =3D (vector & ~vector_mask) |
-                          ((vector + i) & vector_mask),
-            =2Eu=2Emsi=2Egflags =3D msi_gflags(data, address, (mask >> i)=
 & 1),
-        };
-        int rc =3D pt_irq_create_bind(pdev->domain, &bind);
+        uint8_t gvec =3D (vector & ~vector_mask) | ((vector + i) & vector=
_mask);
+        uint32_t msi_data =3D (data & ~MSI_DATA_VECTOR_MASK) |
+                            MASK_INSR(gvec, MSI_DATA_VECTOR_MASK);
+        int rc =3D pt_irq_bind_msi(pdev->domain, pirq + i, address, msi_d=
ata,
+                                 0 /* gtable */, !((mask >> i) & 1));
=20
         if ( rc )
         {
+            struct xen_domctl_bind_pt_irq bind =3D {
+                =2Eirq_type =3D PT_IRQ_TYPE_MSI,
+                =2Emachine_irq =3D pirq + i,
+            };
+
             gdprintk(XENLOG_ERR, "%pp: failed to bind PIRQ %u: %d\n",
                      &pdev->sbdf, pirq + i, rc);
             while ( bind=2Emachine_irq-- > pirq )
diff --git a/xen/arch/x86/include/asm/hvm/irq=2Eh b/xen/arch/x86/include/a=
sm/hvm/irq=2Eh
index 77595fb3f4=2E=2Ee79e2e3fed 100644
--- a/xen/arch/x86/include/asm/hvm/irq=2Eh
+++ b/xen/arch/x86/include/asm/hvm/irq=2Eh
@@ -120,8 +120,8 @@ struct dev_intx_gsi_link {
 #define HVM_IRQ_DPCI_TRANSLATE       (1u << _HVM_IRQ_DPCI_TRANSLATE_SHIFT=
)
=20
 struct hvm_gmsi_info {
-    uint32_t gvec;
-    uint32_t gflags;
+    uint64_t addr; /* raw MSI address (0xfeexxxxx) */
+    uint32_t data; /* raw MSI data (vector, delivery mode, trigger mode) =
*/
     int dest_vcpu_id; /* -1 :multi-dest, non-negative: dest_vcpu_id */
     bool posted; /* directly deliver to guest via VT-d PI? */
 };
diff --git a/xen/arch/x86/include/asm/msi=2Eh b/xen/arch/x86/include/asm/m=
si=2Eh
index 6fb663b2e7=2E=2Ea553922853 100644
--- a/xen/arch/x86/include/asm/msi=2Eh
+++ b/xen/arch/x86/include/asm/msi=2Eh
@@ -54,6 +54,25 @@
 #define	 MSI_ADDR_DEST_ID_MASK		0x00ff000
 #define  MSI_ADDR_DEST_ID(dest)		(((dest) << MSI_ADDR_DEST_ID_SHIFT) & MS=
I_ADDR_DEST_ID_MASK)
=20
+/* Width of the architectural destination ID field (MSI address bits 19:1=
2)=2E */
+#define MSI_ADDR_DEST_ID_WIDTH		8
+
+/*
+ * "Extended Destination ID": MSI address bits 11:5 carry the top 7 bits =
of a
+ * 15-bit APIC ID, extending the reachable destination range from 8 to 15=
 bits=2E
+ * A guest is told this is available via XEN_HVM_CPUID_EXT_DEST_ID=2E The=
 Linux
+ * guest side is x86_msi_msg_get_destid() in arch/x86/kernel/apic/apic=2E=
c=2E
+ *
+ * Only interpret these bits this way for a guest that has opted in=2E Ot=
herwise
+ * treat them as reserved and ignore them=2E
+ */
+#define MSI_ADDR_EXT_DEST_ID_MASK	0x0000fe0
+
+/* Combine the architectural and extended destination bits of an MSI addr=
ess=2E */
+#define MSI_ADDR_DEST(addr)						  \
+    (MASK_EXTR(addr, MSI_ADDR_DEST_ID_MASK) |				  \
+     (MASK_EXTR(addr, MSI_ADDR_EXT_DEST_ID_MASK) << MSI_ADDR_DEST_ID_WIDT=
H))
+
 /* MAX fixed pages reserved for mapping MSIX tables=2E */
 #define FIX_MSIX_MAX_PAGES              512
=20
diff --git a/xen/drivers/passthrough/x86/hvm=2Ec b/xen/drivers/passthrough=
/x86/hvm=2Ec
index 5fdb885311=2E=2Ebdab065eb7 100644
--- a/xen/drivers/passthrough/x86/hvm=2Ec
+++ b/xen/drivers/passthrough/x86/hvm=2Ec
@@ -287,19 +287,24 @@ static int pt_irq_dpci_setup(struct domain *d, unsig=
ned int pirq,
     return 0;
 }
=20
-static int pt_irq_bind_msi(struct domain *d, unsigned int machine_irq,
-                           uint8_t gvec, unsigned int gflags, uint64_t gt=
able,
-                           bool unmasked)
+int pt_irq_bind_msi(struct domain *d, unsigned int machine_irq,
+                    uint64_t msi_addr, uint32_t msi_data,
+                    uint64_t gtable, bool unmasked)
 {
     struct hvm_irq_dpci *hvm_irq_dpci;
     struct hvm_pirq_dpci *pirq_dpci;
     struct pirq *info;
     int rc;
-    uint8_t dest, delivery_mode;
+    uint8_t gvec;
+    uint32_t dest;
     bool dest_mode;
     int dest_vcpu_id;
     const struct vcpu *vcpu;
=20
+    /* A passthrough MSI must carry an MSI-format address (0xfeexxxxx)=2E=
 */
+    if ( (msi_addr & MSI_ADDR_BASE_MASK) !=3D MSI_ADDR_HEADER )
+        return -EINVAL;
+
     rc =3D pt_irq_dpci_setup(d, machine_irq, &hvm_irq_dpci, &pirq_dpci, &=
info);
     if ( rc )
         return rc;
@@ -308,8 +313,8 @@ static int pt_irq_bind_msi(struct domain *d, unsigned =
int machine_irq,
     {
         pirq_dpci->flags =3D HVM_IRQ_DPCI_MAPPED | HVM_IRQ_DPCI_MACH_MSI =
|
                            HVM_IRQ_DPCI_GUEST_MSI;
-        pirq_dpci->gmsi=2Egvec =3D gvec;
-        pirq_dpci->gmsi=2Egflags =3D gflags;
+        pirq_dpci->gmsi=2Eaddr =3D msi_addr;
+        pirq_dpci->gmsi=2Edata =3D msi_data;
         /*
          * 'pt_irq_bind_msi' can be called after 'pt_irq_destroy_bind'=2E
          * The 'pirq_cleanup_check' which would free the structure is onl=
y
@@ -341,8 +346,8 @@ static int pt_irq_bind_msi(struct domain *d, unsigned =
int machine_irq,
         }
         if ( unlikely(rc) )
         {
-            pirq_dpci->gmsi=2Egflags =3D 0;
-            pirq_dpci->gmsi=2Egvec =3D 0;
+            pirq_dpci->gmsi=2Eaddr =3D 0;
+            pirq_dpci->gmsi=2Edata =3D 0;
             pirq_dpci->dom =3D NULL;
             pirq_dpci->flags =3D 0;
             if ( !info->evtchn )
@@ -362,23 +367,22 @@ static int pt_irq_bind_msi(struct domain *d, unsigne=
d int machine_irq,
         }
=20
         /* If pirq is already mapped as vmsi, update guest data/addr=2E *=
/
-        if ( pirq_dpci->gmsi=2Egvec !=3D gvec ||
-             pirq_dpci->gmsi=2Egflags !=3D gflags )
+        if ( pirq_dpci->gmsi=2Eaddr !=3D msi_addr ||
+             pirq_dpci->gmsi=2Edata !=3D msi_data )
         {
             /* Directly clear pending EOIs before enabling new MSI info=
=2E */
             pirq_guest_eoi(info);
=20
-            pirq_dpci->gmsi=2Egvec =3D gvec;
-            pirq_dpci->gmsi=2Egflags =3D gflags;
+            pirq_dpci->gmsi=2Eaddr =3D msi_addr;
+            pirq_dpci->gmsi=2Edata =3D msi_data;
         }
     }
=20
     /* Calculate dest_vcpu_id for MSI-type pirq migration=2E */
-    dest =3D MASK_EXTR(pirq_dpci->gmsi=2Egflags,
-                     XEN_DOMCTL_VMSI_X86_DEST_ID_MASK);
-    dest_mode =3D pirq_dpci->gmsi=2Egflags & XEN_DOMCTL_VMSI_X86_DM_MASK;
-    delivery_mode =3D MASK_EXTR(pirq_dpci->gmsi=2Egflags,
-                              XEN_DOMCTL_VMSI_X86_DELIV_MASK);
+    gvec =3D MASK_EXTR(msi_data, MSI_DATA_VECTOR_MASK);
+    dest =3D MSI_ADDR_DEST(msi_addr);
+    dest_mode =3D msi_addr & MSI_ADDR_DESTMODE_MASK;
+    delivery_mode =3D MASK_EXTR(msi_data, MSI_DATA_DELIVERY_MODE_MASK);
=20
     dest_vcpu_id =3D hvm_girq_dest_2_vcpu_id(d, dest, dest_mode);
     pirq_dpci->gmsi=2Edest_vcpu_id =3D dest_vcpu_id;
@@ -389,8 +393,7 @@ static int pt_irq_bind_msi(struct domain *d, unsigned =
int machine_irq,
     if ( iommu_intpost )
     {
         if ( delivery_mode =3D=3D dest_LowestPrio )
-            vcpu =3D vector_hashing_dest(d, dest, dest_mode,
-                                       pirq_dpci->gmsi=2Egvec);
+            vcpu =3D vector_hashing_dest(d, dest, dest_mode, gvec);
         if ( vcpu )
             pirq_dpci->gmsi=2Eposted =3D true;
     }
@@ -405,7 +408,7 @@ static int pt_irq_bind_msi(struct domain *d, unsigned =
int machine_irq,
             =2Eirq_type =3D PT_IRQ_TYPE_MSI,
         };
=20
-        rc =3D hvm_pi_update_irte(vcpu, info, pirq_dpci->gmsi=2Egvec);
+        rc =3D hvm_pi_update_irte(vcpu, info, gvec);
         if ( rc )
         {
             pt_irq_destroy_bind(d, &pt_irq_bind);
@@ -448,9 +451,30 @@ int pt_irq_create_bind(
     case PT_IRQ_TYPE_MSI:
     {
         unsigned int gflags =3D pt_irq_bind->u=2Emsi=2Egflags;
+        uint64_t msi_addr;
+        uint32_t msi_data;
=20
-        return pt_irq_bind_msi(d, pirq, pt_irq_bind->u=2Emsi=2Egvec,
-                               gflags & ~XEN_DOMCTL_VMSI_X86_UNMASKED,
+        /*
+         * Rebuild a raw MSI message from the pre-decoded domctl gflags s=
o the
+         * canonical bind path can decode it uniformly=2E This legacy pat=
h never
+         * carries extended destination ID bits=2E
+         */
+        msi_addr =3D MSI_ADDR_HEADER |
+                   MASK_INSR(MASK_EXTR(gflags, XEN_DOMCTL_VMSI_X86_DEST_I=
D_MASK),
+                             MSI_ADDR_DEST_ID_MASK) |
+                   (gflags & XEN_DOMCTL_VMSI_X86_RH_MASK
+                    ? MSI_ADDR_REDIRECTION_LOWPRI
+                    : MSI_ADDR_REDIRECTION_CPU) |
+                   (gflags & XEN_DOMCTL_VMSI_X86_DM_MASK
+                    ? MSI_ADDR_DESTMODE_LOGIC
+                    : MSI_ADDR_DESTMODE_PHYS);
+        msi_data =3D MASK_INSR(pt_irq_bind->u=2Emsi=2Egvec, MSI_DATA_VECT=
OR_MASK) |
+                   MASK_INSR(MASK_EXTR(gflags, XEN_DOMCTL_VMSI_X86_DELIV_=
MASK),
+                             MSI_DATA_DELIVERY_MODE_MASK) |
+                   (gflags & XEN_DOMCTL_VMSI_X86_TRIG_MASK
+                    ? MSI_DATA_TRIGGER_LEVEL : 0);
+
+        return pt_irq_bind_msi(d, pt_irq_bind->machine_irq, msi_addr, msi=
_data,
                                pt_irq_bind->u=2Emsi=2Egtable,
                                gflags & XEN_DOMCTL_VMSI_X86_UNMASKED);
     }
@@ -857,11 +881,10 @@ static int cf_check _hvm_dpci_msi_eoi(
     int vector =3D (long)arg;
=20
     if ( (pirq_dpci->flags & HVM_IRQ_DPCI_MACH_MSI) &&
-         (pirq_dpci->gmsi=2Egvec =3D=3D vector) )
+         MASK_EXTR(pirq_dpci->gmsi=2Edata, MSI_DATA_VECTOR_MASK) =3D=3D v=
ector )
     {
-        unsigned int dest =3D MASK_EXTR(pirq_dpci->gmsi=2Egflags,
-                                      XEN_DOMCTL_VMSI_X86_DEST_ID_MASK);
-        bool dest_mode =3D pirq_dpci->gmsi=2Egflags & XEN_DOMCTL_VMSI_X86=
_DM_MASK;
+        unsigned int dest =3D MSI_ADDR_DEST(pirq_dpci->gmsi=2Eaddr);
+        bool dest_mode =3D pirq_dpci->gmsi=2Eaddr & MSI_ADDR_DESTMODE_MAS=
K;
=20
         if ( vlapic_match_dest(vcpu_vlapic(current), NULL, 0, dest,
                                dest_mode) )
diff --git a/xen/include/xen/iommu=2Eh b/xen/include/xen/iommu=2Eh
index 37c4a1dc82=2E=2Ed68d9ca6ec 100644
--- a/xen/include/xen/iommu=2Eh
+++ b/xen/include/xen/iommu=2Eh
@@ -222,6 +222,9 @@ int pt_irq_create_bind(struct domain *d,
                        const struct xen_domctl_bind_pt_irq *pt_irq_bind);
 int pt_irq_destroy_bind(struct domain *d,
                         const struct xen_domctl_bind_pt_irq *pt_irq_bind)=
;
+int pt_irq_bind_msi(struct domain *d, unsigned int machine_irq,
+                    uint64_t msi_addr, uint32_t msi_data,
+                    uint64_t gtable, bool unmasked);
=20
 struct hvm_irq_dpci *domain_get_irq_dpci(const struct domain *d);
 void free_hvm_irq_dpci(struct hvm_irq_dpci *dpci);
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.35aa.daf7bf3a43bd1d0b.1a0679ed6ce.2c4e65cada2122c3=---

