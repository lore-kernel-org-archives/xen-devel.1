Return-Path: <SRS0=xPWR=G4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81CB4C433DB
	for <xen-devel@archiver.kernel.org>; Mon, 25 Jan 2021 11:07:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D9CA22482
	for <xen-devel@archiver.kernel.org>; Mon, 25 Jan 2021 11:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D9CA22482
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.74015.133031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3ziL-0003OE-Cv; Mon, 25 Jan 2021 11:07:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74015.133031; Mon, 25 Jan 2021 11:07:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3ziL-0003O7-9X; Mon, 25 Jan 2021 11:07:21 +0000
Received: by outflank-mailman (input) for mailman id 74015;
 Mon, 25 Jan 2021 11:07:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dw2F=G4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l3ziK-0003O2-Ix
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 11:07:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7fdfd6a-c7a0-43f1-8c74-3aad4388bc58;
 Mon, 25 Jan 2021 11:07:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C4A50ADC1;
 Mon, 25 Jan 2021 11:07:18 +0000 (UTC)
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
X-Inumbo-ID: a7fdfd6a-c7a0-43f1-8c74-3aad4388bc58
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611572838; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OCH5mNo/fxjiEqHTunmH5wmzPdxMGOeLfyDAlBqrF3A=;
	b=XxMCDQc/Qjc48my6dWcGpPWMl/0IIaik9uTeNNha/pEAv6PtnagLY42XY1KsAH8mEkCmN+
	JSikBOO9TOiaVvEnXbJ7WXs1suzLBW9JybYIJhCHb/7AsPKYntyu9Rr2yGTlxjYPelhiRd
	zzWbCLe3g7tyYNDrrMokAp+E6YyDYzA=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/shadow: replace stale literal numbers in
 hash_{vcpu,domain}_foreach()
Message-ID: <035e3959-d15b-e897-1c57-9ff713d64da3@suse.com>
Date: Mon, 25 Jan 2021 12:07:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

15 apparently once used to be the last valid type to request a callback
for, and the dimension of the respective array. The arrays meanwhile are
larger than this (in a benign way, i.e. no caller ever sets a mask bit
higher than 15), dimensioned by SH_type_unused. Have the ASSERT()s
follow suit and add build time checks at the call sites.

Also adjust a comment naming the wrong of the two functions.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The ASSERT()s being adjusted look redundant with the BUILD_BUG_ON()s
being added, so I wonder whether dropping them wouldn't be the better
route.

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1623,6 +1623,9 @@ void shadow_hash_delete(struct domain *d
 typedef int (*hash_vcpu_callback_t)(struct vcpu *v, mfn_t smfn, mfn_t other_mfn);
 typedef int (*hash_domain_callback_t)(struct domain *d, mfn_t smfn, mfn_t other_mfn);
 
+#define HASH_CALLBACKS_CHECK(mask) \
+    BUILD_BUG_ON((mask) > (1U << ARRAY_SIZE(callbacks)) - 1)
+
 static void hash_vcpu_foreach(struct vcpu *v, unsigned int callback_mask,
                               const hash_vcpu_callback_t callbacks[],
                               mfn_t callback_mfn)
@@ -1658,7 +1661,7 @@ static void hash_vcpu_foreach(struct vcp
         {
             if ( callback_mask & (1 << x->u.sh.type) )
             {
-                ASSERT(x->u.sh.type <= 15);
+                ASSERT(x->u.sh.type < SH_type_unused);
                 ASSERT(callbacks[x->u.sh.type] != NULL);
                 done = callbacks[x->u.sh.type](v, page_to_mfn(x),
                                                callback_mfn);
@@ -1705,7 +1708,7 @@ static void hash_domain_foreach(struct d
         {
             if ( callback_mask & (1 << x->u.sh.type) )
             {
-                ASSERT(x->u.sh.type <= 15);
+                ASSERT(x->u.sh.type < SH_type_unused);
                 ASSERT(callbacks[x->u.sh.type] != NULL);
                 done = callbacks[x->u.sh.type](d, page_to_mfn(x),
                                                callback_mfn);
@@ -2009,6 +2012,7 @@ int sh_remove_write_access(struct domain
         perfc_incr(shadow_writeable_bf_1);
     else
         perfc_incr(shadow_writeable_bf);
+    HASH_CALLBACKS_CHECK(callback_mask);
     hash_domain_foreach(d, callback_mask, callbacks, gmfn);
 
     /* If that didn't catch the mapping, then there's some non-pagetable
@@ -2080,6 +2084,7 @@ int sh_remove_all_mappings(struct domain
 
     /* Brute-force search of all the shadows, by walking the hash */
     perfc_incr(shadow_mappings_bf);
+    HASH_CALLBACKS_CHECK(callback_mask);
     hash_domain_foreach(d, callback_mask, callbacks, gmfn);
 
     /* If that didn't catch the mapping, something is very wrong */
@@ -2246,10 +2251,12 @@ void sh_remove_shadows(struct domain *d,
     /* Search for this shadow in all appropriate shadows */
     perfc_incr(shadow_unshadow);
 
-    /* Lower-level shadows need to be excised from upper-level shadows.
-     * This call to hash_vcpu_foreach() looks dangerous but is in fact OK: each
+    /*
+     * Lower-level shadows need to be excised from upper-level shadows. This
+     * call to hash_domain_foreach() looks dangerous but is in fact OK: each
      * call will remove at most one shadow, and terminate immediately when
-     * it does remove it, so we never walk the hash after doing a deletion.  */
+     * it does remove it, so we never walk the hash after doing a deletion.
+     */
 #define DO_UNSHADOW(_type) do {                                         \
     t = (_type);                                                        \
     if( !(pg->count_info & PGC_page_table)                              \
@@ -2270,6 +2277,7 @@ void sh_remove_shadows(struct domain *d,
     if( !fast                                                           \
         && (pg->count_info & PGC_page_table)                            \
         && (pg->shadow_flags & (1 << t)) )                              \
+        HASH_CALLBACKS_CHECK(SHF_page_type_mask);                       \
         hash_domain_foreach(d, masks[t], callbacks, smfn);              \
 } while (0)
 
@@ -2370,6 +2378,7 @@ void sh_reset_l3_up_pointers(struct vcpu
     };
     static const unsigned int callback_mask = SHF_L3_64;
 
+    HASH_CALLBACKS_CHECK(callback_mask);
     hash_vcpu_foreach(v, callback_mask, callbacks, INVALID_MFN);
 }
 
@@ -3420,6 +3429,7 @@ void shadow_audit_tables(struct vcpu *v)
         }
     }
 
+    HASH_CALLBACKS_CHECK(SHF_page_type_mask);
     hash_vcpu_foreach(v, mask, callbacks, INVALID_MFN);
 }
 

