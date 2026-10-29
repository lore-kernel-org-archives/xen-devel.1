Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F94C606A31F
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 13:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=axBkBCVt
Received: from list by lists.xenproject.org with outflank-mailman.1464704.1675576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMQfF-0000PP-87; Thu, 29 Oct 2026 13:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464704.1675576; Thu, 29 Oct 2026 13:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMQfF-0000PI-5Q; Thu, 29 Oct 2026 13:59:33 +0000
Received: by outflank-mailman (input) for mailman id 1464704;
 Thu, 29 Oct 2026 13:59:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a187f55469000f79f@swg.vates.tech>)
 id 1xMQfD-0000PC-Jd
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 13:59:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMQfD-006hw8-0G
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 14:59:31 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a187f55469000f79f@swg.vates.tech>)
 id 6ae3513a-bab6-0a2a0a5309dd-0a2a4506e970-24
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 14:59:30 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a187f55469000f79f@swg.vates.tech>)
 id 6ae35142-195a-0a2a45060019-b9ff1c2296f9-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 14:59:30 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a187f55469000f79f.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 29 Oct 2026 13:59:24 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 8DEA881F81;
 Thu, 29 Oct 2026 14:59:23 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=ngP0V0CyZiKEvVbwG2RaqA/mms4DwbxyAVzE2p6XZ8w=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=axBkBCVtoIkuwe/uTmbCOgyp4IYk6Nf+ySZAbDXJU60o4D2PQhANh1VTlqCEIA3ST8Z6lHjDX
 JClMnNem4Ei+MCw0k/UI/54b0cV9tcS9HAdB/Zs4+J9bpMC4j52lWW991Zbjb9u9aGmfxOB4FUp
 aJjE84+vo0GJ9ofC/xNyNQnQGbAc/4UbZN0KEJqxu0hzQal18lcE/usVBSmFo4mbBYi2BV/CdDf
 76dRxeHbShwmKbjiqYWMmKElggoUPc1AzakQIeHg4/oYCItiO6D8oO4DsOwclm6YsvCz7NB1LMX
 X4is/ci8ycncJ6iFueBeEcAMAXpZ+KLYd4rKSiev2iJw==
X-Zone-Loop: ecf0d029a7fa486bf737e2443a8f28174620dbf1e55c
x-campaign-type: default
x-transaction-id: affd84d6-5218-4cdd-81dc-fa2c1a18e225
x-swg-uid: 01-ad61ac13-1048-4442-a97d-a2ea33ac3558
X-Mailer: Sweego
Message-ID:
 <1793282364.8631fc262581453bbf619ec5b2062170.1a187f55469000f79f@vates.tech>
x-swg-bid: 1793282364.8631fc262581453bbf619ec5b2062170.1a187f55469000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>
Subject: [PATCH] common: Convert !test_bit(_VPF_down) into is_vcpu_online()
Date: Thu, 29 Oct 2026 14:58:47 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2e1.2451c527bc220225.1a187f551a5.6ccfb3988fd86c8c=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793282363817
X-purgate-ID: tlsNG-16d1c6/1793282370-FCC0777B-72A9A542/0/0
X-purgate-type: clean
X-purgate-size: 4611
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.2e1.2451c527bc220225.1a187f551a5.6ccfb3988fd86c8c=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Do the same for test_bit(_VPF_down) into !is_vcpu_online()=2E

No functional change=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 xen/arch/arm/domctl=2Ec  | 2 +-
 xen/arch/arm/traps=2Ec   | 2 +-
 xen/arch/arm/vgic=2Ec    | 2 +-
 xen/arch/arm/vpsci=2Ec   | 4 ++--
 xen/arch/x86/pv/shim=2Ec | 2 +-
 xen/arch/x86/traps=2Ec   | 2 +-
 xen/common/domain=2Ec    | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/domctl=2Ec b/xen/arch/arm/domctl=2Ec
index b76af56fad=2E=2E292cc92159 100644
--- a/xen/arch/arm/domctl=2Ec
+++ b/xen/arch/arm/domctl=2Ec
@@ -203,7 +203,7 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_co=
ntext_u c)
     ctxt->ttbr1 =3D v->arch=2Ettbr1;
     ctxt->ttbcr =3D v->arch=2Ettbcr;
=20
-    if ( !test_bit(_VPF_down, &v->pause_flags) )
+    if ( is_vcpu_online(v) )
         ctxt->flags |=3D VGCF_online;
 }
=20
diff --git a/xen/arch/arm/traps=2Ec b/xen/arch/arm/traps=2Ec
index 6a5dcef2aa=2E=2E47a5c6bdd4 100644
--- a/xen/arch/arm/traps=2Ec
+++ b/xen/arch/arm/traps=2Ec
@@ -1004,7 +1004,7 @@ static void show_guest_stack(struct vcpu *v, const s=
truct cpu_user_regs *regs)
     void *mapped;
     unsigned long *stack, addr;
=20
-    if ( test_bit(_VPF_down, &v->pause_flags) )
+    if ( !is_vcpu_online(v) )
     {
         printk("No stack trace, VCPU offline\n");
         return;
diff --git a/xen/arch/arm/vgic=2Ec b/xen/arch/arm/vgic=2Ec
index acded6a40f=2E=2E062238a899 100644
--- a/xen/arch/arm/vgic=2Ec
+++ b/xen/arch/arm/vgic=2Ec
@@ -818,7 +818,7 @@ void vgic_inject_irq(struct domain *d, struct vcpu *v,=
 unsigned int virq,
     }
=20
     /* vcpu offline */
-    if ( test_bit(_VPF_down, &v->pause_flags) )
+    if ( !is_vcpu_online(v) )
     {
         spin_unlock_irqrestore(&v->arch=2Evgic=2Elock, flags);
         return;
diff --git a/xen/arch/arm/vpsci=2Ec b/xen/arch/arm/vpsci=2Ec
index ac6af6118f=2E=2Eb2b6b4c98d 100644
--- a/xen/arch/arm/vpsci=2Ec
+++ b/xen/arch/arm/vpsci=2Ec
@@ -85,7 +85,7 @@ static int do_common_cpu_on(register_t target_cpu, regis=
ter_t entry_point,
     if ( is_64bit_domain(d) && is_thumb )
         return PSCI_INVALID_ADDRESS;
=20
-    if ( !test_bit(_VPF_down, &v->pause_flags) )
+    if ( is_vcpu_online(v) )
         return PSCI_ALREADY_ON;
=20
     rc =3D vpsci_build_guest_context(v, entry_point, context_id, &ctxt);
@@ -195,7 +195,7 @@ static int32_t do_psci_0_2_affinity_info(register_t ta=
rget_affinity,
         v =3D d->vcpu[vcpuid];
=20
         if ( ( ( v->arch=2Evmpidr & tmask ) =3D=3D target_affinity )
-                && ( !test_bit(_VPF_down, &v->pause_flags) ) )
+                && ( is_vcpu_online(v) ) )
             return PSCI_0_2_AFFINITY_LEVEL_ON;
     }
=20
diff --git a/xen/arch/x86/pv/shim=2Ec b/xen/arch/x86/pv/shim=2Ec
index 41000b0523=2E=2E8ec03d7295 100644
--- a/xen/arch/x86/pv/shim=2Ec
+++ b/xen/arch/x86/pv/shim=2Ec
@@ -404,7 +404,7 @@ int pv_shim_shutdown(uint8_t reason)
         /* Stop the singleshot timer=2E */
         stop_timer(&v->singleshot_timer);
=20
-        if ( test_bit(_VPF_down, &v->pause_flags) )
+        if ( !is_vcpu_online(v) )
             BUG_ON(vcpu_reset(v));
=20
         if ( v !=3D current )
diff --git a/xen/arch/x86/traps=2Ec b/xen/arch/x86/traps=2Ec
index ac01ba0872=2E=2E5a702fe22c 100644
--- a/xen/arch/x86/traps=2Ec
+++ b/xen/arch/x86/traps=2Ec
@@ -918,7 +918,7 @@ void vcpu_show_execution_state(struct vcpu *v)
 {
     unsigned long flags =3D 0;
=20
-    if ( test_bit(_VPF_down, &v->pause_flags) )
+    if ( !is_vcpu_online(v) )
     {
         printk("*** %pv is offline ***\n", v);
         return;
diff --git a/xen/common/domain=2Ec b/xen/common/domain=2Ec
index 6b52713518=2E=2E167338f360 100644
--- a/xen/common/domain=2Ec
+++ b/xen/common/domain=2Ec
@@ -2190,7 +2190,7 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUE=
ST_HANDLE_PARAM(void) arg)
=20
     case VCPUOP_down:
         for_each_vcpu ( d, v )
-            if ( v->vcpu_id !=3D vcpuid && !test_bit(_VPF_down, &v->pause=
_flags) )
+            if ( v->vcpu_id !=3D vcpuid && is_vcpu_online(v) )
             {
                rc =3D 1;
                break;
--=20
2=2E56=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.2e1.2451c527bc220225.1a187f551a5.6ccfb3988fd86c8c=---

