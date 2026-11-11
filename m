Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B63A606A33C
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WhGSZ9Zo
Received: from list by lists.xenproject.org with outflank-mailman.1483778.1687136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9FO-0002mG-D5; Wed, 11 Nov 2026 14:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483778.1687136; Wed, 11 Nov 2026 14:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9FO-0002m7-9o; Wed, 11 Nov 2026 14:24:22 +0000
Received: by outflank-mailman (input) for mailman id 1483778;
 Wed, 11 Nov 2026 14:24:21 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9FN-0002l3-Ah
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:24:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9FM-00GMyo-Nq
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:24:20 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47a91-8faa-0a2a0a5109dd-0a2a4507d7e8-4
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:24:20 +0100
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47a94-b4ea-0a2a45070019-d155dd30adaa-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:24:20 +0100
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-48e10a70540so1966741f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:24:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498365cbbe5sm12527380f8f.42.2026.11.11.06.24.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 06:24:18 -0800 (PST)
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
        d=suse.com; s=google; t=1794407060; x=1795011860; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ENiUMWYjoTv5oytUFd7mvjFfA3odhY6gUV2WS7ldYx8=;
        b=WhGSZ9ZoavnEPwviflUecbAEk7iIpE1C+W1mHyLyL9WQyTcRFdcPikHKteinDxuLYK
         jcgsXGPAKAD+NsHyekggix1SiA4XbdEBZCCducOxpLdjdHHL2eEcgpPHWno1b6E91NLv
         3hXVSzS9cCFFN0XykCSCykGFxGJPTFyNHB9dFnvGk2VRMiAhbhuS3nPudT0sJStU3br1
         hc9y6BznfwINftTxpOwC1LIwvFip/c1msKKJ4eRx8rUCck/1M3RWX9HSPs47wS4EPckk
         khKh+7wSt57fTHglfD5vH1IOPb1TaO5XlNzcCSckleTPwnhWXubATwkDgWR++vzjzKlW
         1SQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407060; x=1795011860;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ENiUMWYjoTv5oytUFd7mvjFfA3odhY6gUV2WS7ldYx8=;
        b=mWW13XW5yobJSEFGTJbJQG62+7hAL4QRCmNxEeP+R8ot5/iofWNypK1Y79oIg7R4rH
         na0mWeL8GJpoNpXDXG+EHqb95OUggIbZdZEkSCX7ooxcuB9ThP908Q6F7xViwwZ86QMe
         PA74r4mLlJlNjiBUH99EjUGWyqTQwMv/HjqXv/wu5OOem7wjmcr2nAse5SKodfz7LtxB
         2OiymAlzhUXm0pu58IFkruV8f80WwBm3+5wiUxHpq5ktiWiJMlaUj20GsbKTlkvSDadz
         VWcHL6vSwkQtYvmnq1SjCB/vbNqFCwH5E/2QHD4KboQOvZUQC8R03heAll9MZEQW4miY
         KpCw==
X-Gm-Message-State: APuU4Z999+/gvzapPjxJTg2OXVH7CYg4yrJNHP+Os2LGWlj6KjB9w7qd
	7m5aJ8JzPBvuLZgiP6HRq0XLBRcDRtmjm+cpvG8aGQUoyHsVPmEk2mbnakB5eoHbFBCzOwA/Hwh
	+kLkY/w==
X-Gm-Gg: AYBFou3OeiOZlWGGS2K6jxLPZi+7idx9tQraRroYNRxPr3fPzaIoup0AFYrDp29JylP
	rPYxWoiAwoVc9XL0QQRkaLjswHS9OcmT1Ifv5LzSdityUdyDoKWnPE3gi1rCm5GqwDQBV6iga1Q
	xPNhANrIJjTELgAO+0PI1MDIn+xwyJEvxIqno1lk+/rpTR8FSpkVDAlIqqjQknIYL933EnD/U3D
	66gb4goBhiC7vTi756T0f1pup6b8R5GHpKLaFbbuLPMxcwVuMMeDEpwxKknU/hA2zDk3bRggshP
	moo3VoYA2qN1p80nQ4dZc3DeuXgoph+VaShFYPLeFIi0H1laF1sEiXQX+kggPfHI1FIT9TRjzXK
	ZrQjejBLD0YX0V8snw6pd2SkSuaz2V7mvSQS+VveWiWEMOu5smhO5M/H8mwZFJe2zuXNm9/NIRG
	bDgYWYP78Uhzx8F6ktz7oYmT6jchxWIMitdvyE4QTQfL21vBZHppM/VkWJk195KG0J1Bk3an78+
	bIQdNbWjas4S84xViiX0BcPcuxQRwfiMaoCiiFl+wdkQIh/upQ8N71k8ziknHCZfVMX8sdqQdBc
	yjg4EX98Pp1Bcfo+gqt71e8YWCSHztvhnBjxB+p0s81RPMVvTuiDtfSlHL90RiK3DsAJ1N+R8tv
	Xg2uPKD8uP+c/BU4zPQ==
X-Received: by 2002:a5d:5f91:0:b0:492:b5e9:4916 with SMTP id ffacd0b85a97d-499c64055a9mr4226176f8f.24.1794407060063;
        Wed, 11 Nov 2026 06:24:20 -0800 (PST)
Message-ID: <67bcd46e-28dd-4b17-a4e6-48d8c9b8906b@suse.com>
Date: Wed, 11 Nov 2026 15:24:18 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 09/30] x86emul: APX_F REX2 testing
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
X-purgate-ID: tlsNG-ef75cf/1794407060-A7AD0AE4-A20C721F/10/78276251493
X-purgate-type: spam
X-purgate-size: 8858
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Re-use the blowfish code for this, by replacing uses of %r8, %r9, and
%r10-%r15 with %r18, %r19, and %r20-%r25 respectively.

At the same time consume fuzzing input to prefill the eGPR-s when
accessible.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: -future (9.38.0 or later)
---
load_egpr() doesn't strictly need the __builtin_constant_p() dependency.
I coded it up to make sure previous open-coding of the logic would be
replaced by binary-identical code. If we want to keep it, check_egpr()
may want to gain an equivalent alternative.

--- a/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
+++ b/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
@@ -1031,6 +1031,56 @@ int LLVMFuzzerTestOneInput(const uint8_t
 
     disable_hooks(&ctxt);
 
+    if ( cpu_has_apx_f )
+    {
+        uint64_t egpr[16];
+
+        /* Pre-seed the eGPR-s if enough input data is available. */
+        if ( input_avail(&state, sizeof(egpr)) )
+        {
+            input_read(&state, egpr, sizeof(egpr));
+
+            /*
+             * These are "mov %0, %%r<N>" encoded with hand-crafted REX2
+             * prefixes.  The arrangement is such that no REX prefix would
+             * be emitted, as that would conflict with the REX2 we want.
+             */
+            asm volatile ( ".byte 0xd5, 0x48; mov      (%0), %%eax"
+                           :: "R" (egpr), "m" (egpr[0]) );
+            asm volatile ( ".byte 0xd5, 0x48; mov     8(%0), %%ecx"
+                           :: "R" (egpr), "m" (egpr[1]) );
+            asm volatile ( ".byte 0xd5, 0x48; mov 0x2*8(%0), %%edx"
+                           :: "R" (egpr), "m" (egpr[2]) );
+            asm volatile ( ".byte 0xd5, 0x48; mov 0x3*8(%0), %%ebx"
+                           :: "R" (egpr), "m" (egpr[3]) );
+            asm volatile ( ".byte 0xd5, 0x48; mov 0x4*8(%0), %%esp"
+                           :: "R" (egpr), "m" (egpr[4]) );
+            asm volatile ( ".byte 0xd5, 0x48; mov 0x5*8(%0), %%ebp"
+                           :: "R" (egpr), "m" (egpr[5]) );
+            asm volatile ( ".byte 0xd5, 0x48; mov 0x6*8(%0), %%esi"
+                           :: "R" (egpr), "m" (egpr[6]) );
+            asm volatile ( ".byte 0xd5, 0x48; mov 0x7*8(%0), %%edi"
+                           :: "R" (egpr), "m" (egpr[7]) );
+
+            asm volatile ( ".byte 0xd5, 0x4c; mov 0x8*8(%0), %%eax"
+                           :: "R" (egpr), "m" (egpr[8]) );
+            asm volatile ( ".byte 0xd5, 0x4c; mov 0x9*8(%0), %%ecx"
+                           :: "R" (egpr), "m" (egpr[9]) );
+            asm volatile ( ".byte 0xd5, 0x4c; mov 0xa*8(%0), %%edx"
+                           :: "R" (egpr), "m" (egpr[10]) );
+            asm volatile ( ".byte 0xd5, 0x4c; mov 0xb*8(%0), %%ebx"
+                           :: "R" (egpr), "m" (egpr[11]) );
+            asm volatile ( ".byte 0xd5, 0x4c; mov 0xc*8(%0), %%esp"
+                           :: "R" (egpr), "m" (egpr[12]) );
+            asm volatile ( ".byte 0xd5, 0x4c; mov 0xd*8(%0), %%ebp"
+                           :: "R" (egpr), "m" (egpr[13]) );
+            asm volatile ( ".byte 0xd5, 0x4c; mov 0xe*8(%0), %%esi"
+                           :: "R" (egpr), "m" (egpr[14]) );
+            asm volatile ( ".byte 0xd5, 0x4c; mov 0xf*8(%0), %%edi"
+                           :: "R" (egpr), "m" (egpr[15]) );
+        }
+    }
+
     do {
         /* FIXME: Until we actually implement SIGFPE handling properly */
         setup_fpu_exception_handler();
--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -40,6 +40,7 @@ else
 
 blowfish-cflags := ""
 blowfish-cflags-x86_32 := "-mno-accumulate-outgoing-args -Dstatic="
+blowfish-cflags-x86_64 := "-DREX2 -Dstatic="
 
 3dnow-vecs := 8
 3dnow-ints :=
@@ -265,7 +266,7 @@ $(TARGET): $(OBJS)
 
 .PHONY: clean
 clean:
-	rm -rf $(TARGET) *.o *~ core *.bin x86_emulate
+	rm -rf $(TARGET) *.o *~ core *.bin blowfish.s x86_emulate
 	rm -rf $(addsuffix .h,$(TESTCASES)) $(addsuffix -opmask.h,$(OPMASK))
 	rm -rf $(addsuffix .c,$(filter-out blowfish,$(TESTCASES)))
 
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -57,6 +57,80 @@ static bool blowfish_check_regs(const st
     return regs->eax == 2 && regs->edx == 1;
 }
 
+#ifdef __x86_64__
+# ifdef __APX_F__
+#  error "Needs re-work with APX_F available to the compiler"
+# endif
+# define load_egpr(reg, val) do { \
+    BUILD_BUG_ON(!((reg) & 0x10)); \
+    if ( !__builtin_constant_p(val) ) \
+        /* mov %rax, %r\reg */ \
+        asm volatile ( ".byte 0xd5, 0x18 | %c[rex_b]\n\t" \
+                       ".byte 0x89, 0xc0 | %c[rm]" \
+                       :: [rm] "i" ((reg) & 7), \
+                          [rex_b] "i" ((bool)((reg) & 8)), \
+                          "a" ((val) + 0UL) ); \
+    else if ( (val) <= 0xffffffffUL ) \
+        /* mov $ui32, %r\reg */ \
+        asm volatile ( ".byte 0xd5, 0x10 | %c[rex_b]\n\t" \
+                       ".byte 0xb8 | %c[r]\n\t" \
+                       ".long %P[v]" \
+                       :: [r] "i" ((reg) & 7), \
+                          [rex_b] "i" ((bool)((reg) & 8)), \
+                          [v] "i" ((val) + 0UL) ); \
+    else \
+        /* mov $ui64, %r\reg */ \
+        asm volatile ( ".byte 0xd5, 0x18 | %c[rex_b]\n\t" \
+                       ".byte 0xb8 | %c[r]\n\t" \
+                       ".quad %P[v]" \
+                       :: [r] "i" ((reg) & 7), \
+                          [rex_b] "i" ((bool)((reg) & 8)), \
+                          [v] "i" ((val) + 0UL) ); \
+} while ( false )
+
+# define check_egpr(reg, val) ({ \
+    bool zf; \
+    BUILD_BUG_ON(!((reg) & 0x10)); \
+    /* cmp %rax, %r\reg */ \
+    asm ( ".byte 0xd5, 0x18 | %c[rex_b]\n\t" \
+          ".byte 0x39, 0xc0 | %c[rm]\n\t" \
+          "sete %[res]" \
+          : [res] "=qm" (zf) \
+          : [rm] "i" ((reg) & 7), \
+            [rex_b] "i" ((bool)((reg) & 8)), \
+            "a" ((val) + 0UL) ); \
+    zf; \
+})
+
+static void blowfish_rex2_set_regs(struct cpu_user_regs *regs)
+{
+    /*
+     * %r12...%r15 are preserved as per the ABI.  The REX2 test blob has them
+     * replaced by %r22...%r25, which therefore take the same (preserved) role.
+     * Seed them with recognizable values, for blowfish_rex2_check_regs() to
+     * check.
+     */
+    load_egpr(22, 0x16000016);
+    load_egpr(23, 0x17000017);
+    load_egpr(24, 0x18000018);
+    load_egpr(25, 0x19000019);
+}
+
+static bool blowfish_rex2_check_regs(const struct cpu_user_regs *regs)
+{
+    return blowfish_check_regs(regs) &&
+           check_egpr(22, 0x16000016) &&
+           check_egpr(23, 0x17000017) &&
+           check_egpr(24, 0x18000018) &&
+           check_egpr(25, 0x19000019);
+}
+
+static bool check_apx_f(void)
+{
+    return cpu_has_apx_f;
+}
+#endif /* __x86_64__ */
+
 static bool simd_check__3dnow(void)
 {
     return cpu_has_3dnow_ext && cpu_has_sse;
@@ -303,6 +377,13 @@ static const struct {
       .check_regs = blowfish_check_regs }
 #ifdef __x86_64__
     BLOWFISH(64, blowfish, ),
+    { .code = blowfish_x86_64_DREX2,
+      .size = sizeof(blowfish_x86_64_DREX2),
+      .bitness = 64,
+      .name = "blowfish (REX2)",
+      .check_cpu = check_apx_f,
+      .set_regs = blowfish_rex2_set_regs,
+      .check_regs = blowfish_rex2_check_regs },
 #endif
     BLOWFISH(32, blowfish, ),
     BLOWFISH(32, blowfish (push), _mno_accumulate_outgoing_args),
--- a/tools/tests/x86_emulator/testcase.mk
+++ b/tools/tests/x86_emulator/testcase.mk
@@ -23,13 +23,29 @@ endif
 
 endif
 
+# For now don't assume an APX_F-capable compiler. Hand-craft eGPR uses instead.
+# In an attempt to have the compiler make more use of %r8 ... %r15, prevent it
+# from using %rbx and %rbp.  We can't also disallow %rax, %rcx, %rdx, %rsi, and
+# %rdi, as those are the hard-wired operands of certain insns.  Since the blob
+# is self-contained, we can then exchange %r8 ... %r15 to become %r18 ... %r25.
+CFLAGS-REX2 := -fomit-frame-pointer -ffixed-rbx -ffixed-rbp
+SED-REX2 := -e 's,%r1,%r2,g' -e 's,%r8,%r18,g' -e 's,%r9,%r19,g'
+
 LDFLAGS_DIRECT += $(shell { $(LD) -v --warn-rwx-segments; } >/dev/null 2>&1 && echo --no-warn-rwx-segments)
 
 .PHONY: all
 all: $(TESTCASE).bin
 
 %.bin: %.c
+ifeq ($(filter -DREX2,$($(TESTCASE)-cflags)),)
 	$(CC) $(filter-out -M% .%,$(CFLAGS)) -c $<
+else
+	rm -f $*.o
+	$(CC) $(filter-out -M% .%,$(CFLAGS)) $(CFLAGS-REX2) -S $< -o $*.s
+	sed $(SED-REX2) -i $*.s
+	$(AS) -o $*.o $*.s
+	rm -f $*.s
+endif
 	$(LD) $(LDFLAGS_DIRECT) -N -Ttext 0x100000 -o $*.tmp $*.o
 	$(OBJCOPY) -O binary -R .note.gnu.property $*.tmp $@
 	rm -f $*.tmp


