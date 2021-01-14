Return-Path: <SRS0=mH2p=GR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D57CC433E0
	for <xen-devel@archiver.kernel.org>; Thu, 14 Jan 2021 15:07:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BED8C23A69
	for <xen-devel@archiver.kernel.org>; Thu, 14 Jan 2021 15:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BED8C23A69
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.67104.119493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04Ds-0005yG-8p; Thu, 14 Jan 2021 15:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67104.119493; Thu, 14 Jan 2021 15:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04Ds-0005y9-5c; Thu, 14 Jan 2021 15:07:40 +0000
Received: by outflank-mailman (input) for mailman id 67104;
 Thu, 14 Jan 2021 15:07:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l04Dq-0005xw-Se
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:07:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 46b1bee5-db7f-46be-a17a-9a2e928cb4a8;
 Thu, 14 Jan 2021 15:07:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 71E0CAC24;
 Thu, 14 Jan 2021 15:07:37 +0000 (UTC)
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
X-Inumbo-ID: 46b1bee5-db7f-46be-a17a-9a2e928cb4a8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610636857; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e67EQSav/B2t339nJdJXrH2VD3Eb4kam/ZfJ4x2oFeo=;
	b=lm4hQtOB9+KiI16TV/CjhfkbYZz4L25k5bT4rgjNG5BXJWylkl7JwmNFVV6Plp8f8HGLtv
	IhaIihyk94bt/LVdHhvgMbffWmjKA4RC3Y27VzWTMgbxako6kszjoryUEBRRMjFBSZeEBj
	CtkA+HHchx97AdMnINR30bWYsTvhtCk=
Subject: [PATCH 09/17] x86/PV: use get_unsafe() instead of copy_from_unsafe()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
Message-ID: <810ebd98-6ed6-a492-0fd4-6a39d04f875b@suse.com>
Date: Thu, 14 Jan 2021 16:07:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The former expands to a single (memory accessing) insn, which the latter
does not guarantee. Yet we'd prefer to read consistent PTEs rather than
risking a split read racing with an update done elsewhere.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/pv/mm.c
+++ b/xen/arch/x86/pv/mm.c
@@ -41,9 +41,7 @@ l1_pgentry_t *map_guest_l1e(unsigned lon
         return NULL;
 
     /* Find this l1e and its enclosing l1mfn in the linear map. */
-    if ( copy_from_unsafe(&l2e,
-                          &__linear_l2_table[l2_linear_offset(linear)],
-                          sizeof(l2_pgentry_t)) )
+    if ( get_unsafe(l2e, &__linear_l2_table[l2_linear_offset(linear)]) )
         return NULL;
 
     /* Check flags that it will be safe to read the l1e. */
--- a/xen/arch/x86/pv/mm.h
+++ b/xen/arch/x86/pv/mm.h
@@ -22,9 +22,7 @@ static inline l1_pgentry_t guest_get_eff
         toggle_guest_pt(curr);
 
     if ( unlikely(!__addr_ok(linear)) ||
-         copy_from_unsafe(&l1e,
-                          &__linear_l1_table[l1_linear_offset(linear)],
-                          sizeof(l1_pgentry_t)) )
+         get_unsafe(l1e, &__linear_l1_table[l1_linear_offset(linear)]) )
         l1e = l1e_empty();
 
     if ( user_mode )


