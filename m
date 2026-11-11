Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55666606A338
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TFgwzhp6
Received: from list by lists.xenproject.org with outflank-mailman.1483761.1687117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9EX-0001n0-OO; Wed, 11 Nov 2026 14:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483761.1687117; Wed, 11 Nov 2026 14:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9EX-0001mt-Le; Wed, 11 Nov 2026 14:23:29 +0000
Received: by outflank-mailman (input) for mailman id 1483761;
 Wed, 11 Nov 2026 14:23:28 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9EW-0001mT-K4
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:23:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9EW-00ELJI-10
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:23:28 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47a5e-e002-0a2a0a5209dd-0a2a4507d470-14
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:23:28 +0100
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47a5f-b4ea-0a2a45070019-d155dd2ca91f-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:23:27 +0100
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-48e1d0e5dafso2146264f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:23:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498369a4238sm11788385f8f.54.2026.11.11.06.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 06:23:26 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794407007; x=1795011807; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MhPLSjyR8fj9PbEU8eUtegChB7eNo6xjhkoS06aT0Js=;
        b=TFgwzhp6zsneQWeIkxdhywDO8xox+9vo3CCONgVyuWTTHB7Nbort1mjdNB3pDEcy/a
         PaB9+9+30MxUpJggxURXbG+AhhQpEXGQiWNrk3em7+S/9O+Ohg+pjAZqcL+igrwOu8aF
         SBS/XFH8LR9JVJBGmVfrtaW4MZlspq31EySVSlpmgaaz+ba5fY06/EgzQDosfSVyRC4P
         ZI3ecU7KXAGtEEjYC22RNgH+nkuqV01cC4t7WGTy2U7UUoVZMljmPAbmKTSftgRgjX2Q
         KHcqnVAF2ZcOwpXWsQ9MBlCmXUrWGD6fui5beFxI8WjvtNk6Js8zmDoPq4AMI+40epAl
         o8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407007; x=1795011807;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MhPLSjyR8fj9PbEU8eUtegChB7eNo6xjhkoS06aT0Js=;
        b=VYAiHDYD3WgU4zCbIcca21cwIBOsZr7ITyfcU3f+sFaDwnTNWv4OBHa7+8Vgp2vQ/v
         f3rqjWBS0J9MaZw6AlI1/UVTaU8ciiP1KIHOW947bH1v+tA9opJf7aKNwA7TGjeQkuiu
         nYKeNYPyWryBnDTTjl+pxJ2L3axhwF7rEW3Iy/FV5NiJ0FA/q5erSZo8mUkYUYgz/rij
         MtidQDUDvFLJfJqwcQV9KKCM0PzbpZQbDRRqePGG89MgRhaJ3IbHDJ3kqbATJPVzeBIQ
         T+oaF8R4GMi0z/GAVJ+1D/eP8ZGZwbHsDjPA4SAqJlM5tmGRniaWmlhnLyGpS0ChGSN0
         faPw==
X-Gm-Message-State: APuU4Z9DtM6XF7bOe80P4CQ9UE/gPsHiogeNyaaoYJFnwpuIaO8CAz9I
	obVdSjYEUofZIGFZYfzWPsMrGxs4MDIkd+5dcUNO9SqTRJD3JvgWnZZ773NFKUd5CA899D+z1iC
	NHJs1jA==
X-Gm-Gg: AYBFou0gWSe4amgHUJmolij7q0QrP2DzGFV/aIjYgxQxdWd3geo7hVy2+DNC42UtfA/
	Avbq05DHCe6SQjMOfvKxrQHg62wEO6FXuXXg4tB1FlMjal8NunV2V0rgD9i0WaS7xXGwHiJ4tCz
	doS3Xk+E36SmT5XYDaE/LuFg3Fy6wuhXI57h4B//mzK7musQBrzl0/lndYcEaH3ADerNPLJC+rY
	BZKsO2efNYsq0zTNz67P7coAGeBJi2MfAl5rkLA3nSOK+NkkVghKUIlPr3JQiChlRTVpqYnXko5
	WE9MPqPyewKdAZKLCNFiLMnf09rV9Mp531BVPeBrYD6OFrlQrq+JfXdBi9VadUagcP3uis9q7cP
	6cVz02FRY6KflWar7DQgkfLcWW6Km+QL7NSsZ6WwQz81UbAEYo7vltiVJs4LaZm82sKYUIXWzgI
	mLs2EU8uKGdQkLUXIE1YeC1W0o3qZXaRqvL+YLZFRbX+PoICfkBkB2OlmDPXnnvktI0fkziMOeC
	1/h+0NtxNxI+PXWomQU9NyPeExAE49ex1Yt7W9MV7ucXPzWlDl697lBkGbtusZHYUJh4kWYxzp7
	cQchz0bo/wQoyEuEfLxrdWlymQPlbW0RcCaWKc7SUjiFbGMybRt61Sms3zvaOB8b2Z+VqiVg33O
	blZNOYPxPrcxxKbRs
X-Received: by 2002:a05:6000:1889:b0:492:e318:9e22 with SMTP id ffacd0b85a97d-49997e56d38mr5883042f8f.26.1794407007246;
        Wed, 11 Nov 2026 06:23:27 -0800 (PST)
Message-ID: <131dfe66-b98a-45f3-8e47-102a20b55129@suse.com>
Date: Wed, 11 Nov 2026 15:23:25 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 07/30] x86emul: latch XCR0 early during decode
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <17d56a5d-41f2-4691-aea7-d6dfdde5ad32@suse.com>
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
In-Reply-To: <17d56a5d-41f2-4691-aea7-d6dfdde5ad32@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1794407007-A56C2AE4-D3A25C48/10/78276251493
X-purgate-type: spam
X-purgate-size: 4702
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
@@ -1053,6 +1053,24 @@ int x86emul_decode(struct x86_emulate_st
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
+            s->xcr0 &= ~(X86_XCR0_TILE_CFG | X86_XCR0_TILE_DATA | X86_XCR0_APX);
+    }
+
     /* Prefix bytes. */
     for ( ; ; )
     {
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -336,6 +336,8 @@ struct x86_emulate_state {
 
     unsigned long ip;
 
+    uint64_t xcr0;
+
     struct egpr egpr;
 
     struct stub_exn *stub_exn;
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1240,17 +1240,17 @@ static bool is_branch_step(struct x86_em
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
@@ -1964,7 +1964,7 @@ x86_emulate(
     case 0x70 ... 0x7f: /* jcc (short) */
         if ( test_cc(b, _regs.eflags) )
             jmp_rel((int32_t)src.val);
-        adjust_bnd(ctxt, ops, vex.pfx);
+        adjust_bnd(state, ctxt, ops, vex.pfx);
         break;
 
     case 0x80: case 0x81: case 0x82: case 0x83: /* Grp1 */
@@ -2378,7 +2378,7 @@ x86_emulate(
              (rc = ops->insn_fetch(dst.val, NULL, 0, ctxt)) )
             goto done;
         _regs.r(ip) = dst.val;
-        adjust_bnd(ctxt, ops, vex.pfx);
+        adjust_bnd(state, ctxt, ops, vex.pfx);
         break;
 
     case 0xc4: /* les */
@@ -2609,7 +2609,7 @@ x86_emulate(
         op_bytes = ((op_bytes == 4) && mode_64bit()) ? 8 : op_bytes;
         src.val = _regs.r(ip);
         jmp_rel(rel);
-        adjust_bnd(ctxt, ops, vex.pfx);
+        adjust_bnd(state, ctxt, ops, vex.pfx);
         goto push;
     }
 
@@ -2617,7 +2617,7 @@ x86_emulate(
     case 0xeb: /* jmp (short) */
         jmp_rel((int32_t)src.val);
         if ( !(b & 2) )
-            adjust_bnd(ctxt, ops, vex.pfx);
+            adjust_bnd(state, ctxt, ops, vex.pfx);
         break;
 
     case 0xea: /* jmp (far, absolute) */
@@ -2900,14 +2900,14 @@ x86_emulate(
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
@@ -5013,7 +5013,7 @@ x86_emulate(
     case X86EMUL_OPC(0x0f, 0x80) ... X86EMUL_OPC(0x0f, 0x8f): /* jcc (near) */
         if ( test_cc(b, _regs.eflags) )
             jmp_rel((int32_t)src.val);
-        adjust_bnd(ctxt, ops, vex.pfx);
+        adjust_bnd(state, ctxt, ops, vex.pfx);
         break;
 
     case X86EMUL_OPC(0x0f, 0x90) ... X86EMUL_OPC(0x0f, 0x9f): /* setcc */


