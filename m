Return-Path: <SRS0=Kis3=EM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B63C2D0A3
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2020 09:38:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87D50208FE
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2020 09:38:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="hFQdSaoZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87D50208FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.20560.46559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kayC7-0001We-UC; Fri, 06 Nov 2020 09:38:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20560.46559; Fri, 06 Nov 2020 09:38:07 +0000
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
	id 1kayC7-0001WX-QM; Fri, 06 Nov 2020 09:38:07 +0000
Received: by outflank-mailman (input) for mailman id 20560;
 Fri, 06 Nov 2020 09:38:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kayC7-0001WP-3N
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 09:38:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba8c70f6-f202-43ec-ae61-5664e5e78cf7;
 Fri, 06 Nov 2020 09:38:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5B66CAB8F;
 Fri,  6 Nov 2020 09:38:05 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kayC7-0001WP-3N
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 09:38:07 +0000
X-Inumbo-ID: ba8c70f6-f202-43ec-ae61-5664e5e78cf7
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ba8c70f6-f202-43ec-ae61-5664e5e78cf7;
	Fri, 06 Nov 2020 09:38:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604655485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4luM7MlPeuTiZGoTwImWIMS+Z6u+POF2aKYB3Z/AaQQ=;
	b=hFQdSaoZG3mAy8CIobKtYaGvMoC/vMK+kQDMnf3LPLiyKneaEq0cyf6gsPGEbgmZjeS5tl
	bUdcxqBx2QtTMVQRu50zKbaVYFVyyoeOxzoEtALKxKDIPP31Ub/7b+qqPZ56tUVW6KCJqz
	hpZfRrEzImebNZypRbMb0tAxMSwJQmE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5B66CAB8F;
	Fri,  6 Nov 2020 09:38:05 +0000 (UTC)
Subject: [PATCH v2 7/9] x86/p2m: pass old PTE directly to
 write_p2m_entry_pre() hook
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
References: <4b63025f-164c-2e93-3d54-7a7f145ad046@suse.com>
Message-ID: <9d10a4be-e463-0d3d-39c0-0920761537c5@suse.com>
Date: Fri, 6 Nov 2020 10:38:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <4b63025f-164c-2e93-3d54-7a7f145ad046@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

In no case is a pointer to non-const needed. Since no pointer arithmetic
is done by the sole user of the hook, passing in the PTE itself is quite
fine.

While doing this adjustment also
- drop the intermediate sh_write_p2m_entry_pre():
  sh_unshadow_for_p2m_change() can itself be used as the hook function,
  moving the conditional into there,
- introduce a local variable holding the flags of the old entry.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -135,7 +135,7 @@ static int write_p2m_entry(struct p2m_do
         paging_lock(d);
 
         if ( p2m->write_p2m_entry_pre && gfn != gfn_x(INVALID_GFN) )
-            p2m->write_p2m_entry_pre(d, gfn, p, new, level);
+            p2m->write_p2m_entry_pre(d, gfn, *p, new, level);
 
         oflags = l1e_get_flags(*p);
         omfn = l1e_get_mfn(*p);
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -3078,19 +3078,28 @@ static int shadow_test_disable(struct do
  */
 
 static void sh_unshadow_for_p2m_change(struct domain *d, unsigned long gfn,
-                                       l1_pgentry_t *p, l1_pgentry_t new,
+                                       l1_pgentry_t old, l1_pgentry_t new,
                                        unsigned int level)
 {
+    unsigned int oflags = l1e_get_flags(old);
+
+    /*
+     * If there are any shadows, update them.  But if shadow_teardown()
+     * has already been called then it's not safe to try.
+     */
+    if ( unlikely(!d->arch.paging.shadow.total_pages) )
+        return;
+
     /* The following assertion is to make sure we don't step on 1GB host
      * page support of HVM guest. */
-    ASSERT(!(level > 2 && (l1e_get_flags(*p) & _PAGE_PRESENT) &&
-             (l1e_get_flags(*p) & _PAGE_PSE)));
+    ASSERT(!(level > 2 && (oflags & _PAGE_PRESENT) && (oflags & _PAGE_PSE)));
 
     /* If we're removing an MFN from the p2m, remove it from the shadows too */
     if ( level == 1 )
     {
-        mfn_t mfn = l1e_get_mfn(*p);
-        p2m_type_t p2mt = p2m_flags_to_type(l1e_get_flags(*p));
+        mfn_t mfn = l1e_get_mfn(old);
+        p2m_type_t p2mt = p2m_flags_to_type(oflags);
+
         if ( (p2m_is_valid(p2mt) || p2m_is_grant(p2mt)) && mfn_valid(mfn) )
         {
             sh_remove_all_shadows_and_parents(d, mfn);
@@ -3102,15 +3111,15 @@ static void sh_unshadow_for_p2m_change(s
     /* If we're removing a superpage mapping from the p2m, we need to check
      * all the pages covered by it.  If they're still there in the new
      * scheme, that's OK, but otherwise they must be unshadowed. */
-    if ( level == 2 && (l1e_get_flags(*p) & _PAGE_PRESENT) &&
-         (l1e_get_flags(*p) & _PAGE_PSE) )
+    if ( level == 2 && (oflags & _PAGE_PRESENT) && (oflags & _PAGE_PSE) )
     {
         unsigned int i;
         cpumask_t flushmask;
-        mfn_t omfn = l1e_get_mfn(*p);
+        mfn_t omfn = l1e_get_mfn(old);
         mfn_t nmfn = l1e_get_mfn(new);
         l1_pgentry_t *npte = NULL;
-        p2m_type_t p2mt = p2m_flags_to_type(l1e_get_flags(*p));
+        p2m_type_t p2mt = p2m_flags_to_type(oflags);
+
         if ( p2m_is_valid(p2mt) && mfn_valid(omfn) )
         {
             cpumask_clear(&flushmask);
@@ -3144,16 +3153,6 @@ static void sh_unshadow_for_p2m_change(s
     }
 }
 
-static void
-sh_write_p2m_entry_pre(struct domain *d, unsigned long gfn, l1_pgentry_t *p,
-                       l1_pgentry_t new, unsigned int level)
-{
-    /* If there are any shadows, update them.  But if shadow_teardown()
-     * has already been called then it's not safe to try. */
-    if ( likely(d->arch.paging.shadow.total_pages != 0) )
-         sh_unshadow_for_p2m_change(d, gfn, p, new, level);
-}
-
 #if (SHADOW_OPTIMIZATIONS & SHOPT_FAST_FAULT_PATH)
 static void
 sh_write_p2m_entry_post(struct p2m_domain *p2m, unsigned int oflags)
@@ -3178,7 +3177,7 @@ sh_write_p2m_entry_post(struct p2m_domai
 
 void shadow_p2m_init(struct p2m_domain *p2m)
 {
-    p2m->write_p2m_entry_pre  = sh_write_p2m_entry_pre;
+    p2m->write_p2m_entry_pre  = sh_unshadow_for_p2m_change;
     p2m->write_p2m_entry_post = sh_write_p2m_entry_post;
 }
 
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -274,7 +274,7 @@ struct p2m_domain {
     void               (*memory_type_changed)(struct p2m_domain *p2m);
     void               (*write_p2m_entry_pre)(struct domain *d,
                                               unsigned long gfn,
-                                              l1_pgentry_t *p,
+                                              l1_pgentry_t old,
                                               l1_pgentry_t new,
                                               unsigned int level);
     void               (*write_p2m_entry_post)(struct p2m_domain *p2m,


