Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69924606A324
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DLJwU4lR
Received: from list by lists.xenproject.org with outflank-mailman.1483812.1687172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9Gm-0004kG-GT; Wed, 11 Nov 2026 14:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483812.1687172; Wed, 11 Nov 2026 14:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9Gm-0004k9-De; Wed, 11 Nov 2026 14:25:48 +0000
Received: by outflank-mailman (input) for mailman id 1483812;
 Wed, 11 Nov 2026 14:25:47 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9Gl-0004iJ-23
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:25:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9Gk-00GNFz-FI
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:25:46 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47ae4-bab6-0a2a0a5309dd-0a2a45018622-10
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:25:46 +0100
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47aea-5984-0a2a45010019-d155dd2fd022-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:25:46 +0100
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-48e20ed3b9dso2867302f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:25:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4983f7801bbsm11374877f8f.5.2026.11.11.06.25.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 06:25:43 -0800 (PST)
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
        d=suse.com; s=google; t=1794407146; x=1795011946; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LgrF9bW0dBWIX40RKWCwn3LYz86xkPsnuGJp7WDcjRo=;
        b=DLJwU4lROvdAcSVkQWygzQlND4JIoniISmvWUugeabp2u1LG8hDAvsHFcNGevTLv1c
         fzqIMb1QgncMiAwKL5fAZvfjJqOWYQG9eizLLlJAt8VcpPPHCr1cUmzq4VAlsYVsOAzP
         y/Wbp9LEtJQ7MlL+2CDRz3h3ydEfaBYHdukC9nm+3GDK0DR3cGHXf/WZIRDHup/m1Wdv
         LyRWi31LAxEMghz5xpCi1IpAt1b2pgvhr+pkpyeXv8D2UCP+2Cg9BxDDXGq2WPCZdjMi
         JMhR9c31/5NSHC/5tEXigXhIUijEKvgykofcVS2LcO0dWzqFK0NNfeHi5RGro4RDoLx6
         PZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407146; x=1795011946;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LgrF9bW0dBWIX40RKWCwn3LYz86xkPsnuGJp7WDcjRo=;
        b=IzzB9l3Frg5095cNBG/48A6q09TilN4x1Knt8cF7oWzliuvbTzUmKwXhpS5QrHWa5U
         xoCZjAb5NX1UIiUZWeXRL218mgrAvnv9rF1nWjoNvrLBkRMvOcj4foIaV7l39vS83TNU
         Vi1K9SHMnCWPPWc4bu0Uy5jYiQ+cpCRiGq/pR2MZABe4zD1r3oGUASEADS7CBdTdZrQ/
         0Ryog1PiTC3amQxpqNfNXs62IPFCi8pPKUBf+8iWQ1kjodj8MjQoRU+g8jB8mDLTs28I
         4MXa0IQTQSQzRiHiz+lDWPcSR2dgn1Lg3oWcBnxlC8DfYvIi/OnsfkusW41aSupZaoYL
         fgoQ==
X-Gm-Message-State: APuU4Z/FtNt9NOZedE6cMdlHpbDHDxfbCJFzVT49PSqwxQbh9zvaDY4Y
	fnNEXWZrb7D0FEvlZYn1YoWu1C+hgP4yeRoqY+Six7Ix6+6qEfI0v1VxenDq6ji5tNitbz38ALz
	o/iWomw==
X-Gm-Gg: AYBFou3CA0J9sDgaUkMHJz0GM/6dtrbcWFbxtaD+ph2bB5HOeO4yDzfC5cz4s6h6tZV
	IIS1P2UqJlY+a+DTqVWfwUTIhzx8ZQV3W9mRa20IVjA2o6qXRa9PzFBSugaEo8RrrDkI7LhiwKl
	7/J7+M50KWIbp1Q6BGjcrnO7IFqcTWIDXnSFPhzXctM5Gi0FeGp6tIQD/51+gguHQa6iwXzDkAl
	8YDlCEEPZ2vNeStPjeLSN2FnE1ojIOe0Coo6ypUim9B4MWIOQJRmZRFyO7biMOf7WlYE64NAgjd
	JUby8P0+MHNLm/AWJAocvuZ5xtwBCoqK4do0g/XWSXDOH4HfWXf/Q3xQAHpIbQfH40JX/eyP1sC
	00tK2s6URlvGTXWgYKItcFFTon6w0dewkTbwQ72hDAa1259uZQ697RFCOi9VisfyW2Ln6Mj8nJo
	+QALAgEYSKrotLN433DKV9NmKRs5lTYPmvZOoRHRlzG31tDzBhHyUUAWtBDOijO4uhprsVZwviJ
	UC7syYXAz+A/+rxIUVEFjFQwSe3dvOr+lJH4qa1Z7TlXuTJESFdiFpzvlIFRjBA8WeD9I8pshRy
	azkl9gsemrHUcp9bpiLPZSazqIiCEpDGy9KMaa3Cahd1dnrmD9JA+Ff2lOZcYKBzDbwtvinh49x
	duhh+BwJx3T8V3mJZ
X-Received: by 2002:a05:6000:26c9:b0:490:b23b:8017 with SMTP id ffacd0b85a97d-499c75529e1mr4636519f8f.34.1794407145339;
        Wed, 11 Nov 2026 06:25:45 -0800 (PST)
Message-ID: <4bcab30e-d9f6-4b63-aad4-6c51e4cd134d@suse.com>
Date: Wed, 11 Nov 2026 15:25:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 13/30] x86emul: switch to EVEX.X3 nomenclature
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
X-purgate-ID: tlsNG-d62444/1794407146-1DC79757-6052E048/10/78276251493
X-purgate-type: spam
X-purgate-size: 6118
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The APX spec renames the X field and repurposes U for the 5th index
register bit; it can be expected for the SDM to follow once APX stuff is
folded in. The new naming is also better to reflect in our structure
field identifiers.

Like we represent VEX.X and EVEX.X3 in rex_prefix, also represent
EVEX.U (EVEX.X4) in rex2_prefix, allowing to leave index register
calculation untouched.

In the test harness'es evex-disp8.c also rename the "mbs" field at this
occasion.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -941,10 +941,10 @@ static void test_one(const struct test *
             uint8_t b4:1;
             uint8_t r4:1;
             uint8_t b3:1;
-            uint8_t x:1;
+            uint8_t x3:1;
             uint8_t r3:1;
             uint8_t pfx:2;
-            uint8_t mbs:1;
+            uint8_t u:1;
             uint8_t reg:4;
             uint8_t w:1;
             uint8_t opmsk:3;
@@ -955,7 +955,7 @@ static void test_one(const struct test *
         };
     } evex = {
         .opcx = test->spc, .pfx = test->pfx, .lr = vl,
-        .r4 = 1, .b3 = 1, .x = 1, .r3 = 1, .mbs = 1,
+        .r4 = 1, .b3 = 1, .x3 = 1, .r3 = 1, .u = 1,
         .reg = 0xf, .RX = 1, .opmsk = sg,
     };
 
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -16,7 +16,7 @@
 # define ERR_PTR(val) NULL
 #endif
 
-#define evex_encoded() (s->evex.mbs)
+#define evex_encoded() (s->evex.opcx)
 
 struct x86_emulate_state *
 x86_decode_insn(
@@ -1276,7 +1276,20 @@ int x86emul_decode(struct x86_emulate_st
                         s->evex.raw[1] = s->vex.raw[1];
                         s->evex.raw[2] = insn_fetch_type(uint8_t);
 
-                        generate_exception_if(!s->evex.mbs, X86_EXC_UD);
+                        /*
+                         * VEX.L's bit position matches EVEX.U.  Shared code
+                         * paths for vector insns use evex.lr (copying happens
+                         * a little further down), but the bit being set can
+                         * get in the way on shared APX code paths.
+                         */
+                        s->vex.l = 0;
+
+                        /*
+                         * .opcx is being checked here just to be on the safe
+                         * side, especially as long as evex_encoded() uses
+                         * this field.
+                         */
+                        generate_exception_if(!s->evex.opcx, X86_EXC_UD);
                         generate_exception_if((!(s->xcr0 & X86_XCR0_APX) &&
                                                s->evex.b4),
                                               X86_EXC_UD);
@@ -1293,6 +1306,8 @@ int x86emul_decode(struct x86_emulate_st
                                 s->rex2_prefix |= REX_R;
                             if ( s->evex.b4 )
                                 s->rex2_prefix |= REX_B;
+                            if ( !s->evex.u )
+                                s->rex2_prefix |= REX_X;
                         }
 
                         s->vex.opcx = s->evex.opcx;
@@ -1535,7 +1550,11 @@ int x86emul_decode(struct x86_emulate_st
             if ( ext0f38_table[b].two_op )
                 d |= TwoOp;
             if ( ext0f38_table[b].vsib )
+            {
+                generate_exception_if(evex_encoded() && !s->evex.u,
+                                      X86_EXC_UD);
                 d |= vSIB;
+            }
             s->simd_size = ext0f38_table[b].simd_size;
             if ( evex_encoded() )
             {
@@ -1898,7 +1917,7 @@ int x86emul_decode(struct x86_emulate_st
             generate_exception_if(d & vSIB, X86_EXC_UD);
             s->modrm_rm |= ((s->rex_prefix & 1) << 3) |
                            ((evex_encoded() && !rm_is_gpr
-                             ? !s->evex.x
+                             ? !s->evex.x3
                              : !!(s->rex2_prefix & REX_B)) << 4);
             s->ea.type = OP_REG;
         }
@@ -2038,6 +2057,16 @@ int x86emul_decode(struct x86_emulate_st
     if ( override_seg != x86_seg_none )
         s->ea.mem.seg = override_seg;
 
+    /*
+     * While this generic check takes care of most insns, scalar ones (with
+     * EVEX.b set) need checking individually (elsewhere).
+     */
+    generate_exception_if((evex_encoded() &&
+                           !s->evex.u &&
+                           (s->modrm_mod == 3 ||
+                            !(s->xcr0 & X86_XCR0_APX))),
+                          X86_EXC_UD);
+
     /* Fetch the immediate operand, if present. */
     switch ( d & SrcMask )
     {
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -239,10 +239,10 @@ union evex {
         uint8_t b4:1;    /* B4 */
         uint8_t r4:1;    /* R4 (aka R') */
         uint8_t b3:1;    /* B3 (aka B) */
-        uint8_t x:1;     /* X */
+        uint8_t x3:1;    /* X3 (aka X) */
         uint8_t r3:1;    /* R3 (aka R) */
         uint8_t pfx:2;   /* pp */
-        uint8_t mbs:1;
+        uint8_t u:1;     /* U (aka X4) */
         uint8_t reg:4;   /* vvvv */
         uint8_t w:1;     /* W */
         uint8_t opmsk:3; /* aaa */
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1302,7 +1302,7 @@ int cf_check x86emul_unhandleable_rw(
 #define lock_prefix (state->lock_prefix)
 #define vex (state->vex)
 #define evex (state->evex)
-#define evex_encoded() (evex.mbs)
+#define evex_encoded() (evex.opcx)
 #define ea (state->ea)
 
 /* Undo DEBUG wrapper. */
@@ -7529,7 +7529,7 @@ x86_emulate(
         b = 0x15;
         modrm <<= 3;
         evex.r3 = evex.b3;
-        evex.r4 = evex.x;
+        evex.r4 = evex.x3;
         /* fall through */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x14): /* vpextrb $imm8,xmm,r/m */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x15): /* vpextrw $imm8,xmm,r/m */


