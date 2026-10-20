Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7B6606A32E
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 13:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=sqC4oCCP
Received: from list by lists.xenproject.org with outflank-mailman.1455875.1669509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJAHo-0001C6-25; Tue, 20 Oct 2026 13:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455875.1669509; Tue, 20 Oct 2026 13:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJAHn-0001Bz-VP; Tue, 20 Oct 2026 13:53:51 +0000
Received: by outflank-mailman (input) for mailman id 1455875;
 Tue, 20 Oct 2026 13:53:50 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15996ef22000f79f@swg.vates.tech>)
 id 1xJAHm-0000uN-DM
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 13:53:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJAHl-005FUj-IZ
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 15:53:49 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15996ef22000f79f@swg.vates.tech>)
 id 6ad7725c-e002-0a2a0a5209dd-0a2a4502d836-46
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 15:53:49 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15996ef22000f79f@swg.vates.tech>)
 id 6ad7726d-6ca4-0a2a45020019-b9ff1c128e0d-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 15:53:49 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a15996ef22000f79f.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 13:53:46 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id B5B4681B3D;
 Tue, 20 Oct 2026 15:53:45 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=/deWJryXA3ZF7Y0BOA32Mgf1VnUaFf1YaZyFGD1qmCk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=sqC4oCCPBkMboVAzBGKtajiIAMmATtl73leMFHbvePXDeLfE8pfY/cJ2DbC4aQgKZeuQs+nm4
 vRV5KEHXvnnu8Dok6xzfTFaHsxZP+UwpLZjV0nyLulOiyM5589pMyP52meVzw3ni/7YdpjW/oJj
 XXpLX8RcC17O7NACQGzGvTxdgaeivccNhEjaWQBlC0X+Vql1JiF8X1bh2RDxjXcQT2CCD4x37TU
 OLR8sbV0IloVjUdv54PZznLLaUyV7VI48tRuAOhmRqfv3DVR3Y4D2AN2jiGIin2kdgq2e/TWo0a
 sYHQ36QppGuGeQ85DMLpa+OArCkfnfDWFlFlR8FZ1quA==
X-Zone-Loop: d196853433b765c3c1afad803641a07d3ef65a2b3fa2
x-campaign-type: default
x-transaction-id: 2d585555-4420-44ca-99be-e5a28922ed1d
x-swg-uid: 01-09dee455-4875-43c1-a2f4-7562d1d7dcfb
X-Mailer: Sweego
Message-ID:
 <1792504426.8631fc262581453bbf619ec5b2062170.1a15996ef22000f79f@vates.tech>
x-swg-bid: 1792504426.8631fc262581453bbf619ec5b2062170.1a15996ef22000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>
Subject: [PATCH 3/6] vmx/apicv: Don't lose posted interrupts while SN=1
Date: Tue, 20 Oct 2026 15:53:30 +0200
In-Reply-To: <20261020135333.38064-2-teddy.astie@vates.tech>
References: <1792504313.8631fc262581453bbf619ec5b2062170.1a1599536d8000f79f@vates.tech>
 <20261020135333.38064-2-teddy.astie@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.52.2f4fad2419199ce5.1a15996ed88.6a4f53c2a2bf26a6=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792504425864
X-purgate-ID: tlsNG-720697/1792504429-F20A82AC-BBF27547/0/0
X-purgate-type: clean
X-purgate-size: 8911
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.52.2f4fad2419199ce5.1a15996ed88.6a4f53c2a2bf26a6=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

When a vCPU is descheduled, vmx_pi_switch_from() sets SN so the IOMMU
doesn't notify a pCPU the vCPU isn't running on=2E  For non-urgent
interrupts the IOMMU then records the vector in the PIR but neither
sets ON nor sends a notification (VT-d spec "Interrupt-Posting
Hardware Operation")=2E vmx_deliver_posted_intr() mirrored that and
refused to set ON while SN was set=2E

vmx_sync_pir_to_irr() however uses ON as its "PIR needs scanning"
gate, and hardware only processes the PIR upon receipt of the
notification vector, never at VM entry=2E  Clearing SN in
vmx_pi_switch_to() therefore left such vectors parked in the PIR
until an unrelated posting happened to set ON=2E  A re-posting of
the same vector doesn't help either, as the early
pi_test_and_set_pir() return skips the ON logic altogether=2E

Set ON when clearing SN if the PIR is non-empty, as KVM does, and
have the software path always set ON: SN has no bearing on it, since
__vmx_deliver_posted_interrupt() already refrains from IPIing a vCPU
that isn't running=2E  vmx_pi_desc_fixup() sets SN around moving
blocked vCPUs between pCPU lists and had the same window, so handle
it there too by waking the vCPU as the existing ON case does=2E

Only affect systems where iommu=3Dintpost is enabled=2E

Fixes: 4b759ce163f4 ("vmx: VT-d posted-interrupt core logic handling")
Fixes: 7c00de17562e ("VMX: permanently assign PI hook vmx_pi_switch_to()")=
"
Assisted-by: Claude Fable 5=2E1
Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/arch/x86/hvm/vmx/vmx=2Ec             | 93 +++++++++++++++-----------
 xen/arch/x86/include/asm/hvm/vmx/vmx=2Eh |  5 ++
 2 files changed, 60 insertions(+), 38 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx=2Ec b/xen/arch/x86/hvm/vmx/vmx=2Ec
index b655075c17=2E=2E3d77d77534 100644
--- a/xen/arch/x86/hvm/vmx/vmx=2Ec
+++ b/xen/arch/x86/hvm/vmx/vmx=2Ec
@@ -151,6 +151,21 @@ static void vmx_pi_switch_to(struct vcpu *v)
                  x2apic_enabled ? dest : MASK_INSR(dest, PI_xAPIC_NDST_MA=
SK));
=20
     pi_clear_sn(pi_desc);
+
+    /*
+     * Interrupts posted while SN was set (by the IOMMU for non-urgent
+     * interrupts, see VT-d spec 5=2E2=2E3) have their vector recorded in=
 the PIR
+     * but neither set ON nor generate a notification=2E  vmx_sync_pir_to=
_irr()
+     * uses ON as its "PIR needs scanning" indicator, and hardware only
+     * processes the PIR upon receipt of the notification vector, so such
+     * vectors would otherwise stay parked in the PIR until an unrelated
+     * posting sets ON=2E  Set it ourselves if there is anything pending=
=2E
+     *
+     * pi_clear_sn() is a locked operation and hence orders the PIR read
+     * after the SN clear=2E
+     */
+    if ( !pi_is_pir_empty(pi_desc) )
+        pi_set_on(pi_desc);
 }
=20
 static void vmx_pi_unblock_vcpu(struct vcpu *v)
@@ -263,6 +278,18 @@ void vmx_pi_desc_fixup(unsigned int cpu)
         }
=20
         pi_clear_sn(&vmx->pi_desc);
+
+        /*
+         * A posting which arrived while SN was set above has left its ve=
ctor
+         * in the PIR without setting ON or notifying anyone=2E  The vCPU=
 is on
+         * the new cpu's blocking list by now, so wake it up directly as =
in
+         * the ON case; vmx_pi_unblock_vcpu() will take it off the list=
=2E
+         */
+        if ( !pi_is_pir_empty(&vmx->pi_desc) )
+        {
+            pi_set_on(&vmx->pi_desc);
+            vcpu_unblock(container_of(vmx, struct vcpu, arch=2Ehvm=2Evmx)=
);
+        }
     }
=20
     spin_unlock_irqrestore(old_lock, flags);
@@ -368,18 +395,17 @@ void vmx_pi_hooks_deassign(struct domain *d)
     domain_pause(d);
=20
     /*
-     * Note that we don't set 'd->arch=2Ehvm=2Epi_ops=2Eswitch_to' to NUL=
L
-     * here=2E If we deassign the hooks while the vCPU is runnable in the
-     * runqueue with 'SN' set, all the future notification event will be
-     * suppressed since vmx_deliver_posted_intr() also use 'SN' bit
-     * as the suppression flag=2E Preserving the 'switch_to' hook functio=
n can
-     * clear the 'SN' bit when the vCPU becomes running next time=2E Afte=
r
-     * that, No matter which status(runnable, running or block) the vCPU =
is in,
-     * the 'SN' bit will keep clear for the 'switch_from' hook function t=
hat set
-     * the 'SN' bit has been removed=2E At that time, the 'switch_to' hoo=
k function
-     * is also useless=2E Considering the function doesn't do harm to the=
 whole
-     * system, leave it here until we find a clean solution to deassign t=
he
-     * 'switch_to' hook function=2E
+     * Note that we keep the 'switch_to' hook=2E  Any vCPU which isn't bl=
ocked
+     * has just been descheduled by domain_pause() with the 'switch_from'
+     * hook still in place, and hence has 'SN' set=2E  Interrupts posted =
by the
+     * IOMMU while 'SN' is set only have their vector recorded in the PIR=
,
+     * without setting 'ON'=2E  vmx_pi_switch_to() clears 'SN' and sets '=
ON'
+     * if the PIR isn't empty, so that such vectors get delivered once th=
e
+     * vCPU runs again=2E  It also keeps 'NDST' up to date, which
+     * vmx_pi_hooks_assign() relies upon should a device get assigned aga=
in=2E
+     *
+     * Once 'SN' is clear it stays clear, as nothing sets it anymore, and=
 the
+     * hook is redundant from then on=2E
      */
     d->arch=2Ehvm=2Epi_ops=2Evcpu_block =3D NULL;
     d->arch=2Ehvm=2Epi_ops=2Eflags =3D PI_CSW_TO;
@@ -2322,8 +2348,6 @@ static void __vmx_deliver_posted_interrupt(struct vc=
pu *v)
=20
 static void cf_check vmx_deliver_posted_intr(struct vcpu *v, u8 vector)
 {
-    struct pi_desc old, new, prev;
-
     if ( pi_test_and_set_pir(vector, &v->arch=2Ehvm=2Evmx=2Epi_desc) )
         return;
=20
@@ -2339,30 +2363,23 @@ static void cf_check vmx_deliver_posted_intr(struc=
t vcpu *v, u8 vector)
         return;
     }
=20
-    prev=2Econtrol =3D v->arch=2Ehvm=2Evmx=2Epi_desc=2Econtrol;
-
-    do {
-        /*
-         * Currently, we don't support urgent interrupt, all
-         * interrupts are recognized as non-urgent interrupt,
-         * Besides that, if 'ON' is already set, no need to
-         * send posted-interrupts notification event as well,
-         * according to hardware behavior=2E
-         */
-        if ( pi_test_sn(&prev) || pi_test_on(&prev) )
-        {
-            vcpu_kick(v);
-            return;
-        }
-
-        old=2Econtrol =3D v->arch=2Ehvm=2Evmx=2Epi_desc=2Econtrol &
-                      ~((1 << POSTED_INTR_ON) | (1 << POSTED_INTR_SN));
-        new=2Econtrol =3D v->arch=2Ehvm=2Evmx=2Epi_desc=2Econtrol |
-                      (1 << POSTED_INTR_ON);
-
-        prev=2Econtrol =3D cmpxchg(&v->arch=2Ehvm=2Evmx=2Epi_desc=2Econtr=
ol,
-                               old=2Econtrol, new=2Econtrol);
-    } while ( prev=2Econtrol !=3D old=2Econtrol );
+    /*
+     * Always set ON, irrespective of SN: ON is what vmx_sync_pir_to_irr(=
)
+     * keys off, so leaving it clear while SN is set would park the vecto=
r in
+     * the PIR until an unrelated posting sets ON=2E  SN only exists to s=
top the
+     * IOMMU from notifying a pCPU the vCPU isn't running on; it has no
+     * bearing on the software path, where __vmx_deliver_posted_interrupt=
()
+     * already refrains from sending an IPI to a vCPU that isn't running=
=2E
+     *
+     * If ON was already set, whoever set it has taken care of the
+     * notification (or hardware will pick the vector up when it processe=
s
+     * the pending notification), so a plain kick suffices=2E
+     */
+    if ( pi_test_and_set_on(&v->arch=2Ehvm=2Evmx=2Epi_desc) )
+    {
+        vcpu_kick(v);
+        return;
+    }
=20
     __vmx_deliver_posted_interrupt(v);
 }
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx=2Eh b/xen/arch/x86/inclu=
de/asm/hvm/vmx/vmx=2Eh
index b7b8bc0c84=2E=2E7f286f8679 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx=2Eh
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx=2Eh
@@ -94,6 +94,11 @@ static inline int pi_test_pir(uint8_t vector, const str=
uct pi_desc *pi_desc)
     return test_bit(vector, pi_desc->pir);
 }
=20
+static inline bool pi_is_pir_empty(const struct pi_desc *pi_desc)
+{
+    return bitmap_empty(pi_desc->pir, X86_IDT_VECTORS);
+}
+
 static inline int pi_test_and_set_on(struct pi_desc *pi_desc)
 {
     return test_and_set_bit(POSTED_INTR_ON, &pi_desc->control);
--=20
2=2E56=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.52.2f4fad2419199ce5.1a15996ed88.6a4f53c2a2bf26a6=---

