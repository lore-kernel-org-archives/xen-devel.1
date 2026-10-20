Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA51606B667
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 13:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=TYLztz2E
Received: from list by lists.xenproject.org with outflank-mailman.1455876.1669519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJAHp-0001PR-CT; Tue, 20 Oct 2026 13:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455876.1669519; Tue, 20 Oct 2026 13:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJAHp-0001PI-8v; Tue, 20 Oct 2026 13:53:53 +0000
Received: by outflank-mailman (input) for mailman id 1455876;
 Tue, 20 Oct 2026 13:53:51 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15996f17b000f79f@swg.vates.tech>)
 id 1xJAHn-0001BY-Ah
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 13:53:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJAHm-006xHp-NV
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 15:53:50 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15996f17b000f79f@swg.vates.tech>)
 id 6ad7726e-8faa-0a2a0a5109dd-0a2a4506d652-2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 15:53:50 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a15996f17b000f79f@swg.vates.tech>)
 id 6ad7726e-195a-0a2a45060019-b9ff1c228035-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 15:53:50 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a15996f17b000f79f.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 20 Oct 2026 13:53:46 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5494C82800;
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
 q=dns/txt; s=selector1; bh=vrUdu5oSpf6Vj6QPP161AAKtUJ9o8bO5hOPV90BJ4jw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=TYLztz2EeJIqKeCYOv4Hh3mdaw958/fct1B61XIdMNdvq/Qg8ljs9+bE4BtMUP8R6/POcgLdP
 oW20VtWDAUUaIwVAAGNEWQEC7keJ6ruhn+8CVnlyXqNNorfJdEHwYVtctn3Syc4QoXXeE0qUtJ/
 5L3bTvy3TyWr9WWDorPJfKnMAz5tZvmC6+ss5//rZ3LXuCw5Tpga7HFzJZrpOnA8yztZgIKguuE
 y9TMAhRx/4E5OjrY64PhfatOpm8y9CrqkjgU6hbKJLe+r5HgH/7ngJ66cmSf6Au2/MJjpVSEP7S
 GlvztRTWnCf95/wvE72hMxBcsko02op/5vB2WC/vEYDQ==
X-Zone-Loop: ee691cfd165b7a0a1d439529934b37b460714b35d009
x-campaign-type: default
x-transaction-id: e05a6571-8663-4aac-960b-109bcc46efe3
x-swg-uid: 01-4c868f89-d915-4c6f-a9ba-6207317b3b40
X-Mailer: Sweego
Message-ID:
 <1792504426.8631fc262581453bbf619ec5b2062170.1a15996f17b000f79f@vates.tech>
x-swg-bid: 1792504426.8631fc262581453bbf619ec5b2062170.1a15996f17b000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>
Subject: [PATCH 4/6] vmx/apicv: Fully deassign the PI hooks when the last device is removed
Date: Tue, 20 Oct 2026 15:53:31 +0200
In-Reply-To: <20261020135333.38064-2-teddy.astie@vates.tech>
References: <1792504313.8631fc262581453bbf619ec5b2062170.1a1599536d8000f79f@vates.tech>
 <20261020135333.38064-2-teddy.astie@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.53.532838114bc79f7e.1a15996efe2.5a4bdcc6f679e4cf=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792504426467
X-purgate-ID: tlsNG-16d1c6/1792504430-F647377B-69244FE4/0/0
X-purgate-type: clean
X-purgate-size: 4480
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.53.532838114bc79f7e.1a15996efe2.5a4bdcc6f679e4cf=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

vmx_pi_hooks_deassign() has been keeping the 'switch_to' hook installed
forever since 7c00de17562e, for it to clear SN when a vCPU which was
descheduled with SN set runs again=2E  It also has to set ON if anything
got posted to the PIR while SN was set, as otherwise these vectors
would stay parked in there=2E

The domain is paused at that point, so there's no need to defer any of
this to the next context switch: clear SN and set ON as needed right
away, and drop PI_CSW_TO alongside PI_CSW_FROM=2E  Without the hook, NDST
isn't kept up to date anymore, so reset it to APIC_INVALID_DEST for
vmx_pi_hooks_assign() to set it up again upon a later assignment, as it
does for a freshly created vCPU=2E

While at it, also wake up blocked vCPUs with ON set:
vmx_pi_unblock_vcpu() resets NV to posted_intr_vector before taking the
vCPU off the blocking list, so a posting landing in between is only
notified to the pCPU, and nothing would wake the vCPU=2E

Fixes: 7c00de17562e ("VMX: permanently assign PI hook vmx_pi_switch_to()")
Assisted-by: Claude Opus 5=2E5
Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>

---
We're removing the comment that the previous commit fixed=2E
I'm not sure if that would be preferable to merge this one
with the previous one=2E
---
 xen/arch/x86/hvm/vmx/vmx=2Ec | 46 ++++++++++++++++++++++++++------------
 1 file changed, 32 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx=2Ec b/xen/arch/x86/hvm/vmx/vmx=2Ec
index 3d77d77534=2E=2E6db2529730 100644
--- a/xen/arch/x86/hvm/vmx/vmx=2Ec
+++ b/xen/arch/x86/hvm/vmx/vmx=2Ec
@@ -394,25 +394,43 @@ void vmx_pi_hooks_deassign(struct domain *d)
     ASSERT(current->domain !=3D d);
     domain_pause(d);
=20
-    /*
-     * Note that we keep the 'switch_to' hook=2E  Any vCPU which isn't bl=
ocked
-     * has just been descheduled by domain_pause() with the 'switch_from'
-     * hook still in place, and hence has 'SN' set=2E  Interrupts posted =
by the
-     * IOMMU while 'SN' is set only have their vector recorded in the PIR=
,
-     * without setting 'ON'=2E  vmx_pi_switch_to() clears 'SN' and sets '=
ON'
-     * if the PIR isn't empty, so that such vectors get delivered once th=
e
-     * vCPU runs again=2E  It also keeps 'NDST' up to date, which
-     * vmx_pi_hooks_assign() relies upon should a device get assigned aga=
in=2E
-     *
-     * Once 'SN' is clear it stays clear, as nothing sets it anymore, and=
 the
-     * hook is redundant from then on=2E
-     */
     d->arch=2Ehvm=2Epi_ops=2Evcpu_block =3D NULL;
-    d->arch=2Ehvm=2Epi_ops=2Eflags =3D PI_CSW_TO;
+    d->arch=2Ehvm=2Epi_ops=2Eflags =3D 0;
=20
     for_each_vcpu ( d, v )
+    {
+        struct pi_desc *pi_desc =3D &v->arch=2Ehvm=2Evmx=2Epi_desc;
+
         vmx_pi_unblock_vcpu(v);
=20
+        /*
+         * Any vCPU which isn't blocked has just been descheduled by
+         * domain_pause() with the 'switch_from' hook still in place, and
+         * hence has 'SN' set=2E  Nothing sets it anymore from now on, so=
 do
+         * what vmx_pi_switch_to() would have done when the vCPU next run=
s:
+         * clear 'SN', and set 'ON' if anything got posted in the meantim=
e=2E
+         */
+        pi_clear_sn(pi_desc);
+        if ( !pi_is_pir_empty(pi_desc) )
+            pi_set_on(pi_desc);
+
+        /*
+         * A blocked vCPU may have had an interrupt posted after
+         * vmx_pi_unblock_vcpu() reset 'NV' to posted_intr_vector, and, n=
ow
+         * that it is off the blocking list, nobody will wake it up=2E  T=
he
+         * domain is paused, so a spurious wakeup is harmless=2E
+         */
+        if ( pi_test_on(pi_desc) )
+            vcpu_unblock(v);
+
+        /*
+         * Reset 'NDST' to its initial value, for vmx_pi_hooks_assign() t=
o
+         * set it up again if a device gets assigned later on: without th=
e
+         * 'switch_to' hook it isn't kept up to date anymore=2E
+         */
+        write_atomic(&pi_desc->ndst, APIC_INVALID_DEST);
+    }
+
     domain_unpause(d);
 }
=20
--=20
2=2E56=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.53.532838114bc79f7e.1a15996efe2.5a4bdcc6f679e4cf=---

