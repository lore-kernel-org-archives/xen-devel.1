Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911E7606A321
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 15:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eenX6KsF
Received: from list by lists.xenproject.org with outflank-mailman.1484285.1687659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRA6g-0007mA-Hl; Wed, 11 Nov 2026 15:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484285.1687659; Wed, 11 Nov 2026 15:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRA6g-0007m3-Ds; Wed, 11 Nov 2026 15:19:26 +0000
Received: by outflank-mailman (input) for mailman id 1484285;
 Wed, 11 Nov 2026 15:19:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRA6e-0007kX-W3
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:19:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRA6e-003r4V-D4
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:19:24 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af48770-8faa-0a2a0a5109dd-0a2a4503b828-36
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:19:24 +0100
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af4877c-fae8-0a2a45030019-d155dd2dad03-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:19:24 +0100
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-48e10a70540so2003488f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 07:19:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498365cd06fsm11307834f8f.40.2026.11.11.07.19.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 07:19:23 -0800 (PST)
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
        d=suse.com; s=google; t=1794410364; x=1795015164; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wL9Eotxd/ZDjmktLmRUrRPg5TEnAeT9ACm+0IyZV9xs=;
        b=eenX6KsFrILkbklzB1v8Gtbz0SnS0o/c1QkM7Po5626ZRwAuixXV52mF2sh503NdnH
         5MIY+Ggb+1JTF4CJI+HDYwjHG8Va1PyZp4eiusen953ePD7U0FAMk/gNTZUHByEnY4DM
         51XlM+gqS1RioTVyrbTK2c7vXTriw9EyiWCjvaRSUbP9kz2mOU3W5a+Sc13mhBeFUpJ5
         w0HpZmrOI4BVX+r+IyrckbN+T2JJb9QYe/Lo0rIh6yROVnK/fmwXYReOWEQxIGNZxEQI
         DzDo6WxjctoS6zQULJxgQ1s4nsRNcv5+YgdIl5OXqyquiWC4c67xrOSw81ghTcC7bvRE
         DdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794410364; x=1795015164;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wL9Eotxd/ZDjmktLmRUrRPg5TEnAeT9ACm+0IyZV9xs=;
        b=FepWRjbiOb0BWNDhwPlTxhk26M0sLGWbk3YTzurgRZL2uSLOguRfbtzma1Ks1DP/H6
         WkoEs3QEo2QV0Z4S1UsLCwdshDU5aYdY9lV2bM0dBYRO8r88BRh1RfGbgItCh42MpXfO
         8Z/tLvUNDL9oI7a0mPNF2v38waLFkg9DQ4RYfWO0PhklD8F+z46tenIwG7V4Feaj6tWp
         FQHYjKnHx+uQyZuMtm8/vYQ+2Ig24Gka1U89n+s4fsfhTBZyOpMJv98q+l3T9RGARXHz
         XDVfA+rPIgwkcVKbbsR2DUwcBb2sOgMKX5frQbfH6UYo9PRBnMAylxmi8XEe8TjE+JJq
         M/vg==
X-Gm-Message-State: APuU4Z/ogLAiAboPIm6v77KpaJyuzq0NaCDD26waMQhxHhjdKbhFTaLG
	pWkJQuclWa1Ph2sJq9Dh1352R8IUBnD13t8n5y5BrPzBj/DVYmjDXtSohJIEpxkIk3wZ6nJUOLH
	mnkM9kg==
X-Gm-Gg: AYBFou0RZuajdVRQABmo7erqrQ8p8A4Z+2uaXNk5+d60gl7OTfpnOKYi6v+mE7fwfqV
	n5PrJK9Zyltg4ZUZRxnLb/XviBE2LywNNbIrmhXCrcXEPcgyb7YrQ5toJFZqzoP7gGZjkv+66+Z
	nvyRoFSdlvFuCHaiqGxf2x/6CNhyRC9aGZ1jJJb9abfbNn3NOg1WqikOaOOAi8WT0ClmmDGGeRp
	g/GRdkX/Wq90fUP6Brt2Wg7p05WDVGSYAYVPUvD63VjlxwdtG70QMa2veMXte4v8wdOyZHEYQpa
	WnNXDupFzO+MzGgyP7757AXqLMOZ59m5zycwvm8slHpB0FlYic8ZveycZUiqh4jKMiuLKNqalNh
	PeniF97tqp1KYnfPWbtvDoiv74eNoz6e8jr7Yb6oEqw4pKSma44d6Pe2qexkgISrT4r61BHxXY1
	JhwxY0G33LX7Y1zq9GUHhUPPUKGLWVRs6kVgVe9D1DbtPmCXb6O3cvpoyIMVa3YF5q2y+fZ9XTy
	ghI3fRecYr1fbX1Ha7HVeL0LF1Atyvxlh4o0aC9qi5p4DMJNo4LEooB/FGwD8cBcHXLJtLYcqcS
	LoAzeJ0vITYi3NpeQnQ7ESUvPquNW7lVXKZRBhdLTm4zD6umzUlH+zA1tYWQMUs/IRbZcrfLNk1
	kFOUcOxxyCvomcWXY
X-Received: by 2002:a05:6000:3103:b0:48b:a7:6396 with SMTP id ffacd0b85a97d-499c6e97942mr5082502f8f.41.1794410363720;
        Wed, 11 Nov 2026 07:19:23 -0800 (PST)
Message-ID: <3d703ce5-7798-43df-a42c-10fbe59c46ff@suse.com>
Date: Wed, 11 Nov 2026 16:19:22 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 27/28] x86emul: enable block scale register insns for ACE
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <0407294d-d605-41f3-a16b-1505d897ef3f@suse.com>
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
In-Reply-To: <0407294d-d605-41f3-a16b-1505d897ef3f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1794410364-6E6CE4E9-F5C08A63/10/78276251493
X-purgate-type: spam
X-purgate-size: 7255
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

BSRINIT is an encoding sibling of TILEZERO and hence the code there merely
needs EVEX.W handling to be adjusted. BSRMOV* are at an entirely new code
point, with EVEX.W controlling the direction of the move.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: ???
---
v4: New.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -1203,6 +1203,12 @@ static const struct test amx_tile[] = {
 };
 
 static const struct test ace[] = {
+    /* Element sizes are arbitrary here, for test_one() to set W correctly. */
+    INSN(bsrmovf,       , map6, 95, vl, q_nb, vl),
+    INSN(bsrmovh,     f2, map6, 95, vl, d_nb, vl),
+    INSN(bsrmovh,     f2, map6, 95, vl, q_nb, vl),
+    INSN(bsrmovl,     f3, map6, 95, vl, d_nb, vl),
+    INSN(bsrmovl,     f3, map6, 95, vl, q_nb, vl),
     /* Element size is set arbitrarily here. See test_one(). */
     INSN(ldtilecfg,     , 0f38, 49, el,    b, no),
     INSN(sttilecfg,   66, 0f38, 49, el,    b, no),
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1347,6 +1347,7 @@ static const struct vex {
     { { 0x49, 0x00 }, 2, F, W, pfx_66, W0, L0 }, /* sttilecfg */
     { { 0x49, 0xc0 }, 2, F, N, pfx_no, W0, L0 }, /* tilerelease */
     { { 0x49, 0xc0 }, 2, F, N, pfx_f2, W0, L0 }, /* tilezero */
+    { { 0x49, 0xc0 }, 2, F, N, pfx_f2, W1, L0 }, /* bsrinit */
     { { 0x4a, VSIB(0) }, 3, F, R, pfx_66, W0, L0 }, /* tileloaddrst1 */
     { { 0x4a, VSIB(0) }, 3, F, R, pfx_f2, W0, L0 }, /* tileloaddrs */
     { { 0x4b, VSIB(0) }, 3, F, R, pfx_66, W0, L0 }, /* tileloaddt1 */
@@ -2567,6 +2568,11 @@ static const struct evex {
     { { 0x80 }, 2, T, R, pfx_no, W0, L1 | L2 }, /* vbmacor16x16x16 */
     { { 0x80 }, 2, T, R, pfx_no, W1, L1 | L2 }, /* vbmacxor16x16x16 */
     { { 0x81 }, 2, T, R, pfx_no, W0, Ln }, /* vbitrev */
+    { { 0x95 }, 2, F, R, pfx_no, W1, L2 }, /* bsrmovf */
+    { { 0x95 }, 2, F, W, pfx_f3, W0, L2 }, /* bsrmovl */
+    { { 0x95 }, 2, F, R, pfx_f3, W1, L2 }, /* bsrmovl */
+    { { 0x95 }, 2, F, W, pfx_f2, W0, L2 }, /* bsrmovh */
+    { { 0x95 }, 2, F, R, pfx_f2, W1, L2 }, /* bsrmovh */
     { { 0x96 }, 2, T, R, pfx_66, W0, Ln }, /* vfmaddsub132ph */
     { { 0x97 }, 2, T, R, pfx_66, W0, Ln }, /* vfmsubadd132ph */
     { { 0x98 }, 2, T, R, pfx_66, W0, Ln }, /* vfmadd132ph */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -406,6 +406,7 @@ static const struct ext0f38_table {
     [0x8e] = { .simd_size = simd_packed_int, .to_mem = 1 },
     [0x8f] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0x90 ... 0x93] = { .simd_size = simd_other, .vsib = 1, .d8s = d8s_dq },
+    [0x95] = { .simd_size = simd_other, .d8s = d8s_vl },
     [0x96 ... 0x98] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
     [0x99] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0x9a] = { .simd_size = simd_packed_fp, .d8s = d8s_vl },
@@ -1559,6 +1560,26 @@ decode_map5(struct x86_emulate_state *s,
     return rc;
 }
 
+static int
+decode_map6(struct x86_emulate_state *s,
+            struct x86_emulate_ctxt *ctxt,
+            const struct x86_emulate_ops *ops)
+{
+    int rc = X86EMUL_OKAY;
+
+    switch ( ctxt->opcode & 0xff )
+    {
+    case 0x95: /* bsrmov{f,h,l} */
+        if ( !s->evex.w )
+            s->desc = DstMem | SrcReg;
+        if ( s->evex.pfx )
+            s->desc |= TwoOp;
+        break;
+    }
+
+    return rc;
+}
+
 #define ad_bytes (s->ad_bytes) /* for truncate_ea() */
 
 int x86emul_decode(struct x86_emulate_state *s,
@@ -2706,6 +2727,9 @@ int x86emul_decode(struct x86_emulate_st
         break;
 
     case ext_map6:
+        rc = decode_map6(s, ctxt, ops);
+        break;
+
     case ext_map7:
     case ext_8f09:
     case ext_8f0a:
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6794,18 +6794,29 @@ x86_emulate(
         goto unrecognized_insn;
 
     case X86EMUL_OPC_VEX_F2(0x0f38, 0x49):
-        generate_exception_if(!mode_64bit() || vex.l || vex.w, X86_EXC_UD);
+        generate_exception_if(!mode_64bit() || vex.l, X86_EXC_UD);
         if ( ea.type == OP_REG )
         {
             switch ( modrm_rm & 7 )
             {
-            case 0: /* tilezero */
-                if ( !vcpu_has_ace() )
-                    vcpu_must_have(amx_tile);
-                get_fpu(X86EMUL_FPU_tile);
+            case 0:
+                if ( !vex.w ) /* tilezero */
+                {
+                    if ( !vcpu_has_ace() )
+                        vcpu_must_have(amx_tile);
+                    get_fpu(X86EMUL_FPU_tile);
+                }
+                else /* bsrinit */
+                {
+                    vcpu_must_have(ace);
+                    get_fpu(X86EMUL_FPU_ace);
+                }
                 sttilecfg(&mmvalp->tilecfg);
-                generate_exception_if(!tile_valid(modrm_reg, &mmvalp->tilecfg,
-                                                  PALETTE(AMX, ACE)),
+                generate_exception_if(vex.w
+                                      ? mmvalp->tilecfg.palette != PALETTE_ACE ||
+                                        modrm_reg
+                                      : !tile_valid(modrm_reg, &mmvalp->tilecfg,
+                                                    PALETTE(AMX, ACE)),
                                       X86_EXC_UD);
                 op_bytes = 1; /* fake */
                 goto simd_0f_common;
@@ -9415,6 +9426,41 @@ x86_emulate(
         avx512_vlen_check(false);
         goto simd_zmm;
 
+    case X86EMUL_OPC_EVEX   (6, 0x95): /* bsrmovf zmm/m512,zmm,%bsr0 */
+        generate_exception_if(!evex.w, X86_EXC_UD);
+        fallthrough;
+    case X86EMUL_OPC_EVEX_F3(6, 0x95): /* bsrmovl zmm/m512,%bsr0 */
+                                       /* bsrmovl %bsr0,zmm/m512 */
+    case X86EMUL_OPC_EVEX_F2(6, 0x95): /* bsrmovh zmm/m512,%bsr0 */
+                                       /* bsrmovh %bsr0,zmm/m512 */
+        vcpu_must_have(ace);
+        generate_exception_if((evex.brs || evex.opmsk || evex.lr != 2),
+                              X86_EXC_UD);
+
+        get_fpu(X86EMUL_FPU_zmm_ace);
+        sttilecfg(&mmvalp->tilecfg);
+        generate_exception_if(mmvalp->tilecfg.palette != PALETTE_ACE,
+                              X86_EXC_UD);
+
+        generate_exception_if(modrm_reg, X86_EXC_UD);
+
+        opc = init_evex(stub);
+        opc[0] = b;
+        opc[1] = modrm;
+        if ( ea.type == OP_MEM )
+        {
+            generate_exception_if(!evex.RX && !(state->xcr0 & X86_XCR0_APX),
+                                  X86_EXC_UD);
+
+            /* convert memory operand to (%rAX) */
+            evex.b3 = 1;
+            evex.b4 = 0;
+            opc[1] &= 0x38;
+        }
+        insn_bytes = EVEX_PFX_BYTES + 2;
+        op_bytes = 64;
+        break;
+
     case X86EMUL_OPC_XOP(08, 0x85): /* vpmacssww xmm,xmm/m128,xmm,xmm */
     case X86EMUL_OPC_XOP(08, 0x86): /* vpmacsswd xmm,xmm/m128,xmm,xmm */
     case X86EMUL_OPC_XOP(08, 0x87): /* vpmacssdql xmm,xmm/m128,xmm,xmm */


