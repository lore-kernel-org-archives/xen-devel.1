Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90824606A321
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UZPOutsq
Received: from list by lists.xenproject.org with outflank-mailman.1483902.1687270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9L9-0003if-18; Wed, 11 Nov 2026 14:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483902.1687270; Wed, 11 Nov 2026 14:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9L8-0003iY-Un; Wed, 11 Nov 2026 14:30:18 +0000
Received: by outflank-mailman (input) for mailman id 1483902;
 Wed, 11 Nov 2026 14:30:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9L7-0003ff-TZ
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:30:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9L7-000l9W-82
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:30:17 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47bf8-8faa-0a2a0a5109dd-0a2a4501c402-2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:30:17 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47bf9-5984-0a2a45010019-d1558036ec78-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:30:17 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a2d6d01ecbso20451535e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:30:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4c524faesm403955e9.15.2026.11.11.06.30.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 06:30:15 -0800 (PST)
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
        d=suse.com; s=google; t=1794407417; x=1795012217; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Pd4Hs3mt0nDAxz//BysCCFqqUZlFJ9dNrV/g+ANkI+Q=;
        b=UZPOutsqtx9CmqiorqPjwPoYSPTfatPiQRba4eo+8bXrEAQVVeBFWGZHR3tyal0w24
         HP3fm7JWObelkMbscwWT3+O3B0ALsLE9VEmeQsKeh62fZkMSxbu0/bq9XBK0rA0Yvhrd
         Z2QHI/asLWq6Xtkz+t3YgFqIaLyQEenlKzm+6vUcQAheYme87o0u19cy5cFsu5W28/v1
         GmWzrkJZy9oPBFClbrVgUZKa2l+HGyS5AIji+WXV9QKrH0OVlrIOfVeRD7hHQ2L/sLBG
         /FPGHg5OPDg13NS/Fzp+CRDWTZrXq+R/AZrvepQQQlEsUzJLTNMRwIK3FiS/vo8FrfRy
         WkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407417; x=1795012217;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Pd4Hs3mt0nDAxz//BysCCFqqUZlFJ9dNrV/g+ANkI+Q=;
        b=JL1r8atJ7k9DlC73Z+TZ5JEOuP7MKu4nGzlKAMaVTXLxfnRyW1cpUgVTPXz2bbC8qC
         4w3WWG6fRxCyCJX98PWeJMcfAms4ndhgGefLTo6jjNCmnzEiUd98pBp7lHPj6SgR2L2m
         5HN/MyTuLoI5freFymGzhh+IE31GYZeeE3Q/UbJ57tV8Q8FBpMfL68Mi9C/jQpnp5N6X
         19kc84+LtAzGoN7upjb2clOFo7+DzeZncD1m3kdCeW3XrXNlX/oQv0iTdpjSmcC6GioK
         GVcwwzJ7Dk2w30qb3yKd7c/SEs6Xw8TAwwIu0pWGd/7L9alQH+FyOvlmn7Xbnq4U2zmU
         pOPg==
X-Gm-Message-State: APuU4Z+qZsYy1JB8VSM/+5m01ee21AFXaaMxYwQgYGtept7Kbt2/rmgJ
	YRNLF/uRsL6XAP+3dMDBUefjR9yLL6Jy/E5t0uAmEImm2lJoplof5Dg4U21BgNAoX80gk5gBKtm
	SvlUHCw==
X-Gm-Gg: AYBFou02dqtSxbSuA/EgPKcGVld7oXzrvFZlse0cyODpG3+nHRnVy5OH9Xoy7ZOr5bo
	OIZ9Lgqx6udZe/cEOE+6tQYdnNlmyeh48xpYWw1/4Gl05eXOfVzVvsqzZbL2HiiZT0PWJB8Fz0E
	XDroA7seVtd2TaSVyy/uanas8BKG2Bd9zV+i2x1of+50/noYc5gyI43VpsQBi/vDElzZ6C+Vm0D
	AbIicQylnPZdMttkgYA/Jc8iWNzv38pE6o1ecfQ99IAyo0rQe1n2p/I3NWlfHlXOGsFdVuoUwy0
	uwrS1kcFT5zIVm6nguZoxn1oYJZ/UrDMfUupWOS9a449Neq2ooCatAv/Q4Nj3b4LAwT/M4d0+Tf
	X/mBczLif2SX8x9WIqajU1w+nDAkJl3rs7yvX72/nwAuI320YNKy12pMcEDxn0h4R622lJGm1vE
	73V8HlIGVj0JJ4ewBhR45b2wD4zqBqy5b6HYlogozAXS+F1otvV6itNK1rdq1qro7ii1Kb4GyjT
	GyqtRYucKhRB5qNdRQebgDnQwQ7sTev16qOkkGDEeTmFFOAgSA88AeuK0LQMTA/I2EhEQIy0ead
	Yq5vyBwKcWXJVDhq2y9WdzdMsZS7whdBawb6XLON18PrDd4fEgvJfMpNTVCbGt9ndJ1tWVH2nnM
	iyzy6NDeIHFyj3H/CX4Nl7NC6KgP+IYv6MVzwjA==
X-Received: by 2002:a05:600c:190a:b0:4a1:f99e:f22d with SMTP id 5b1f17b1804b1-4ba0936c0d2mr50378535e9.6.1794407416356;
        Wed, 11 Nov 2026 06:30:16 -0800 (PST)
Message-ID: <c508a20b-059a-4c65-b335-be6d29769a38@suse.com>
Date: Wed, 11 Nov 2026 15:30:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 24/30] x86emul: support APX+{LZ,POP}CNT insns
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
X-purgate-ID: tlsNG-d62444/1794407417-1DA7E757-34D13772/10/78276251493
X-purgate-type: spam
X-purgate-size: 6814
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Besides adding table entries and case labels there's very little to do
here; generic map 4 handling takes care of things.

To aid making the connection between ABM and LZCNT (the sole insn the
feature bit covers), amend the comment in cpufeatures.h at the same
time.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -1154,6 +1154,16 @@ static const struct test bmi2[] = {
     INSN(shrx,      f2, 0f38, f7,    el,   dq, no),
 };
 
+static const struct test lzcnt[] = {
+    INSN(lzcnt,       , map4, f5,    el,   dq, no),
+    INSN(lzcntw,    66, map4, f5,    el,    w, no),
+};
+
+static const struct test popcnt[] = {
+    INSN(popcnt,      , map4, 88,    el,   dq, no),
+    INSN(popcntw,   66, map4, 88,    el,    w, no),
+};
+
 static const unsigned char vl_all[] = { VL_512, VL_128, VL_256 };
 static const unsigned char vl_128[] = { VL_128 };
 static const unsigned char vl_no128[] = { VL_512, VL_256 };
@@ -1745,6 +1755,8 @@ void evex_disp8_test(void *instr, struct
         RUN(bmi1);
         RUN(bmi2);
         RUN(cmpccxadd);
+        RUN(lzcnt);
+        RUN(popcnt);
 
 #undef RUN
 
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2260,6 +2260,8 @@ static const struct evex {
     { { 0x84 }, 2, T, R, pfx_no, WIG, L0, SCC }, /* ctest<scc> */
     { { 0x85 }, 2, T, R, pfx_no, Wn, L0, SCC }, /* ctest<scc> */
     { { 0x85 }, 2, T, R, pfx_66, Wn, L0, SCC }, /* ctest<scc> */
+    { { 0x88 }, 2, T, R, pfx_no, Wn, L0 }, /* popcnt */
+    { { 0x88 }, 2, T, R, pfx_66, Wn, L0 }, /* popcnt */
     { { 0x8f, 0xc0 }, 2, F, R, pfx_no, Wn, L0, ND }, /* pop2 */
     { { 0xa5 }, 2, T, W, pfx_no, Wn, L0, ND }, /* shld */
     { { 0xa5 }, 2, T, W, pfx_66, Wn, L0, ND }, /* shld */
@@ -2344,6 +2346,8 @@ static const struct evex {
     { { 0xf1 }, 2, T, R, pfx_66, Wn, L0 }, /* crc32 */
     { { 0xf4 }, 2, T, R, pfx_no, Wn, L0 }, /* tzcnt */
     { { 0xf4 }, 2, T, R, pfx_66, Wn, L0 }, /* tzcnt */
+    { { 0xf5 }, 2, T, R, pfx_no, Wn, L0 }, /* lzcnt */
+    { { 0xf5 }, 2, T, R, pfx_66, Wn, L0 }, /* lzcnt */
     { { 0xf6, 0x00 }, 3, T, R, pfx_no, WIG, L0, SCC }, /* ctest<scc> */
     { { 0xf6, 0x10 }, 2, T, W, pfx_no, WIG, L0, ND }, /* not */
     { { 0xf6, 0x18 }, 2, T, W, pfx_no, WIG, L0, ND }, /* neg */
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -2516,6 +2516,26 @@ int main(int argc, char **argv)
              (regs.eip != (unsigned long)&instr[5]) )
             goto fail;
         printf("okay\n");
+
+        if ( true /* cpu_has_apx_nci_ndd_nf */ )
+        {
+            cpu_policy.apx.apx_nci_ndd_nf = true;
+
+            printf("%-40s", "Testing {nf}popcnt (%rdx),%rcx...");
+            instr[0] = 0x62; instr[1] = 0xf4; instr[2] = 0xfc; instr[3] = 0x0c;
+            instr[4] = 0x88; instr[5] = 0x0a;
+            res[1]      = 0x23456789;
+            regs.eflags = EFLAGS_MASK;
+            regs.rip    = (unsigned long)&instr[0];
+            rc = x86_emulate(&ctxt, &emulops);
+            if ( (rc != X86EMUL_OKAY) || regs.rcx != 34 ||
+                 (regs.eflags != EFLAGS_MASK) ||
+                 (regs.rip != (unsigned long)&instr[6]) )
+                goto fail;
+            printf("okay\n");
+
+            cpu_policy.apx.apx_nci_ndd_nf = nci_ndd_nf;
+        }
 #endif
     }
     else
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -234,6 +234,7 @@ void wrpkru(unsigned int val);
 #define cpu_has_xgetbv1             (cpu_has_xsave && cpu_policy.xstate.xgetbv1)
 
 #define cpu_has_3dnow_ext            cpu_policy.extd._3dnowext
+#define cpu_has_lzcnt                cpu_policy.extd.abm
 #define cpu_has_sse4a                cpu_policy.extd.sse4a
 #define cpu_has_xop                 (cpu_policy.extd.xop  && xcr0_mask(6))
 #define cpu_has_fma4                (cpu_policy.extd.fma4 && xcr0_mask(6))
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -730,6 +730,10 @@ static const struct map4_table {
         [vex_np] = { },
         [vex_66] = { },
     },
+    [0x88] = { /* POPCNT ({,d,q}word) */
+        [vex_np] = { .nf = true, .nci_ndd_nf = true },
+        [vex_66] = { .nf = true, .nci_ndd_nf = true },
+    },
     [0x8f] = { /* Grp1a */
         [vex_np] = { .nd = true },
     },
@@ -792,6 +796,10 @@ static const struct map4_table {
         [vex_np] = { .nf = true, .nci_ndd_nf = true },
         [vex_66] = { .nf = true, .nci_ndd_nf = true },
     },
+    [0xf5] = { /* LZCNT ({,d,q}word) */
+        [vex_np] = { .nf = true, .nci_ndd_nf = true },
+        [vex_66] = { .nf = true, .nci_ndd_nf = true },
+    },
     [0xf6] = { /* Grp3 (byte); most attributes depend on modrm_reg */
         [vex_np] = { .byte = true, .nci_ndd_nf = true },
     },
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -5668,7 +5668,9 @@ x86_emulate(
         dst.val = (uint16_t)src.val;
         break;
 
-    case X86EMUL_OPC_F3(0x0f, 0xb8): /* popcnt r/m,r */
+    case X86EMUL_OPC_F3  (0x0f, 0xb8): /* popcnt r/m,r */
+    case X86EMUL_OPC_EVEX   (4, 0x88): /* popcnt r/m,reg */
+    case X86EMUL_OPC_EVEX_66(4, 0x88): /* popcnt r/m,r16 */
         vcpu_must_have(popcnt);
         asm ( "popcnt %1,%0" : "=r" (dst.val) : "rm" (src.val) );
         _regs.eflags &= ~EFLAGS_MASK;
@@ -5709,8 +5711,12 @@ x86_emulate(
         }
         break;
 
+    case X86EMUL_OPC_EVEX   (4, 0xf5): /* lzcnt r/m,reg */
+    case X86EMUL_OPC_EVEX_66(4, 0xf5): /* lzcnt r/m,r16 */
+        vcpu_must_have(lzcnt);
+        fallthrough;
     case X86EMUL_OPC(0x0f, 0xbd): /* bsr or lzcnt */
-        if ( vex.pfx == vex_f3 )
+        if ( vex.pfx == vex_f3 || state->promoted_evex )
             emulate_2op_SrcV_srcmem("lzcnt", src, dst, _regs.eflags);
         else
         {
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -159,7 +159,7 @@ XEN_CPUFEATURE(CMP_LEGACY,    3*32+ 1) /
 XEN_CPUFEATURE(SVM,           3*32+ 2) /*h  Secure virtual machine */
 XEN_CPUFEATURE(EXTAPIC,       3*32+ 3) /*   Extended APIC space */
 XEN_CPUFEATURE(CR8_LEGACY,    3*32+ 4) /*S  CR8 in 32-bit mode */
-XEN_CPUFEATURE(ABM,           3*32+ 5) /*A  Advanced bit manipulation */
+XEN_CPUFEATURE(ABM,           3*32+ 5) /*A  LZCNT insn (Advanced Bit Manipulation) */
 XEN_CPUFEATURE(SSE4A,         3*32+ 6) /*A  SSE-4A */
 XEN_CPUFEATURE(MISALIGNSSE,   3*32+ 7) /*A  Misaligned SSE mode */
 XEN_CPUFEATURE(3DNOWPREFETCH, 3*32+ 8) /*A  3DNow prefetch instructions */


