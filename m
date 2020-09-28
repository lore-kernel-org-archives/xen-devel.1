Return-Path: <SRS0=Jb4W=DF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA72C4727F
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2020 11:58:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BAA620774
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2020 11:58:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Fg93szN6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BAA620774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMrnO-00033v-8c; Mon, 28 Sep 2020 11:58:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMrnN-00033U-25
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 11:58:17 +0000
X-Inumbo-ID: 8d94be41-9bf8-41a7-9e80-4912efb91dea
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d94be41-9bf8-41a7-9e80-4912efb91dea;
 Mon, 28 Sep 2020 11:58:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601294295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CsG+aphuX1HQft8qqct3CdbxURiqtK11xbyQxpROX/k=;
 b=Fg93szN6RBJoqraYYcMbaskBq9dsVOyzq81V2lXUQ6lcyP63ZR7MzaGrRWj8EFvxJQTIg0
 +e4AJWr7nZ1xcE0021KXhTG+JVnBV0EpBEJX//niNM6VHuwiOYbeEILZ3wmETMFgsLIxIp
 6Bo+xV7VlrVxlIDklKeE90M/ExJ0i1g=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 576E8AC97;
 Mon, 28 Sep 2020 11:58:15 +0000 (UTC)
Subject: [PATCH 2/2] x86/mm: remove some indirection from
 {paging,sh}_cmpxchg_guest_entry()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <a7d93ec1-ed89-fbdb-1b52-4091870f7fab@suse.com>
Message-ID: <cc2ad2fb-8fd1-499e-a902-9bf8dca3ab1a@suse.com>
Date: Mon, 28 Sep 2020 13:58:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <a7d93ec1-ed89-fbdb-1b52-4091870f7fab@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Make the functions more similar to cmpxchg() in that they now take an
integral "old" input and return the value read.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -398,8 +398,8 @@ int shadow_write_p2m_entry(struct p2m_do
 /* Functions that atomically write PV guest PT entries */
 void sh_write_guest_entry(struct vcpu *v, intpte_t *p, intpte_t new,
                           mfn_t gmfn);
-void sh_cmpxchg_guest_entry(struct vcpu *v, intpte_t *p, intpte_t *old,
-                            intpte_t new, mfn_t gmfn);
+intpte_t sh_cmpxchg_guest_entry(struct vcpu *v, intpte_t *p, intpte_t old,
+                                intpte_t new, mfn_t gmfn);
 
 /* Update all the things that are derived from the guest's CR0/CR3/CR4.
  * Called to initialize paging structures if the paging mode
--- a/xen/arch/x86/mm/shadow/pv.c
+++ b/xen/arch/x86/mm/shadow/pv.c
@@ -39,22 +39,22 @@ sh_write_guest_entry(struct vcpu *v, int
 
 /*
  * Cmpxchg a new value into the guest pagetable, and update the shadows
- * appropriately.
- * N.B. caller should check the value of "old" to see if the cmpxchg itself
- * was successful.
+ * appropriately.  Returns the previous entry found, which the caller is
+ * expected to check to see if the cmpxchg was successful.
  */
-void
-sh_cmpxchg_guest_entry(struct vcpu *v, intpte_t *p, intpte_t *old,
+intpte_t
+sh_cmpxchg_guest_entry(struct vcpu *v, intpte_t *p, intpte_t old,
                        intpte_t new, mfn_t gmfn)
 {
     intpte_t t;
 
     paging_lock(v->domain);
-    t = cmpxchg(p, *old, new);
-    if ( t == *old )
+    t = cmpxchg(p, old, new);
+    if ( t == old )
         sh_validate_guest_entry(v, gmfn, p, sizeof(new));
-    *old = t;
     paging_unlock(v->domain);
+
+    return t;
 }
 
 /*
--- a/xen/arch/x86/pv/mm.h
+++ b/xen/arch/x86/pv/mm.h
@@ -47,16 +47,14 @@ static inline bool update_intpte(intpte_
     else
 #endif
     {
-        intpte_t t = old;
-
         for ( ; ; )
         {
-            intpte_t _new = new;
+            intpte_t _new = new, t;
 
             if ( preserve_ad )
                 _new |= old & (_PAGE_ACCESSED | _PAGE_DIRTY);
 
-            paging_cmpxchg_guest_entry(v, p, &t, _new, mfn);
+            t = paging_cmpxchg_guest_entry(v, p, old, _new, mfn);
 
             if ( t == old )
                 break;
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -168,8 +168,8 @@ static int ptwr_emulated_update(unsigned
     if ( p_old )
     {
         ol1e = l1e_from_intpte(old);
-        paging_cmpxchg_guest_entry(v, &l1e_get_intpte(*pl1e), &old,
-                                   l1e_get_intpte(nl1e), mfn);
+        old = paging_cmpxchg_guest_entry(v, &l1e_get_intpte(*pl1e), old,
+                                         l1e_get_intpte(nl1e), mfn);
         if ( l1e_get_intpte(ol1e) == old )
             ret = X86EMUL_OKAY;
         else
--- a/xen/include/asm-x86/paging.h
+++ b/xen/include/asm-x86/paging.h
@@ -98,8 +98,8 @@ struct shadow_paging_mode {
 #ifdef CONFIG_PV
     void          (*write_guest_entry     )(struct vcpu *v, intpte_t *p,
                                             intpte_t new, mfn_t gmfn);
-    void          (*cmpxchg_guest_entry   )(struct vcpu *v, intpte_t *p,
-                                            intpte_t *old, intpte_t new,
+    intpte_t      (*cmpxchg_guest_entry   )(struct vcpu *v, intpte_t *p,
+                                            intpte_t old, intpte_t new,
                                             mfn_t gmfn);
 #endif
 #ifdef CONFIG_HVM
@@ -342,16 +342,15 @@ static inline void paging_write_guest_en
  * true if not.  N.B. caller should check the value of "old" to see if the
  * cmpxchg itself was successful.
  */
-static inline void paging_cmpxchg_guest_entry(
-    struct vcpu *v, intpte_t *p, intpte_t *old, intpte_t new, mfn_t gmfn)
+static inline intpte_t paging_cmpxchg_guest_entry(
+    struct vcpu *v, intpte_t *p, intpte_t old, intpte_t new, mfn_t gmfn)
 {
 #ifdef CONFIG_SHADOW_PAGING
     if ( unlikely(paging_mode_shadow(v->domain)) && paging_get_hostmode(v) )
-        paging_get_hostmode(v)->shadow.cmpxchg_guest_entry(v, p, old,
-                                                           new, gmfn);
-    else
+        return paging_get_hostmode(v)->shadow.cmpxchg_guest_entry(v, p, old,
+                                                                  new, gmfn);
 #endif
-        *old = cmpxchg(p, *old, new);
+    return cmpxchg(p, old, new);
 }
 
 #endif /* CONFIG_PV */


