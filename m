Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E62C606A321
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ICTlweYF
Received: from list by lists.xenproject.org with outflank-mailman.1483896.1687262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9Kh-0002Bq-Ln; Wed, 11 Nov 2026 14:29:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483896.1687262; Wed, 11 Nov 2026 14:29:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9Kh-0002Bg-Iw; Wed, 11 Nov 2026 14:29:51 +0000
Received: by outflank-mailman (input) for mailman id 1483896;
 Wed, 11 Nov 2026 14:29:50 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9Kg-00029v-5g
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:29:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9Kf-00GO4u-Iv
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:29:49 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47bda-e002-0a2a0a5209dd-0a2a4508a2b2-4
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:29:49 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47bdd-f659-0a2a45080019-d1558031a4f5-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:29:49 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a549cd7fd2so29243855e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:29:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba0951fe22sm67723915e9.3.2026.11.11.06.29.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 06:29:48 -0800 (PST)
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
        d=suse.com; s=google; t=1794407389; x=1795012189; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ueFmi+EjzroaXN2yr2ODBEKXEvgRyyTn9C0wdSbSsi0=;
        b=ICTlweYFgBqHeEP8miJKJEwOVzo1OjQ7J1KnWFedufjp9Js1DEsjZk+0a9ZePM4psP
         C8VAXxTxeVQMcizjxaITrM1D+dmpr4bUi9sLtYnlgJwCsvyqUmuS1zvurUaGWpft5KmX
         vVT9HzMLyEYWs0Hdn5IwAMR+dEBhVruAFhca6alGP9BjSllx9CZwxSLlk2L+f/adbtcb
         umwNAK+93vtO78Zqw2G2eXd2a1Y5gGlkALArdTb4+yvumpaeghieA8EVnT1W2lhZ8+gu
         8IYNTJ8HTchxyxPAY5Vy76xIu0+o13/10PteuD04Y9+PUqzg+j9clPKDoivqKjizsfRa
         t99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407389; x=1795012189;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ueFmi+EjzroaXN2yr2ODBEKXEvgRyyTn9C0wdSbSsi0=;
        b=Rv0FIa5EzThLMPCAeuKDdQhCwJPhfjV6cF8kdqmPuR75Q0WriGFO9wKpWhVHIN3fKx
         VAtyREOoXTcGcqbxjRzsbtq7eUebHVD9N3ce+ma4DrK0IbiKuKeo4A6EgJv0DMR3+6fx
         8EOJkiTO/yQ4JkB8og7HkTQojd5Ur2oUQNhUixPgCnkYilXAldI2f3R2yAfeTugfnJSp
         Q4kK6Ju6TY+FBCOxljToQzV9tupM8jTes651G9Il8OiKhPO7+zBID0zUkIgVZNGVHMqu
         RyE6oLnl8VE3oPIGfsqJzWXM5OTUgunXh0n1GQVPe6uenYamugK0T89vPCVMdshsmYhI
         QToQ==
X-Gm-Message-State: APuU4Z84LHeco9naFGw8BUcI64GodPn02jFv79p7ohIpuiyDxtP3vrEF
	8rbOQOROfmKpDLbC8lJ+q8dqriMKK7i4ZIT/4YrFlRITeNTMuobIiwRCC/OWCBbatKtquIIXn4e
	5wIPWeg==
X-Gm-Gg: AYBFou2hDineyM9MFMZTJzqz+IqAVYwH4ymf99EcVqYCQXDqFPNiu/sCkZDPoCBNWIc
	/YxOeMkRSLrT11JV9xUOwmrGq5XUVX0Rc2gaqKZa1FvxXrNXjeOMpj+6jPYm38/c+DkNnu+bzSK
	jeOhpzeaXc+Gbuukw+lAoVBTmjg+ApUTthHJe0ALVKbAF3NcJDicCL4Q0WqoN93dYMX4yfelIuK
	HX3vj1Es4vsBu7AiGHgh1MXvZVQAwEkY+b8dD4NnOiCH6r1qw6wO1IKGEeRy1jjXfUaWfYU7g6G
	PBOtm1bvFzSzL4sX+X1c69EymxpKW3tPPTCxx23OR4YLDkL0DTGZWjV+wyDMNwxVItvnkfrEjz2
	rkG45fAFxGiqN46FBog+sqedDeQuRQPEm+HHMEuywVN/hdG269guOtnvoIe5EpXLUvIgG4KWpu4
	EIubh3PdhAD9wkwxs44anC7keIDXOWJBelFoH3kqXAkY7ACy64SOdXb7Tzkvb0uxSzmh7d0m3SO
	Sv28KxzmTy4q43drcb5aeeQFAww2IhhiRAIJGuPM2g5PDNHMzcv3AB3rWuYLEiMhYBUtpys4/MT
	a3CYFU8wMNJvgwsY9aJDA3ptFwUp4q9ikTCN9RNE0bjJhQgTHys3yRGCwRjlgfLhq5pv0HIfkXY
	d/GWJ3GC5LyUsE095gg==
X-Received: by 2002:a05:600c:4594:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4ba0938142cmr47040135e9.17.1794407388937;
        Wed, 11 Nov 2026 06:29:48 -0800 (PST)
Message-ID: <3a2a93ac-b6bd-447e-a6fa-e547c420df55@suse.com>
Date: Wed, 11 Nov 2026 15:29:48 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 23/30] x86emul: support APX+CMPccXADD insns
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
X-purgate-ID: tlsNG-c1860d/1794407389-CD74B87B-13D14839/10/78276251493
X-purgate-type: spam
X-purgate-size: 6134
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This group of promoted-from-VEX insns is again handled by transforming
to the VEX counterparts.

In the test harness'es predicates tables also replace the original (VEX)
entries to use the available CND().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -1096,6 +1096,13 @@ static const struct test apx_nci[] = {
 #undef COND
 };
 
+static const struct test cmpccxadd[] = {
+#define COND(c, n) \
+    INSN(cmp##c##xadd, 66, 0f38, e0 | (n), el, dq, no)
+    CONDS(),
+#undef COND
+};
+
 #undef CONDS
 
 static const struct test adx[] = {
@@ -1737,6 +1744,7 @@ void evex_disp8_test(void *instr, struct
         RUN(avx512bw);
         RUN(bmi1);
         RUN(bmi2);
+        RUN(cmpccxadd);
 
 #undef RUN
 
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1422,22 +1422,7 @@ static const struct vex {
     { { 0xdd }, 2, T, R, pfx_66, WIG, Ln }, /* vaesenclast */
     { { 0xde }, 2, T, R, pfx_66, WIG, Ln }, /* vaesdec */
     { { 0xdf }, 2, T, R, pfx_66, WIG, Ln }, /* vaesdeclast */
-    { { 0xe0 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpoxadd */
-    { { 0xe1 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpnoxadd */
-    { { 0xe2 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpbxadd */
-    { { 0xe3 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpnbxadd */
-    { { 0xe4 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpexadd */
-    { { 0xe5 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpnexadd */
-    { { 0xe6 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpbexadd */
-    { { 0xe7 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpaxadd */
-    { { 0xe8 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpsxadd */
-    { { 0xe9 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpnsxadd */
-    { { 0xea }, 2, F, W, pfx_66, Wn, L0 }, /* cmppxadd */
-    { { 0xeb }, 2, F, W, pfx_66, Wn, L0 }, /* cmpnpxadd */
-    { { 0xec }, 2, F, W, pfx_66, Wn, L0 }, /* cmplxadd */
-    { { 0xed }, 2, F, W, pfx_66, Wn, L0 }, /* cmpgexadd */
-    { { 0xee }, 2, F, W, pfx_66, Wn, L0 }, /* cmplexadd */
-    { { 0xef }, 2, F, W, pfx_66, Wn, L0 }, /* cmpgxadd */
+    CND(0xe0,   2, F, W, pfx_66, Wn, L0 ), /* cmp<cc>xadd */
     { { 0xf2 }, 2, T, R, pfx_no, Wn, L0 }, /* andn */
     { { 0xf3, 0x08 }, 2, T, R, pfx_no, Wn, L0 }, /* blsr */
     { { 0xf3, 0x10 }, 2, T, R, pfx_no, Wn, L0 }, /* blsmsk */
@@ -2067,6 +2052,7 @@ static const struct evex {
     { { 0xde }, 2, T, R, pfx_66, WIG, Ln }, /* vaesdec */
     { { 0xdf }, 2, T, R, pfx_66, WIG, Ln }, /* vaesdeclast */
 #ifdef __x86_64__
+    CND(0xe0,   2, F, W, pfx_66, Wn, L0 ), /* cmp<cc>xadd */
     { { 0xf2 }, 2, T, R, pfx_no, Wn, L0 }, /* andn */
     { { 0xf3, 0x08 }, 2, T, R, pfx_no, Wn, L0 }, /* blsr */
     { { 0xf3, 0x10 }, 2, T, R, pfx_no, Wn, L0 }, /* blsmsk */
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -2293,6 +2293,41 @@ int main(int argc, char **argv)
              (res[2] + 1) )
             goto fail;
         printf("okay\n");
+
+        if ( cpu_has_apx_f )
+        {
+            printf("%-40s", "Testing cmpnpxadd %ebx,%r9d,-4(%r18)...");
+            instr[0] = 0x62; instr[1] = 0x7a; instr[2] = 0x65; instr[3] = 0x08;
+            instr[4] = 0xeb; instr[5] = 0x4a; instr[6] = 0xfc;
+            regs.rip = (unsigned long)&instr[0];
+            load_egpr(18, (unsigned long)(res + 2));
+            rc = x86_emulate(&ctxt, &emulops);
+            if ( (rc != X86EMUL_OKAY) ||
+                 (regs.rip != (unsigned long)&instr[7]) ||
+                 (regs.r9 != 0x13253749) ||
+                 (regs.rbx != 0x02030405) ||
+                 ((regs.eflags & EFLAGS_MASK) !=
+                  (EFLAGS_ALWAYS_SET | X86_EFLAGS_PF)) ||
+                 (res[0] + 1) ||
+                 (res[1] != 0x13253749) ||
+                 (res[2] + 1) )
+                goto fail;
+
+            regs.rip = (unsigned long)&instr[0];
+            regs.r9 <<= 8;
+            rc = x86_emulate(&ctxt, &emulops);
+            if ( (rc != X86EMUL_OKAY) ||
+                 (regs.rip != (unsigned long)&instr[7]) ||
+                 (regs.r9 != 0x13253749) ||
+                 (regs.rbx != 0x02030405) ||
+                 ((regs.eflags & EFLAGS_MASK) !=
+                  (EFLAGS_ALWAYS_SET | X86_EFLAGS(CF, SF))) ||
+                 (res[0] + 1) ||
+                 (res[1] != 0x15283b4e) ||
+                 (res[2] + 1) )
+                goto fail;
+            printf("okay\n");
+        }
     }
     else
         printf("skipped\n");
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1267,6 +1267,8 @@ decode_0f38(struct x86_emulate_state *s,
     case X86EMUL_OPC_VEX_F2(0, 0xf7): /* shrx */
         break;
 
+    case X86EMUL_OPC_EVEX_66(0, 0xe0) ...
+         X86EMUL_OPC_EVEX_66(0, 0xef): /* cmp<cc>xadd */
     case X86EMUL_OPC_EVEX(0, 0xf2):    /* andn */
     case X86EMUL_OPC_EVEX(0, 0xf3):    /* Grp 17 */
     case X86EMUL_OPC_EVEX(0, 0xf5):    /* bzhi */
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7323,6 +7323,10 @@ x86_emulate(
 
 #endif /* !X86EMUL_NO_SIMD */
 
+    case X86EMUL_OPC_EVEX_66(0x0f38, 0xe0) ...
+         X86EMUL_OPC_EVEX_66(0x0f38, 0xef): /* cmp<cc>xadd r,r,m */
+        generate_exception_if(evex.lr || evex.brs || evex.opmsk, X86_EXC_UD);
+        fallthrough;
     case X86EMUL_OPC_VEX_66(0x0f38, 0xe0) ...
          X86EMUL_OPC_VEX_66(0x0f38, 0xef): /* cmp<cc>xadd r,r,m */
         generate_exception_if(!mode_64bit() || dst.type != OP_MEM || vex.l,
@@ -9355,6 +9359,7 @@ x86_emulate(
 #undef rex_prefix
 #undef lock_prefix
 #undef vex
+#undef evex
 #undef ea
 
 int x86_emul_rmw(
@@ -9443,6 +9448,8 @@ int x86_emul_rmw(
         pvex->b = 1;
         pvex->r = 1;
         pvex->reg = 0xf; /* rAX */
+        if ( s->promoted_evex )
+            pvex->opcx &= 7; /* See copy_VEX(). */
         buf[3] = ctxt->opcode;
         buf[4] = 0x11; /* reg=rDX r/m=(%RCX) */
         place_ret(&buf[5]);


