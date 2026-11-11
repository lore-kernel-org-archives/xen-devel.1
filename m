Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD0A606A321
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AQ0D8CSH
Received: from list by lists.xenproject.org with outflank-mailman.1483884.1687253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9KI-0001Uh-CR; Wed, 11 Nov 2026 14:29:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483884.1687253; Wed, 11 Nov 2026 14:29:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9KI-0001Ua-9L; Wed, 11 Nov 2026 14:29:26 +0000
Received: by outflank-mailman (input) for mailman id 1483884;
 Wed, 11 Nov 2026 14:29:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9KH-0001SI-3k
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:29:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9KG-009ooK-9J
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:29:24 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47bc2-bab6-0a2a0a5309dd-0a2a4504bc14-8
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:29:24 +0100
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47bc4-b57f-0a2a45040019-d155802ad440-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:29:24 +0100
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4b467581b98so29796715e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:29:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4c544a1esm83685e9.11.2026.11.11.06.29.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 06:29:23 -0800 (PST)
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
        d=suse.com; s=google; t=1794407364; x=1795012164; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hyrry5iGfVnranQ4nsNgoEImLQDnDhL+FSGWAq3P4pU=;
        b=AQ0D8CSHTomEEQZvdiWoGlQhZgvZE2siY1mt3ph8mfu6cUQAIc+ntv748IX/9roFbN
         pHfIE6n6tOvscVEzpnTMpL9+L7sPBYo545zxZEMnXtrXhyrhtJIz2gYt4rwaWVefVfCn
         5cr+LLvJ7HWsNOcfdEgbWoEBFOgLXWxQg6/BC6WXwrpXYp0jedOJuVBTOaQIeQcqFefi
         YTTbzFaslYPvexuTs5/fO6H3TfaYgEEF/7Y1+FXytrwI8xEh/FUU8z3jo/SmUqu3YtSv
         8FsdXD2eE769ATKwZyqbhQwfE5rOu2GTAhYcPyRHqSzevOfuHXeqIBQ4GXTG5vD+tYyK
         ukUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407364; x=1795012164;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hyrry5iGfVnranQ4nsNgoEImLQDnDhL+FSGWAq3P4pU=;
        b=VLB2pgPEj+JRWMh7YllaBkhkTazjd500THquAI8wcXaV5XdbsnHcCi+prOcvIpaAkR
         XsKbQvpzjcqpOSimg6YFCLXUIXHOxEBmC5tJMFR03uUNOpK+3yZsxutBm0ALIgc4vvXa
         27zMbPvam0BrqAt4pCp3B+IgwfD+KYC1v1DeTjzmSFRsIoUhAk9yAUROkN2171x2f4f+
         +MOVy1Nk1w5xZnDJSaGYeV7urVFpUSrrXwNnkPOpsxnNfR0xBdUloWorXSpXFt0lDY1m
         dYevGVEI8uiWkIMWylatSXT4nddZNBv5UL/irdISWH7rCzdmO0pAobWaSQdYtPfzgUoo
         ceAA==
X-Gm-Message-State: APuU4Z/iXXa9KUDatuyQYNBEO1o4N8df2IBimaKVY1CNU2YXEFjGxYMU
	ef1xBpTfqOKCy1UXUCvLGaNqCE0LO36CNTzwx39HZo0KUzmckFFSenqhflDi6NCh2KtwBCVi0Gj
	YQccjqw==
X-Gm-Gg: AYBFou23ZmNJcVX3+6H63Xb9jaouNBkWHjOioJPsVh5j0d9FmQ6V0eyMglsjzUfScJa
	eViAJIR3U+TwhVwKvRYKhqAxuuBF9fckvliCsoDv8ImDCzEcctr3Jm6o2g26ROx/WUt/Fb3slSk
	QQsxPux7uZtE3eFXnAtAOpkS6K7TEpxqk3wLo11GM86EPEfPPs/05exsOM4aJ0zxu3pZqCQ6ZNC
	KF/6/aTvszE4YarVycd28qpV7WsfDzdylSWk82GD1pfDWvRBXpGL/aG5LlPR83IwUwHf1VhUmiE
	eN1ptRBhvmw0Wslz8M8IEuserB0sq+glg4R4cKcmeKUFTDiY1+dWnSzXq32coojJmwLPUCI6+K3
	pUaByjHfLjqb8EtwJ+MlHQqp25ggpN4YuDRHTdPViyld9E6wFsQKBXobtZ34XC77J5FAfNNmEfF
	ffU1lBiv/2cGsSoo4ZVbi8xggjg9mStiUNDbFLwYa6MR5FygNe83SjQC/Aczk3NAnVKAYD/wbHY
	nmGwwmprOmp2y3/HS9Z49TH6nKUrc6RitWUtvCCIvFx32KzFEzoL3WkOSTAcsONAdqVakTgfG5O
	3wfQh+CZsGwFYnycAp76OxC77bl7u+q26pn0TVdkhtG8HghrljH9OttqgccvmdwaCpmL3a/sL7G
	NH1P0BZzCGeQtMOnP
X-Received: by 2002:a05:600c:4e41:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4ba0939db52mr45622115e9.22.1794407363521;
        Wed, 11 Nov 2026 06:29:23 -0800 (PST)
Message-ID: <f89b0e54-70ba-4a06-9612-703f8ed7e7f3@suse.com>
Date: Wed, 11 Nov 2026 15:29:22 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 22/30] x86emul: support APX+BMI2 insns
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
X-purgate-ID: tlsNG-ebf023/1794407364-536C2B50-0633A65F/10/78276251493
X-purgate-type: spam
X-purgate-size: 13839
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These promoted-from-VEX insns are again handled by transforming them to
their VEX counterparts, re-using (where possible) logic already used for
BMI1. As before common EVEX.NF handling takes care of the EFLAGS aspect.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -1136,6 +1136,17 @@ static const struct test bmi1[] = {
     INSN(tzcntw,    66, map4, f4,    el,    w, no),
 };
 
+static const struct test bmi2[] = {
+    INSN(bzhi,        , 0f38, f5,    el,   dq, no),
+    INSN(mulx,      f2, 0f38, f6,    el,   dq, no),
+    INSN(pdep,      f2, 0f38, f5,    el,   dq, no),
+    INSN(pext,      f3, 0f38, f5,    el,   dq, no),
+    INSN(rorx,      f2, 0f3a, f0,    el,   dq, no),
+    INSN(sarx,      f3, 0f38, f7,    el,   dq, no),
+    INSN(shlx,      66, 0f38, f7,    el,   dq, no),
+    INSN(shrx,      f2, 0f38, f7,    el,   dq, no),
+};
+
 static const unsigned char vl_all[] = { VL_512, VL_128, VL_256 };
 static const unsigned char vl_128[] = { VL_128 };
 static const unsigned char vl_no128[] = { VL_512, VL_256 };
@@ -1725,6 +1736,7 @@ void evex_disp8_test(void *instr, struct
         RUN(avx512dq);
         RUN(avx512bw);
         RUN(bmi1);
+        RUN(bmi2);
 
 #undef RUN
 
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2071,7 +2071,14 @@ static const struct evex {
     { { 0xf3, 0x08 }, 2, T, R, pfx_no, Wn, L0 }, /* blsr */
     { { 0xf3, 0x10 }, 2, T, R, pfx_no, Wn, L0 }, /* blsmsk */
     { { 0xf3, 0x18 }, 2, T, R, pfx_no, Wn, L0 }, /* blsi */
+    { { 0xf5 }, 2, T, R, pfx_no, Wn, L0 }, /* bzhi */
+    { { 0xf5 }, 2, T, R, pfx_f3, Wn, L0 }, /* pext */
+    { { 0xf5 }, 2, T, R, pfx_f2, Wn, L0 }, /* pdep */
+    { { 0xf6 }, 2, T, R, pfx_f2, Wn, L0 }, /* mulx */
     { { 0xf7 }, 2, T, R, pfx_no, Wn, L0 }, /* bextr */
+    { { 0xf7 }, 2, T, R, pfx_66, Wn, L0 }, /* shlx */
+    { { 0xf7 }, 2, T, R, pfx_f3, Wn, L0 }, /* sarx */
+    { { 0xf7 }, 2, T, R, pfx_f2, Wn, L0 }, /* shrx */
 #endif
 }, evex_0f3a[] = {
     { { 0x00 }, 3, T, R, pfx_66, W1, L1|L2 }, /* vpermq */
@@ -2147,6 +2154,9 @@ static const struct evex {
     { { 0xc2 }, 3, T, R, pfx_f2, W0, Ln }, /* vcmpbf16 */
     { { 0xce }, 3, T, R, pfx_66, W1, Ln }, /* vgf2p8affineqb */
     { { 0xcf }, 3, T, R, pfx_66, W1, Ln }, /* vgf2p8affineinvqb */
+#ifdef __x86_64__
+    { { 0xf0 }, 3, T, R, pfx_f2, Wn, L0 }, /* rorx */
+#endif
 }, evex_map4[] = {
 #ifdef __x86_64__
 #define ND .nd = true
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -2970,6 +2970,34 @@ int main(int argc, char **argv)
              !check_eip(bzhi) )
             goto fail;
         printf("okay\n");
+
+#if defined(__x86_64__) && \
+    (defined(__clang__) ? __clang_major__ >= 18 : __GNUC__ >= 14)
+        if ( true /* cpu_has_apx_nci_ndd_nf */ )
+        {
+            decl_insn(bzhi_apx);
+
+            cpu_policy.apx.apx_nci_ndd_nf = true;
+
+            printf("%-40s", "Testing {nf}bzhi %edx,(%rcx),%ebx...");
+
+            asm volatile ( put_insn(bzhi_apx, "%{nf%} bzhi %%edx, (%0), %%ebx")
+                           :: "c" (NULL) );
+            set_insn(bzhi_apx);
+
+            regs.rbx = 0;
+            regs.eflags = EFLAGS_ALWAYS_SET | X86_EFLAGS(OF, SF, ZF, CF);
+            rc = x86_emulate(&ctxt, &emulops);
+            if ( (rc != X86EMUL_OKAY) || (regs.rbx != (*res & 0x7ffff)) ||
+                 (regs.eflags !=
+                  (EFLAGS_ALWAYS_SET | X86_EFLAGS(OF, SF, ZF, CF))) ||
+                 !check_eip(bzhi_apx) )
+                goto fail;
+            printf("okay\n");
+
+            cpu_policy.apx.apx_nci_ndd_nf = nci_ndd_nf;
+        }
+#endif
     }
     else
         printf("skipped\n");
@@ -2992,6 +3020,28 @@ int main(int argc, char **argv)
              regs.eflags != 0xac3 || !check_eip(mulx) )
             goto fail;
         printf("okay\n");
+
+#if defined(__x86_64__) && \
+    (defined(__clang__) ? __clang_major__ >= 18 : __GNUC__ >= 14)
+        if ( cpu_has_apx_f )
+        {
+            decl_insn(mulx_apx);
+
+            printf("%-40s", "Testing mulx (%rax),%r25,%rbx...");
+
+            asm volatile ( put_insn(mulx_apx, "mulx (%0), %%r25, %%rbx")
+                           :: "a" (NULL) );
+            set_insn(mulx_apx);
+
+            res[1]      = 0;
+            rc = x86_emulate(&ctxt, &emulops);
+            if ( (rc != X86EMUL_OKAY) || regs.rbx ||
+                 !check_egpr(25, 0x121fa00a35068740UL) ||
+                 !check_eip(mulx_apx) )
+                goto fail;
+            printf("okay\n");
+        }
+#endif
     }
     else
         printf("skipped\n");
@@ -3014,6 +3064,28 @@ int main(int argc, char **argv)
              regs.eflags != 0xa43 || !check_eip(pdep) )
             goto fail;
         printf("okay\n");
+
+#if defined(__x86_64__) && \
+    (defined(__clang__) ? __clang_major__ >= 18 : __GNUC__ >= 14)
+        if ( cpu_has_apx_f )
+        {
+            decl_insn(pdep_apx);
+
+            printf("%-40s", "Testing pdep (%rdx),%ecx,%r19d...");
+
+            asm volatile ( put_insn(pdep_apx, "pdep (%0), %%ecx, %%r19d")
+                           :: "d" (NULL) );
+            set_insn(pdep_apx);
+
+            rc = x86_emulate(&ctxt, &emulops);
+            if ( (rc != X86EMUL_OKAY) ||
+                 !check_egpr(19, 0x850b298) ||
+                 (regs.ecx != 0x8cef) ||
+                 !check_eip(pdep_apx) )
+                goto fail;
+            printf("okay\n");
+        }
+#endif
     }
     else
         printf("skipped\n");
@@ -3036,6 +3108,30 @@ int main(int argc, char **argv)
              regs.eflags != 0xa43 || !check_eip(pext) )
             goto fail;
         printf("okay\n");
+
+#if defined(__x86_64__) && \
+    (defined(__clang__) ? __clang_major__ >= 18 : __GNUC__ >= 14)
+        if ( cpu_has_apx_f )
+        {
+            decl_insn(pext_apx);
+
+            printf("%-40s", "Testing pext (%edx),%r17d,%ebx...");
+
+            asm volatile ( put_insn(pext_apx, "pext (%0), %%r17d, %%ebx")
+                           :: "d" (NULL) );
+            set_insn(pext_apx);
+
+            regs.rcx    = 0;
+            regs.rbx    = 0;
+            load_egpr(17, 0x137f8cef);
+            rc = x86_emulate(&ctxt, &emulops);
+            if ( (rc != X86EMUL_OKAY) || (regs.ebx != 0x12f95) ||
+                 !check_egpr(17, 0x137f8cef) ||
+                 !check_eip(pext_apx) )
+                goto fail;
+            printf("okay\n");
+        }
+#endif
     }
     else
         printf("skipped\n");
@@ -3057,6 +3153,27 @@ int main(int argc, char **argv)
              regs.eflags != 0xa43 || !check_eip(rorx) )
             goto fail;
         printf("okay\n");
+
+#if defined(__x86_64__) && \
+    (defined(__clang__) ? __clang_major__ >= 18 : __GNUC__ >= 14)
+        if ( cpu_has_apx_f )
+        {
+            decl_insn(rorx_apx);
+
+            printf("%-40s", "Testing rorx $8,(%r17),%ebx...");
+
+            asm volatile ( put_insn(rorx_apx, "rorx $8, (%r17), %ebx") );
+            set_insn(rorx_apx);
+
+            regs.ecx    = 0;
+            load_egpr(17, (unsigned long)res);
+            rc = x86_emulate(&ctxt, &emulops);
+            if ( (rc != X86EMUL_OKAY) || (regs.rbx != 0x98fedcbaU) ||
+                 !check_eip(rorx_apx) )
+                goto fail;
+            printf("okay\n");
+        }
+#endif
     }
     else
         printf("skipped\n");
@@ -3080,6 +3197,29 @@ int main(int argc, char **argv)
              regs.eflags != 0xa43 || !check_eip(sarx) )
             goto fail;
         printf("okay\n");
+
+#if defined(__x86_64__) && \
+    (defined(__clang__) ? __clang_major__ >= 18 : __GNUC__ >= 14)
+        if ( cpu_has_apx_f )
+        {
+            decl_insn(sarx_apx);
+
+            printf("%-40s", "Testing sarx %r26d,(%rcx),%ebx...");
+
+            asm volatile ( put_insn(sarx_apx, "sarx %%r26d, (%0), %%ebx")
+                           :: "c" (NULL) );
+            set_insn(sarx_apx);
+
+            regs.ebx    = 0;
+            load_egpr(26, 0xff11);
+            rc = x86_emulate(&ctxt, &emulops);
+            if ( (rc != X86EMUL_OKAY) ||
+                 (regs.rbx != (unsigned)(((signed)*res >> 0x11))) ||
+                 !check_eip(sarx_apx) )
+                goto fail;
+            printf("okay\n");
+        }
+#endif
     }
     else
         printf("skipped\n");
@@ -3100,6 +3240,27 @@ int main(int argc, char **argv)
              regs.eflags != 0xa43 || !check_eip(shlx) )
             goto fail;
         printf("okay\n");
+
+#if defined(__x86_64__) && \
+    (defined(__clang__) ? __clang_major__ >= 18 : __GNUC__ >= 14)
+        if ( cpu_has_apx_f )
+        {
+            decl_insn(shlx_apx);
+
+            printf("%-40s", "Testing shlx %rdx,(%rcx),%r19...");
+
+            asm volatile ( put_insn(shlx_apx, "shlx %%rdx, (%0), %%r19")
+                           :: "c" (NULL) );
+            set_insn(shlx_apx);
+
+            rc = x86_emulate(&ctxt, &emulops);
+            if ( (rc != X86EMUL_OKAY) ||
+                 !check_egpr(19, (unsigned long)*res << (regs.rdx & 0x1f)) ||
+                 !check_eip(shlx_apx) )
+                goto fail;
+            printf("okay\n");
+        }
+#endif
     }
     else
         printf("skipped\n");
@@ -3120,6 +3281,27 @@ int main(int argc, char **argv)
              regs.eflags != 0xa43 || !check_eip(shrx) )
             goto fail;
         printf("okay\n");
+
+#if defined(__x86_64__) && \
+    (defined(__clang__) ? __clang_major__ >= 18 : __GNUC__ >= 14)
+        if ( cpu_has_apx_f )
+        {
+            decl_insn(shrx_apx);
+
+            printf("%-40s", "Testing shrx %edx,(%ecx),%r19d...");
+
+            asm volatile ( put_insn(shrx_apx, "shrx %%edx, (%0), %%r19d")
+                           :: "c" (NULL) );
+            set_insn(shrx_apx);
+
+            rc = x86_emulate(&ctxt, &emulops);
+            if ( (rc != X86EMUL_OKAY) ||
+                 !check_egpr(19, (*res >> (regs.edx & 0x1f))) ||
+                 !check_eip(shrx_apx) )
+                goto fail;
+            printf("okay\n");
+        }
+#endif
     }
     else
         printf("skipped\n");
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1269,7 +1269,14 @@ decode_0f38(struct x86_emulate_state *s,
 
     case X86EMUL_OPC_EVEX(0, 0xf2):    /* andn */
     case X86EMUL_OPC_EVEX(0, 0xf3):    /* Grp 17 */
+    case X86EMUL_OPC_EVEX(0, 0xf5):    /* bzhi */
+    case X86EMUL_OPC_EVEX_F3(0, 0xf5): /* pext */
+    case X86EMUL_OPC_EVEX_F2(0, 0xf5): /* pdep */
+    case X86EMUL_OPC_EVEX_F2(0, 0xf6): /* mulx */
     case X86EMUL_OPC_EVEX(0, 0xf7):    /* bextr */
+    case X86EMUL_OPC_EVEX_66(0, 0xf7): /* shlx */
+    case X86EMUL_OPC_EVEX_F3(0, 0xf7): /* sarx */
+    case X86EMUL_OPC_EVEX_F2(0, 0xf7): /* shrx */
         s->promoted_evex = true;
         break;
 
@@ -1326,6 +1333,10 @@ decode_0f3a(struct x86_emulate_state *s,
         s->desc = DstImplicit | SrcMem;
         break;
 
+    case X86EMUL_OPC_EVEX_F2(0, 0xf0): /* rorx */
+        s->promoted_evex = true;
+        break;
+
     default:
         s->op_bytes = 0;
         break;
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7390,7 +7390,15 @@ x86_emulate(
         }
         break;
 
+    case X86EMUL_OPC_EVEX_F3(0x0f38, 0xf5): /* pext r/m,r,r */
+    case X86EMUL_OPC_EVEX_F2(0x0f38, 0xf5): /* pdep r/m,r,r */
+    case X86EMUL_OPC_EVEX_66(0x0f38, 0xf7): /* shlx r,r/m,r */
+    case X86EMUL_OPC_EVEX_F3(0x0f38, 0xf7): /* sarx r,r/m,r */
+    case X86EMUL_OPC_EVEX_F2(0x0f38, 0xf7): /* shrx r,r/m,r */
+        generate_exception_if(evex.opmsk, X86_EXC_UD);
+        fallthrough;
     case X86EMUL_OPC_EVEX(0x0f38, 0xf2):    /* andn r/m,r,r */
+    case X86EMUL_OPC_EVEX(0x0f38, 0xf5):    /* bzhi r,r/m,r */
     case X86EMUL_OPC_EVEX(0x0f38, 0xf7):    /* bextr r,r/m,r */
         generate_exception_if((evex.z || evex.lr || evex.brs ||
                                (evex.opmsk & 3)),
@@ -7524,10 +7532,19 @@ x86_emulate(
         break;
     }
 
+    case X86EMUL_OPC_EVEX_F2(0x0f38, 0xf6): /* mulx r/m,r,r */
+        generate_exception_if(evex.lr || evex.brs || evex.opmsk, X86_EXC_UD);
+        fallthrough;
     case X86EMUL_OPC_VEX_F2(0x0f38, 0xf6): /* mulx r/m,r,r */
         vcpu_must_have(bmi2);
-        generate_exception_if(vex.l, X86_EXC_UD);
-        ea.reg = decode_vex_gpr(vex.reg, &_regs, ctxt);
+        if ( state->promoted_evex )
+            ea.reg = decode_evex_gpr(evex.reg | (evex.RX << 4), &_regs,
+                                     &state->egpr, ctxt);
+        else
+        {
+            generate_exception_if(vex.l, X86_EXC_UD);
+            ea.reg = decode_vex_gpr(vex.reg, &_regs, ctxt);
+        }
         if ( mode_64bit() && vex.w )
             asm ( "mulq %3" : "=a" (*ea.reg), "=d" (dst.val)
                             : "0" (src.val), "rm" (_regs.r(dx)) );
@@ -8382,6 +8399,10 @@ x86_emulate(
 
 #endif /* X86EMUL_NO_SIMD */
 
+    case X86EMUL_OPC_EVEX_F2(0x0f3a, 0xf0): /* rorx imm,r/m,r */
+        generate_exception_if((evex.lr || evex.brs || evex.opmsk || !evex.RX),
+                              X86_EXC_UD);
+        fallthrough;
     case X86EMUL_OPC_VEX_F2(0x0f3a, 0xf0): /* rorx imm,r/m,r */
         vcpu_must_have(bmi2);
         generate_exception_if(vex.l || vex.reg != 0xf, X86_EXC_UD);


