Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F5460A2635
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bPR7+5kW
Received: from list by lists.xenproject.org with outflank-mailman.1483771.1687128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9F3-0002NS-5J; Wed, 11 Nov 2026 14:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483771.1687128; Wed, 11 Nov 2026 14:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9F3-0002NL-1f; Wed, 11 Nov 2026 14:24:01 +0000
Received: by outflank-mailman (input) for mailman id 1483771;
 Wed, 11 Nov 2026 14:23:58 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9F0-0002Lc-R9
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:23:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9F0-003g9H-41
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:23:58 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47a6c-8faa-0a2a0a5109dd-0a2a4501e194-46
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:23:58 +0100
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47a7d-5984-0a2a45010019-d155dd2bd4e4-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:23:58 +0100
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-49a92144733so146870f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:23:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498357648f0sm11831262f8f.12.2026.11.11.06.23.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 06:23:56 -0800 (PST)
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
        d=suse.com; s=google; t=1794407037; x=1795011837; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jvbct22YpkRVW8LgCU7kHXAqwxHqewK4CypoVnDwceA=;
        b=bPR7+5kWpohL7pfGFqRm36qfe/RC6J+WOX1Ghx41TexIbvyb1HZA6B6lvuIs0om7Le
         vcFB620nA+zjgyoJ2+axXHkd9mi1dyZ2Qs3SeTgld778H21DMImjoUMmNZkoHGEdG5Rn
         FSNiKWD9/xNqkArWNw5JBYJwNLSlgdJG7EBEmOacjJtD3wQ+BLdr/N+6qq7QAsclDUOq
         lbHPz7UyniN83mOvFv2XXVf6e55XyPjSAjTQ6B2Qv4j91ol1VkhoKloeQABgdP+n4Iqb
         pRb0xTgMhVROHXsBF9r8ThCHElzLCzYKe/X+1X2v9TxRPuzU1IKePmvpZOjLTzxV9f22
         hcfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407037; x=1795011837;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jvbct22YpkRVW8LgCU7kHXAqwxHqewK4CypoVnDwceA=;
        b=IawmRPd66MIJEy9CzKiFlilXNmeXVFTwEz9LnTB0H9JgA087cTyi2f480dgkBrZOjL
         1PnHeF7P91yoPSqIzdDmXixc1X27gH8Y8qR5ra5I8u0pKgvOSQKx92fCySkCHvONus7M
         IlRumLmapEbItb6yWa12577Kq7UHj4+Bh2/xxKdluRdxqICiVottDG7fp8PSRvHXlk9g
         2NF0Y8E80T5/xYeAJz3AtzdXwjs3UCGn60c1FGrrxiXP8ifq4HFh+FeTmw7r43NyQu++
         8llEQpKfsGkinCHhsCfKPvNmX077YY7stjcHQW4+lGZRqMSp9+oRpSzLg7y+0/yHYDQ3
         PqNw==
X-Gm-Message-State: APuU4Z/hyrIZPA0HGhBHaO8jvz04V92lJtdYaaPXqwZTbrxswmVi8zLO
	SEYs25cK4Gh7+caM4F7JYvEJYJ4KR8nWZaXXYA4ef1VvimhxG367WxGIcItBjkJRN20fyrAydEX
	53DvAnQ==
X-Gm-Gg: AYBFou0hKhmBA61DscICuLaC3K05Hd2DXT+xGWTQkNb+TV4Ls5wwQKC4rEcHHCoOq+3
	SIouZY7gNmCrjTQn92YCHk3wdCmIJmATuKF9LXXOnKDPkYoAscj48s4IB6wCjXrR2Y1I7iHNT8t
	D2VOhTUm4+lXcW+5r3E4v6CJq6tyolmtX8IcUr/RV39K5AI7DDbaxGQ8L4c0K6pL3l1amrxFEGv
	ovzFUGrUDchwcZQN0rV+XTaRpcmlKVmJGLgzBWHsYXxfOB4w2nGz8EX72uPMCLDJGmojWORFqLK
	4sP5b/tqMCMu1EAGYXFdaV9feIgEnWjQDi3qQUengVQPjaLvjyn1wN1RPDSmSG16ilhCuOEtutL
	2Nn7TO9NGhWRGG6Uw4ZC+nO6YKzmVnh+WJOJS20aINSpmMTUL4bO7qEVgvBA1x7S3ev/BfH7/rT
	0Yy6qMGnDp5g4LdCnDn18OmPECGCeHGAl8WLzhvzoMJWo9TwR8CwhHG96CtXvK2u0rA4m8WuxJK
	f4KKqGI4ICWkwePXSsCDrATlJw6aC+eaVSTfxBVCnSpqLzALZvawgvGXV6h9rmZ2/Wh5QxHvWwP
	bHtIjL8XuNUX6XsVMpMt5i5M+xjAy9P8kgG9VS1If+kI6wOZPEKXu78bOJCEYAVPQhQTyDnlRwF
	efcYhKnMqv5aHzjJ8LQ==
X-Received: by 2002:a5d:64c7:0:b0:48a:f320:dba0 with SMTP id ffacd0b85a97d-499c89814femr4688017f8f.45.1794407037407;
        Wed, 11 Nov 2026 06:23:57 -0800 (PST)
Message-ID: <b66783f8-d369-4222-9d87-b32444a3e4a6@suse.com>
Date: Wed, 11 Nov 2026 15:23:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 08/30] x86emul: support REX2-prefixed insns
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
X-purgate-ID: tlsNG-d62444/1794407038-C475B757-2E082579/10/78276251493
X-purgate-type: spam
X-purgate-size: 13018
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This primarily involves folding the various bits into the register
number calculations, plus the handling of REX2.M (when set). And of
course eGPR values which have changed need writing back into their
respective registers.

Note that copy_REX_VEX() doesn't need any adjustment: REX2.{R,B}4 are
ignored when MMX/XMM registers are accessed, and we convert any GPR uses
(including base, with index never used) to fixed registers in the low 8
legacy set (clearing REX.{R,B} accordingly as well).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Perhaps the respective literal number uses in the reg/base/index
calculations should also be converted to use REX_{R,X,B}, to help
readability (sacrificing a tiny bit of code efficiency).

The recurring calculation of the register number when embedded in the
major opcode may want to have a helper function introduced?

While we don't support XSAVE et al yet, I wonder whether - alongside the
row exclusions - their special casing should be added here. Handling in
the actual emulation (when adding support) would likely be less extra
logic, though.

As to the row exclusions: The spec specifically mentions them, which
makes ambiguous what the situation is for certain other insns. From the
spec: "All instructions in legacy maps 0 and 1 that have explicit GPR or
memory operands can use the REX2 prefix to access the upper 16 GPRs
(namely, R16 to R31)." This statement alone would be sufficient to cover
any rows where no insns exist at all with explicit GPR/mem operands
(the first 4 insns in row 0xA are kind of a special case, though). With
the "forbidden" rows enumerated explicitly, it becomes ambiguous whether
such insns outside those rows (e.g. PUSH <imm>) would ignore REX2, or
whether they would instead #UD.

Like in "x86emul: replace earlier relaxation of decode_gpr()" the actual
eGPR accesses could also be done with less inline assembly, but the
readbility gains would likely be similarly marginal here.

--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1111,6 +1111,27 @@ int x86emul_decode(struct x86_emulate_st
                 goto done_prefixes;
             s->rex_prefix = b;
             continue;
+        case 0xd5:
+            if ( (s->xcr0 & X86_XCR0_APX) && !s->rex_prefix )
+            {
+                b = insn_fetch_type(uint8_t);
+                /*
+                 * The bits having a REX equivalent are supposed to be consumed
+                 * from ->rex_prefix.  Move the REX2 counterpart bits (R4, X4,
+                 * and B4) to REX equivalent positions.  To be usable in boolean
+                 * contexts as well as with copy_REX_VEX(), OR in REX_PREFIX.
+                 */
+                s->rex_prefix = REX_PREFIX |
+                                (b & (REX_W | REX_R | REX_X | REX_B));
+                s->rex2_prefix = REX_PREFIX | (b >> 4) | (b & REX2_M);
+
+                /*
+                 * REX2 is always followed by the major opcode byte; no more
+                 * prefix bytes follow.
+                 */
+                b = insn_fetch_type(uint8_t);
+            }
+            fallthrough;
         default:
             goto done_prefixes;
         }
@@ -1125,7 +1146,32 @@ int x86emul_decode(struct x86_emulate_st
 
     /* Opcode byte(s). */
     d = opcode_table[b];
-    if ( b == 0x0f )
+    if ( s->rex2_prefix )
+    {
+        opcode = b;
+        if ( s->rex2_prefix & REX2_M )
+        {
+            d = twobyte_table[b].desc;
+            opcode |= MASK_INSR(0x0f, X86EMUL_OPC_EXT_MASK);
+            s->ext = ext_0f;
+
+            /* Rows 3 and 8 don't have their legacy meaning. */
+            if ( (0x0108 >> (b >> 4)) & 1 )
+            {
+                d = 0;
+                opcode |= X86EMUL_OPC_REX2;
+            }
+            else
+                s->simd_size = twobyte_table[b].size;
+        }
+        /* Rows 4, 7, A, and E don't have their legacy meaning. */
+        else if ( (0x4490 >> (b >> 4)) & 1 )
+        {
+            d = 0;
+            opcode |= X86EMUL_OPC_REX2;
+        }
+    }
+    else if ( b == 0x0f )
     {
         /* Two-byte opcode. */
         b = insn_fetch_type(uint8_t);
@@ -1158,8 +1204,9 @@ int x86emul_decode(struct x86_emulate_st
         s->modrm = insn_fetch_type(uint8_t);
         s->modrm_mod = (s->modrm & 0xc0) >> 6;
 
-        if ( !s->ext && ((b & ~1) == 0xc4 || (b == 0x8f && (s->modrm & 0x18)) ||
-                         b == 0x62) )
+        if ( !s->ext && !s->rex2_prefix &&
+             ((b & ~1) == 0xc4 || (b == 0x8f && (s->modrm & 0x18)) ||
+              b == 0x62) )
             switch ( def_ad_bytes )
             {
             default:
@@ -1340,7 +1387,8 @@ int x86emul_decode(struct x86_emulate_st
         d &= ~ModRM;
 #undef ModRM /* Only its aliases are valid to use from here on. */
         s->modrm_reg = ((s->rex_prefix & 4) << 1) | ((s->modrm & 0x38) >> 3) |
-                       ((evex_encoded() && !s->evex.R) << 4);
+                       ((evex_encoded() ? !s->evex.R
+                                        : !!(s->rex2_prefix & REX_R)) << 4);
         s->modrm_rm  = s->modrm & 0x07;
 
         /*
@@ -1775,7 +1823,8 @@ int x86emul_decode(struct x86_emulate_st
         {
             generate_exception_if(d & vSIB, X86_EXC_UD);
             s->modrm_rm |= ((s->rex_prefix & 1) << 3) |
-                           ((evex_encoded() && !s->evex.x) << 4);
+                           ((evex_encoded() ? !s->evex.x
+                                            : !!(s->rex2_prefix & REX_B)) << 4);
             s->ea.type = OP_REG;
         }
         else if ( ad_bytes == 2 )
@@ -1836,9 +1885,11 @@ int x86emul_decode(struct x86_emulate_st
             if ( s->modrm_rm == 4 )
             {
                 uint8_t sib = insn_fetch_type(uint8_t);
-                uint8_t sib_base = (sib & 7) | ((s->rex_prefix << 3) & 8);
+                uint8_t sib_base = (sib & 7) | ((s->rex_prefix << 3) & 8) |
+                                   (!!(s->rex2_prefix & REX_B) << 4);
 
-                s->sib_index = ((sib >> 3) & 7) | ((s->rex_prefix << 2) & 8);
+                s->sib_index = ((sib >> 3) & 7) | ((s->rex_prefix << 2) & 8) |
+                               (!!(s->rex2_prefix & REX_X) << 4);
                 s->sib_scale = (sib >> 6) & 3;
                 if ( unlikely(d & vSIB) )
                     s->sib_index |= (mode_64bit() && evex_encoded() &&
@@ -1870,7 +1921,8 @@ int x86emul_decode(struct x86_emulate_st
             else
             {
                 generate_exception_if(d & vSIB, X86_EXC_UD);
-                s->modrm_rm |= (s->rex_prefix & 1) << 3;
+                s->modrm_rm |= ((s->rex_prefix & 1) << 3) |
+                               (!!(s->rex2_prefix & REX_B) << 4);
                 s->ea.mem.off = *decode_gpr(ctxt->regs, &s->egpr, s->modrm_rm);
                 if ( (s->modrm_rm == 5) && (s->modrm_mod != 0) )
                     s->ea.mem.seg = x86_seg_ss;
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -122,12 +122,14 @@ struct operand {
 #define REX_X 0x02
 #define REX_R 0x04
 #define REX_W 0x08
+#define REX2_M 0x80
 #elif defined(__i386__)
 #define REX_PREFIX 0
 #define REX_B 0
 #define REX_X 0
 #define REX_R 0
 #define REX_W 0
+#define REX2_M 0
 #endif
 
 enum simd_opsize {
@@ -315,6 +317,7 @@ struct x86_emulate_state {
     uint8_t modrm, modrm_mod, modrm_reg, modrm_rm;
     uint8_t sib_index, sib_scale;
     uint8_t rex_prefix;
+    uint8_t rex2_prefix;
     bool lock_prefix;
     bool not_64bit; /* Instruction not available in 64bit. */
     bool fpu_ctrl;  /* Instruction is an FPU control one. */
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1754,13 +1754,15 @@ x86_emulate(
 
     case 0x50 ... 0x57: /* push reg */
         src.val = *decode_gpr(&_regs, &state->egpr,
-                              (b & 7) | ((rex_prefix & 1) << 3));
+                              ((b & 7) | ((rex_prefix & 1) << 3) |
+                               (!!(state->rex2_prefix & REX_B) << 4)));
         goto push;
 
     case 0x58 ... 0x5f: /* pop reg */
         dst.type  = OP_REG;
         dst.reg   = decode_gpr(&_regs, &state->egpr,
-                               (b & 7) | ((rex_prefix & 1) << 3));
+                               ((b & 7) | ((rex_prefix & 1) << 3) |
+                                (!!(state->rex2_prefix & REX_B) << 4)));
         dst.bytes = op_bytes;
         if ( mode_64bit() && (dst.bytes == 4) )
             dst.bytes = 8;
@@ -2078,7 +2080,7 @@ x86_emulate(
 
     case 0x90: /* nop / xchg %%r8,%%rax */
     case X86EMUL_OPC_F3(0, 0x90): /* pause / xchg %%r8,%%rax */
-        if ( !(rex_prefix & REX_B) )
+        if ( !((rex_prefix | state->rex2_prefix) & REX_B) )
             break; /* nop / pause */
         /* fall through */
 
@@ -2086,7 +2088,8 @@ x86_emulate(
         dst.type = OP_REG;
         dst.bytes = op_bytes;
         dst.reg  = decode_gpr(&_regs, &state->egpr,
-                              (b & 7) | ((rex_prefix & 1) << 3));
+                              ((b & 7) | ((rex_prefix & 1) << 3) |
+                               (!!(state->rex2_prefix & REX_B) << 4)));
         dst.val  = *dst.reg;
         goto xchg;
 
@@ -2333,14 +2336,16 @@ x86_emulate(
 
     case 0xb0 ... 0xb7: /* mov imm8,r8 */
         dst.reg = _decode_gpr(&_regs, &state->egpr,
-                              (b & 7) | ((rex_prefix & 1) << 3),
+                              ((b & 7) | ((rex_prefix & 1) << 3) |
+                               (!!(state->rex2_prefix & REX_B) << 4)),
                               !rex_prefix);
         dst.val = src.val;
         break;
 
     case 0xb8 ... 0xbf: /* mov imm{16,32,64},r{16,32,64} */
         dst.reg = decode_gpr(&_regs, &state->egpr,
-                             (b & 7) | ((rex_prefix & 1) << 3));
+                             ((b & 7) | ((rex_prefix & 1) << 3) |
+                              (!!(state->rex2_prefix & REX_B) << 4)));
         dst.val = src.val;
         break;
 
@@ -5534,7 +5539,8 @@ x86_emulate(
     case X86EMUL_OPC(0x0f, 0xc8) ... X86EMUL_OPC(0x0f, 0xcf): /* bswap */
         dst.type = OP_REG;
         dst.reg  = decode_gpr(&_regs, &state->egpr,
-                              (b & 7) | ((rex_prefix & 1) << 3));
+                              ((b & 7) | ((rex_prefix & 1) << 3)) |
+                               (!!(state->rex2_prefix & REX_B) << 4));
         switch ( dst.bytes = op_bytes )
         {
         default: /* case 2: */
@@ -8800,7 +8806,49 @@ x86_emulate(
     }
 
     if ( rc != X86EMUL_DONE )
+    {
+        unsigned int i;
+
         *ctxt->regs = _regs;
+
+        /* Put changed eGPR values back into the registers themselves. */
+        for ( i = 0; i < ARRAY_SIZE(state->egpr.regno); ++i )
+        {
+            unsigned int reg = state->egpr.regno[i];
+
+            if ( !reg )
+                break;
+
+            if ( state->egpr.val[i] == state->egpr.orig[i] )
+                continue;
+
+            asm volatile ( "sub	$17, %[reg]\n\t"
+
+                           /* cmovc (%rdi), %r16 */
+                           ".byte 0xd5, 0xc8, 0x42, 0x07\n\t"
+
+                           /* cmovz (%rdi), %r17 */
+                           ".byte 0xd5, 0xc8, 0x44, 0x0f\n\t"
+
+                           ".irp n, 18, 19, 20, 21, 22, 23,"
+                           "        24, 25, 26, 27, 28, 29, 30\n\t"
+
+                           "dec	%[reg]\n\t"
+
+                           /* cmovz (%rdi), %r\n */
+                           ".byte 0xd5, 0xc8 + ((\\n & 8) >> 1)\n\t"
+                           ".byte 0x44, 0x07 + ((\\n & 7) << 3)\n\t"
+
+                           ".endr\n\t"
+
+                           /* cmovg (%rdi), %r31 */
+                           ".byte 0xd5, 0xcc, 0x4f, 0x3f"
+
+                           : [reg] "+r" (reg)
+                           : "m" (state->egpr.val[i]),
+                             "D" (&state->egpr.val[i]) );
+        }
+    }
     else
     {
         ctxt->regs->r(ip) = _regs.r(ip);
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -586,6 +586,11 @@ struct x86_emulate_ctxt
     (X86EMUL_OPC_F3(ext, byte) | X86EMUL_OPC_EVEX_)
 # define X86EMUL_OPC_EVEX_F2(ext, byte) \
     (X86EMUL_OPC_F2(ext, byte) | X86EMUL_OPC_EVEX_)
+/*
+ * This is used only for opcode rows that don't have their legacy meaning when
+ * used with REX2.
+ */
+#define X86EMUL_OPC_REX2             0x00003000
 
 #define X86EMUL_OPC_XOP(ext, byte)    X86EMUL_OPC(0x8f##ext, byte)
 #define X86EMUL_OPC_XOP_66(ext, byte) X86EMUL_OPC_66(0x8f##ext, byte)


