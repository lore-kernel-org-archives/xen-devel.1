Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D62C55175
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 07:20:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381226.1624795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqmy7-0001zI-Ld; Mon, 03 Aug 2026 07:20:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381226.1624795; Mon, 03 Aug 2026 07:20:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqmy7-0001yY-Fr; Mon, 03 Aug 2026 07:20:15 +0000
Received: by outflank-mailman (input) for mailman id 1381226;
 Mon, 03 Aug 2026 07:20:14 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wqmy6-0001jl-7i
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 07:20:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqmy5-003y8B-Km
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 09:20:13 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a704126-bab6-0a2a0a5309dd-0a2a4503b0a8-20
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 09:20:13 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a70412d-fae8-0a2a45030019-d1558034ac3f-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 09:20:13 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-495590dde14so16957645e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 00:20:13 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b85be7sm254687935e9.2.2026.08.03.00.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2026 00:20:12 -0700 (PDT)
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
        d=citrix.com; s=google; t=1785741613; x=1786346413; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9oalEqncjdi9YKb26F6ASg1uy+nWQGozZLeLwjudyuk=;
        b=nXQToXflDY+GL0UfpGRRGa/mTaF3lJrALlJSTIj5pJJp4E1rr6etPaNvXifQYZvDBO
         pkleLegLT8CnonqfpLkYcpZ3BYoQQ3EFuN34omNUNeG+Y5tmArhhQJK3pdcuB9dBy3L4
         +azacdKjGK6mWIgxSvTdUkTfG8dprXzaxbA68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785741613; x=1786346413;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9oalEqncjdi9YKb26F6ASg1uy+nWQGozZLeLwjudyuk=;
        b=Zv8366P381RA65Bu5vAzw4Il85qRvCGOqGNyPNtZkvJpgpq43aAHWyCAQliUVh7Sni
         YhuD16OLAXaeRfYXpJi0WlHj5uEII/ygZUp1DHoLVNS6wghot1QdjuwMBsyplwpM0kgN
         M29Qy6JRAGGX1Pi8/368UmaJWjVbbi2ubMFYf5qjmQO1J7C+25y1V5t8LIpKLPB1CM67
         Pnl1phN59vpfq1tJG4Jp0c7AqOi5XP9s+zwRNbMjg7RvlncvVMw6/s5XcZl1LZC8v8/q
         ceCqrxrgLygKwebPjFK50VNJ1l/wyBgbZarSJuzjsqs9MBosPpPBA/2PS9tJQA/ypPUs
         akdA==
X-Gm-Message-State: AOJu0YzSPvBBCyMuGX1etuv3N23UqWGaEigdgUPhjLFOZJtarKJlcbzU
	fUZ2PaFfwGFX5fsuvo+wVHoAIUA3KCVSupudGZ2/QcBLdMCOieX4bswIWmrjFoOs0FSle6jwI19
	+v+lU9mU=
X-Gm-Gg: AR+sD10/X+cB1tbPIjI8aiP1eTsAzEY3/BzenZ9AV72bJ1wgtMyHZVOczP9RDOrDQAN
	ax36zRNRYhL9SqJHYBXWhav8es2hzVk/znrlrEAFM7zy8Sw3C7FXLZZGPojNfH+U9r7LiroTH5c
	wKKXG/zlJnpEUHcDMpyY51xK7H+QBF6qE9HBSIumuLQzPdlzY2xnf55iiR2dWIwZawYr6rB9t4v
	EKOyTOqXUdwIt0kProMIrml0/8I+PFQHnnQvk7+lY2BJnX0u80CQoAANrW3D/RhvDtPXcmPxwDh
	YJG3Lr0O8OT4Q3O92DQ5iPWh53IMktsSYudVBrLNQbF3PB2wY5KB2Oqt7NO0z0uvsPMmGREsBm8
	aMvSkIys8v6Wokhkg+FXr9n2h9IElM29EAzp0/ZA1pBzFrdldTsNy14ERprdhrJNd673UREg5JM
	bu/JJu0emVB0hNZ5RbGz0SrVexZ6Uh2I7iNPfwrEu8ExeirnES+Bj6LP1Cfx5Ph2bFrPYSD3qyY
	Yla8wm7LLmkxbPTq0E53vKIvTaKeqQ/o+FghKo=
X-Received: by 2002:a05:600c:4685:b0:493:e365:7630 with SMTP id 5b1f17b1804b1-4980eb66053mr147150085e9.14.1785741612890;
        Mon, 03 Aug 2026 00:20:12 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v3 3/5] x86/alternative: Walk all replacements during self tests
Date: Mon,  3 Aug 2026 08:20:04 +0100
Message-Id: <20260803072006.9678-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260803072006.9678-1-andrew.cooper3@citrix.com>
References: <20260803072006.9678-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1785741613-758824E9-8A49664C/0/0
X-purgate-type: clean
X-purgate-size: 2998

When self tests are active, walk all alternative replacements with
x86_decode_lite().

This checks that we can decode all instructions, and also lets us check that
disp8's don't leave the replacement block as such a case will definitely
malfunction.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <JBeulich@suse.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>

v2:
 * Rebase over API changes in patch 1
 * Use +%lu and drop casts
 * Swap to CONFIG_SELF_TESTS
---
 xen/arch/x86/alternative.c | 52 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 5ed0c2672589..fd03147bdd12 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -16,6 +16,7 @@
 #include <asm/traps.h>
 #include <asm/nmi.h>
 #include <asm/nops.h>
+#include <asm/x86_emulate.h>
 #include <xen/livepatch.h>
 
 #define MAX_PATCH_LEN (255-1)
@@ -586,6 +587,57 @@ static void __init _alternative_instructions(unsigned int what)
 void __init alternative_instructions(void)
 {
     arch_init_ideal_nops();
+
+    /*
+     * Walk all replacement instructions with x86_decode_lite().  This checks
+     * both that we can decode all instructions within the replacement, and
+     * that any near branch with a disp8 stays within the alternative itself.
+     */
+    if ( IS_ENABLED(CONFIG_SELF_TESTS) )
+    {
+        struct alt_instr *a;
+
+        for ( a = __alt_instructions;
+              a < __alt_instructions_end; ++a )
+        {
+            void *repl = ALT_REPL_PTR(a);
+            void *ip = repl, *end = ip + a->repl_len;
+
+            if ( !a->repl_len )
+                continue;
+
+            for ( x86_decode_lite_t res; ip < end; ip += res.len )
+            {
+                const int8_t *d8;
+                const void *target;
+
+                res = x86_decode_lite(ip, end);
+
+                if ( res.len == 0 )
+                {
+                    printk("Alt for %ps [%*ph]\n",
+                           ALT_ORIG_PTR(a), a->repl_len, repl);
+                    panic("  Unable to decode instruction at +%lu in alternative\n",
+                          ip - repl);
+                }
+
+                if ( res.rel_sz != 1 )
+                    continue;
+
+                d8 = res.rel;
+                target = ip + res.len + *d8;
+
+                if ( target < repl || target > end )
+                {
+                    printk("Alt for %ps [%*ph]\n",
+                           ALT_ORIG_PTR(a), a->repl_len, repl);
+                    panic("  'JMP/Jcc disp8' at +%lu leaves alternative block\n",
+                          ip - repl);
+                }
+            }
+        }
+    }
+
     _alternative_instructions(ALT_INSNS);
 }
 
-- 
2.39.5


