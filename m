Return-Path: <SRS0=Kis3=EM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E23C2D0A3
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2020 09:36:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4D05208FE
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2020 09:36:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="LfM79q9s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4D05208FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.20541.46511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kayA6-00010p-KC; Fri, 06 Nov 2020 09:36:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20541.46511; Fri, 06 Nov 2020 09:36:02 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kayA6-00010i-Fm; Fri, 06 Nov 2020 09:36:02 +0000
Received: by outflank-mailman (input) for mailman id 20541;
 Fri, 06 Nov 2020 09:36:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kayA5-00010a-AD
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 09:36:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4fae4db4-407c-470c-aaee-c530b2ecd558;
 Fri, 06 Nov 2020 09:36:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A5334ABB2;
 Fri,  6 Nov 2020 09:35:59 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kayA5-00010a-AD
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 09:36:01 +0000
X-Inumbo-ID: 4fae4db4-407c-470c-aaee-c530b2ecd558
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4fae4db4-407c-470c-aaee-c530b2ecd558;
	Fri, 06 Nov 2020 09:36:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604655359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5dIUaobboFAZTb8wiUsGf1F1BaRpXPw/Me/kiFs+0h8=;
	b=LfM79q9ssUxZvLO+ivIZ6VleTEMGnqb/VKDRMkTNj+DxImNELy/TWBkzlsmOh76s9ewFHa
	zzTdlMJHENGSoXq9EdG4tMKiN6X76BRJu15KDnp5FMqrYb7QAUKwoxAjIyUx6hOZ2p0iQB
	wb+BKlIzaCIhrUhF8m9+VzGDkKAjyXo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A5334ABB2;
	Fri,  6 Nov 2020 09:35:59 +0000 (UTC)
Subject: [PATCH v2 3/9] x86/p2m: suppress audit_p2m hook when possible
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>
References: <4b63025f-164c-2e93-3d54-7a7f145ad046@suse.com>
Message-ID: <3d422bf7-9110-23ac-8061-9a7251f54e66@suse.com>
Date: Fri, 6 Nov 2020 10:35:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <4b63025f-164c-2e93-3d54-7a7f145ad046@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

When P2M_AUDIT is false, it's unused, so instead of having a dangling
NULL pointer sit there, omit the field altogether.

Instead of adding "#if P2M_AUDIT && defined(CONFIG_HVM)" in even more
places, fold the latter part right into the definition of P2M_AUDIT.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Fix build with newer clang ("defined" may not be the result of a
    macro expansion).
---
I wonder if !NDEBUG wouldn't better be replaced by CONFIG_DEBUG.

--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1012,7 +1012,7 @@ long arch_do_domctl(
         break;
 #endif
 
-#if P2M_AUDIT && defined(CONFIG_HVM)
+#if P2M_AUDIT
     case XEN_DOMCTL_audit_p2m:
         if ( d == currd )
             ret = -EPERM;
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -1260,7 +1260,9 @@ int ept_p2m_init(struct p2m_domain *p2m)
     p2m->change_entry_type_global = ept_change_entry_type_global;
     p2m->change_entry_type_range = ept_change_entry_type_range;
     p2m->memory_type_changed = ept_memory_type_changed;
+#if P2M_AUDIT
     p2m->audit_p2m = NULL;
+#endif
     p2m->tlb_flush = ept_tlb_flush;
 
     /* Set the memory type used when accessing EPT paging structures. */
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -971,8 +971,8 @@ static int p2m_pt_change_entry_type_rang
     return err;
 }
 
-#if P2M_AUDIT && defined(CONFIG_HVM)
-long p2m_pt_audit_p2m(struct p2m_domain *p2m)
+#if P2M_AUDIT
+static long p2m_pt_audit_p2m(struct p2m_domain *p2m)
 {
     unsigned long entry_count = 0, pmbad = 0;
     unsigned long mfn, gfn, m2pfn;
@@ -1120,8 +1120,6 @@ long p2m_pt_audit_p2m(struct p2m_domain
 
     return pmbad;
 }
-#else
-# define p2m_pt_audit_p2m NULL
 #endif /* P2M_AUDIT */
 
 /* Set up the p2m function pointers for pagetable format */
@@ -1141,8 +1139,6 @@ void p2m_pt_init(struct p2m_domain *p2m)
 
 #if P2M_AUDIT
     p2m->audit_p2m = p2m_pt_audit_p2m;
-#else
-    p2m->audit_p2m = NULL;
 #endif
 }
 
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2435,7 +2435,7 @@ int p2m_altp2m_propagate_change(struct d
 
 /*** Audit ***/
 
-#if P2M_AUDIT && defined(CONFIG_HVM)
+#if P2M_AUDIT
 void audit_p2m(struct domain *d,
                uint64_t *orphans,
                 uint64_t *m2p_bad,
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -31,6 +31,14 @@
 #include <asm/mem_sharing.h>
 #include <asm/page.h>    /* for pagetable_t */
 
+/* Debugging and auditing of the P2M code? */
+#if !defined(NDEBUG) && defined(CONFIG_HVM)
+#define P2M_AUDIT     1
+#else
+#define P2M_AUDIT     0
+#endif
+#define P2M_DEBUGGING 0
+
 extern bool_t opt_hap_1gb, opt_hap_2mb;
 
 /*
@@ -268,7 +276,9 @@ struct p2m_domain {
     int                (*write_p2m_entry)(struct p2m_domain *p2m,
                                           unsigned long gfn, l1_pgentry_t *p,
                                           l1_pgentry_t new, unsigned int level);
+#if P2M_AUDIT
     long               (*audit_p2m)(struct p2m_domain *p2m);
+#endif
 
     /*
      * P2M updates may require TLBs to be flushed (invalidated).
@@ -758,14 +768,6 @@ extern void p2m_pt_init(struct p2m_domai
 void *map_domain_gfn(struct p2m_domain *p2m, gfn_t gfn, mfn_t *mfn,
                      p2m_query_t q, uint32_t *pfec);
 
-/* Debugging and auditing of the P2M code? */
-#ifndef NDEBUG
-#define P2M_AUDIT     1
-#else
-#define P2M_AUDIT     0
-#endif
-#define P2M_DEBUGGING 0
-
 #if P2M_AUDIT
 extern void audit_p2m(struct domain *d,
                       uint64_t *orphans,


