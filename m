Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7234C624DD
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 14:14:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407263.1640399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28D7-0006yY-J4; Thu, 03 Sep 2026 14:14:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407263.1640399; Thu, 03 Sep 2026 14:14:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28D7-0006xz-F5; Thu, 03 Sep 2026 14:14:37 +0000
Received: by outflank-mailman (input) for mailman id 1407263;
 Thu, 03 Sep 2026 14:14:36 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679ed9b9000c4f3@swg.vates.tech>)
 id 1x28D6-0006kV-GH
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 14:14:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x28D5-001H4c-SG
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 16:14:35 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679ed9b9000c4f3@swg.vates.tech>)
 id 6a9980bd-2eae-0a2a0a5409dd-0a2a4505c668-28
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:14:35 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679ed9b9000c4f3@swg.vates.tech>)
 id 6a9980cb-4cb1-0a2a45050019-b9ff1c228579-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:14:35 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0679ed9b9000c4f3.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 03 Sep 2026 14:14:18 +0000
Received: from julian.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 2C59784011;
 Thu,  3 Sep 2026 16:14:18 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=TFc5nplCWpPWb6TL9VVLyQHid2vUkbZ6H31MHV3pWe0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Qp7WExPsUYQbCeHcj9T3b90YMy2Y1LVopsrlS0Fqk5ae8aJdDC5TZZn8NzqdpcMl6XM3YMdUC
 wqmM89twND3GP1h+LjbpIK/xQfq77SKbdvLWAbPMc3w0Se9yGIjzDcb0v0Yp58PPFuixq152qEn
 v73FMgK2G2oymjkIuMaak4H9c/OzgbnZ80NTfPW1+D2XdDJPPWSX2YX4JhM5nSdvYtQDihIdfrW
 n2K6kwe15kZ/usQtzoayZYaPS90lZz9jcfQPGznMzzyz20JPOOBN+o1GQqNaYHDLDve3R71pfmo
 hvZIy8cN3yHhdH0EoCD/tsMzPHI+Ol06eaTHt+eQkD9Q==
X-Zone-Loop: f743ef71d49e150dfec641ea08342951af9fe89bf7a2
x-campaign-type: default
x-transaction-id: 071547b2-5152-4e0e-b954-168722a7635b
x-swg-uid: 01-2e75de1e-8a2a-4c83-9194-d44ac0952cc7
X-Mailer: Sweego
Message-ID:
 <1788444858.8631fc262581453bbf619ec5b2062170.1a0679ed9b9000c4f3@vates.tech>
x-swg-bid: 1788444858.8631fc262581453bbf619ec5b2062170.1a0679ed9b9000c4f3
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
Subject: [PATCH v5 08/11] x86/hvm: Decode extended MSI / IO-APIC destination IDs when opted in
Date: Thu,  3 Sep 2026 16:14:06 +0200
In-Reply-To: <1788444605.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3@vates.tech>
References: <1788444605.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.35ab.e5d7a6729895094a.1a0679ed81d.65b008e6a50fbf51=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788444858397
X-purgate-ID: tlsNG-c201ff/1788444875-F6CB02A1-8B16E8B3/0/0
X-purgate-type: clean
X-purgate-size: 11092

---=Part.35ab.e5d7a6729895094a.1a0679ed81d.65b008e6a50fbf51=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add the plumbing to allow for 15-bit destination IDs:

- struct hvm_domain gains a tri-state ext_dest_id (UNSET / DISABLED /
  ENABLED)=2E hvm_ext_dest_id_active() is the single point to guard every
  extended decode=2E

- The vIO-APIC RTE save record grows an ext_dest_id:7 field (the top 7
  bits of a 15-bit APIC ID) and VIOAPIC_RTE_DEST() combines it with
  dest_id=2E

- vmsi_deliver() / hvm_girq_dest_2_vcpu_id() take a uint32_t dest=2E

- hvm_inject_msi(), vioapic_deliver(), vmsi_deliver_pirq(),
  pt_irq_bind_msi() and _hvm_dpci_msi_eoi() fold in the extended bits
  only when hvm_ext_dest_id_active(), otherwise an unaware guest that
  left non-zero values in those bits would have its interrupts
  misrouted=2E

Since ext_dest_id is never ENABLED yet, there is no functional change=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v5:
- Rewritten to use a tri-state d->arch=2Ehvm=2Eext_dest_id (UNSET / DISABL=
ED
  / ENABLED)=2E
- Addressed Jan's comment about "wrong way round": every decode site
  folds in the extended bits only when active and ignores them
  otherwise, rather than rejecting a guest that left values there=2E
- VIOAPIC_RTE_DEST() takes a union vioapic_redir_entry and uses =2Edest_id
  / =2Eext_dest_id=2E
- Replaced comments and added one central explanation=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
 xen/arch/x86/hvm/irq=2Ec                 |  6 ++++--
 xen/arch/x86/hvm/vioapic=2Ec             |  5 ++++-
 xen/arch/x86/hvm/vmsi=2Ec                |  8 +++++---
 xen/arch/x86/include/asm/hvm/domain=2Eh  | 13 +++++++++++++
 xen/arch/x86/include/asm/hvm/hvm=2Eh     | 12 ++++++++++--
 xen/arch/x86/include/asm/hvm/vioapic=2Eh | 10 ++++++++++
 xen/drivers/passthrough/x86/hvm=2Ec      |  8 ++++++--
 xen/include/public/arch-x86/hvm/save=2Eh |  4 +++-
 8 files changed, 55 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/hvm/irq=2Ec b/xen/arch/x86/hvm/irq=2Ec
index 5f64361113=2E=2Eaa5926529a 100644
--- a/xen/arch/x86/hvm/irq=2Ec
+++ b/xen/arch/x86/hvm/irq=2Ec
@@ -374,7 +374,8 @@ int hvm_set_pci_link_route(struct domain *d, u8 link, =
u8 isa_irq)
 int hvm_inject_msi(struct domain *d, uint64_t addr, uint32_t data)
 {
     uint32_t tmp =3D (uint32_t) addr;
-    uint8_t  dest =3D (tmp & MSI_ADDR_DEST_ID_MASK) >> MSI_ADDR_DEST_ID_S=
HIFT;
+    uint8_t  dest =3D MASK_EXTR(tmp, MSI_ADDR_DEST_ID_MASK);
+    uint32_t full_dest =3D hvm_ext_dest_id_active(d) ? MSI_ADDR_DEST(tmp)=
 : dest;
     uint8_t  dest_mode =3D !!(tmp & MSI_ADDR_DESTMODE_MASK);
     uint8_t  delivery_mode =3D (data & MSI_DATA_DELIVERY_MODE_MASK)
         >> MSI_DATA_DELIVERY_MODE_SHIFT;
@@ -412,7 +413,8 @@ int hvm_inject_msi(struct domain *d, uint64_t addr, ui=
nt32_t data)
         return -ERANGE;
     }
=20
-    return vmsi_deliver(d, vector, dest, dest_mode, delivery_mode, trig_m=
ode);
+    return vmsi_deliver(d, vector, full_dest, dest_mode, delivery_mode,
+                        trig_mode);
 }
=20
 void hvm_set_callback_via(struct domain *d, uint64_t via)
diff --git a/xen/arch/x86/hvm/vioapic=2Ec b/xen/arch/x86/hvm/vioapic=2Ec
index 80dc9148a9=2E=2Eca9b34d3ea 100644
--- a/xen/arch/x86/hvm/vioapic=2Ec
+++ b/xen/arch/x86/hvm/vioapic=2Ec
@@ -39,6 +39,7 @@
 #include <asm/event=2Eh>
 #include <asm/io_apic=2Eh>
 #include <asm/x86_emulate=2Eh>
+#include <asm/msi=2Eh>
=20
 /* HACK: Route IRQ0 only to VCPU0 to prevent time jumps=2E */
 #define IRQ0_SPECIAL_ROUTING 1
@@ -413,7 +414,9 @@ static void ioapic_inj_irq(
=20
 static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin=
)
 {
-    uint16_t dest =3D vioapic->redirtbl[pin]=2Efields=2Edest_id;
+    union vioapic_redir_entry rte =3D vioapic->redirtbl[pin];
+    uint32_t dest =3D hvm_ext_dest_id_active(vioapic_domain(vioapic))
+                    ? VIOAPIC_RTE_DEST(rte) : rte=2Efields=2Edest_id;
     uint8_t dest_mode =3D vioapic->redirtbl[pin]=2Efields=2Edest_mode;
     uint8_t delivery_mode =3D vioapic->redirtbl[pin]=2Efields=2Edelivery_=
mode;
     uint8_t vector =3D vioapic->redirtbl[pin]=2Efields=2Evector;
diff --git a/xen/arch/x86/hvm/vmsi=2Ec b/xen/arch/x86/hvm/vmsi=2Ec
index 6966cabfa7=2E=2Eeede42a202 100644
--- a/xen/arch/x86/hvm/vmsi=2Ec
+++ b/xen/arch/x86/hvm/vmsi=2Ec
@@ -67,7 +67,7 @@ static void vmsi_inj_irq(
=20
 int vmsi_deliver(
     struct domain *d, int vector,
-    uint8_t dest, uint8_t dest_mode,
+    uint32_t dest, uint8_t dest_mode,
     uint8_t delivery_mode, uint8_t trig_mode)
 {
     struct vlapic *target;
@@ -111,7 +111,9 @@ void vmsi_deliver_pirq(struct domain *d, const struct =
hvm_pirq_dpci *pirq_dpci)
     uint64_t addr =3D pirq_dpci->gmsi=2Eaddr;
     uint32_t data =3D pirq_dpci->gmsi=2Edata;
     unsigned int vector =3D MASK_EXTR(data, MSI_DATA_VECTOR_MASK);
-    uint32_t dest =3D MSI_ADDR_DEST(addr);
+    uint32_t dest =3D hvm_ext_dest_id_active(d)
+                    ? MSI_ADDR_DEST(addr)
+                    : MASK_EXTR(addr, MSI_ADDR_DEST_ID_MASK);
     bool dest_mode =3D addr & MSI_ADDR_DESTMODE_MASK;
     unsigned int delivery_mode =3D MASK_EXTR(data, MSI_DATA_DELIVERY_MODE=
_MASK);
     bool trig_mode =3D data & MSI_DATA_TRIGGER_MASK;
@@ -127,7 +129,7 @@ void vmsi_deliver_pirq(struct domain *d, const struct =
hvm_pirq_dpci *pirq_dpci)
 }
=20
 /* Return value, -1 : multi-dests, non-negative value: dest_vcpu_id */
-int hvm_girq_dest_2_vcpu_id(struct domain *d, uint8_t dest, uint8_t dest_=
mode)
+int hvm_girq_dest_2_vcpu_id(struct domain *d, uint32_t dest, uint8_t dest=
_mode)
 {
     int dest_vcpu_id =3D -1, w =3D 0;
     struct vcpu *v;
diff --git a/xen/arch/x86/include/asm/hvm/domain=2Eh b/xen/arch/x86/includ=
e/asm/hvm/domain=2Eh
index dd7fa96aad=2E=2E16f0586907 100644
--- a/xen/arch/x86/include/asm/hvm/domain=2Eh
+++ b/xen/arch/x86/include/asm/hvm/domain=2Eh
@@ -102,6 +102,19 @@ struct hvm_domain {
=20
     bool                   is_s3_suspended;
=20
+    /*
+     * Whether extended (15-bit) MSI / IO-APIC destination IDs are honour=
ed for
+     * this domain=2E Tri-state: EXT_DEST_ID_UNSET until the value is loc=
ked (at
+     * creation_finished, or restored from a migration stream)=2E Afterwa=
rds it
+     * is a stable, guest-visible property advertised through
+     * XEN_HVM_CPUID_EXT_DEST_ID=2E
+     */
+    enum {
+        EXT_DEST_ID_UNSET =3D 0,
+        EXT_DEST_ID_DISABLED,
+        EXT_DEST_ID_ENABLED,
+    } ext_dest_id;
+
     /* Compatibility setting for a bug in x2APIC LDR */
     bool bug_x2apic_ldr_vcpu_id;
=20
diff --git a/xen/arch/x86/include/asm/hvm/hvm=2Eh b/xen/arch/x86/include/a=
sm/hvm/hvm=2Eh
index 16383e1084=2E=2Ecedaa28820 100644
--- a/xen/arch/x86/include/asm/hvm/hvm=2Eh
+++ b/xen/arch/x86/include/asm/hvm/hvm=2Eh
@@ -296,11 +296,19 @@ uint64_t hvm_get_guest_time_fixed(const struct vcpu =
*v, uint64_t at_tsc);
=20
 int vmsi_deliver(
     struct domain *d, int vector,
-    uint8_t dest, uint8_t dest_mode,
+    uint32_t dest, uint8_t dest_mode,
     uint8_t delivery_mode, uint8_t trig_mode);
 struct hvm_pirq_dpci;
 void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq=
_dpci);
-int hvm_girq_dest_2_vcpu_id(struct domain *d, uint8_t dest, uint8_t dest_=
mode);
+int hvm_girq_dest_2_vcpu_id(struct domain *d, uint32_t dest, uint8_t dest=
_mode);
+
+/*
+ * True when this domain has extended (15-bit) MSI / IO-APIC destination =
IDs
+ * enabled=2E Only then may address[11:5] / RTE[55:49] be folded into the
+ * destination ID=2E
+ */
+#define hvm_ext_dest_id_active(d) \
+    ((d)->arch=2Ehvm=2Eext_dest_id =3D=3D EXT_DEST_ID_ENABLED)
=20
 enum hvm_intblk
 hvm_interrupt_blocked(struct vcpu *v, struct hvm_intack intack);
diff --git a/xen/arch/x86/include/asm/hvm/vioapic=2Eh b/xen/arch/x86/inclu=
de/asm/hvm/vioapic=2Eh
index 68af6dce79=2E=2E3df2aa7fe5 100644
--- a/xen/arch/x86/include/asm/hvm/vioapic=2Eh
+++ b/xen/arch/x86/include/asm/hvm/vioapic=2Eh
@@ -32,6 +32,16 @@
 #define VIOAPIC_EDGE_TRIG  0
 #define VIOAPIC_LEVEL_TRIG 1
=20
+/*
+ * Combined 15-bit destination ID of an IO-APIC redirection table entry: =
the
+ * architectural dest_id byte plus the 7 "Extended Destination ID" bits=
=2E The
+ * caller is responsible for only using the extended part when the guest =
has
+ * opted in (hvm_ext_dest_id_active())=2E
+ */
+#define VIOAPIC_RTE_DEST(rte) \
+    ((rte)=2Efields=2Edest_id | \
+     ((uint32_t)(rte)=2Efields=2Eext_dest_id << MSI_ADDR_DEST_ID_WIDTH))
+
 #define VIOAPIC_DEFAULT_BASE_ADDRESS  0xfec00000U
 #define VIOAPIC_MEM_LENGTH            0x100
=20
diff --git a/xen/drivers/passthrough/x86/hvm=2Ec b/xen/drivers/passthrough=
/x86/hvm=2Ec
index bdab065eb7=2E=2Ea13dd86610 100644
--- a/xen/drivers/passthrough/x86/hvm=2Ec
+++ b/xen/drivers/passthrough/x86/hvm=2Ec
@@ -380,7 +380,8 @@ int pt_irq_bind_msi(struct domain *d, unsigned int mac=
hine_irq,
=20
     /* Calculate dest_vcpu_id for MSI-type pirq migration=2E */
     gvec =3D MASK_EXTR(msi_data, MSI_DATA_VECTOR_MASK);
-    dest =3D MSI_ADDR_DEST(msi_addr);
+    dest =3D hvm_ext_dest_id_active(d) ? MSI_ADDR_DEST(msi_addr)
+                                     : MASK_EXTR(msi_addr, MSI_ADDR_DEST_=
ID_MASK);
     dest_mode =3D msi_addr & MSI_ADDR_DESTMODE_MASK;
     delivery_mode =3D MASK_EXTR(msi_data, MSI_DATA_DELIVERY_MODE_MASK);
=20
@@ -883,7 +884,10 @@ static int cf_check _hvm_dpci_msi_eoi(
     if ( (pirq_dpci->flags & HVM_IRQ_DPCI_MACH_MSI) &&
          MASK_EXTR(pirq_dpci->gmsi=2Edata, MSI_DATA_VECTOR_MASK) =3D=3D v=
ector )
     {
-        unsigned int dest =3D MSI_ADDR_DEST(pirq_dpci->gmsi=2Eaddr);
+        unsigned int dest =3D hvm_ext_dest_id_active(d)
+                            ? MSI_ADDR_DEST(pirq_dpci->gmsi=2Eaddr)
+                            : MASK_EXTR(pirq_dpci->gmsi=2Eaddr,
+                                        MSI_ADDR_DEST_ID_MASK);
         bool dest_mode =3D pirq_dpci->gmsi=2Eaddr & MSI_ADDR_DESTMODE_MAS=
K;
=20
         if ( vlapic_match_dest(vcpu_vlapic(current), NULL, 0, dest,
diff --git a/xen/include/public/arch-x86/hvm/save=2Eh b/xen/include/public=
/arch-x86/hvm/save=2Eh
index 44d7924777=2E=2Eff73b83d65 100644
--- a/xen/include/public/arch-x86/hvm/save=2Eh
+++ b/xen/include/public/arch-x86/hvm/save=2Eh
@@ -359,7 +359,9 @@ union vioapic_redir_entry
         uint8_t trig_mode:1;
         uint8_t mask:1;
         uint8_t reserve:7;
-        uint8_t reserved[4];
+        uint8_t reserved[3];
+        uint8_t reserved2:1;
+        uint8_t ext_dest_id:7;
         uint8_t dest_id;
     } fields;
 };
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.35ab.e5d7a6729895094a.1a0679ed81d.65b008e6a50fbf51=---

