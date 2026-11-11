Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0146606A324
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WhdbEABR
Received: from list by lists.xenproject.org with outflank-mailman.1483839.1687199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9I8-0006Jz-Dk; Wed, 11 Nov 2026 14:27:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483839.1687199; Wed, 11 Nov 2026 14:27:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9I8-0006Js-BB; Wed, 11 Nov 2026 14:27:12 +0000
Received: by outflank-mailman (input) for mailman id 1483839;
 Wed, 11 Nov 2026 14:27:10 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9I6-0006JY-DI
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:27:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9I5-00EsUb-QC
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:27:09 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47b39-bab6-0a2a0a5309dd-0a2a450c8f18-10
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:27:09 +0100
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47b3d-f479-0a2a450c0019-d155dd29d058-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:27:09 +0100
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48e20ed3b9dso2868649f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:27:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498366c2793sm11201936f8f.45.2026.11.11.06.27.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 06:27:05 -0800 (PST)
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
        d=suse.com; s=google; t=1794407229; x=1795012029; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Pe+0A+FhNIDCq8SGAScipW+EYMNOnI3nT5gC7uYGBT0=;
        b=WhdbEABRNQCtzzuYAcwnAlSIQQYUUcyKI9nMy8Z35G+hnGJDYh5XowMs6mSlX0sCCM
         OE3kILd60Y2kHb+Vo/7Z78ZuUvJIqIaAjue46M4izfXOQBC7k1b71BedQjY/1KH5Utjx
         x1503HivyAJKP8Dl24uvKo2rZ/bXimOshodspXy6u9Axxqh+j0SmhEMSvBepHby6hN+H
         pwRRZGtNj/Bwalom2R8AWO69upgi728p6ygtfgQNnyxKrsWgP7DWmTsfP/vWu/UMSzkG
         RWAr83ZLoyKyqi8WMDKgftkmlJQMfIkfPCewfKDAJN8K8ZNWb/7o0w3brC244KzBgOs7
         VuHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407229; x=1795012029;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Pe+0A+FhNIDCq8SGAScipW+EYMNOnI3nT5gC7uYGBT0=;
        b=Xan05h6P9+7kT0f1Vo7so9cW6nT6jSqGSCD3vjG7CVcaew6TlQjkPtlTXcM/392q8N
         b7Uv5NLIKgPRf4q/ER+MkfvqtV/7vcXT49CWwDwwmLpfNEexh+5zMkEdXBxBzcSyWOeF
         qFxw1BAJ+YvVM2gSBiHUjBLZNiP08CbL3b/wd/7FfKHudvqVf980H9eJVKorS+aHkQfs
         5C9h5XcggNMj+a5TG3TwjMc4jo4AdOxsOTjDZE7uakNmVO6RoFuNEG0fGXY9rvQTbr/a
         pYNs3oZkM4N4FFma7N7BfJuIm2ylSI5WTA3g17cLql4wgLlP2f7La19I2RMVwXrwuNHu
         osMg==
X-Gm-Message-State: APuU4Z8FgjfSqQ88gxISDeYlF9hoJc9uL7WGw7shvpsOlzcRkhC75t6J
	fQZY1Cr/n+lp2FktcnO6FIUTt8bILyyiuFvanR80HJ1nH1V1L8f6kWvI6BI/naHR+twnJPzTPif
	DeYeO3w==
X-Gm-Gg: AYBFou1CTSydCl64UY1xfDrWhM0lL40aa6p51qyQHw5o6iVs9aSdOVNMEZLcOwG2vTR
	72tG9JSJxWiIw4WENJWTxjZ5kpD/+f72b6E5QaqCLR8MEV2CHHoAX2DPyNJb1v7Fq8ou1zyqHQp
	9j5RY9ZLkBQy2saWFVisKmw67EAQy487z3fFmmY8E1iqDGl9dk/J/a4b16X5Zy2XAbpWNcKoO7z
	oiehw+z+ablX3jgoXnp2ab5gdjOr1pGnIo8mYS3BqLpLIon4o19pm+3FWUkPuUD40X4sbEXVybL
	kLxlZnDQ5Ei176j6MhsbKgqKr0/ltykMWrPkamyrpv/J4TGfeGEnzlDE7qtPYV9Hv2Eh919eily
	3cpuyUUMB4nLpkx/IqcVkWmavNaaRa1057IFnUzLlI9I1UY+BNcYRNSDd4WVfVbYrc05KV1Czyu
	/Axh++4QkoowWZKZhSpF0uN23fSqYapUkkjjB68Az4HEosQrDzI2Ir3NTY9tASt1+rJno2z6sOF
	bO8fke+kw/temjuRN7UxZ646FSP5OHrGVNNagbrXRE7Y1nJ8opOJB6h7SMExEVmFa42BZI/bOa8
	6uwXyLJbedfPixeLWk46wHVxdlwyhp1rt3poVPNUK8aCrtL1/6SrYe+LEOrJ3bgOoGNOFOFAs03
	9gZ90gfqn702zcSdThw==
X-Received: by 2002:a05:6000:250b:b0:48d:f99d:a0d3 with SMTP id ffacd0b85a97d-499c7b1bb2amr4216396f8f.46.1794407228705;
        Wed, 11 Nov 2026 06:27:08 -0800 (PST)
Message-ID: <d7e003a7-98b0-438a-b9ae-b176c997cf55@suse.com>
Date: Wed, 11 Nov 2026 15:27:04 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 16/30] x86emul: support remaining basic APX EVEX-Map4 insns
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
X-purgate-ID: tlsNG-d25034/1794407229-50F3BA5B-CB406B44/10/78276251493
X-purgate-type: spam
X-purgate-size: 30598
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

That is all which neither have a dependency on another CPUID bit nor
use the SCC sub-form of EVEX. I.e. remaining IMUL forms, CRC32, SETcc,
{,CF}CMOVcc, PUSH2, and POP2.

Note that the ZU forms of IMUL and SETcc are handled by re-using the
common EVEX.nd handling, via use of the (otherwise unused) EVEX.V[0-4]
bits.

To cover in particular PUSH2/POP2, build yet another blowfish flavor.
For PUSH2/POP2 to actually be usable the entry stub needs to adjust the
stack by one slot.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
An alternative to the HAVE_AS_SSE4_2 hackery would of course be to
determine the compiler capability in the test harness'es makefile,
and to define the symbol there accordingly.

--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -40,7 +40,7 @@ else
 
 blowfish-cflags := ""
 blowfish-cflags-x86_32 := "-mno-accumulate-outgoing-args -Dstatic="
-blowfish-cflags-x86_64 := "-DREX2 -Dstatic="
+blowfish-cflags-x86_64 := "-DREX2 -Dstatic=" "-mapxf -Dstatic="
 
 3dnow-vecs := 8
 3dnow-ints :=
--- a/tools/tests/x86_emulator/blowfish.c
+++ b/tools/tests/x86_emulator/blowfish.c
@@ -29,7 +29,9 @@ asm (
     "addl $8,%esp; "
 #else
     "shlq $32,%rdx; movl %eax,%edi; orq %rdx,%rdi; "
+    "push %rcx; " /* Maintain ABI-conforming stack. */
     "call blowfish_test; "
+    "pop %rcx; "
     "movq %rax,%rdx; movl %eax,%eax; shrq $32,%rdx; "
 #endif
     "ret"
--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -896,6 +896,9 @@ static const struct test apx_f[] = {
     INSN(andw,      66, map4, 23,    el,    w, no),
     INSNX(andw,     66, map4, 81, 4, el,    w, no),
     INSNX(andw,     66, map4, 83, 4, el,    w, no),
+    INSN(crc32,       , map4, f1,    el,   dq, no),
+    INSN(crc32b,      , map4, f0,    el,    b, no),
+    INSN(crc32w,    66, map4, f1,    el,    w, no),
     INSNX(dec,        , map4, ff, 1, el,   dq, no),
     INSNX(decb,       , map4, fe, 1, el,    b, no),
     INSNX(decw,     66, map4, ff, 1, el,    w, no),
@@ -905,8 +908,14 @@ static const struct test apx_f[] = {
     INSNX(idiv,       , map4, f7, 7, el,   dq, no),
     INSNX(idivb,      , map4, f6, 7, el,    b, no),
     INSNX(idivw,    66, map4, f7, 7, el,    w, no),
+    INSN(imul,        , map4, 69,    el,   dq, no),
+    INSN(imul,        , map4, 6b,    el,   dq, no),
+    INSN(imul,        , map4, af,    el,   dq, no),
     INSNX(imul,       , map4, f7, 5, el,   dq, no),
     INSNX(imulb,      , map4, f6, 5, el,    b, no),
+    INSN(imulw,     66, map4, 69,    el,    w, no),
+    INSN(imulw,     66, map4, 6b,    el,    w, no),
+    INSN(imulw,     66, map4, af,    el,    w, no),
     INSNX(imulw,    66, map4, f7, 5, el,    w, no),
     INSNX(inc,        , map4, ff, 0, el,   dq, no),
     INSNX(incb,       , map4, fe, 0, el,    b, no),
@@ -931,6 +940,8 @@ static const struct test apx_f[] = {
     INSN(orw,       66, map4, 0b,    el,    w, no),
     INSNX(orw,      66, map4, 81, 1, el,    w, no),
     INSNX(orw,      66, map4, 83, 1, el,    w, no),
+//        pop2,       , map4, 8f, 0,        o
+//        push2,      , map4, ff, 6,        o
     INSNX(rcl,        , map4, c1, 2, el,   dq, no),
     INSNX(rcl,        , map4, d1, 2, el,   dq, no),
     INSNX(rcl,        , map4, d3, 2, el,   dq, no),
@@ -1046,6 +1057,30 @@ static const struct test apx_f[] = {
     INSNX(xorw,     66, map4, 83, 6, el,    w, no),
 };
 
+/*
+ * Of the three features covered by APX-NCI-NDD-NF, the latter two only cover
+ * specific insn forms. Treat NCI as a separate feature for the purpose here.
+ */
+#define CONDS() \
+    COND( a,  7), COND( c,  2), COND( g, 15), COND( l, 12), \
+    COND(na,  6), COND(nc,  3), COND(ng, 14), COND(nl, 13), \
+    COND(no,  1), COND(np, 11), COND(ns,  9), COND(nz,  5), \
+    COND( o,  0), COND( p, 10), COND( s,  8), COND( z,  4)
+
+static const struct test apx_nci[] = {
+#define COND(c, n) \
+    INSN(cfcmov##c,   , map4, 40 | (n), el, dq, no), \
+    INSN(cfcmov##c, 66, map4, 40 | (n), el,  w, no)
+    CONDS(),
+#undef COND
+#define COND(c, n) \
+    INSN(set##c,    f2, map4, 40 | (n), el, b, no)
+    CONDS(),
+#undef COND
+};
+
+#undef CONDS
+
 static const unsigned char vl_all[] = { VL_512, VL_128, VL_256 };
 static const unsigned char vl_128[] = { VL_128 };
 static const unsigned char vl_no128[] = { VL_512, VL_256 };
@@ -1075,6 +1110,8 @@ static const uint16_t imm0f[16] = {
 static const uint8_t immM4[256] = {
     [0x24] = 1,
     [0x2c] = 1,
+    [0x69] = 4,
+    [0x6b] = 1,
     [0xc0] = 1,
     [0xc1] = 1,
     [0x80] = 1,
@@ -1265,6 +1302,7 @@ static void test_one(const struct test *
      * without extra conditionals.
      */
     instr[0] = 0x62;
+ again:
     instr[1] = evex.raw[0];
     instr[2] = evex.raw[1];
     instr[3] = evex.raw[2];
@@ -1284,8 +1322,28 @@ static void test_one(const struct test *
     }
     else
     {
+        static const uint16_t eflags[16] = {
+            [0x0 /*  o */] = X86_EFLAGS_OF,
+            [0x2 /*  c */] = X86_EFLAGS_CF,
+            [0x4 /*  z */] = X86_EFLAGS_ZF,
+            [0x6 /* na */] = X86_EFLAGS_CF,
+            [0x8 /*  s */] = X86_EFLAGS_SF,
+            [0xa /*  p */] = X86_EFLAGS_PF,
+            [0xc /*  l */] = X86_EFLAGS_SF,
+            [0xe /* ng */] = X86_EFLAGS_ZF,
+        };
+
         switch ( test->opc )
         {
+        case 0x40 ... 0x4f:
+            /*
+             * CFCMOVcc needs specific EFLAGS values for memory accesses to
+             * actually occur.
+             */
+            ctxt->regs->eflags = eflags[test->opc & 0xf] |
+                                 X86_EFLAGS_MBS | X86_EFLAGS_IF;
+            break;
+
         case 0xf6:
             /*
              * For APX 8-bit DIV/IDIV %ah needs to be less than what read()
@@ -1326,7 +1384,21 @@ static void test_one(const struct test *
 
     /* Also check the broadcast case, if available. */
     if ( test->vsz >= VSZ_el || test->scale != SC_vl )
-        return;
+    {
+        /*
+         * {CF,}CMOVcc really wants testing in all four flavors, controlled
+         * by EVEX.nd (aliasing EVEX.b, i.e. evex.bcst) and EVEX.nf (aliasing
+         * the top bit of EVEX.aaa, i.e. evex.opmsk).
+         */
+        if ( test->spc != SPC_map4 || (test->opc | 0xf) != 0x4f ||
+             test->pfx > PFX_66 || (evex.bcst && evex.opmsk) )
+            return;
+
+        evex.bcst = !evex.bcst;
+        if ( !evex.bcst )
+            evex.opmsk ^= 4;
+        goto again;
+    }
 
     switch ( test->esz )
     {
@@ -1558,6 +1630,11 @@ void evex_disp8_test(void *instr, struct
                    vl_128, ARRAY_SIZE(vl_128), instr, ctxt);
         printf("okay\n");
 
+        printf("%-40s", "Testing APX-NCI-NDD-NF disp8 handling...");
+        test_group(apx_nci, ARRAY_SIZE(apx_nci),
+                   vl_128, ARRAY_SIZE(vl_128), instr, ctxt);
+        printf("okay\n");
+
         cpu_policy.apx.apx_nci_ndd_nf = nci_ndd_nf;
         ctxt->force_writeback = wb;
     }
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -873,7 +873,6 @@ static const struct {
     { { 0xf8 }, { 2, 2 }, F, W, pfx_f2 }, /* enqcmd */
     { { 0xf9 }, { 2, 2 }, F, W }, /* movdiri */
 };
-#undef CND
 #undef REG
 
 static const struct {
@@ -2177,6 +2176,14 @@ static const struct evex {
     { { 0x32 }, 2, T, R, pfx_no, WIG, L0, ND }, /* xor */
     { { 0x33 }, 2, T, R, pfx_no, Wn, L0, ND }, /* xor */
     { { 0x33 }, 2, T, R, pfx_66, Wn, L0, ND }, /* xor */
+    CND(0x40,   2, T, R, pfx_no, Wn, L0, ND ), /* {,cf}cmov<cc> */ \
+    CND(0x40,   2, T, R, pfx_66, Wn, L0, ND ), /* {,cf}cmov<cc> */ \
+    CND(0x40,   2, T, W, pfx_f2, WIG, L0 ), /* set<cc> */
+    { { 0x69 }, 6, T, R, pfx_no, Wn, L0 }, /* imul */
+    { { 0x69 }, 4, T, R, pfx_66, W0, L0 }, /* imul */
+    { { 0x69 }, 6, T, R, pfx_66, W1, L0 }, /* imul */
+    { { 0x6b }, 3, T, R, pfx_no, Wn, L0 }, /* imul */
+    { { 0x6b }, 3, T, R, pfx_66, Wn, L0 }, /* imul */
     { { 0x80, 0x00 }, 3, T, W, pfx_no, WIG, L0, ND }, /* add */
     { { 0x80, 0x08 }, 3, T, W, pfx_no, WIG, L0, ND }, /* or */
     { { 0x80, 0x10 }, 3, T, W, pfx_no, WIG, L0, ND }, /* adc */
@@ -2219,10 +2226,13 @@ static const struct evex {
     { { 0x83, 0x28 }, 3, T, W, pfx_66, Wn, L0, ND }, /* sub */
     { { 0x83, 0x30 }, 3, T, W, pfx_no, Wn, L0, ND }, /* xor */
     { { 0x83, 0x30 }, 3, T, W, pfx_66, Wn, L0, ND }, /* xor */
+    { { 0x8f, 0xc0 }, 2, F, R, pfx_no, Wn, L0, ND }, /* pop2 */
     { { 0xa5 }, 2, T, W, pfx_no, Wn, L0, ND }, /* shld */
     { { 0xa5 }, 2, T, W, pfx_66, Wn, L0, ND }, /* shld */
     { { 0xad }, 2, T, W, pfx_no, Wn, L0, ND }, /* shrd */
     { { 0xad }, 2, T, W, pfx_66, Wn, L0, ND }, /* shrd */
+    { { 0xaf }, 2, T, R, pfx_no, Wn, L0, ND }, /* imul */
+    { { 0xaf }, 2, T, R, pfx_66, Wn, L0, ND }, /* imul */
     { { 0xc0, 0x00 }, 3, T, W, pfx_no, WIG, L0, ND }, /* rol */
     { { 0xc0, 0x08 }, 3, T, W, pfx_no, WIG, L0, ND }, /* ror */
     { { 0xc0, 0x10 }, 3, T, W, pfx_no, WIG, L0, ND }, /* rcl */
@@ -2295,6 +2305,9 @@ static const struct evex {
     { { 0xd3, 0x30 }, 2, T, W, pfx_66, Wn, L0, ND }, /* sal */
     { { 0xd3, 0x38 }, 2, T, W, pfx_no, Wn, L0, ND }, /* sar */
     { { 0xd3, 0x38 }, 2, T, W, pfx_66, Wn, L0, ND }, /* sar */
+    { { 0xf0 }, 2, T, R, pfx_no, Wn, L0 }, /* crc32 */
+    { { 0xf1 }, 2, T, R, pfx_no, Wn, L0 }, /* crc32 */
+    { { 0xf1 }, 2, T, R, pfx_66, Wn, L0 }, /* crc32 */
     { { 0xf6, 0x10 }, 2, T, W, pfx_no, WIG, L0, ND }, /* not */
     { { 0xf6, 0x18 }, 2, T, W, pfx_no, WIG, L0, ND }, /* neg */
     { { 0xf6, 0x20 }, 2, T, R, pfx_no, WIG, L0 }, /* mul */
@@ -2319,6 +2332,7 @@ static const struct evex {
     { { 0xff, 0x00 }, 2, T, W, pfx_66, Wn, L0, ND }, /* inc */
     { { 0xff, 0x08 }, 2, T, W, pfx_no, Wn, L0, ND }, /* dec */
     { { 0xff, 0x08 }, 2, T, W, pfx_66, Wn, L0, ND }, /* dec */
+    { { 0xff, 0xf0 }, 2, F, W, pfx_no, Wn, L0, ND }, /* push2 */
 #undef ND
 #endif /* __x86_64__ */
 }, evex_map5[] = {
@@ -2490,6 +2504,8 @@ static const struct evex {
     { { 0xd7 }, 2, T, R, pfx_f2, W0, LIG }, /* vfcmulcsh */
 };
 
+#undef CND
+
 static const struct {
     const struct evex *tbl;
     unsigned int num;
@@ -2889,7 +2905,26 @@ void predicates_test(void *instr, struct
 
                         do_test(instr, evex[x].tbl[t].len + ((void *)ptr - instr),
                                 evex[x].tbl[t].modrm ? (void *)ptr - instr + 1 : 0,
-                                mem_read, ctxt, fetch);
+                                evex[x].tbl[t].modrm ? mem_read : evex[x].tbl[t].mem,
+                                ctxt, fetch);
+
+                        /* Also test 3-operand and store form of CFCMOVcc. */
+                        if ( (evex[x].tbl[t].opc[0] | 0xf) == 0x4f )
+                        {
+                            ptr[-1] |= 0x04; /* Set EVEX.nf. */
+                            memcpy(ptr, evex[x].tbl[t].opc, evex[x].tbl[t].len);
+                            do_test(instr,
+                                    evex[x].tbl[t].len + ((void *)ptr - instr),
+                                    (void *)ptr - instr + 1, mem_read, ctxt,
+                                    fetch);
+
+                            ptr[-1] &= ~0x10; /* Clear EVEX.nd. */
+                            memcpy(ptr, evex[x].tbl[t].opc, evex[x].tbl[t].len);
+                            do_test(instr,
+                                    evex[x].tbl[t].len + ((void *)ptr - instr),
+                                    (void *)ptr - instr + 1, mem_write, ctxt,
+                                    fetch);
+                        }
                     }
                 }
             }
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -129,6 +129,11 @@ static bool check_apx_f(void)
 {
     return cpu_has_apx_f;
 }
+
+static bool check_apx_nci_ndd_nf(void)
+{
+    return cpu_has_apx_nci_ndd_nf;
+}
 #endif /* __x86_64__ */
 
 static bool simd_check__3dnow(void)
@@ -384,6 +389,13 @@ static const struct {
       .check_cpu = check_apx_f,
       .set_regs = blowfish_rex2_set_regs,
       .check_regs = blowfish_rex2_check_regs },
+    { .code = blowfish_x86_64_mapxf,
+      .size = sizeof(blowfish_x86_64_mapxf),
+      .bitness = 64,
+      .name = "blowfish (APX)",
+      .check_cpu = check_apx_nci_ndd_nf,
+      .set_regs = blowfish_set_regs,
+      .check_regs = blowfish_check_regs },
 #endif
     BLOWFISH(32, blowfish, ),
     BLOWFISH(32, blowfish (push), _mno_accumulate_outgoing_args),
@@ -1566,6 +1578,102 @@ int main(int argc, char **argv)
             goto fail;
         printf("okay\n");
 
+        printf("%-40s", "Testing {nf}imul $3,-4(%rdx),%ecx...");
+        instr[4] = 0x6b; instr[5] = 0x4a; instr[7] = 0x03;
+        regs.rip    = (unsigned long)&instr[0];
+        regs.ecx    = 0x12345678;
+        *res        = 0x89abcdef;
+        regs.rdx    = (unsigned long)(res + 1);
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.rcx != 0x89abcdefU * 3) ||
+             (regs.eflags != EFLAGS_ALWAYS_SET) ||
+             (regs.rip != (unsigned long)&instr[8]) )
+            goto fail;
+        printf("okay\n");
+
+        printf("%-40s", "Testing cmovz %cx,%dx,%ax...");
+        instr[2] = 0x7d; instr[3] = 0x18;
+        instr[4] = 0x44; instr[5] = 0xd1;
+        regs.rip    = (unsigned long)&instr[0];
+        regs.rax    = 0x1111111122222222;
+        regs.rcx    = 0x3333333344444444;
+        regs.rdx    = 0x5555555566666666;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.rax != 0x0000000000006666) ||
+             (regs.rcx != 0x3333333344444444) ||
+             (regs.rdx != 0x5555555566666666) ||
+             (regs.eflags != EFLAGS_ALWAYS_SET) ||
+             (regs.rip != (unsigned long)&instr[6]) )
+            goto fail;
+        printf("okay\n");
+
+        printf("%-40s", "Testing cfcmovz %ecx,4(%rax)...");
+        instr[2] = 0x7c; instr[3] = 0x0c;
+        instr[4] = 0x44; instr[5] = 0x48; instr[6] = 0x04;
+        regs.rax = (unsigned long)res;
+        for ( regs.eflags = EFLAGS_ALWAYS_SET | X86_EFLAGS_ZF; ; )
+        {
+            regs.rip = (unsigned long)&instr[0];
+            memset(res, 0x55, 16);
+            rc = x86_emulate(&ctxt, &emulops);
+            if ( (rc != X86EMUL_OKAY) ||
+                 (res[0] != 0x55555555) ||
+                 (res[1] != (regs.eflags & X86_EFLAGS_ZF ? 0x44444444
+                                                         : 0x55555555)) ||
+                 (res[2] != 0x55555555) ||
+                 (res[3] != 0x55555555) ||
+                 (regs.rip != (unsigned long)&instr[7]) )
+                goto fail;
+
+            if ( !(regs.eflags & X86_EFLAGS_ZF) )
+                break;
+            regs.rax ^= 1ULL << 63;
+            regs.eflags ^= X86_EFLAGS_ZF;
+        }
+        printf("okay\n");
+
+        printf("%-40s", "Testing cfcmovs 4(%rax),%ecx...");
+        instr[3] = 0x08; instr[4] = 0x48;
+        regs.rax = (unsigned long)res;
+        for ( regs.eflags = EFLAGS_ALWAYS_SET | X86_EFLAGS_SF; ; )
+        {
+            regs.rip = (unsigned long)&instr[0];
+            rc = x86_emulate(&ctxt, &emulops);
+            if ( (rc != X86EMUL_OKAY) ||
+                 (regs.rcx != (regs.eflags & X86_EFLAGS_SF ? 0x55555555 : 0)) ||
+                 (regs.rip != (unsigned long)&instr[7]) )
+                goto fail;
+
+            if ( !(regs.eflags & X86_EFLAGS_SF) )
+                break;
+            regs.rax ^= 1ULL << 63;
+            regs.eflags ^= X86_EFLAGS_SF;
+        }
+        printf("okay\n");
+
+        printf("%-40s", "Testing cfcmovp 4(%rax),%edx,%ecx...");
+        instr[2] = 0x74; instr[3] = 0x1c;
+        instr[4] = 0x4a; instr[5] = 0x50;
+        regs.rax = (unsigned long)res;
+        for ( regs.eflags = EFLAGS_ALWAYS_SET | X86_EFLAGS_PF; ; )
+        {
+            regs.rip = (unsigned long)&instr[0];
+            rc = x86_emulate(&ctxt, &emulops);
+            if ( (rc != X86EMUL_OKAY) ||
+                 (regs.rcx != (regs.eflags & X86_EFLAGS_PF ? 0x55555555
+                                                           : 0x66666666)) ||
+                 (regs.rip != (unsigned long)&instr[7]) )
+                goto fail;
+
+            if ( !(regs.eflags & X86_EFLAGS_PF) )
+                break;
+            regs.rax ^= 1ULL << 63;
+            regs.eflags ^= X86_EFLAGS_PF;
+        }
+        printf("okay\n");
+
         cpu_policy.apx.apx_nci_ndd_nf = nci_ndd_nf;
     }
 #endif
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -240,6 +240,9 @@ void wrpkru(unsigned int val);
 #define cpu_has_avx512_bmm          (cpu_policy.extd.avx512_bmm && \
                                      xcr0_mask(0xe6))
 
+#define cpu_has_apx_nci_ndd_nf      (cpu_policy.apx.apx_nci_ndd_nf && \
+                                     xcr0_mask(X86_XCR0_APX))
+
 int emul_test_cpuid(
     uint32_t leaf,
     uint32_t subleaf,
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -671,6 +671,24 @@ static const struct map4_table {
         [vex_np] = { .nd = true, .nf = true, .nci_ndd_nf = true },
         [vex_66] = { .nd = true, .nf = true, .nci_ndd_nf = true },
     },
+    [0x40 ... 0x4f] = { /* {,CF}CMOVcc, SETcc */
+        [vex_np] = { .nd = true, .nf = true, .nci_ndd_nf = true },
+        [vex_66] = { .nd = true, .nf = true, .nci_ndd_nf = true },
+        [vex_f2] = { .to_mem = true, .byte = true, .nd = true,
+                     .nci_ndd_nf = true },
+    },
+    [0x69] = { /* IMUL */
+        [vex_np] = { .immW = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+        [vex_66] = { .immW = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+    },
+    [0x6b] = { /* IMUL */
+        [vex_np] = { .imm8 = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+        [vex_66] = { .imm8 = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+    },
     [0x80] = { /* Grp1 (byte); .nf depends on modrm_reg */
         [vex_np] = { .to_mem = true, .byte = true, .imm8 = true, .nd = true,
                      .nci_ndd_nf = true },
@@ -687,6 +705,9 @@ static const struct map4_table {
         [vex_66] = { .to_mem = true, .imm8 = true, .nd = true,
                      .nci_ndd_nf = true },
     },
+    [0x8f] = { /* Grp1a */
+        [vex_np] = { .nd = true },
+    },
     [0xa5] = { /* SHLD */
         [vex_np] = { .to_mem = true, .nd = true, .nf = true,
                      .nci_ndd_nf = true },
@@ -699,6 +720,10 @@ static const struct map4_table {
         [vex_66] = { .to_mem = true, .nd = true, .nf = true,
                      .nci_ndd_nf = true },
     },
+    [0xaf] = { /* IMUL */
+        [vex_np] = { .nd = true, .nf = true, .nci_ndd_nf = true },
+        [vex_66] = { .nd = true, .nf = true, .nci_ndd_nf = true },
+    },
     [0xc0] = { /* Grp2 (byte, imm8); .nf depends on modrm_reg */
         [vex_np] = { .to_mem = true, .byte = true, .imm8 = true, .nd = true,
                      .nci_ndd_nf = true },
@@ -731,6 +756,13 @@ static const struct map4_table {
         [vex_np] = { .to_mem = true, .nd = true },
         [vex_66] = { .to_mem = true, .nd = true },
     },
+    [0xf0] = { /* CRC32 (byte) */
+        [vex_np] = { .byte = true },
+    },
+    [0xf1] = { /* CRC32 ({,d,q}word) */
+        [vex_np] = { },
+        [vex_66] = { },
+    },
     [0xf6] = { /* Grp3 (byte); most attributes depend on modrm_reg */
         [vex_np] = { .byte = true, .nci_ndd_nf = true },
     },
@@ -1265,6 +1297,22 @@ decode_map4(struct x86_emulate_state *s,
 
     switch ( ctxt->opcode & 0xff )
     {
+    case 0x40 ... 0x4f:
+        if ( s->evex.pfx <= vex_66 ) /* {,cf}cmov<cc> */
+        {
+            if ( !EVEX_ND(&s->evex) && EVEX_NF(&s->evex) )
+                /*
+                 * While the memory operand is only written if the condition
+                 * is true, help x86_insn_is_mem_write() by setting DstMem.
+                 */
+                s->desc = DstMem | SrcReg;
+            else if ( !EVEX_ND(&s->evex) || EVEX_NF(&s->evex) )
+                /* Memory operand is only read if the condition is true. */
+                s->desc = DstReg | SrcNone;
+        }
+        s->desc |= Mov;
+        break;
+
     case 0x80: case 0x81: case 0x83: /* Grp1 */
         if ( (s->modrm_reg & 7) == 7 ) /* ccmp */
         {
@@ -1283,6 +1331,15 @@ decode_map4(struct x86_emulate_state *s,
         nf = (s->modrm_reg & 6) != 2;
         break;
 
+    case 0x8f: /* Grp1a */
+        switch ( s->modrm_reg & 7 )
+        {
+        case 0: /* pop2 */
+            s->desc |= Mov;
+            break;
+        }
+        break;
+
     case 0xf6: case 0xf7: /* Grp3 */
         switch ( s->modrm_reg & 7 )
         {
@@ -1305,6 +1362,16 @@ decode_map4(struct x86_emulate_state *s,
             break;
         }
         break;
+
+    case 0xff: /* Grp5 */
+        switch ( s->modrm_reg & 7 )
+        {
+        case 6: /* push2 */
+            s->desc |= Mov;
+            nf = false;
+            break;
+        }
+        break;
     }
 
     generate_exception_if((scc || nci_ndd_nf) && !vcpu_has_apx_nci_ndd_nf(),
--- a/xen/arch/x86/x86_emulate/util.c
+++ b/xen/arch/x86/x86_emulate/util.c
@@ -156,13 +156,15 @@ bool cf_check x86_insn_is_mem_access(con
     case X86EMUL_OPC(0x0f, 0xf7):        /* MASKMOVQ */
     case X86EMUL_OPC_66(0x0f, 0xf7):     /* MASKMOVDQU */
     case X86EMUL_OPC_VEX_66(0x0f, 0xf7): /* VMASKMOVDQU */
+    case X86EMUL_OPC_EVEX(4, 0x8f):      /* POP2 */
         return true;
 
     case 0xff:
+    case X86EMUL_OPC_EVEX(4, 0xff):
         switch ( s->modrm_reg & 7 )
         {
         case 2: /* CALL (near, indirect) */
-        case 6: /* PUSH r/m */
+        case 6: /* PUSH r/m, PUSH2 */
             return true;
         }
         break;
@@ -196,6 +198,9 @@ bool cf_check x86_insn_is_mem_write(cons
     case DstMem:
         return (s->modrm_mod != 3 &&
                 (!s->promoted_evex || !EVEX_ND(&s->evex))) ||
+               /* PUSH2 is special. */
+               (ctxt->opcode == X86EMUL_OPC_EVEX(4, 0xff) &&
+                (s->modrm_reg & 7) == 6) ||
                /* This is to cover {,V}MASKMOV{Q,DQU}. */
                (s->desc & SrcMask) == SrcMem;
 
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1947,6 +1947,18 @@ x86_emulate(
         dst.mem.off = sp_pre_dec(dst.bytes);
         break;
 
+    case X86EMUL_OPC_EVEX   (4, 0x69): /* imul imm,r/m,reg */
+    case X86EMUL_OPC_EVEX_66(4, 0x69): /* imul{,zu} imm,r/m,r16 */
+    case X86EMUL_OPC_EVEX   (4, 0x6b): /* imul imm8,r/m,reg */
+    case X86EMUL_OPC_EVEX_66(4, 0x6b): /* imul{,zu} imm8,r/m,r16 */
+        generate_exception_if(evex.reg != 0xf || !evex.RX, X86_EXC_UD);
+        /*
+         * For IMULZU engage common EVEX.nd handling, requiring to put
+         * the destination register in EVEX.V[0-4].
+         */
+        evex.reg = ~modrm_reg;
+        evex.RX = evex.r4;
+        fallthrough;
     case 0x69: /* imul imm16/32 */
     case 0x6b: /* imul imm8 */
         if ( ea.type == OP_REG )
@@ -2992,9 +3004,29 @@ x86_emulate(
         _regs.eflags |= X86_EFLAGS_DF;
         break;
 
+    case X86EMUL_OPC_EVEX(4, 0xff): /* Grp5 */
+        if ( (modrm_reg & 7) == 6 ) /* push2 */
+        {
+            generate_exception_if((src.type != OP_REG || !EVEX_ND(&evex) ||
+                                   EVEX_NF(&evex)),
+                                  X86_EXC_UD);
+            n = (~evex.reg & 0xf) | (!evex.RX << 4);
+            generate_exception_if(modrm_rm == 4 || n == 4, X86_EXC_UD);
+            generate_exception_if(_regs.r(sp) & 0xf, X86_EXC_GP, 0);
+            fail_if(!ops->write);
+            if ( (rc = ops->write(x86_seg_ss, sp_pre_dec(8),
+                                  decode_evex_gpr(evex.reg | (evex.RX << 4),
+                                                  &_regs, &state->egpr, ctxt),
+                                  8, ctxt)) != X86EMUL_OKAY ||
+                 (rc = ops->write(x86_seg_ss, sp_pre_dec(8), &dst.val, 8,
+                                  ctxt)) != X86EMUL_OKAY )
+                goto done;
+            dst.type = OP_NONE;
+            break;
+        }
+        fallthrough;
     case 0xfe: /* Grp4 */
     case X86EMUL_OPC_EVEX   (4, 0xfe): /* inc/dec r/m{,r8} */
-    case X86EMUL_OPC_EVEX   (4, 0xff): /* inc/dec r/m{,reg} */
     case X86EMUL_OPC_EVEX_66(4, 0xff): /* inc/dec r/m{,r16} */
         generate_exception_if((modrm_reg & 7) >= 2, X86_EXC_UD);
         /* Fallthrough. */
@@ -4164,6 +4196,59 @@ x86_emulate(
         singlestep = _regs.eflags & X86_EFLAGS_TF;
         break;
 
+    case X86EMUL_OPC_EVEX   (4, 0x40) ...
+         X86EMUL_OPC_EVEX   (4, 0x4f): /* {,cf}cmovcc */
+    case X86EMUL_OPC_EVEX_66(4, 0x40) ...
+         X86EMUL_OPC_EVEX_66(4, 0x4f): /* {,cf}cmovcc */
+        if ( !EVEX_ND(&evex) )
+        {
+            if ( EVEX_NF(&evex) ) /* cfcmovcc reg,rm */
+            {
+                /*
+                 * Incoming:
+                 * - dst.val set from modrm_rm (if modrm_mod == 3),
+                 * - src.val set from modrm_reg.
+                 */
+                if ( test_cc(b, _regs.eflags) )
+                    dst.val = src.val;
+                else if ( dst.type == OP_REG )
+                    dst.val = 0;
+                else
+                    dst.type = OP_NONE;
+            }
+            else /* cfcmovcc rm,reg */
+            {
+                /* Incoming: dst.val set from modrm_reg. */
+                if ( !test_cc(b, _regs.eflags) )
+                    dst.val = 0;
+                else if ( ea.type != OP_MEM )
+                    dst.val = *decode_gpr(&_regs, &state->egpr, modrm_rm);
+                else if ( (rc = read_ulong(ea.mem.seg, ea.mem.off, &dst.val,
+                                           op_bytes, ctxt, ops)) != X86EMUL_OKAY )
+                    goto done;
+            }
+
+            /* Upper bits of the destination register are uniformly zeroed. */
+            if ( dst.bytes == 2 && dst.type == OP_REG )
+            {
+                dst.val = (uint16_t)dst.val;
+                dst.bytes = 4;
+            }
+            break;
+        }
+        if ( EVEX_NF(&evex) ) /* cfcmovcc rm,reg,reg */
+        {
+            /* Incoming: dst.val set from modrm_reg. */
+            if ( !test_cc(b, _regs.eflags) )
+                break;
+            if ( ea.type != OP_MEM )
+                dst.val = *decode_gpr(&_regs, &state->egpr, modrm_rm);
+            else if ( (rc = read_ulong(ea.mem.seg, ea.mem.off, &dst.val,
+                                       op_bytes, ctxt, ops)) != X86EMUL_OKAY )
+                goto done;
+            break;
+        }
+        fallthrough;
     case X86EMUL_OPC(0x0f, 0x40) ... X86EMUL_OPC(0x0f, 0x4f): /* cmovcc */
         vcpu_must_have(cmov);
         if ( test_cc(b, _regs.eflags) )
@@ -5144,6 +5229,21 @@ x86_emulate(
         adjust_bnd(state, ctxt, ops, vex.pfx);
         break;
 
+    case X86EMUL_OPC_EVEX_F2(4, 0x40) ...
+         X86EMUL_OPC_EVEX_F2(4, 0x4f): /* set{,zu}cc */
+        generate_exception_if(evex.reg != 0xf || !evex.RX, X86_EXC_UD);
+        if ( dst.type == OP_REG )
+        {
+            /*
+             * For SETZUcc engage common EVEX.nd handling, requiring to put
+             * the destination in EVEX.V[0-4].
+             */
+            evex.reg = ~modrm_rm;
+            evex.RX = !evex.b4;
+        }
+        else /* Clear EVEX.nd. */
+            evex.brs = 0;
+        fallthrough;
     case X86EMUL_OPC(0x0f, 0x90) ... X86EMUL_OPC(0x0f, 0x9f): /* setcc */
         dst.val = test_cc(b, _regs.eflags);
         break;
@@ -5400,6 +5500,8 @@ x86_emulate(
         goto dispatch_from_helper;
 
     case X86EMUL_OPC(0x0f, 0xaf): /* imul */
+    case X86EMUL_OPC_EVEX   (4, 0xaf): /* imul reg,r/m{,reg} */
+    case X86EMUL_OPC_EVEX_66(4, 0xaf): /* imul r16,r/m{,r16} */
         emulate_2op_SrcV_srcmem("imul", src, dst, _regs.eflags);
         break;
 
@@ -7164,6 +7266,10 @@ x86_emulate(
     case X86EMUL_OPC_F2(0x0f38, 0xf0): /* crc32 r/m8, r{32,64} */
     case X86EMUL_OPC_F2(0x0f38, 0xf1): /* crc32 r/m{16,32,64}, r{32,64} */
         vcpu_must_have(sse4_2);
+        fallthrough;
+    case X86EMUL_OPC_EVEX   (4, 0xf0): /* crc32 r/m8, r{32,64} */
+    case X86EMUL_OPC_EVEX   (4, 0xf1): /* crc32 r/m, r{32,64} */
+    case X86EMUL_OPC_EVEX_66(4, 0xf1): /* crc32 r/m16, r{32,64} */
         dst.bytes = rex_prefix & REX_W ? 8 : 4;
         switch ( op_bytes )
         {
@@ -8162,6 +8268,23 @@ x86_emulate(
             asm ( "rorl %b1,%k0" : "=g" (dst.val) : "c" (imm1), "0" (src.val) );
         break;
 
+    case X86EMUL_OPC_EVEX(4, 0x8f): /* POP2 */
+        generate_exception_if(((modrm_reg & 7) || src.type != OP_REG ||
+                               !EVEX_ND(&evex) || EVEX_NF(&evex)),
+                              X86_EXC_UD);
+        n = (~evex.reg & 0xf) | (!evex.RX << 4);
+        generate_exception_if(modrm_rm == 4 || n == 4 || modrm_rm == n,
+                              X86_EXC_UD);
+        generate_exception_if(_regs.r(sp) & 0xf, X86_EXC_GP, 0);
+        if ( (rc = read_ulong(x86_seg_ss, sp_post_inc(8),
+                              &dst.val, 8, ctxt, ops)) != X86EMUL_OKAY ||
+             (rc = read_ulong(x86_seg_ss, sp_post_inc(8),
+                              src.reg, 8, ctxt, ops)) != X86EMUL_OKAY )
+            goto done;
+        dst.type = OP_REG;
+        dst.bytes = 8;
+        break;
+
 #ifndef X86EMUL_NO_SIMD
 
     case X86EMUL_OPC_EVEX_F3(5, 0x10):   /* vmovsh m16,xmm{k} */


