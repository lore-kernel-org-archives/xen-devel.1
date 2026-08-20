Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B297AC5DF82
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 08:52:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396127.1634168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwyVQ-0002cp-Vu; Thu, 20 Aug 2026 08:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396127.1634168; Thu, 20 Aug 2026 08:52:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwyVQ-0002ci-Sy; Thu, 20 Aug 2026 08:52:12 +0000
Received: by outflank-mailman (input) for mailman id 1396127;
 Thu, 20 Aug 2026 08:52:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwyVP-0002cc-W8
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 08:52:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwyVP-003Jmg-Ck
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 10:52:11 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a86c033-bab6-0a2a0a5309dd-0a2a4509c90c-26
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 10:52:11 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a86c03a-be1a-0a2a45090019-d1558031a853-3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 10:52:10 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4980fe6b3beso5751595e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 01:52:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa17f202sm120697425e9.13.2026.08.20.01.52.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 01:52:10 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787215930; x=1787820730; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IJcAOFJxYzUkoLBuDV15vBU/KPsTSNpfBgAh1I6vk/o=;
        b=RBX8vYbs6cClwkQ+KFLW0Cg3GC4ugayJkKVh/F+Otr+sV2yxxX2Yko/E2eQQXRl9k+
         wVng6bv50iT6RFQSsm/dU58bwbYsB67K87432e09+Le0/Lgs3KxIZK72K3UKRwoZjNcX
         beYyWIyViekQE9A0EbC+wVV/mVvDWxMZ1f0ayCsaBK6FhpysysrchFVGLnGqKGURwjqK
         6ka2DOQsS97UyVfAJZ71Eq+9rwWoPUbhXWF8gryt1FjleuQ2XGNbRx0XrW9sGPM9BmRB
         joxCqDy4wVhgOMuT2v/FeZEitHr/GSXlFaUalhcahdy4f8WR7sYtCgUf17+zh47xyxVj
         sKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787215930; x=1787820730;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IJcAOFJxYzUkoLBuDV15vBU/KPsTSNpfBgAh1I6vk/o=;
        b=pG6P7pWZHaj117JLHCUG/LUHnrGy+rWgElyoVsIkFihK3cg0HBDpwSkgF6HyOVSr95
         wh7sA84MfSw0RDs/ldgCooeKvaVf3pnrYKjt23h+A8KATEay9E45w7adzJqHAXtB/QX4
         AMG3zntfFL2T2n8XwQHwe/jpWOVfOgMFgaIxSKn47tjtoZN7HbA33b7vk09TJo9ITG3P
         rhvUrV9hW8zeq4YbieDHUPJV8Q8Tr2TgvRUJySOZBtmQWsMyetHuVuT0Ip/clQOUl8Ui
         g9XPEcrdF3nBaWfhx6d5WbpBnqJO96IQmvN4MibODTduTJTRT5qvh+aiaAa7aZprvJdR
         ZVDA==
X-Gm-Message-State: AOJu0YyaZ/6+xHhqrS1qtbbRSxf3ToADPfMvitmn8Js3v6MX9vkKVgoo
	6JjT/8f/iP6R9/NHNWekEmTlwB2/z4/kYGhxGtV2pFgyxbFfC3KaOFMtlYcg0G03YJaCqLpbvjr
	PrUUpkg==
X-Gm-Gg: AR+sD13HOp1TBB3sQjp9qmpeeLK1Z0aeRl3mmN7xmYZN6KN6/0tJkW+DPmrqOL0HLjg
	MSfra/HXqj73R17YfRgJbPPzA7eg4LNhXfH9MSk66o3wxNGc2NmnKYqzkFjEdyghfaco2Y/M8Mw
	08X7JzIYIf2eDLPHFeiEZaxnLEhdpph7WsClHJEmrY9Vjc0wkkmG1QLr1zTBaDctduhjLH8oRKV
	sKpNKl7xGwR4ZuE24B285u4EV11pI8C64cLJXwAAM6g7YW+le7xtv0MgVu1NCgLn6EmaucfBckX
	7gF+cXgjIOQbxomkUaplx1Yits2nlNx7Pcu032cjeHmIJSNePiAAXl1njIQX3sMRAMd98r2VBnW
	O70clMLj/SWiZfTQHCOMF+wQMKBqZoTqf/hBdyxwoYwRtAHf19dDO1ISnq19lnpRfICpwjQ5bsQ
	6C6RDSnIHxUfO6p29UNPribqmIEV+bVBLXtIAOd19mTSB/mgW7kANdUpetG250f4+T4cbHwlN3l
	mynKZ+WiksgzKgK/3NVnN3l6jc/YAnuHIiZPKTkYVt5ZqUnmMAt
X-Received: by 2002:a05:600c:a11:b0:499:a0a5:e13f with SMTP id 5b1f17b1804b1-499b06a5952mr44471485e9.2.1787215930340;
        Thu, 20 Aug 2026 01:52:10 -0700 (PDT)
Message-ID: <04b55ed1-1103-483f-9bca-72b8955f6cdf@suse.com>
Date: Thu, 20 Aug 2026 10:52:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/2] x86emul: latch XCR0 early during decode
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Andrew Mbugua <andrewprecious388@gmail.com>
References: <0c3cb1ae-4888-4319-a348-263f7913a7f2@suse.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <0c3cb1ae-4888-4319-a348-263f7913a7f2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1787215930-BCCCF034-2A0849DB/0/0
X-purgate-type: clean
X-purgate-size: 4680

We'll need to consult it to decide whether to treat 0xD5 as a REX2
prefix, and whether to recognize extended EVEX encodings.

Utilize this in adjust_bnd() right away, but leave leveraging in
x86emul_get_fpu() for a separate change.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
While not directly relevant in this series, should we perhaps latch CR4
into the state structure as well right away, since we need to read it
here anyway?

--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1036,6 +1036,24 @@ int x86emul_decode(struct x86_emulate_st
 #endif
     }
 
+    /* Latch XCR0, if available. */
+    if ( ops->read_cr && ops->read_xcr )
+    {
+        unsigned long cr4;
+
+        rc = ops->read_cr(4, &cr4, ctxt);
+        if ( rc == X86EMUL_OKAY && (cr4 & X86_CR4_OSXSAVE) &&
+             ops->read_xcr(0, &s->xcr0, ctxt) != X86EMUL_OKAY )
+            s->xcr0 = 0;
+
+        /*
+         * To ease consuming, strip 64-bit-only state right away for non-64-bit
+         * environments.
+         */
+        if ( !mode_64bit() )
+            s->xcr0 &= ~(X86_XCR0_TILE_CFG | X86_XCR0_TILE_DATA);
+    }
+
     /* Prefix bytes. */
     for ( ; ; )
     {
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -334,6 +334,8 @@ struct x86_emulate_state {
 
     unsigned long ip;
 
+    uint64_t xcr0;
+
     struct stub_exn *stub_exn;
 
 #ifndef NDEBUG
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1234,17 +1234,17 @@ static bool is_branch_step(struct x86_em
     return debugctl & IA32_DEBUGCTLMSR_BTF;
 }
 
-static void adjust_bnd(struct x86_emulate_ctxt *ctxt,
+static void adjust_bnd(const struct x86_emulate_state *s,
+                       struct x86_emulate_ctxt *ctxt,
                        const struct x86_emulate_ops *ops, enum vex_pfx pfx)
 {
-    uint64_t xcr0, bndcfg;
+    uint64_t bndcfg;
     int rc;
 
     if ( pfx == vex_f2 || !cpu_has_mpx || !vcpu_has_mpx() )
         return;
 
-    if ( !ops->read_xcr || ops->read_xcr(0, &xcr0, ctxt) != X86EMUL_OKAY ||
-         !(xcr0 & X86_XCR0_BNDREGS) || !(xcr0 & X86_XCR0_BNDCSR) )
+    if ( !(s->xcr0 & X86_XCR0_BNDREGS) || !(s->xcr0 & X86_XCR0_BNDCSR) )
     {
         ASSERT(!ctxt->event_pending);
         return;
@@ -1952,7 +1952,7 @@ x86_emulate(
     case 0x70 ... 0x7f: /* jcc (short) */
         if ( test_cc(b, _regs.eflags) )
             jmp_rel((int32_t)src.val);
-        adjust_bnd(ctxt, ops, vex.pfx);
+        adjust_bnd(state, ctxt, ops, vex.pfx);
         break;
 
     case 0x80: case 0x81: case 0x82: case 0x83: /* Grp1 */
@@ -2363,7 +2363,7 @@ x86_emulate(
              (rc = ops->insn_fetch(dst.val, NULL, 0, ctxt)) )
             goto done;
         _regs.r(ip) = dst.val;
-        adjust_bnd(ctxt, ops, vex.pfx);
+        adjust_bnd(state, ctxt, ops, vex.pfx);
         break;
 
     case 0xc4: /* les */
@@ -2594,7 +2594,7 @@ x86_emulate(
         op_bytes = ((op_bytes == 4) && mode_64bit()) ? 8 : op_bytes;
         src.val = _regs.r(ip);
         jmp_rel(rel);
-        adjust_bnd(ctxt, ops, vex.pfx);
+        adjust_bnd(state, ctxt, ops, vex.pfx);
         goto push;
     }
 
@@ -2602,7 +2602,7 @@ x86_emulate(
     case 0xeb: /* jmp (short) */
         jmp_rel((int32_t)src.val);
         if ( !(b & 2) )
-            adjust_bnd(ctxt, ops, vex.pfx);
+            adjust_bnd(state, ctxt, ops, vex.pfx);
         break;
 
     case 0xea: /* jmp (far, absolute) */
@@ -2885,14 +2885,14 @@ x86_emulate(
                 goto done;
             _regs.r(ip) = src.val;
             src.val = dst.val;
-            adjust_bnd(ctxt, ops, vex.pfx);
+            adjust_bnd(state, ctxt, ops, vex.pfx);
             goto push;
         case 4: /* jmp (near) */
             if ( (rc = ops->insn_fetch(src.val, NULL, 0, ctxt)) )
                 goto done;
             _regs.r(ip) = src.val;
             dst.type = OP_NONE;
-            adjust_bnd(ctxt, ops, vex.pfx);
+            adjust_bnd(state, ctxt, ops, vex.pfx);
             break;
         case 3: /* call (far, absolute indirect) */
         case 5: /* jmp (far, absolute indirect) */
@@ -4981,7 +4981,7 @@ x86_emulate(
     case X86EMUL_OPC(0x0f, 0x80) ... X86EMUL_OPC(0x0f, 0x8f): /* jcc (near) */
         if ( test_cc(b, _regs.eflags) )
             jmp_rel((int32_t)src.val);
-        adjust_bnd(ctxt, ops, vex.pfx);
+        adjust_bnd(state, ctxt, ops, vex.pfx);
         break;
 
     case X86EMUL_OPC(0x0f, 0x90) ... X86EMUL_OPC(0x0f, 0x9f): /* setcc */


