Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F23606A324
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 15:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RD6DwODg
Received: from list by lists.xenproject.org with outflank-mailman.1484275.1687648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRA6J-00077A-89; Wed, 11 Nov 2026 15:19:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484275.1687648; Wed, 11 Nov 2026 15:19:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRA6J-000773-5Z; Wed, 11 Nov 2026 15:19:03 +0000
Received: by outflank-mailman (input) for mailman id 1484275;
 Wed, 11 Nov 2026 15:19:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRA6H-000746-Ij
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:19:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRA6G-000HI2-Vi
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:19:00 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af48756-2eae-0a2a0a5409dd-0a2a45059f04-22
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:19:00 +0100
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af48764-4cb1-0a2a45050019-d155dd30ed50-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:19:00 +0100
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-49134c8509fso2701454f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 07:19:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4983284c9b1sm10672932f8f.6.2026.11.11.07.18.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 07:18:59 -0800 (PST)
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
        d=suse.com; s=google; t=1794410340; x=1795015140; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KVmPDwxZITmtgoC5eUf4o9Ip79E/bn+hiU5X7sRYdI8=;
        b=RD6DwODgE1Zxo+s5ADues6psRpgu7EAPxo1+BYJnsAHmmui/8leWv4L5+6F3y5bbxv
         O++xQN213wfmP6s1nUyFvTF9hoe+gpZq7EIev2u+bc2K8H6ZUbmWyVTp11b+0UgyZVIF
         gAmGhhBCrBAxv68XFQwvqVcfCNFxEWI/am5kNeKpJ1hyPdNTqcLIfBuzAZUcS6h8Mzu4
         XsormVe6Y5svznNAgHu7j8D8bBKiPkmvXR5FAd11PEnKvjrNiw6W50Viqs2vxHICOGfR
         veCJ2YIfjPRjFibLsuTxXBLKI/1/nXQut8ldVASmFa0Xy/3Cfy/jIOh50cvbkQbvE99P
         w2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794410340; x=1795015140;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KVmPDwxZITmtgoC5eUf4o9Ip79E/bn+hiU5X7sRYdI8=;
        b=z+EQQT1jipRapwY2FGPC8fKh0UYV8LvaxpKe2Jot0Cb0KaqgRGx0eMXkDi4c0HB/Uf
         D/El9zrYjlASHt/zzvzbEZo8R0V3aG+t1Uf3dFve+9EblReOZDNq53JAIItYoyD1jwgt
         t3yh53DBikViLF76t2fF4Waxn2SUTvf5dFkLvdPlg7pdf+qYiS89KDp+1kGx74Swn3Sa
         pIW/zNi7q0+GWQZucAd+d40QvQwT6TJmwAMJEDV3lBqPguz6HIUCay7ThdsuU0ZmcPRc
         6IR0sJccSOF9W/nEwGlBJE3nqDJt68ZT3JEPGJwWOw6ZDl3RE1CuhU9yWPmV/PDHOOHV
         PO8g==
X-Gm-Message-State: APuU4Z/hki94TbSnuNcB2orEHR6LESprzLByRy2vOeVwN0MG0U0HkRGm
	2fQW956AVWzFVLcgKPVbyOY5JPDOCnWa+/drK78KV6Gv/6csln+wANX5+mbgikwXGrh5FhAR2V2
	O9OGetA==
X-Gm-Gg: AYBFou3L1prDOfTIgZzqDg8ef+SeDROEPHeJ0GzMEQuoWu/fZu3B8TgIu57OskUMnyr
	Jd37kOL+SSp92oYbs+N1exNOcFjdnVAxm40k2QXogeEAYjfT8iPcmXMm5uhwhHo5Sat1EcXEaC4
	GP1JvccZF+rdELtZOeNw93ISZELTvfCPynZVcf28CVC6x6hVrUWpAuU1QXs7pLaoG8Wxq1n1UNg
	uHKM4R/IVc/1O5FV6xXdRjAS6x5ohf0G+NbpIFIjycAKkzUuFlBGTrJKspnMWQDkWk005WhULN6
	SGuRJ6EUG45lYIRXmMkXM+5GaNDGDO7G0boDGdnFJEglGCWJR6R4OfgK3P0H0DItZgO2zxCVXhV
	XTa7h+a9u/51/+vAHzxaNu7N075q/OzwVPB6JXMtnl2ypTM6t3ajrT0cjRcPeJOerA6xROMhDCr
	Xf/Hj37o+bvIZKSzhLyUISO3CZgXFVB1MaD+O7fnOc/7wvYla0F//b5ELZZl9FQ4njc+lpuF4b5
	1pC+h6xasofARIc8liqhG6fMIp/IPhcIY1zhSsM4XL5eJ1cIJ4leSGfNdyybn16LFL5NKq2LHGE
	RrK0dKzSwBa9w1idZWbaY+34oD+9Nv85rjRz5yxM2yGRZtyVUrwB37trsOYbrdO97jrHw+cI+0T
	UywSBpCBMFwDfbWOofpaceDAn+y7qM91gnap5XQ==
X-Received: by 2002:a05:6000:26c6:b0:498:b92a:30b with SMTP id ffacd0b85a97d-499c68d2ddfmr4874924f8f.15.1794410340236;
        Wed, 11 Nov 2026 07:19:00 -0800 (PST)
Message-ID: <f1f6617a-db03-447d-b237-3b9658a342e8@suse.com>
Date: Wed, 11 Nov 2026 16:18:59 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 26/28] x86emul: enable tile data movement insns for ACE
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
X-purgate-ID: tlsNG-c201ff/1794410340-736BD2A1-3C99919C/10/78276251493
X-purgate-type: spam
X-purgate-size: 10124
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Most of these are being re-used from AMX, only TILEMOVCOL and TILEMOVROW
moving to tile are new.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: ???
---
While all ACE-E<n> right now merely say "#UD if TILES_CONFIGURED == 0",
that's reportedly be incorrect. A requirement for the new insns (enabled
here and/or by later patches) is that the selected palette be palette 2.
By implication for the original AMX insns this then also means that they
need to have palette 1 in use. Except for the few which are available with
either palette.
---
v4: New.

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1948,11 +1948,12 @@ static const struct evex {
     { { 0x49, 0x00 }, 2, F, W, pfx_66, W0, L0 }, /* sttilecfg */
     { { 0x4a, VSIB(0) }, 3, F, R, pfx_66, W0, L0 }, /* tileloaddrst1 */
     { { 0x4a, VSIB(0) }, 3, F, R, pfx_f2, W0, L0 }, /* tileloaddrs */
-    { { 0x4a, 0xc0 }, 2, F, N, pfx_66, W0, L2 }, /* tilemovrow */
+    { { 0x4a, 0xc0 }, 2, F, N, pfx_66, Wn, L2 }, /* tilemovrow */
     { { 0x4a, 0xc0 }, 2, F, N, pfx_f3, W0, L2 }, /* tcvtrowd2ps */
     { { 0x4b, VSIB(0) }, 3, F, R, pfx_66, W0, L0 }, /* tileloaddt1 */
     { { 0x4b, VSIB(0) }, 3, F, W, pfx_f3, W0, L0 }, /* tilestored */
     { { 0x4b, VSIB(0) }, 3, F, R, pfx_f2, W0, L0 }, /* tileloadd */
+    { { 0x4b, 0xc0 }, 2, F, N, pfx_66, W1, L2 }, /* tilemovcol */
     { { 0x4c }, 2, T, R, pfx_66, Wn, Ln }, /* vrcp14p{s,d} */
     { { 0x4d }, 2, T, R, pfx_66, Wn, LIG }, /* vrcp14s{s,d} */
     { { 0x4e }, 2, T, R, pfx_66, Wn, Ln }, /* vrsqrt14p{s,d} */
@@ -2108,7 +2109,7 @@ static const struct evex {
     { { 0x04 }, 3, T, R, pfx_66, W0, Ln }, /* vpermilps */
     { { 0x05 }, 3, T, R, pfx_66, W1, Ln }, /* vpermilpd */
     { { 0x07, 0xc0 }, 3, F, N, pfx_no, W0, L2 }, /* tcvtrowps2phh */
-    { { 0x07, 0xc0 }, 3, F, N, pfx_66, W0, L2 }, /* tilemovrow */
+    { { 0x07, 0xc0 }, 3, F, N, pfx_66, Wn, L2 }, /* tilemovrow */
     { { 0x07, 0xc0 }, 3, F, N, pfx_f3, W0, L2 }, /* tcvtrowd2ps */
     { { 0x07, 0xc0 }, 3, F, N, pfx_f2, W0, L2 }, /* tcvtrowps2bf16h */
     { { 0x08 }, 3, T, R, pfx_no, W0, Ln }, /* vrndscaleph */
@@ -2140,6 +2141,7 @@ static const struct evex {
     { { 0x26 }, 3, T, R, pfx_f2, W0, Ln }, /* vgetmantbf16 */
     { { 0x27 }, 3, T, R, pfx_no, W0, LIG }, /* vgetmantsh */
     { { 0x27 }, 3, T, R, pfx_66, Wn, LIG }, /* vgetmants{s,d} */
+    { { 0x2f, 0xc0 }, 3, F, N, pfx_66, W1, L2 }, /* tilemovcol */
     { { 0x38 }, 3, T, R, pfx_66, Wn, L1|L2 }, /* vinserti{32x4,64x2} */
     { { 0x39 }, 3, T, W, pfx_66, Wn, L1|L2 }, /* vextracti{32x4,64x2} */
     { { 0x3a }, 3, T, R, pfx_66, Wn, L2 }, /* vinserti{32x8,64x4} */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -493,6 +493,7 @@ static const struct ext0f3a_table {
     [0x25] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0x26] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
     [0x27] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
+    [0x2f] = { .simd_size = simd_other, .two_op = 1 },
     [0x30 ... 0x33] = { .simd_size = simd_other, .two_op = 1 },
     [0x38] = { .simd_size = simd_128, .d8s = 4 },
     [0x3a] = { .simd_size = simd_256, .d8s = d8s_vl_by_2 },
@@ -1315,6 +1316,7 @@ decode_0f38(struct x86_emulate_state *s,
         break;
 
     case X86EMUL_OPC_EVEX_66(0, 0x4a): /* tileloaddrst1 / tilemovrow */
+    case X86EMUL_OPC_EVEX_66(0, 0x4b): /* tileloaddt1 / tilemovcol */
         if ( s->modrm_mod == 3 )
         {
     case X86EMUL_OPC_EVEX_F3(0, 0x4a): /* tcvtrowd2ps */
@@ -1324,7 +1326,6 @@ decode_0f38(struct x86_emulate_state *s,
         fallthrough;
     case X86EMUL_OPC_EVEX(0, 0x49):    /* ldtilecfg */
     case X86EMUL_OPC_EVEX_F2(0, 0x4a): /* tileloaddrs */
-    case X86EMUL_OPC_EVEX_66(0, 0x4b): /* tileloaddt1 */
     case X86EMUL_OPC_EVEX_F2(0, 0x4b): /* tileloadd */
     case X86EMUL_OPC_EVEX_66(0, 0xe0) ...
          X86EMUL_OPC_EVEX_66(0, 0xef): /* cmp<cc>xadd */
@@ -2112,7 +2113,7 @@ int x86emul_decode(struct x86_emulate_st
                 generate_exception_if(evex_encoded() && !s->evex.u,
                                       X86_EXC_UD);
 
-                if ( b != 0x4a || s->modrm_mod != 3 )
+                if ( (b | 1) != 0x4b || s->modrm_mod != 3 )
                    d |= vSIB;
             }
             s->simd_size = ext0f38_table[b].simd_size;
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6818,7 +6818,13 @@ x86_emulate(
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x4a): /* tileloaddrst1 mem,tmm */
         if ( ea.type != OP_MEM )
-            goto tilemovrow;
+        {
+            if ( evex.w )
+                vcpu_must_have(ace);
+            else if ( !vcpu_has_ace() )
+                vcpu_must_have(amx_avx512);
+            goto tilemov_gpr;
+        }
         fallthrough;
     case X86EMUL_OPC_EVEX_F2(0x0f38, 0x4a): /* tileloaddrs mem,tmm */
         generate_exception_if((evex.lr || evex.brs || evex.opmsk || !evex.RX),
@@ -6830,6 +6836,13 @@ x86_emulate(
         goto tile_load_store;
 
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x4b): /* tileloaddt1 mem,tmm */
+        if ( ea.type != OP_MEM )
+        {
+            generate_exception_if(!evex.w, X86_EXC_UD);
+            vcpu_must_have(ace);
+            goto tilemov_gpr;
+        }
+        fallthrough;
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x4b): /* tilestored tmm,mem */
     case X86EMUL_OPC_EVEX_F2(0x0f38, 0x4b): /* tileloadd mem,tmm */
         generate_exception_if(evex.lr || evex.brs || evex.opmsk || !evex.RX,
@@ -6999,7 +7012,6 @@ x86_emulate(
         generate_exception_if(vex.w, X86_EXC_UD);
         goto simd_0f_avx2;
 
-    tilemovrow:                             /* tilemovrow r32,tmm,zmm */
     case X86EMUL_OPC_EVEX_F3(0x0f38, 0x4a): /* tcvtrowd2ps r32,tmm,zmm */
     case X86EMUL_OPC_EVEX   (0x0f38, 0x6d): /* tcvtrowps2phh r32,tmm,zmm */
     case X86EMUL_OPC_EVEX_66(0x0f38, 0x6d): /* tcvtrowps2phl r32,tmm,zmm */
@@ -7008,20 +7020,36 @@ x86_emulate(
         if ( ea.type != OP_REG )
             goto unrecognized_insn;
         vcpu_must_have(amx_avx512);
-        generate_exception_if((evex.w || evex.brs || evex.opmsk ||
-                               evex.lr != 2 ||
+        generate_exception_if(evex.w, X86_EXC_UD);
+    tilemov_gpr:                            /* tilemovrow r32,tmm,zmm */
+                                            /* tilemovrow r32,zmm,tmm */
+                                            /* tilemovcol r32,zmm,tmm */
+        generate_exception_if((evex.brs || evex.opmsk || evex.lr != 2 ||
                                (!evex.RX && !(state->xcr0 & X86_XCR0_APX))),
                               X86_EXC_UD);
 
     tilemov:
-        get_fpu(X86EMUL_FPU_zmm_tile);
+        get_fpu(X86EMUL_FPU_tilecfg);
         sttilecfg(&mmvalp->tilecfg);
+        put_fpu(X86EMUL_FPU_tilecfg, false, state, ctxt, ops);
+        fpu_type = X86EMUL_FPU_none;
 
-        generate_exception_if(!tile_valid(modrm_rm, &mmvalp->tilecfg,
-                                          PALETTE(AMX)),
-                              X86_EXC_UD);
-        generate_exception_if(mmvalp->tilecfg.colsb[modrm_rm] & 3,
-                              X86_EXC_UD);
+        if ( evex.w )
+            generate_exception_if(!tile_valid(modrm_reg, &mmvalp->tilecfg,
+                                              PALETTE(ACE)),
+                                  X86_EXC_UD);
+        else
+        {
+            generate_exception_if(!tile_valid(modrm_rm, &mmvalp->tilecfg,
+                                              PALETTE(AMX, ACE)),
+                                  X86_EXC_UD);
+            generate_exception_if((mmvalp->tilecfg.palette == PALETTE_AMX &&
+                                   (mmvalp->tilecfg.colsb[modrm_rm] & 3)),
+                                  X86_EXC_UD);
+        }
+
+        get_fpu(mmvalp->tilecfg.palette == PALETTE_AMX ? X86EMUL_FPU_zmm_tile
+                                                       : X86EMUL_FPU_zmm_ace);
 
         /*
          * Note: For the immediate forms this decodes %rax, but the value isn't
@@ -8331,8 +8359,26 @@ x86_emulate(
         fault_suppression = false;
         goto avx512f_imm8_no_sae;
 
-    case X86EMUL_OPC_EVEX   (0x0f3a, 0x07): /* tcvtrowps2phh $imm8,tmm,zmm */
+    case X86EMUL_OPC_EVEX_66(0x0f3a, 0x2f): /* tilemovcol $imm8,zmm,tmm */
+        if ( ea.type != OP_REG )
+            goto unrecognized_insn;
+        generate_exception_if(!evex.w, X86_EXC_UD);
+        vcpu_must_have(ace);
+        goto tilemov_imm;
+
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x07): /* tilemovrow $imm8,tmm,zmm */
+                                            /* tilemovrow $imm8,zmm,tmm */
+        if ( ea.type == OP_REG )
+        {
+            if ( evex.w )
+                vcpu_must_have(ace);
+            else if ( !vcpu_has_ace() )
+                vcpu_must_have(amx_avx512);
+            goto tilemov_imm;
+        }
+        goto unrecognized_insn;
+
+    case X86EMUL_OPC_EVEX   (0x0f3a, 0x07): /* tcvtrowps2phh $imm8,tmm,zmm */
     case X86EMUL_OPC_EVEX_F3(0x0f3a, 0x07): /* tcvtrowd2ps $imm8,tmm,zmm */
     case X86EMUL_OPC_EVEX_F2(0x0f3a, 0x07): /* tcvtrowps2bf16h $imm8,tmm,zmm */
     case X86EMUL_OPC_EVEX_F3(0x0f3a, 0x77): /* tcvtrowps2bf16l $imm8,tmm,zmm */
@@ -8340,8 +8386,10 @@ x86_emulate(
         if ( ea.type != OP_REG )
             goto unrecognized_insn;
         vcpu_must_have(amx_avx512);
-        generate_exception_if((evex.w || evex.brs || evex.opmsk ||
-                               evex.lr != 2 || evex.reg != 0xf || !evex.RX),
+        generate_exception_if(evex.w, X86_EXC_UD);
+    tilemov_imm:
+        generate_exception_if((evex.brs || evex.opmsk || evex.lr != 2 ||
+                               evex.reg != 0xf || !evex.RX),
                               X86_EXC_UD);
         goto tilemov;
 


