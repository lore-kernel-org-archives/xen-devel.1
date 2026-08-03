Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C4EC55190
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 07:20:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381228.1624812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqmy8-0002KN-OB; Mon, 03 Aug 2026 07:20:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381228.1624812; Mon, 03 Aug 2026 07:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqmy8-0002Jr-F9; Mon, 03 Aug 2026 07:20:16 +0000
Received: by outflank-mailman (input) for mailman id 1381228;
 Mon, 03 Aug 2026 07:20:15 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wqmy7-0001uR-3K
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 07:20:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqmy6-00Dk99-GY
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 09:20:14 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a70412d-5cb7-0a2a0a5109dd-0a2a45088d92-8
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 09:20:14 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a70412e-f659-0a2a45080019-d155dd2ed828-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 09:20:14 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-47fd4ee0b01so1842141f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 00:20:14 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b85be7sm254687935e9.2.2026.08.03.00.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2026 00:20:13 -0700 (PDT)
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
        d=citrix.com; s=google; t=1785741614; x=1786346414; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HxkChm6nTI+5JRyuyWipeFtEAkEUxs5crJhjhmOkg8A=;
        b=mtnOI27/DhL8W/LMMi5Pb25C2MuCzmwBVCnj/1A8w/74wMnlI9QJRLIKuWjdOtDNWZ
         TpvdMA1Ym0MHFBtW/rvUl1SxJa5nIx2tiF9ekqXmp+mZIuFhlyTZBZyJJ1BWyX9oi8Yj
         wQcnOdcJPyUdtCM6FuvQqaxMyPWf68EcwkkfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785741614; x=1786346414;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HxkChm6nTI+5JRyuyWipeFtEAkEUxs5crJhjhmOkg8A=;
        b=XLy0A+Sd02KCgevNr01X8f4FkldYQoAQvhHMiiOlvz6OHzk99IBKBu8Ib6kr66StV5
         fvi6L1Rm2DCLt6LBciNRjHDrUDo4Gehe3pE2vuH7u5Ls4t1KZgPHv/LvC+fTrb7NIRmC
         wsMyiA+rCPEEEvMSmt3NvUCgwpeeLh7cvM89MfjKaMMnr4G4eEV4ipHICx9PEpc/Se0Y
         ft8Cp+1JrqA9SP/3QyiEI73PQdHi1uTuWlgEVj8b45huy/6aiDDFn+dZC6aa0hXkK7K1
         SnxDP5QbBtoNQye4Co5lA52i13hpP1uN4o1Cx5u9dJyD3vZVGEl69F9tgRjF83fdBIut
         WjJw==
X-Gm-Message-State: AOJu0Yy9hUPVbCXrQ0JISwRLcwanYAyCQ+G//JOXwCS/FzVeucm3m2j/
	nH7m90Qo4Lol2bzs8ToPU8KYfUeGEEvRKLRK8k0cBiYutqKarrhTlp7/hS50KEXOsGlRn2wE6PR
	a0X77oYA=
X-Gm-Gg: AR+sD1152/KSo7BQDIqyw2hsgFwZNFwjeI5l3md4uiwfYhmfk7hNODRRRPWcZ/4JLRP
	oqhvwub9Dkbhs6aCJNoRYb/4zjM3xUCzfVaWDOVXXTESxN4byi7vkhus6yTU9ZleAFwjGEhtQQw
	v6Z0R+caXC/Xlw7Iwb1lqed/TfDxqp5p9HGH6mscr9zgKKTGK5hzN6/llgWbBLOmPbCTRU8mWF6
	QBATqGZJgIaHqtt2gcXxI9mncRNGqmO2MqRxb/P0sueUlVXdIztt+3FT1JRo0rwbx9czoVGnEft
	2+1vDXHvV5fqy1ArgaophwS4tEDvMU9bDt7elWIesCCIlvaHSiZvol2bduFQpHM6yqxLhYQHSS+
	TpSSc4XF2fj9mu7MyS15V2jrvk2RAF5OhW48cYPhpMVS6s6e+S/uUSR0BvR23mYYTPTOU5uDnEp
	+N9z693E4LMo2glLveZi7aZR4+JsHd7fpJUiqln24rrFz0yOTYaAlwGgw36C6gUtebyDIxElbPJ
	3Fd8OhPnBtQRbeqIhJeNrQuBaOD/eSXSC77WBs=
X-Received: by 2002:a05:600d:640f:20b0:495:503f:cf9a with SMTP id 5b1f17b1804b1-4980c672adbmr145404915e9.9.1785741613604;
        Mon, 03 Aug 2026 00:20:13 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v3 4/5] x86/alternative: Relocate all insn-relative fields
Date: Mon,  3 Aug 2026 08:20:05 +0100
Message-Id: <20260803072006.9678-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260803072006.9678-1-andrew.cooper3@citrix.com>
References: <20260803072006.9678-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1785741614-CD54C87B-DC0C22F6/0/0
X-purgate-type: clean
X-purgate-size: 3035

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

v3:
 * Rebase over the split-out of altcall.  Substantially simpler.
---
 xen/arch/x86/alternative.c | 50 +++++++++++++++++++++++++++++++-------
 1 file changed, 41 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index fd03147bdd12..a4a65597b2fc 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -349,15 +349,47 @@ static int init_or_livepatch _apply_alternatives(struct alt_instr *start,
 
         memcpy(buf, repl, a->repl_len);
 
-        /* 0xe8/0xe9 are relative branches; fix the offset. */
-        if ( a->repl_len >= 5 && (*buf & 0xfe) == 0xe8 )
-            *(int32_t *)(buf + 1) += repl - orig;
-        else if ( IS_ENABLED(CONFIG_RETURN_THUNK) &&
-                  a->repl_len > 5 && buf[a->repl_len - 5] == 0xe9 &&
-                  ((long)repl + a->repl_len +
-                   *(int32_t *)(buf + a->repl_len - 4) ==
-                   (long)__x86_return_thunk) )
-            *(int32_t *)(buf + a->repl_len - 4) += repl - orig;
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
+                *d32 += repl - orig;
+            }
+        }
 
         a->priv = 1;
 
-- 
2.39.5


