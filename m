Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1EE606A326
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 15:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OJKq+EfF
Received: from list by lists.xenproject.org with outflank-mailman.1484180.1687550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRA16-0001Kx-6f; Wed, 11 Nov 2026 15:13:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484180.1687550; Wed, 11 Nov 2026 15:13:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRA16-0001Kl-3n; Wed, 11 Nov 2026 15:13:40 +0000
Received: by outflank-mailman (input) for mailman id 1484180;
 Wed, 11 Nov 2026 15:13:38 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRA14-0001K1-BB
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:13:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRA13-00GW02-OB
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:13:37 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af4861b-8faa-0a2a0a5109dd-0a2a4509d22e-16
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:13:37 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af48621-be1a-0a2a45090019-d155802ba432-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:13:37 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a549cd7fd2so29629235e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 07:13:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4c5cf33fsm1587935e9.7.2026.11.11.07.13.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 07:13:36 -0800 (PST)
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
        d=suse.com; s=google; t=1794410017; x=1795014817; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=h9w2fnoZZZERl0+mC/6wowCD60OnfoNJPrBLcOgOEhk=;
        b=OJKq+EfFrf0gmdGwExNoIEUguMMXl+Rltzz+6azQibqQjmXPkvSfZNCz+P0tsuI2i2
         PD1t8W9MjwFbvH6jn+GmLXOznpovOPHgqfVEgqtjVlG5TVNCAjkFEogAtMI6qvMny98s
         J65/jUCcd/ceIdUxz6HHpySZ2eN2zKfmNkMEFrcAJ81Kf4q4hk0RO1J9waVxqzbF9j1Y
         MU40MXfKYeA4X1FcUndL6NZpiBbrif5DjbGkHok9Rd/x6SH7IkBsba1LRVSA1BkNMGCx
         nyurpzePJ6IUdY3B4KGGzCL6mRkSiIIJkDmTns/xAcHn6Y7lWxxXRsJi7DrCscCohPGb
         Vrow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794410017; x=1795014817;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h9w2fnoZZZERl0+mC/6wowCD60OnfoNJPrBLcOgOEhk=;
        b=yduBzIakGVpaMlFR15PsI/HqoMF9eFpIFCo3hG+Cn0CV8pzV/NvNYdUAWOluaMZF8H
         cMWHxbH4NQraV94VlrENLScr/+lfgmmAlklxyF+gHhC5BVrzv20LTl9uxnEYDqT7InDn
         i+M2XHM+IBN7+o46uSJ5zb7hF/1xpJae8GnnWlFdDqKf3EEomqShxDXH0x2zQrJRo2Pe
         w45/y8f5Zlv4IsGOuR9e0zRaN7FBtjk+ZIPYpbVFcvwqJkR1GHhH2QctbFckcL1HvxkN
         yCvM4k1d3pmpd/x7gRHc70ufKSeC2upEh8mclm2xEavtD2AY8CgPxNBHu4FY+7/lY/5P
         O0Aw==
X-Gm-Message-State: APuU4Z/DYa4U9Hm/Z13GL8RGjFyK2DjtGYcpYef1lz0kLcs+uSTrcQw2
	3a4L9kBVEzVkm8wQLH4LTatsaLPB7KoXSe5cOkjVjxoynFKH17Vm1rC4wYdI737CBTLqB3wUpr7
	9hjyn9g==
X-Gm-Gg: AYBFou2Nj0OIw1vB1tKVhEZVGSbzbvzHpPWE3ih8oXf1Cv+O3dxcJZwaBVF1Ajr+pVw
	xuIxMQqMGygv4c4gpoUlta1pvAwIwoWNiD8cErj7XaDyeR8YdgoC896Eo2SF4d1ozU+wqZ7OHoU
	MCzy9pK5FLciKwWTM7DgowjIF11ntLhAv/3VItiSTCcnfr6iH6hCfBJnmUBSjvAG1krBiuP4QHn
	LdG8k7jZTctEm/45PfnLTrhKptUCwJkNYIMil6wQdNvfVaYcOWkBDEOzeW8cgaCS6auUrDaqABm
	Fya9turV3aKWWW85iHPhIq/8ux2zoZN7EbLhT9u9dFdjkfHAljHRomA2KMKBcgVt9mGdZyZvCQ4
	Cr/x03ffSRICi18zn/ByaG7zqK0iWg4ysq9bd32GaxQE4oIprZUWvg1oygRCTX03cYjUpAeBLB5
	9soWrzixVwxbTDHU3CJBENdMOTOnpldF0udJ9nms6DnmrjFEApi7SEmWGJgYBBKWbdZl1xYmjlP
	4yDt3BmBBeRmcjBH4L8ACeWRpY3E7LXICZBxemIzmscyGwYB7bfAi0sUNoEf61r0hpNgmQqPIRr
	4R1IaU9B939tfw/oMmrqRymwmW3hRUlO1n88+ZjAAuKI+ndIMDybNX7piJmV2VxcP4v3FhRHQfp
	6QeitIvO7L9ob+S/BqQ==
X-Received: by 2002:a05:600c:548d:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4ba0935bd5dmr50847525e9.6.1794410017129;
        Wed, 11 Nov 2026 07:13:37 -0800 (PST)
Message-ID: <f9824d2e-1d65-4a14-9f11-1d1602e3b1ac@suse.com>
Date: Wed, 11 Nov 2026 16:13:36 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 16/28] x86emul: support APX forms of {LD,ST}TILECFG
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
X-purgate-ID: tlsNG-bad1c0/1794410017-3BED6034-0A8A55FA/10/78276251493
X-purgate-type: spam
X-purgate-size: 5839
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Besides adding table entries and case labels, re-existing handling can
be re-used. The only special aspect once again is dealing with the
512-bit memory operands in EVEX Disp8 testing.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: New.

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -1192,6 +1192,12 @@ static const struct test popcnt[] = {
     INSN(popcntw,   66, map4, 88,    el,    w, no),
 };
 
+static const struct test amx_tile[] = {
+    /* Element size is set arbitrarily here. See test_one(). */
+    INSN(ldtilecfg,     , 0f38, 49, el, b, no),
+    INSN(sttilecfg,   66, 0f38, 49, el, b, no),
+};
+
 static const unsigned char vl_all[] = { VL_512, VL_128, VL_256 };
 static const unsigned char vl_128[] = { VL_128 };
 static const unsigned char vl_no128[] = { VL_512, VL_256 };
@@ -1452,6 +1458,13 @@ static void test_one(const struct test *
     {
         asm volatile ( "kxnorw %k1, %k1, %k1" );
         asm volatile ( "vxorps %xmm4, %xmm4, %xmm4" );
+
+        /*
+         * {LD,ST}TILECFG's operand size of 512 bits doesn't match up with
+         * EVEX.L'L being 0.
+         */
+        if ( test->spc == SPC_0f38 && test->opc == 0x49 )
+            vsz = 64;
     }
     else
     {
@@ -1796,6 +1809,7 @@ void evex_disp8_test(void *instr, struct
     } while ( false )
 
         RUN(adx);
+        RUN(amx_tile);
         RUN(avx512f);
         RUN(avx512dq);
         RUN(avx512bw);
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1937,6 +1937,8 @@ static const struct evex {
     { { 0x45 }, 2, T, R, pfx_66, Wn, Ln }, /* vpsrlv{d,q} */
     { { 0x46 }, 2, T, R, pfx_66, Wn, Ln }, /* vpsrav{d,q} */
     { { 0x47 }, 2, T, R, pfx_66, Wn, Ln }, /* vpsllv{d,q} */
+    { { 0x49, 0x00 }, 2, F, R, pfx_no, W0, L0 }, /* ldtilecfg */
+    { { 0x49, 0x00 }, 2, F, W, pfx_66, W0, L0 }, /* sttilecfg */
     { { 0x4c }, 2, T, R, pfx_66, Wn, Ln }, /* vrcp14p{s,d} */
     { { 0x4d }, 2, T, R, pfx_66, Wn, LIG }, /* vrcp14s{s,d} */
     { { 0x4e }, 2, T, R, pfx_66, Wn, Ln }, /* vrsqrt14p{s,d} */
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -6218,6 +6218,45 @@ int main(int argc, char **argv)
     else
         printf("skipped\n");
 
+    if ( stack_exec && cpu_has_amx_tile && cpu_has_apx_f )
+    {
+        static const struct x86_tilecfg tilecfg_apx = {
+            .palette = 1,
+            .colsb = { 2, 3, 4, 5 },
+            .rows = { 5, 4, 3, 2 },
+        };
+        decl_insn(ldtilecfg_apx);
+        decl_insn(sttilecfg_apx);
+
+        printf("%-40s", "Testing ldtilecfg (%r26)...");
+
+        asm volatile ( put_insn(ldtilecfg_apx,
+                                /* ldtilecfg (%%r26) */
+                                ".byte 0x62, 0xda, 0x7c, 0x08, 0x49, 0x02") );
+
+        set_insn(ldtilecfg_apx);
+        load_egpr(26, (unsigned long)&tilecfg_apx);
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( rc != X86EMUL_OKAY || !check_eip(ldtilecfg_apx) )
+            goto fail;
+        printf("pending\n");
+
+        printf("%-40s", "Testing sttilecfg -4(%r25)...");
+
+        asm volatile ( put_insn(sttilecfg_apx,
+                                /* sttilecfg -4(%%r25) */
+                                ".byte 0x62, 0xda, 0x7d, 0x08, 0x49, 0x41, 0xfc") );
+
+        memset(res, ~0, 72);
+        set_insn(sttilecfg_apx);
+        load_egpr(25, (unsigned long)(res + 2));
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( rc != X86EMUL_OKAY || !check_eip(sttilecfg_apx) ||
+             ~res[0] || ~res[17] || memcmp(res + 1, &tilecfg_apx, 64) )
+            goto fail;
+        printf("okay\n");
+    }
+
     printf("%-40s", "Testing vzeroupper (compat)...");
     if ( cpu_has_avx )
     {
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1271,6 +1271,9 @@ decode_0f38(struct x86_emulate_state *s,
         s->simd_size = simd_packed_fp;
         break;
 
+    case X86EMUL_OPC_EVEX_66(0, 0x49): /* sttilecfg */
+        s->promoted_evex = true;
+        fallthrough;
     case X86EMUL_OPC_VEX_66(0, 0x49): /* sttilecfg */
     case X86EMUL_OPC_VEX_F3(0, 0x4b): /* tilestored */
         s->desc = DstMem | SrcImplicit | Mov;
@@ -1308,6 +1311,7 @@ decode_0f38(struct x86_emulate_state *s,
     case X86EMUL_OPC_VEX_F2(0, 0xf7): /* shrx */
         break;
 
+    case X86EMUL_OPC_EVEX(0, 0x49):    /* ldtilecfg */
     case X86EMUL_OPC_EVEX_66(0, 0xe0) ...
          X86EMUL_OPC_EVEX_66(0, 0xef): /* cmp<cc>xadd */
     case X86EMUL_OPC_EVEX(0, 0xf2):    /* andn */
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6650,10 +6650,16 @@ x86_emulate(
         generate_exception_if(vex.l, X86_EXC_UD);
         goto simd_0f_avx;
 
+    case X86EMUL_OPC_EVEX(0x0f38, 0x49):
+        generate_exception_if(evex.lr || evex.brs || evex.opmsk, X86_EXC_UD);
+        fallthrough;
     case X86EMUL_OPC_VEX(0x0f38, 0x49):
         generate_exception_if(!mode_64bit() || vex.l || vex.w, X86_EXC_UD);
         if ( ea.type == OP_REG )
         {
+            if ( evex_encoded() )
+                goto unrecognized_insn;
+
             switch ( modrm )
             {
             case 0xc0: /* tilerelease */
@@ -6725,6 +6731,9 @@ x86_emulate(
         }
         goto unrecognized_insn;
 
+    case X86EMUL_OPC_EVEX_66(0x0f38, 0x49):
+        generate_exception_if(evex.lr || evex.brs || evex.opmsk, X86_EXC_UD);
+        fallthrough;
     case X86EMUL_OPC_VEX_66(0x0f38, 0x49):
         generate_exception_if(!mode_64bit() || vex.l || vex.w, X86_EXC_UD);
         if ( ea.type == OP_REG )


