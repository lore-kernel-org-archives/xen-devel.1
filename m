Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0703AC5516D
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2026 14:48:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1379230.1623981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpoXL-0007SE-AJ; Fri, 31 Jul 2026 14:48:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1379230.1623981; Fri, 31 Jul 2026 14:48:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpoXL-0007Qt-5K; Fri, 31 Jul 2026 14:48:35 +0000
Received: by outflank-mailman (input) for mailman id 1379230;
 Fri, 31 Jul 2026 14:48:33 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fb8a5e798000e099@swg.vates.tech>)
 id 1wpoXJ-0007N4-PP
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 14:48:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpoXJ-00CUBm-6C
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 16:48:33 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fb8a5e798000e099@swg.vates.tech>)
 id 6a6cb596-e002-0a2a0a5209dd-0a2a4507c5fc-46
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 16:48:33 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fb8a5e798000e099@swg.vates.tech>)
 id 6a6cb5c0-b4ea-0a2a45070019-b9ff1c238c93-3
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 16:48:32 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fb8a5e798000e099.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 31 Jul 2026 14:48:28 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id B8C6880D94;
 Fri, 31 Jul 2026 16:48:27 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=Q2F0FlO7w3yECG/9TsvG+DDJbpDrd0E51fLuG5f35IE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=AlBQpVohFp3vGIFmMjBTkHa6AchTTIrOIhTgeoCQ46yCMZWEr9cjrNtwiq+BWoXAidNh7mqsU
 qMesGJ4qHKxuqWO6TYWfajEK6rzkwLVowJRkK9a3kE/RK3vVdnzYzbnUoX6H/8Kx4+ifxT2W9l8
 1r5YqRJZLuPTj2QybzindNJ0hMfVsk3xQ4HICLcIvyNzET0sAKVo+NVnQKaWJYeICQdsNzYmEVG
 crHIHtnpbelRVBiWI2/bDb0HlxUBqnWrvziZgw9gcR9FNNWlR40BgFjmnHAm0qT2LClk9nFnG6L
 o+9lodi0V2cGCOMrfIoasbgYuJ/zpe9434/i5U3CyUig==
X-Zone-Loop: 485e407c4cfc042718acb54935d554a7ecb75bda4930
x-campaign-type: default
x-transaction-id: 8ee2bcd0-0c7b-47cc-9ed5-fe788794b472
x-swg-uid: 01-899fd023-2ef8-4202-b916-3856a104c299
X-Mailer: Sweego
Message-ID:
 <1785509308.8631fc262581453bbf619ec5b2062170.19fb8a5e798000e099@vates.tech>
x-swg-bid: 1785509308.8631fc262581453bbf619ec5b2062170.19fb8a5e798000e099
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
Subject: [RFC PATCH v2 3/5] x86: Track vcpu context switches and introduce needs_tlb_flush field
Date: Fri, 31 Jul 2026 16:46:21 +0200
In-Reply-To: <1785509179.8631fc262581453bbf619ec5b2062170.19fb8a3efe8000e099@vates.tech>
References: <1785509179.8631fc262581453bbf619ec5b2062170.19fb8a3efe8000e099@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1901.533985bc8e84151.19fb8a5e5f2.e118d770c751f179=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1785509307890
X-purgate-ID: tlsNG-ef75cf/1785509312-34ECEAE4-91DCB2B6/0/0
X-purgate-type: clean
X-purgate-size: 4750

---=Part.1901.533985bc8e84151.19fb8a5e5f2.e118d770c751f179=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Introduce needs_tlb_flush that indicate that the vCPU related TLB
needs to be flushed before entering this domain=2E This is intended
to be used later for using the same ASID for all vCPU of a domain=2E

Also track vCPU context switch to determine :
 - per vcpu "latest_cpu" that tracks which pCPU last ran this vCPU,
   this is used to know whether our current TLB (of our pCPU) state
   is stale=2E
   Schedule a TLB flush if the vCPU ran on another pCPU previously=2E
 - per pCPU "latest_vcpu" (per domain) that tracks which vCPU the
   TLB+ASID/VPID is holding onto=2E
   Schedule a TLB flush if this pCPU hasn't ran this vCPU previously
   (which can happen if we context-switch multiples vCPUs of a same
   domain on a same pCPU)=2E

If ASID use is disabled, unconditionnaly perform a TLB flush=2E

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
v2: Merge several patches into one, move logic to context_switch(),
    move fields to arch_vcpu/arch_domain, consider !asid_enabled case=2E
---
 xen/arch/x86/domain=2Ec             | 26 ++++++++++++++++++++++++++
 xen/arch/x86/include/asm/domain=2Eh |  6 ++++++
 2 files changed, 32 insertions(+)

diff --git a/xen/arch/x86/domain=2Ec b/xen/arch/x86/domain=2Ec
index 996b50af7a=2E=2E27155546ca 100644
--- a/xen/arch/x86/domain=2Ec
+++ b/xen/arch/x86/domain=2Ec
@@ -38,6 +38,7 @@
 #include <xen/smp=2Eh>
 #include <xen/softirq=2Eh>
 #include <xen/wait=2Eh>
+#include <xen/xvmalloc=2Eh>
=20
 #include <asm/amd=2Eh>
 #include <asm/cpu-policy=2Eh>
@@ -874,6 +875,13 @@ int arch_domain_create(struct domain *d,
=20
     spec_ctrl_init_domain(d);
=20
+    rc =3D -ENOMEM;
+    d->arch=2Elatest_vcpu =3D xvmalloc_array(int, nr_cpu_ids);
+    if ( !d->arch=2Elatest_vcpu )
+        goto fail;
+    for (unsigned int i =3D 0; i < nr_cpu_ids; i++)
+        d->arch=2Elatest_vcpu[i] =3D -1;
+
     if ( (rc =3D paging_domain_init(d)) !=3D 0 )
         goto fail;
     paging_initialised =3D true;
@@ -964,6 +972,7 @@ void arch_domain_destroy(struct domain *d)
=20
     xfree(d->arch=2Ee820);
     XFREE(d->arch=2Ecpu_policy);
+    XFREE(d->arch=2Elatest_vcpu);
=20
     free_domain_pirqs(d);
     if ( !is_idle_domain(d) )
@@ -2183,6 +2192,23 @@ void context_switch(struct vcpu *prev, struct vcpu =
*next)
         ASSERT(!vcpu_cpu_dirty(next));
     }
=20
+    /**
+     * Check if we were the latest vCPU of this domain that ran on this p=
CPU=2E
+     * Flush the TLB if it is not, as the TLB entries are the ones from t=
he previous
+     * vCPU=2E If we weren't the latest pCPU, always perform a TLB flush =
as we may be
+     * out of sync=2E
+     */
+    if ( nextd->arch=2Elatest_vcpu )
+    {
+        if ( !asid_enabled ||
+             nextd->arch=2Elatest_vcpu[cpu] !=3D next->vcpu_id ||
+             next->arch=2Elatest_cpu !=3D cpu )
+            next->arch=2Eneeds_tlb_flush =3D true;
+
+        nextd->arch=2Elatest_vcpu[cpu] =3D next->vcpu_id;
+        next->arch=2Elatest_cpu =3D cpu;
+    }
+
     _update_runstate_area(prev);
     vpmu_switch_from(prev);
     np2m_schedule(NP2M_SCHEDLE_OUT);
diff --git a/xen/arch/x86/include/asm/domain=2Eh b/xen/arch/x86/include/as=
m/domain=2Eh
index e0ce8b4c39=2E=2Ec67af79da2 100644
--- a/xen/arch/x86/include/asm/domain=2Eh
+++ b/xen/arch/x86/include/asm/domain=2Eh
@@ -345,6 +345,10 @@ struct arch_domain
         struct hvm_domain hvm;
     };
=20
+    /* Mapping of the latest vCPU that ran on a specific CPU, thus hold
+     * the current domain TLB state (-1 if the vCPU hasn't ran yet) */
+    int *latest_vcpu;
+
     struct paging_domain paging;
     struct p2m_domain *p2m;
     /* To enforce lock ordering in the pod code wrt the
@@ -647,8 +651,10 @@ struct arch_vcpu
                                         /* former, if any */
     bool old_guest_table_partial;       /* Are we dropping a type ref, or=
 just
                                          * finishing up a partial de-vali=
dation? */
+    bool needs_tlb_flush;               /* VCPU needs its TLB flushed bef=
ore waking? */
=20
     unsigned long cr3;                  /* (MA) value to install in HW CR=
3 */
+    unsigned int latest_cpu;            /* Latest pCPU that ran this VCPU=
=2E */
=20
     /*
      * The save area for Processor Extended States and the bitmask of the
--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.1901.533985bc8e84151.19fb8a5e5f2.e118d770c751f179=---

