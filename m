Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B408CC6B38
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 21:05:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451121.1666327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHSdu-00026L-Le; Thu, 15 Oct 2026 21:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451121.1666327; Thu, 15 Oct 2026 21:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHSdu-00025w-Fs; Thu, 15 Oct 2026 21:05:38 +0000
Received: by outflank-mailman (input) for mailman id 1451121;
 Thu, 15 Oct 2026 21:05:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHSdt-0001kL-FE
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 21:05:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHSds-00Gq26-SP
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 23:05:36 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ad14003-bab6-0a2a0a5309dd-0a2a45089e60-30
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 23:05:36 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ad14020-f659-0a2a45080019-d155dd30d938-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 23:05:36 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-48afcd7ba9bso3236376f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 14:05:36 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4f8bd9sm501163f8f.35.2026.10.15.14.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 14:05:35 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1792098336; x=1792703136; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xt9bqym88aw89T5uLaWYHXCdtcAThtYx4kEoJI0JtxQ=;
        b=Yezu4jY5pP/1DRjALt/mx9WcqNeWCbiN4e8jQWx0mK/AOP1ZEHV7vK/rPyhIAnNWFI
         wun+PzG0CjwaJa+tPGsWOb/kGUpbBwAQlnwW0s8u1QqtTIkCZWUE33mgaFr/1jCjCwld
         w5mSi+gsaAP0d/oIWrX34E1EG/pmlUB/zMYe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792098336; x=1792703136;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xt9bqym88aw89T5uLaWYHXCdtcAThtYx4kEoJI0JtxQ=;
        b=HAxoC6lTxUyktCc/EtULR3r0y3rSTUvfCPrrwqQuUQ8kzdvHTPQwJC9Bo36YLyDU4r
         W77DcbWemJi9AU5qpx0DNpehIu5Q6j4MZ3ZdSOYdz91EKQgQSih7h1ib5y7nb2Xz68Ev
         ++1GBHvcDwSF57bwittzRECgqOVwhPFr4ogpihuBGEdD1Je48pzUKyacDcPXRiyUcS6S
         tKUy+LRoeZZFgVpr98EO5AFmDMTSFYjKZ6p8OVK9aEn62kegmy6ggYUb4MSKuIwHNOcU
         QX+zJ7syYhwn6K2K7L+xUszf8MSn8kWy7IEhZlwhTRb+o8pAWI6MNeJFSc7E6B3/jgvR
         bFjQ==
X-Gm-Message-State: AFq9FYJKdpEdRIt3EsjT+zn1exc7t5LEeDENMkNaeekQ579wiDy3sbpV
	jWfMOorajMI3clT9rjWdrBX72RhR54qGnz/4IgOt8EwjnZ5EkMkRtTaxnlP9tRf82v6J3Wpr1u0
	ibgJ2Aew=
X-Gm-Gg: AYBFou3rTCjZk0mVMxFIPVlSPsItVdQf5pGAc9ixHAOVJIOy5T9WlcrtB5NuZ3ctRdd
	Bwh/EVxHIvnoggSGjD7FX3ywCKuYTsFWlP1qE3OQvRphkEoHgTHXkC86/cPwmTXmskgnJiWQHFv
	f8WlKexvU97fGGDCwP8Rhc599jEdVhGKuWatI2fwtIowYG1JbxCExgsz9vu7cOhyvNyPEjRJOse
	UQ9m2frrzPQNnvqw1vskQGe4kWMvQ5ae2bl9OjP1SLm5pXxpufZKPIk/xbulp1EFlDfkHNfigx6
	aaxUuHavKA6lgRZy2DE6NF7d80LxXlGpgZNFZEnwDTNcLOra3Ic8tycPo4376Uz8U81KNyFPbjy
	HAFAY0YpYFL0z4c5WEtSjnC6n2pRhxvPdxO5wKg+DRz8fraQLL4ILenxU7adtD2G09KxecXzZq+
	PqEoUqfPN01tEnAAwHrwRUvyIP1SZ9OZuKa/p9WHlmKcV2X08iZLVwYc/yZ+SKjvsZ8AmoSoWsy
	imQxK9eYckLdpJF5RkHdsxGfroEFXUhZlTB7o+Ab3e5NIa2
X-Received: by 2002:a05:6000:4904:b0:48a:f0cd:8712 with SMTP id ffacd0b85a97d-48dbacf4734mr42722533f8f.50.1792098336029;
        Thu, 15 Oct 2026 14:05:36 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v4 4/5] x86/alternative: Relocate all insn-relative fields
Date: Thu, 15 Oct 2026 22:05:29 +0100
Message-Id: <20261015210530.786604-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261015210530.786604-1-andrew.cooper3@citrix.com>
References: <20261015210530.786604-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1792098336-DFAD487B-2A5D4503/10/78276251493
X-purgate-type: spam
X-purgate-size: 3089

Right now, relocation of displacements is restricted to finding 0xe8/e9 as the
first byte of the replacement, but this is overly restrictive.

Use x86_decode_lite() to find and adjust all insn-relative fields.

As with disp8's not leaving the replacemnet block, some disp32's don't either.
e.g. the RSB stuffing loop.  These stay unmodified.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>

v4:
 * Rebase

v3:
 * Rebase over the split-out of altcall.  Substantially simpler.
---
 xen/arch/x86/alternative.c | 50 +++++++++++++++++++++++++++++++-------
 1 file changed, 41 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 6b5f9c94f6dd..aa7da97f8548 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -341,15 +341,47 @@ static int init_or_livepatch _apply_alternatives(struct alt_instr *start,
 
         memcpy(buf, repl, a->repl_len);
 
-        /* 0xe8/0xe9 are relative branches; fix the offset. */
-        if ( a->repl_len >= 5 && (*buf & 0xfe) == 0xe8 )
-            *(int32_t *)(buf + 1) += (long)repl - (long)orig;
-        else if ( IS_ENABLED(CONFIG_RETURN_THUNK) &&
-                  a->repl_len > 5 && buf[a->repl_len - 5] == 0xe9 &&
-                  ((long)repl + a->repl_len +
-                   *(int32_t *)(buf + a->repl_len - 4) ==
-                   (long)__x86_return_thunk) )
-            *(int32_t *)(buf + a->repl_len - 4) += (long)repl - (long)orig;
+        /*
+         * Walk buf[] and adjust any insn-relative operands which leave the
+         * replacement block.
+         */
+        if ( a->repl_len )
+        {
+            uint8_t *ip = buf, *repl_end = ip + a->repl_len;
+
+            for ( x86_decode_lite_t res; ip < repl_end; ip += res.len )
+            {
+                int32_t *d32;
+                const uint8_t *target;
+
+                res = x86_decode_lite(ip, repl_end);
+
+                if ( res.len == 0 )
+                {
+                    printk("Alt for %ps [%*ph]\n"
+                           "  Unable to decode instruction at +%lu in alternative\n",
+                           ALT_ORIG_PTR(a), a->repl_len, repl, ip - repl);
+                    return -EINVAL;
+                }
+
+                if ( res.rel_sz != 4 )
+                    continue;
+
+                d32 = res.rel;
+                target = ip + res.len + *d32;
+
+                if ( target >= buf && target <= repl_end )
+                {
+                    /*
+                     * Target doesn't leave the replacement block.  e.g. RSB
+                     * stuffing.  Leave it unmodified.
+                     */
+                    continue;
+                }
+
+                *d32 += (long)repl - (long)orig;
+            }
+        }
 
         a->priv = 1;
 
-- 
2.39.5


