Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E7F606A329
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 13:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=VHxUFMHZ
Received: from list by lists.xenproject.org with outflank-mailman.1455877.1669524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJAHp-0001S6-M9; Tue, 20 Oct 2026 13:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455877.1669524; Tue, 20 Oct 2026 13:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJAHp-0001Qx-FN; Tue, 20 Oct 2026 13:53:53 +0000
Received: by outflank-mailman (input) for mailman id 1455877;
 Tue, 20 Oct 2026 13:53:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15996f3d5000f79f@swg.vates.tech>)
 id 1xJAHn-0001Bj-PM
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 13:53:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJAHn-00DPue-5W
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 15:53:51 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15996f3d5000f79f@swg.vates.tech>)
 id 6ad7725a-bab6-0a2a0a5309dd-0a2a450ad0f6-28
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 15:53:51 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15996f3d5000f79f@swg.vates.tech>)
 id 6ad7726e-f2d2-0a2a450a0019-b9ff1c229ba3-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 15:53:51 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a15996f3d5000f79f.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 13:53:47 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id E2509828FB;
 Tue, 20 Oct 2026 15:53:46 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=rOr97SyIe1ugkipnvYhSxQQI1DhuRpLz45xbXvScgbs=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=VHxUFMHZBiIazn2zsjKykn1dWxuUoK3V0ZcgnmZXnHyHlXZ7QS2d23QaQY1f5Po2z1v0F/5g8
 eL0GDs7/BJcayv/Yizari/oFNDEgAMGlrWY3Y4MoHbAkU5KQRciqgmgQHWQGPzU/kAXegaDaR3s
 Ik7PLAMTjirg23UKIAXv7yCFtxTxDdEzjCAEE9qTKEU87+RCGNR6SD0rEfrf08fzkShE/55zYge
 KFgWXQ18Tey9fRMIWSmLIUyjNy1V7eDEdGowQaEjUrSBSXghKKTBZNxBWXlUOoUtuZdOuhpZbd4
 qqK56STvUXHUBwQJO9rpdIQfphhySr4vLk+gakpZS5Nw==
X-Zone-Loop: dc46f740da4673916ac0ec3ec48c17f15809093f1fc3
x-campaign-type: default
x-transaction-id: 675e14d8-fd03-41c6-a789-bab1c5e22b23
x-swg-uid: 01-3b52d807-c2a2-4bd8-b272-d73a13f696a7
X-Mailer: Sweego
Message-ID:
 <1792504427.8631fc262581453bbf619ec5b2062170.1a15996f3d5000f79f@vates.tech>
x-swg-bid: 1792504427.8631fc262581453bbf619ec5b2062170.1a15996f3d5000f79f
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
Subject: [PATCH 5/6] vmx/apicv: Replace the PI_CSW_{FROM,TO} flags with a boolean
Date: Tue, 20 Oct 2026 15:53:32 +0200
In-Reply-To: <20261020135333.38064-2-teddy.astie@vates.tech>
References: <1792504313.8631fc262581453bbf619ec5b2062170.1a1599536d8000f79f@vates.tech>
 <20261020135333.38064-2-teddy.astie@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.54.2254fd81d8c2d8bd.1a15996f236.68412d95f7ba3d73=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792504427062
X-purgate-ID: tlsNG-4011c0/1792504431-506CECFC-ED568A79/0/0
X-purgate-type: clean
X-purgate-size: 3526
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.54.2254fd81d8c2d8bd.1a15996f236.68412d95f7ba3d73=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Now that vmx_pi_hooks_deassign() no longer keeps the 'switch_to' hook
around on its own, both context switch hooks are always enabled and
disabled together, so there's no point in tracking them separately=2E

A separate indicator is still needed rather than keying off
pi_ops=2Evcpu_block: vmx_pi_hooks_assign() relies on the context switch
hooks being active before NDST is set up and vcpu_block is installed=2E

No functional change=2E

Assisted-by: Claude Opus 5=2E5
Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
Does AVIC needs the previous split flags (FROM/TO) ?
---
 xen/arch/x86/hvm/vmx/vmx=2Ec            | 12 ++++--------
 xen/arch/x86/include/asm/hvm/domain=2Eh |  3 ++-
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx=2Ec b/xen/arch/x86/hvm/vmx/vmx=2Ec
index 6db2529730=2E=2E9ae77fe496 100644
--- a/xen/arch/x86/hvm/vmx/vmx=2Ec
+++ b/xen/arch/x86/hvm/vmx/vmx=2Ec
@@ -74,10 +74,6 @@ static int cf_check vmx_msr_write_intercept(
     unsigned int msr, uint64_t msr_content);
 static void cf_check vmx_invlpg(struct vcpu *v, unsigned long linear);
=20
-/* Values for domain's ->arch=2Ehvm_domain=2Epi_ops=2Eflags=2E */
-#define PI_CSW_FROM (1u << 0)
-#define PI_CSW_TO   (1u << 1)
-
 struct vmx_pi_blocking_vcpu {
     struct list_head     list;
     spinlock_t           lock;
@@ -357,7 +353,7 @@ void vmx_pi_hooks_assign(struct domain *d)
      * This can make sure the PI (especially the NDST feild) is
      * in proper state when we call vmx_vcpu_block()=2E
      */
-    d->arch=2Ehvm=2Epi_ops=2Eflags =3D PI_CSW_FROM | PI_CSW_TO;
+    d->arch=2Ehvm=2Epi_ops=2Ectxt_switch =3D true;
=20
     for_each_vcpu ( d, v )
     {
@@ -395,7 +391,7 @@ void vmx_pi_hooks_deassign(struct domain *d)
     domain_pause(d);
=20
     d->arch=2Ehvm=2Epi_ops=2Evcpu_block =3D NULL;
-    d->arch=2Ehvm=2Epi_ops=2Eflags =3D 0;
+    d->arch=2Ehvm=2Epi_ops=2Ectxt_switch =3D false;
=20
     for_each_vcpu ( d, v )
     {
@@ -1198,7 +1194,7 @@ static void cf_check vmx_ctxt_switch_from(struct vcp=
u *v)
     vmx_restore_host_msrs();
     vmx_save_dr(v);
=20
-    if ( v->domain->arch=2Ehvm=2Epi_ops=2Eflags & PI_CSW_FROM )
+    if ( v->domain->arch=2Ehvm=2Epi_ops=2Ectxt_switch )
         vmx_pi_switch_from(v);
 }
=20
@@ -1207,7 +1203,7 @@ static void cf_check vmx_ctxt_switch_to(struct vcpu =
*v)
     vmx_restore_guest_msrs(v);
     vmx_restore_dr(v);
=20
-    if ( v->domain->arch=2Ehvm=2Epi_ops=2Eflags & PI_CSW_TO )
+    if ( v->domain->arch=2Ehvm=2Epi_ops=2Ectxt_switch )
         vmx_pi_switch_to(v);
 }
=20
diff --git a/xen/arch/x86/include/asm/hvm/domain=2Eh b/xen/arch/x86/includ=
e/asm/hvm/domain=2Eh
index dd7fa96aad=2E=2Ee731096cc4 100644
--- a/xen/arch/x86/include/asm/hvm/domain=2Eh
+++ b/xen/arch/x86/include/asm/hvm/domain=2Eh
@@ -41,7 +41,8 @@ struct mem_sharing_domain
  *     and actually has a physical device assigned =2E
  */
 struct hvm_pi_ops {
-    unsigned int flags;
+    /* Run the PI hooks upon context switch=2E */
+    bool ctxt_switch;
=20
     /*
      * Hook into arch_vcpu_block(), which is called
--=20
2=2E56=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.54.2254fd81d8c2d8bd.1a15996f236.68412d95f7ba3d73=---

