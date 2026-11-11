Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9461C60A382D
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GU/Ilbqz
Received: from list by lists.xenproject.org with outflank-mailman.1483949.1687325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9O4-0006iO-K1; Wed, 11 Nov 2026 14:33:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483949.1687325; Wed, 11 Nov 2026 14:33:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9O4-0006iH-HQ; Wed, 11 Nov 2026 14:33:20 +0000
Received: by outflank-mailman (input) for mailman id 1483949;
 Wed, 11 Nov 2026 14:33:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9O3-0006hx-8J
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:33:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9O2-00B2EE-L2
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:33:18 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47ca4-2eae-0a2a0a5409dd-0a2a45028d86-48
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:33:18 +0100
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47cae-6ca4-0a2a45020019-d155dd34d1cc-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:33:18 +0100
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-48e46e449e8so2160668f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:33:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498369a3fd2sm12111795f8f.52.2026.11.11.06.33.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 06:33:17 -0800 (PST)
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
        d=suse.com; s=google; t=1794407598; x=1795012398; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Xu8cJwymlAVF77eZrExVmJfSx1GTvdVFoBZGgQxx/C4=;
        b=GU/IlbqzNy5sv+GUZaGcywWd/lbwp1vDBzW03nJ/ZdSPCENkRb884b5jG/cUqKuPjv
         ozieRsLamftHoj3mt7EhAlYrcAiNAsncPHVo16axjw0SkQTKX8hiiiVtH3EyxeTUw5hn
         wqOx83aAeKNSRrDVVRDRIpfg6Ck5sgxMgwkHgNh98FaKLtSM4Go9pl9KL4/4SB2VmF8L
         KOpbcC3oLTryTXln3L2Jbvg6rVcD26LVm7kIxNy0cleSXd73RJ9NHPxb0fijoK6Yy6DS
         CipqTnRkZwnuolT8YzBoLOqqWtkKjFS9wc8X/4QMIpOw0Lv7ny4k3d26Di/djeT8bwdU
         STiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407598; x=1795012398;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Xu8cJwymlAVF77eZrExVmJfSx1GTvdVFoBZGgQxx/C4=;
        b=kWizqS0fLfjmdIp8RKuxufn3PN5grfpI8Ob+RHu19JqyFKF7QqoCGPFmkXWjOuHCbX
         YaQLgGMYUCI0h+PSQEZ8Q0U7STs4OEjLORYowRW2sGN9P8YtyzkDTyLfs27h7Yk4ON3x
         fFqLhs2oCpgIJIuSunCwEzZoBlkOqOXMxrlSfwNta1xfTEzyV7YKzn2PI+nC81Sj8+ae
         52J0TMTr7GjMw1LBOmqx4FpS7HHuen/ELkIZtPIcSA1Ik4v8Eio6dVdwYdHvmBELd89Z
         0fX8/zPr8rkQ9S20gRC43oXmQfaR3pI8ngcjvUKYkue9K5OlqG1Y8n9yNwVIeuGDmvdp
         oPDw==
X-Gm-Message-State: APuU4Z/znHLZHG3BFFd6TGmYhGVTvtUZe1ywOOFa9Id2tBCRaweCEMZT
	NJPqvDpwbtocToLGCqowdlU8/Zvp3YUL8nma/TOk8Py7hGWUok01n/CFpVTfLCj7SJg5DzfFq5U
	HdyqRCw==
X-Gm-Gg: AYBFou23LRB30dpzABOQwWHYZ0I3E3Y4hfWGXPjVZyGkaz15Vn1j9f5P27v3jLAYAzn
	9S+3trZnf1sNEdl9lzNdLoe6M+qo0h9IPTdHWQmMpv+DgSUvNo6UTR+BiZrqBZ0a3gF3tgLLBbL
	8HAx9j6YxLxcKkcpAvCC1CUSWmKon8BYBKJWXBCswkp9EWx67IHamRrZtnveaYIXxmP+U1uMHmJ
	E+Oskou8MFxk0MYKEptRtMelI+Qu9EWwmX0zWgVwdRD05/Odem27Ztcazqy8VoKZFhgxaKEOKmp
	k0Z/GDLWakgbJJzwunUJlKDi+rGCGixKcb62r25Ypyoxj9+imDH7HppqxKS58u2z/TwprE8Lf4p
	Qqtsa0YUEl31OEBqmf2/RW3/TGGSTmzZhh166fY2Upavb1xEas2swn7ENGJ7R1uC1XTZ760pPEb
	EAvRQGpXkjQgmZHbO+QKocb42Gim3cYCk1kvPSzE6UyuSCYJMCp4K7r6uwoPNH6Zz++tiy8gzXx
	DMCgnppBja/ogYMTIx7pL+EPSAgPBzU126C1/TMbjzKfzDWF7AyxWAHFM0rCV5y+QOKgjBRlSRL
	iRbVsNidzKzAqtrkf2NxhSAr+/JQKHMzAwJGHlDr6vgN/L2MyLYaNi6z9iJGFvpMB89znvScc63
	mnCuDJGts0XAkyZ5Y
X-Received: by 2002:a05:600c:4f10:b0:4b6:267a:dd6e with SMTP id 5b1f17b1804b1-4ba093c53e1mr52080735e9.28.1794407597955;
        Wed, 11 Nov 2026 06:33:17 -0800 (PST)
Message-ID: <9ca7e466-036f-42d6-99e4-95083d3beb71@suse.com>
Date: Wed, 11 Nov 2026 15:33:16 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 30/30] x86emul: use latched XCR0 in x86emul_get_fpu()
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
X-purgate-ID: tlsNG-720697/1794407598-F08A42AC-0CBF6CC8/10/78276251493
X-purgate-type: spam
X-purgate-size: 3795
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Avoid re-reading, and instead pass state into the function. For
get_fpu() to use "s" as new argument, we need a new local variable in
x86_emulate() though.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
That new local "s" can likely be leveraged to replace explicit uses of
"state" in the function (past the point where the alias #define is).
Long term we probably want to aim at consistently using "s" everywhere
where a struct x86_emulate_state * variable/parameter is needed.
x86emul_get_fpu() isn't using "s" right away just because that would end
up inconsistent with adjacent code (put_fpu() first and foremost). I
could certainly change that.

--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -749,12 +749,13 @@ int x86emul_get_cpl(struct x86_emulate_c
                     const struct x86_emulate_ops *ops);
 
 int x86emul_get_fpu(enum x86_emulate_fpu_type type,
+                    const struct x86_emulate_state *state,
                     struct x86_emulate_ctxt *ctxt,
                     const struct x86_emulate_ops *ops);
 
 #define get_fpu(type)                                           \
 do {                                                            \
-    rc = x86emul_get_fpu(fpu_type = (type), ctxt, ops);         \
+    rc = x86emul_get_fpu(fpu_type = (type), s, ctxt, ops);      \
     if ( rc ) goto done;                                        \
 } while (0)
 
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -398,36 +398,30 @@ do {
 
 int x86emul_get_fpu(
     enum x86_emulate_fpu_type type,
+    const struct x86_emulate_state *state,
     struct x86_emulate_ctxt *ctxt,
     const struct x86_emulate_ops *ops)
 {
-    uint64_t xcr0;
     int rc;
 
     fail_if(!ops->get_fpu);
     ASSERT(type != X86EMUL_FPU_none);
 
-    if ( type < X86EMUL_FPU_ymm || !ops->read_xcr ||
-         ops->read_xcr(0, &xcr0, ctxt) != X86EMUL_OKAY )
-    {
-        ASSERT(!ctxt->event_pending);
-        xcr0 = 0;
-    }
-
     switch ( type )
     {
     case X86EMUL_FPU_zmm:
-        if ( !(xcr0 & X86_XCR0_ZMM) || !(xcr0 & X86_XCR0_HI_ZMM) ||
-             !(xcr0 & X86_XCR0_OPMASK) )
+        if ( !(state->xcr0 & X86_XCR0_ZMM) ||
+             !(state->xcr0 & X86_XCR0_HI_ZMM) ||
+             !(state->xcr0 & X86_XCR0_OPMASK) )
             return X86EMUL_UNHANDLEABLE;
         /* fall through */
     case X86EMUL_FPU_ymm:
-        if ( !(xcr0 & X86_XCR0_SSE) || !(xcr0 & X86_XCR0_YMM) )
+        if ( !(state->xcr0 & X86_XCR0_SSE) || !(state->xcr0 & X86_XCR0_YMM) )
             return X86EMUL_UNHANDLEABLE;
         break;
 
     case X86EMUL_FPU_opmask:
-        if ( !(xcr0 & X86_XCR0_SSE) || !(xcr0 & X86_XCR0_OPMASK) )
+        if ( !(state->xcr0 & X86_XCR0_SSE) || !(state->xcr0 & X86_XCR0_OPMASK) )
             return X86EMUL_UNHANDLEABLE;
         break;
 
@@ -1361,7 +1355,7 @@ x86_emulate(
     /* Shadow copy of register state. Committed on successful emulation. */
     struct cpu_user_regs _regs = *ctxt->regs;
     const struct cpu_policy *__maybe_unused cp = ctxt->cpu_policy;
-    struct x86_emulate_state state;
+    struct x86_emulate_state state, *s = &state;
     int rc;
     uint8_t b, d, *opc = NULL;
     unsigned int first_byte = 0, elem_bytes, insn_bytes = 0;
@@ -1506,7 +1500,7 @@ x86_emulate(
     /* With a memory operand, fetch the mask register in use (if any). */
     if ( ea.type == OP_MEM && !state->promoted_evex && evex.opmsk &&
          x86emul_get_fpu(fpu_type = X86EMUL_FPU_opmask,
-                         ctxt, ops) == X86EMUL_OKAY )
+                         s, ctxt, ops) == X86EMUL_OKAY )
     {
         uint8_t *stb = get_stub(stub);
 


