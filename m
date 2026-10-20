Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991EE606A32D
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 13:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=iflqUXi5
Received: from list by lists.xenproject.org with outflank-mailman.1455874.1669496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJAHl-0000os-Qc; Tue, 20 Oct 2026 13:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455874.1669496; Tue, 20 Oct 2026 13:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJAHl-0000ol-Ni; Tue, 20 Oct 2026 13:53:49 +0000
Received: by outflank-mailman (input) for mailman id 1455874;
 Tue, 20 Oct 2026 13:53:48 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15996ec68000f79f@swg.vates.tech>)
 id 1xJAHk-0000l2-Bv
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 13:53:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJAHj-000OEO-Oy
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 15:53:47 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15996ec68000f79f@swg.vates.tech>)
 id 6ad77256-2eae-0a2a0a5409dd-0a2a45048eb8-40
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 15:53:47 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15996ec68000f79f@swg.vates.tech>)
 id 6ad7726b-b57f-0a2a45040019-b9ff1c239605-4
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 15:53:47 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a15996ec68000f79f.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 13:53:45 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 03BAE81B3D;
 Tue, 20 Oct 2026 15:53:44 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=Jzn2Zb5AruTQT8qiLJh0Qy0tL9MdFQryxCPUXJhgofU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=iflqUXi55gbQp4tGeRaqjKdwE63QEsMRAvyj27+MP37KmImgL2usmAjZ2BL+Sxo01F74kvYNx
 G1GfiJCwkjFObNQA7hH21qGilszC/uBSdTKbSLoVm/FFI7UprgWnyqdV0bHC10ehhshOBx5PEBR
 jUOQvU7uOm9c9gTBxaNqHmDYnd5Y9K8ojbEe1z2+TWJiu1f+CeIuLkkJzuGoHOmZKUVNir2/S4C
 ezyAjmvYKN2mP8Vtwl1xNZ/hjIpkYumtvf0T3Qy5AbPuSy4xfiZDIiAs2ZnRSeomCaAtF1X615Z
 bNtwffJXvV8SBTP3Nbs4QwgFm4rqgiKH61h0q+ExGUdw==
X-Zone-Loop: 9bf5e49e3ab031e257e0c47c9c9906eef8e3b333d314
x-campaign-type: default
x-transaction-id: 9440ae8c-5708-4f88-a4cd-7fe259f11341
x-swg-uid: 01-f5b8cd32-22ff-4cc6-a5a6-e3ae76b95927
X-Mailer: Sweego
Message-ID:
 <1792504425.8631fc262581453bbf619ec5b2062170.1a15996ec68000f79f@vates.tech>
x-swg-bid: 1792504425.8631fc262581453bbf619ec5b2062170.1a15996ec68000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Denis Mukhin <dmukhin@xen.org>
Subject: [PATCH 2/6] x86/vlapic: Fix hardware virtualized APIC state after reset
Date: Tue, 20 Oct 2026 15:53:29 +0200
In-Reply-To: <20261020135333.38064-2-teddy.astie@vates.tech>
References: <1792504313.8631fc262581453bbf619ec5b2062170.1a1599536d8000f79f@vates.tech>
 <20261020135333.38064-2-teddy.astie@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.51.2171014568280812.1a15996eabf.261fe5f835c35f94=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792504425151
X-purgate-ID: tlsNG-ebf023/1792504427-536C2B50-D91D0DFB/0/0
X-purgate-type: clean
X-purgate-size: 7029
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.51.2171014568280812.1a15996eabf.261fe5f835c35f94=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

There are various issues in the current vlapic logic handling reset
 - SVI and RVI aren't reset, and GUEST_INTR_STATUS is not updated
   appropriately
 - stale PIR bits are merged into fresh IRR

Fixes: d7dafa375bc1 ("VMX: Add posted interrupt supporting")
Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
Assisted-by: Claude Fable 5=2E1
---
While the change looks fine to me, I feel some of the comments are
too Intel-centric, and not sure how them apply to AMD AVIC=2E
---
 xen/arch/x86/hvm/vlapic=2Ec  | 43 ++++++++++++++++++++++++++++++++++----
 xen/arch/x86/hvm/vmx/vmx=2Ec | 30 ++++++++++++++++++++------
 2 files changed, 63 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic=2Ec b/xen/arch/x86/hvm/vlapic=2Ec
index 885f5d304b=2E=2E53f8907640 100644
--- a/xen/arch/x86/hvm/vlapic=2Ec
+++ b/xen/arch/x86/hvm/vlapic=2Ec
@@ -68,6 +68,7 @@ static const unsigned int vlapic_lvt_mask[VLAPIC_LVT_NUM=
] =3D
      =3D=3D APIC_TIMER_MODE_TSC_DEADLINE)
=20
 static void vlapic_do_init(struct vlapic *vlapic);
+static void vlapic_reset_hw_state(struct vlapic *vlapic);
=20
 static int vlapic_find_highest_vector(const void *bitmap)
 {
@@ -277,6 +278,7 @@ static void vlapic_init_sipi_one(struct vcpu *target, =
uint32_t icr)
     {
     case APIC_DM_INIT: {
         int rc;
+        struct vlapic *vlapic =3D vcpu_vlapic(target);
=20
         /* No work on INIT de-assert for P4-type APIC=2E */
         if ( (icr & (APIC_INT_LEVELTRIG | APIC_INT_ASSERT)) =3D=3D
@@ -290,7 +292,8 @@ static void vlapic_init_sipi_one(struct vcpu *target, =
uint32_t icr)
         /* Reset necessary VCPU state=2E This does not include FPU state=
=2E */
         rc =3D vcpu_reset(target);
         ASSERT(!rc);
-        vlapic_do_init(vcpu_vlapic(target));
+        vlapic_do_init(vlapic);
+        vlapic_reset_hw_state(vlapic);
         domain_unlock(target->domain);
         break;
     }
@@ -1429,6 +1432,13 @@ static void vlapic_do_init(struct vlapic *vlapic)
     if ( !has_vlapic(vlapic_vcpu(vlapic)->domain) )
         return;
=20
+    /*
+     * Drain the posted interrupt descriptor (and clear its ON bit) befor=
e
+     * zeroing the IRR, so that vectors posted before the reset don't get
+     * merged into the fresh IRR by a later sync=2E
+     */
+    hvm_sync_pir_to_irr(vlapic_vcpu(vlapic));
+
     vlapic_set_reg(vlapic, APIC_LVR, VLAPIC_VERSION);
=20
     for ( i =3D 0; i < 8; i++ )
@@ -1462,8 +1472,26 @@ static void vlapic_do_init(struct vlapic *vlapic)
     destroy_periodic_time(&vlapic->pt);
 }
=20
-/* Reset the VLAPIC back to its power-on/reset state=2E */
-void vlapic_reset(struct vlapic *vlapic)
+/*
+ * Bring hardware accelerated APIC state (on VMX: RVI, SVI and the EOI-ex=
it
+ * bitmap) back in line with the just reset registers=2E  Hardware derive=
s the
+ * virtual PPR from SVI and delivers virtual interrupts based on RVI with=
out
+ * consulting the IRR, so leaving them stale after a reset would block
+ * subsequent interrupts, or inject a vector which isn't pending at all=
=2E
+ */
+static void vlapic_reset_hw_state(struct vlapic *vlapic)
+{
+    struct vcpu *v =3D vlapic_vcpu(vlapic);
+
+    if ( !has_vlapic(v->domain) )
+        return;
+
+    if ( hvm_funcs=2Eprocess_isr )
+        alternative_vcall(hvm_funcs=2Eprocess_isr, -1, v);
+}
+
+/* Reset the VLAPIC registers back to their power-on/reset state=2E */
+static void vlapic_reset_regs(struct vlapic *vlapic)
 {
     const struct vcpu *v =3D vlapic_vcpu(vlapic);
=20
@@ -1478,6 +1506,13 @@ void vlapic_reset(struct vlapic *vlapic)
     vlapic_do_init(vlapic);
 }
=20
+/* Reset the VLAPIC back to its power-on/reset state=2E */
+void vlapic_reset(struct vlapic *vlapic)
+{
+    vlapic_reset_regs(vlapic);
+    vlapic_reset_hw_state(vlapic);
+}
+
 /* rearm the actimer if needed, after a HVM restore */
 static void lapic_rearm(struct vlapic *s)
 {
@@ -1705,7 +1740,7 @@ int vlapic_init(struct vcpu *v)
=20
     clear_page(vlapic->regs);
=20
-    vlapic_reset(vlapic);
+    vlapic_reset_regs(vlapic);
=20
     tasklet_init(&vlapic->init_sipi=2Etasklet, vlapic_init_sipi_action, v=
);
=20
diff --git a/xen/arch/x86/hvm/vmx/vmx=2Ec b/xen/arch/x86/hvm/vmx/vmx=2Ec
index 31bb094d6f=2E=2Eb655075c17 100644
--- a/xen/arch/x86/hvm/vmx/vmx=2Ec
+++ b/xen/arch/x86/hvm/vmx/vmx=2Ec
@@ -2194,10 +2194,10 @@ static void cf_check vmx_update_eoi_exit_bitmap(
         vmx_clear_eoi_exit_bitmap(v, vector);
 }
=20
-static u8 set_svi(int isr)
+static uint8_t set_svi(int isr)
 {
     unsigned long status;
-    u8 old;
+    uint8_t old;
=20
     if ( isr < 0 )
         isr =3D 0;
@@ -2216,12 +2216,14 @@ static u8 set_svi(int isr)
=20
 static void cf_check vmx_process_isr(int isr, struct vcpu *v)
 {
-    unsigned int i;
+    unsigned int i, rvi =3D 0;
+    unsigned long status;
     const struct vlapic *vlapic =3D vcpu_vlapic(v);
=20
     vmx_vmcs_enter(v);
=20
-    set_svi(isr);
+    /* Rebuild the EOI-exit bitmap from scratch, dropping stale entries=
=2E */
+    bitmap_zero(v->arch=2Ehvm=2Evmx=2Eeoi_exit_bitmap, X86_IDT_VECTORS);
=20
     /*
      * Theoretically, only level triggered interrupts can have their
@@ -2237,13 +2239,29 @@ static void cf_check vmx_process_isr(int isr, stru=
ct vcpu *v)
      * bitmap correctly=2E
      */
     for ( i =3D 0x10; i < X86_IDT_VECTORS; ++i )
-        if ( vlapic_test_vector(i, &vlapic->regs->data[APIC_IRR]) ||
-             vlapic_test_vector(i, &vlapic->regs->data[APIC_ISR]) )
+    {
+        if ( vlapic_test_vector(i, &vlapic->regs->data[APIC_IRR]) )
+        {
+            set_bit(i, v->arch=2Ehvm=2Evmx=2Eeoi_exit_bitmap);
+            rvi =3D i;
+        }
+        else if ( vlapic_test_vector(i, &vlapic->regs->data[APIC_ISR]) )
             set_bit(i, v->arch=2Ehvm=2Evmx=2Eeoi_exit_bitmap);
+    }
=20
     for ( i =3D 0; i < ARRAY_SIZE(v->arch=2Ehvm=2Evmx=2Eeoi_exit_bitmap);=
 ++i )
         __vmwrite(EOI_EXIT_BITMAP(i), v->arch=2Ehvm=2Evmx=2Eeoi_exit_bitm=
ap[i]);
=20
+    /*
+     * Hardware delivers virtual interrupts based on RVI alone, without
+     * looking at the IRR, and derives the virtual PPR from SVI=2E  Both =
must
+     * therefore reflect the register contents: RVI is the highest pendin=
g
+     * vector (0 if none), SVI the highest in-service one (0 if none)=2E
+     */
+    status =3D MASK_INSR(rvi, VMX_GUEST_INTR_STATUS_SUBFIELD_BITMASK) |
+             ((isr < 0 ? 0 : isr) << VMX_GUEST_INTR_STATUS_SVI_OFFSET);
+    __vmwrite(GUEST_INTR_STATUS, status);
+
     vmx_vmcs_exit(v);
 }
=20
--=20
2=2E56=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.51.2171014568280812.1a15996eabf.261fe5f835c35f94=---

