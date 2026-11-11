Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91EB606A8A9
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FYFl2I4y
Received: from list by lists.xenproject.org with outflank-mailman.1483934.1687307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9Mh-0005dV-2Q; Wed, 11 Nov 2026 14:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483934.1687307; Wed, 11 Nov 2026 14:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9Mg-0005dO-VT; Wed, 11 Nov 2026 14:31:54 +0000
Received: by outflank-mailman (input) for mailman id 1483934;
 Wed, 11 Nov 2026 14:31:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9Mf-0005cu-HE
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:31:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9Me-009pUr-U8
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:31:52 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47c49-2eae-0a2a0a5409dd-0a2a4504a852-46
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:31:52 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47c57-b57f-0a2a45040019-d1558033a4a9-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:31:52 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a549cd7fd2so29263535e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:31:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4c5167adsm728825e9.9.2026.11.11.06.31.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 06:31:50 -0800 (PST)
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
        d=suse.com; s=google; t=1794407511; x=1795012311; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Wxhk3YuNQf97CiCPuYTyUR0AMNGmK9pa2L3kwWQLpFE=;
        b=FYFl2I4y+ao1amJcFT9lgwAT1f8HS2uWVEkhknim8WojO7TQevXsAysbirZk7Bbf2P
         30sQQZLYjrFWmddhL1idiwGL6vrs8R/KT+SMLgmWcLfXzYTPhLuAu//SABQnFoxG+gQ0
         MOJUSY61p91CnjSSiNImL5m3GQrGwoPuFy6hvSFO1hYmrKu11ZkelrgO3yQlube0XNeU
         Uyz8nZnTjri6aw2t5iLl5U4jSTJPs4cPDjmLiZecKFIRZqgUm7/pzuzZ8i2dg5Y1jYSF
         1GIX2Yz5iOOA/6g1SDIDQi/E8U6TbaHKwQBX/v98AbdcV7TvWwOc0zd1yYfZtmrkN/8l
         X1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407511; x=1795012311;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wxhk3YuNQf97CiCPuYTyUR0AMNGmK9pa2L3kwWQLpFE=;
        b=WRnii7QY5UA/dHTWzUaFd3lnaBOPgzq1cy7+aASCFmOvO2vt84/lh9Q4by/0NJej0o
         WkOeut5BEHsgBiUxyJwvbFkPGPrCjSTa218Nygm+DsItJvnxaV61jq73/opvb5wZE1Vc
         rsQRgGrkJrrct938U3GqTduoSPkayoIbg51tJEXHsp7CrZxdGEKDn/TBsuA1lY21whnF
         a0LO0jJ4DNIynkvxB55LG1Bf+7U3HEGt1Eyi9+l5yIXAaLkb7IYkN27X53EVgle5pnTe
         hHlQuK5rTcd+2IgOwuSgk5UICNPk8i/j7yIqO+gDESORDfBBOiMvPiAzEbCp90oObeLE
         fAqQ==
X-Gm-Message-State: APuU4Z9viJcgZ4ftvt2e2qkTEU6jNeAC+zqDDBz2+Y6+gg4LrJbAtbKD
	Et5ogbl0Ga4IC0PvAsntSplMe/+Dff7Cy8zTMjxwKPDAmCIaPO0j0Jxqe6WNwdoQtesFa4Kwsja
	sVCyc8Q==
X-Gm-Gg: AYBFou0egUBVh51NaT1fuXbC4dnUXXzWtxjdUPRIoChxt2c6/5oUm4ppfIt1OfG+dsq
	FW4xbU7bVpTzElcQAKuOMyhiBlNrGGM+d3SVovIfaYgulerfl8fuAtCdzXjsZzJPpImTPFOTEJH
	dcHahmdrCR9C8UNXxzors2fiXr1pyAiwSvW1nZGPoBPB0GNW+ry1eVRfhsGbIvGLr9gCoSu5+oy
	3LhZnF1/uGYuPJ0/zfgWE/h7H0OifCMD0bKUY4ETdGe08ILC8z9ypWxfpcBEY4sCoImgiDUQkx5
	VgyvIgdFndAXLQkyzxpB2ZMKZXi4bWsM23mR7DGcGUeGW96xH2CpAYP1VseHfy1bW1rcHYSKsLk
	Kil4hclt93hxI6Dk1E4e1o9WqRIFzyRQx6f63YvOdJkQi9ypmDTzQ9aDhfgolBYdHCRRVUXCOqg
	zYlEiSx64KzpCvCHa3DRDhtsc3H+wOhKUskAkVqH8/mHQ3AniajpTdtf4fLVaE2Rlh+jsVu/5JV
	62hC4u7B+gpSrt9z69gzU9rrV+JbpsICBFxqsqMBCX3LwrKSFtdhqJfY2TfWQJ7sTRouC2ND4ua
	hoDX2EPvAjK1m+Vlr6E4N9e/8I8F0HcJq8JJ056FCnhh8axZvfUkcAxEw45Gt6Myey3u9VZfbHW
	LZ/Hv6tAhDewyJpf5
X-Received: by 2002:a05:600c:19d0:b0:4b5:d95c:2380 with SMTP id 5b1f17b1804b1-4ba09375b5amr44806155e9.11.1794407511228;
        Wed, 11 Nov 2026 06:31:51 -0800 (PST)
Message-ID: <980e4834-ef4b-4422-9db1-82017ed8539c@suse.com>
Date: Wed, 11 Nov 2026 15:31:50 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 28/30] x86emul: support APX MSR access insns
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
X-purgate-ID: tlsNG-ebf023/1794407512-526CAB50-475E0974/10/78276251493
X-purgate-type: spam
X-purgate-size: 10393
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Them being direct counterparts of the original VEX-encoded insns, there's
nothing really noteworthy here; code is being re-used as much as possible.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2558,6 +2558,13 @@ static const struct evex {
     { { 0xd6 }, 2, T, R, pfx_f2, W0, Ln }, /* vfcmulcph */
     { { 0xd7 }, 2, T, R, pfx_f3, W0, LIG }, /* vfmulcsh */
     { { 0xd7 }, 2, T, R, pfx_f2, W0, LIG }, /* vfcmulcsh */
+}, evex_map7[] = {
+#ifdef __x86_64__
+    { { 0xf6, 0xc0 }, 6, F, N, pfx_f3, W0, L0 }, /* wrmsrns */
+    { { 0xf6, 0xc0 }, 6, F, N, pfx_f2, W0, L0 }, /* rdmsr */
+    { { 0xf8, 0xc0 }, 6, F, N, pfx_f3, W0, L0 }, /* uwrmsr */
+    { { 0xf8, 0xc0 }, 6, F, N, pfx_f2, W0, L0 }, /* urdmsr */
+#endif
 };
 
 #undef CND
@@ -2572,6 +2579,7 @@ static const struct {
     { evex_map4, ARRAY_SIZE(evex_map4) },
     { evex_map5, ARRAY_SIZE(evex_map5) },
     { evex_map6, ARRAY_SIZE(evex_map6) },
+    { evex_map7, ARRAY_SIZE(evex_map7) },
 };
 
 #undef Wn
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -1960,6 +1960,22 @@ int main(int argc, char **argv)
         goto fail;
     printf("okay\n");
 
+    if ( cpu_has_apx_f )
+    {
+        printf("%-40s", "Testing urdmsr %r26,%r25...");
+        instr[0] = 0x62; instr[1] = 0x4c; instr[2] = 0x7f; instr[3] = 0x08;
+        instr[4] = 0xf8; instr[5] = 0xd1;
+        regs.rip = (unsigned long)&instr[0];
+        load_egpr(26, MSR_IA32_APERF);
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.rip != (unsigned long)&instr[6]) ||
+             !check_egpr(25,
+                         (((uint64_t)APERF_HI_VALUE << 32) | APERF_LO_VALUE)) )
+            goto fail;
+        printf("okay\n");
+    }
+
     printf("%-40s", "Testing urdmsr $MSR_IA32_APERF,%rdx...");
     instr[0] = 0xc4; instr[1] = 0xe7; instr[2] = 0x7b; instr[3] = 0xf8; instr[4] = 0xc2;
     *(uint32_t *)&instr[5] = MSR_IA32_APERF;
@@ -1975,6 +1991,22 @@ int main(int argc, char **argv)
     i = cpu_policy.feat.utmr;
     cpu_policy.feat.utmr = true;
 
+    if ( cpu_has_apx_f )
+    {
+        printf("%-40s", "Testing urdmsr $MSR_IA32_APERF,%r18...");
+        instr[0] = 0x62; instr[1] = 0xff; instr[2] = 0x7f; instr[3] = 0x08;
+        instr[4] = 0xf8; instr[5] = 0xc2;
+        *(uint32_t *)&instr[6] = MSR_IA32_APERF;
+        regs.rip = (unsigned long)&instr[0];
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.rip != (unsigned long)&instr[10]) ||
+             !check_egpr(18,
+                         (((uint64_t)APERF_HI_VALUE << 32) | APERF_LO_VALUE)) )
+            goto fail;
+        printf("okay\n");
+    }
+
     printf("%-40s", "Testing uwrmsr %rdi,%rsi...");
     instr[0] = 0xf3; instr[1] = 0x0f; instr[2] = 0x38; instr[3] = 0xf8; instr[4] = 0xf7;
     regs.rip = (unsigned long)&instr[0];
@@ -1987,6 +2019,22 @@ int main(int argc, char **argv)
         goto fail;
     printf("okay\n");
 
+    if ( cpu_has_apx_f )
+    {
+        printf("%-40s", "Testing uwrmsr %r31,%r30...");
+        instr[0] = 0x62; instr[1] = 0x4c; instr[2] = 0x7e; instr[3] = 0x08;
+        instr[4] = 0xf8; instr[5] = 0xf7;
+        regs.rip = (unsigned long)&instr[0];
+        load_egpr(30, MSR_UINTR_TIMER);
+        load_egpr(31, 0x1122334455667788UL);
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.rip != (unsigned long)&instr[6]) ||
+             (uintr_timer != 0x1122334455667788UL) )
+            goto fail;
+        printf("okay\n");
+    }
+
     printf("%-40s", "Testing uwrmsr %rsi,$MSR_UINTR_TIMER...");
     instr[0] = 0xc4; instr[1] = 0xe7; instr[2] = 0x7a; instr[3] = 0xf8; instr[4] = 0xc6;
     *(uint32_t *)&instr[5] = MSR_UINTR_TIMER;
@@ -1999,8 +2047,6 @@ int main(int argc, char **argv)
         goto fail;
     printf("okay\n");
 
-    cpu_policy.feat.utmr = i;
-
     printf("%-40s", "Testing uwrmsr %rsi,$MSR_UARCH_MISC_CTRL...");
     *(uint32_t *)&instr[5] = MSR_UARCH_MISC_CTRL;
     regs.rip = (unsigned long)&instr[0];
@@ -2011,6 +2057,24 @@ int main(int argc, char **argv)
         goto fail;
     printf("okay\n");
 
+    if ( cpu_has_apx_f )
+    {
+        printf("%-40s", "Testing uwrmsr %r30,$MSR_UINTR_TIMER...");
+        instr[0] = 0x62; instr[1] = 0xdf; instr[2] = 0x7e; instr[3] = 0x08;
+        instr[4] = 0xf8; instr[5] = 0xc6;
+        *(uint32_t *)&instr[6] = MSR_UINTR_TIMER;
+        regs.rip = (unsigned long)&instr[0];
+        load_egpr(30, 0x9988776655443322UL);
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.rip != (unsigned long)&instr[10]) ||
+             (uintr_timer != 0x9988776655443322UL) )
+            goto fail;
+        printf("okay\n");
+    }
+
+    cpu_policy.feat.utmr = i;
+
     printf("%-40s", "Testing rdmsr $MSR_GS_BASE,%rdx...");
     instr[0] = 0xc4; instr[1] = 0xe7; instr[2] = 0x7b; instr[3] = 0xf6; instr[4] = 0xc2;
     *(uint32_t *)&instr[5] = MSR_GS_BASE;
@@ -2023,6 +2087,35 @@ int main(int argc, char **argv)
         goto fail;
     printf("okay\n");
 
+    if ( cpu_has_apx_f )
+    {
+        printf("%-40s", "Testing rdmsr $MSR_GS_BASE,%r26...");
+        instr[0] = 0x62; instr[1] = 0xdf; instr[2] = 0x7f; instr[3] = 0x08;
+        instr[4] = 0xf6; instr[5] = 0xc2;
+        *(uint32_t *)&instr[6] = MSR_GS_BASE;
+        regs.rip = (unsigned long)&instr[0];
+        load_egpr(26, ~gs_base);
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.rip != (unsigned long)&instr[10]) ||
+             !check_egpr(26, gs_base) )
+            goto fail;
+        printf("okay\n");
+
+        printf("%-40s", "Testing wrmsrns %r22,$MSR_SHADOW_GS_BASE...");
+        instr[0] = 0x62; instr[1] = 0xff; instr[2] = 0x7e; instr[3] = 0x08;
+        instr[4] = 0xf6; instr[5] = 0xc6;
+        *(uint32_t *)&instr[6] = MSR_SHADOW_GS_BASE;
+        regs.rip = (unsigned long)&instr[0];
+        load_egpr(22, 0x776655443322UL);
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.rip != (unsigned long)&instr[10]) ||
+             (gs_base_shadow != 0x776655443322UL) )
+            goto fail;
+        printf("okay\n");
+    }
+
     printf("%-40s", "Testing wrmsrns %rsi,$MSR_SHADOW_GS_BASE...");
     instr[0] = 0xc4; instr[1] = 0xe7; instr[2] = 0x7a; instr[3] = 0xf6; instr[4] = 0xc6;
     *(uint32_t *)&instr[5] = MSR_SHADOW_GS_BASE;
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1469,8 +1469,15 @@ decode_map4(struct x86_emulate_state *s,
         }
         break;
 
-    case 0xf8: /* movdir64b / enqcmd{,s} */
+    case 0xf8: /* movdir64b / enqcmd{,s} / u{rd,wr}msr */
         /* Make these match their legacy forms. */
+        if ( s->modrm_mod == 3 )
+        {
+            s->desc = DstMem | SrcReg | Mov;
+            s->op_bytes = 8;
+            s->simd_size = simd_none;
+            break;
+        }
         s->desc = DstReg | Mov;
         s->op_bytes = 0;
         break;
@@ -1892,6 +1899,8 @@ int x86emul_decode(struct x86_emulate_st
                         break;
 
                     case vex_map7:
+                        if ( evex_encoded() )
+                            s->promoted_evex = true;
                         opcode |= MASK_INSR(7, X86EMUL_OPC_EXT_MASK);
                         /*
                          * No table lookup here for now, as there are only two
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7589,6 +7589,11 @@ x86_emulate(
         state->simd_size = simd_none;
         break;
 
+    case X86EMUL_OPC_EVEX_F3(7, 0xf6): /* wrmsrns r64,imm32 */
+    case X86EMUL_OPC_EVEX_F2(7, 0xf6): /* rdmsr imm32,r64 */
+        generate_exception_if((evex.lr || evex.brs || evex.opmsk || !evex.RX),
+                              X86_EXC_UD);
+        fallthrough;
     case X86EMUL_OPC_VEX_F3(7, 0xf6): /* wrmsrns r64,imm32 */
     case X86EMUL_OPC_VEX_F2(7, 0xf6): /* rdmsr imm32,r64 */
         generate_exception_if((!mode_64bit() || ea.type != OP_REG ||
@@ -7620,16 +7625,26 @@ x86_emulate(
 
     case X86EMUL_OPC_F3(0x0f38, 0xf8): /* enqcmds r,m512 / uwrmsr r64,r32 */
     case X86EMUL_OPC_F2(0x0f38, 0xf8): /* enqcmd r,m512 / urdmsr r32,r64 */
+    case X86EMUL_OPC_EVEX_F3(4, 0xf8): /* enqcmds r,m512 / uwrmsr r64,r32 */
+    case X86EMUL_OPC_EVEX_F2(4, 0xf8): /* enqcmd r,m512 / urdmsr r32,r64 */
         if ( ea.type == OP_MEM )
             goto enqcmd;
         imm1 = src.val;
         fallthrough;
+    case X86EMUL_OPC_EVEX_F3(7, 0xf8): /* uwrmsr r64,imm32 */
+    case X86EMUL_OPC_EVEX_F2(7, 0xf8): /* urdmsr imm32,r64 */
+        if ( evex.opcx == vex_map7 )
+            generate_exception_if((evex.lr || evex.brs || evex.opmsk ||
+                                   !evex.RX),
+                                  X86_EXC_UD);
+        fallthrough;
     case X86EMUL_OPC_VEX_F3(7, 0xf8): /* uwrmsr r64,imm32 */
     case X86EMUL_OPC_VEX_F2(7, 0xf8): /* urdmsr imm32,r64 */
         generate_exception_if(!mode_64bit() || ea.type != OP_REG, X86_EXC_UD);
         generate_exception_if(vex.l || vex.w, X86_EXC_UD);
-        generate_exception_if(vex.opcx && ((modrm_reg & 7) || vex.reg != 0xf),
+        generate_exception_if(vex.opcx == vex_map7 && (modrm_reg & 7),
                               X86_EXC_UD);
+        generate_exception_if(vex.opcx && vex.reg != 0xf, X86_EXC_UD);
         vcpu_must_have(user_msr);
         fail_if(!ops->read_msr);
         if ( ops->read_msr(MSR_USER_MSR_CTL, &msr_val, ctxt) != X86EMUL_OKAY )
@@ -7684,9 +7699,6 @@ x86_emulate(
         }
         break;
 
-    case X86EMUL_OPC_EVEX_F3(4, 0xf8): /* enqcmds r,m512 */
-    case X86EMUL_OPC_EVEX_F2(4, 0xf8): /* enqcmd r,m512 */
-        generate_exception_if(ea.type != OP_MEM, X86_EXC_UD);
     enqcmd:
         vcpu_must_have(enqcmd);
         generate_exception_if(vex.pfx != vex_f2 && !mode_ring0(), X86_EXC_GP, 0);


