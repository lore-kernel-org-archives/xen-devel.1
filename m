Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7023606A321
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Tc4MxeXa
Received: from list by lists.xenproject.org with outflank-mailman.1483786.1687145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9Fj-0003HA-NE; Wed, 11 Nov 2026 14:24:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483786.1687145; Wed, 11 Nov 2026 14:24:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9Fj-0003H3-K5; Wed, 11 Nov 2026 14:24:43 +0000
Received: by outflank-mailman (input) for mailman id 1483786;
 Wed, 11 Nov 2026 14:24:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9Fi-0003Gn-PT
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:24:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9Fi-0006Qt-69
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:24:42 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47aa6-bab6-0a2a0a5309dd-0a2a45099fe8-10
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:24:42 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47aa9-be1a-0a2a45090019-d1558033e81c-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:24:42 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so22575135e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:24:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4c5202f4sm173965e9.12.2026.11.11.06.24.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 06:24:40 -0800 (PST)
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
        d=suse.com; s=google; t=1794407081; x=1795011881; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=P/DlLEIyPeOpj4zKyWi62w1Q9dNY6I9tt8Tm2qptmxw=;
        b=Tc4MxeXaJtq3KU76RILfUm6hkLWUSISebmLRlKDWM+Gzlp0rStxacRq7EKk3sHSBEz
         A6B+3K4GUUcshCdbROYJ1KJYjPIQTbN7cCZNC6LcsYysTAws9+qWWZR98sW5gVxhaO3v
         6FTHCuR+1+1Uw8PxS9t7kAafj40tOcvAks4fMPRiaetPz05A+Fhm5R0n+YsP+HNn34O4
         BAaGRlyWOMSLYaZCaHnAXOym7Pkl2A7uB9+t8kmy5aJ3GFIef/+CNgV/DypCKq3eYzVQ
         /xNEpttCXtucbVHxAZg7y3omALVVBkIYZ3GbBf9EgK/zMAyDndVG3bExvW/Yi2KBIU4H
         YoDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407081; x=1795011881;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P/DlLEIyPeOpj4zKyWi62w1Q9dNY6I9tt8Tm2qptmxw=;
        b=jVOiwICDHmOY3FsX0FYY7J3wapnwujva2J+0Oga+xqokMxpLn9w3pYhjck9cx8ctls
         KZWlblfuwf1fdVmJVG3S/WJMfToWJcHfiMWRun77pOsji7y2I39IqdT+IXWZfCH3uUl/
         iYHo1npYVLB1ucPJdD5glJ4G8HxMtBNsO8lZjuKh5DLaCA7B/vGZLjYBqEho+fJhsvFm
         WIAAUVQaVChnMCE60O6PtwK6XTT8OaoFDVeQnRXep087Ww6v7qeA3PIULJs6Tj+7qAJ9
         h90d3ZWSekgr8hkP3GHWAqjIJApRF0Q4abYG20pRM7EIWHdHrdScrxNRMyp+dBs33b6V
         5CfQ==
X-Gm-Message-State: APuU4Z/9QQ++qBMQobua7/C1WrzOcSt/oQj+9AabhPpiREOoocSQGz7Q
	Fa/0tiN9YuRdBSawOgdPBZiLv941U2XoBd+S/Gv4ZiembJkrBUUwVBDmdNNNwjhmcunBolN2zck
	aBXdeqA==
X-Gm-Gg: AYBFou3dPXT6ps2bs4tjVG4mU6gri/ySZDawBmYQ0794As0eCcPFmVrb/aXrOaLLWnx
	WeXg2kI2x6F4i2ak9RaHX/FkqL02jByZjRJJqzLghAeAmGxqpD9MwVM5HhJn+/ZXgF9Wc1zI+iY
	nyKHYPgST4JwJTHNdcpfGMEYfJFDzUpsCg3xaaRBjTAVyoZ+861905WQhgvfEFxyAXNk73LFUBi
	XKjd3AVE6IuGkkhr4kSDqXrQUbAH1Gn1ufmlHgVuvEx6repyqMsxv5YaSBWpOSEH+ihM1C9Fpuh
	cnUmP/lN7ynvGLwu97p2P6cGVsLG/Zs0HXA1y3Ozs5EO0rTw84Eoot7Q4rxK7QoLxyEII/slGjj
	DIhR0VPazh86TkD6tz90/JoNlEEKW1Oyi42ImrUgkPgIjwZ6jrblRDyQWVsxSDfOOPZxjiMHj5c
	r9xg/HyrKlCt2mss9Wr9fvmeeth+9CQbVc0NGBspdP0BM4/Nmvy9Kp/dx/GuWvb11IFcufBp9oh
	iKNrtXtuF58FImWVvS6+c/Aj7VmyybWoH34dQAu5D3b0U1MB0+wKEX4KrDo1JXMn9nWYjnDuqQE
	PmP4GZMKYcekaD98iSkM/CR4hjNQr56STDdsFdPtoSBcQl+RF9KRUxJts6nj3TBkZ7hEZPPvA7M
	mAM9cd5l2MSEnpgZSUA==
X-Received: by 2002:a05:600c:3544:b0:4a4:de70:2ad4 with SMTP id 5b1f17b1804b1-4ba0938e165mr46957415e9.22.1794407081479;
        Wed, 11 Nov 2026 06:24:41 -0800 (PST)
Message-ID: <c697a485-5977-4759-adfc-cf44d6f2d502@suse.com>
Date: Wed, 11 Nov 2026 15:24:39 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 10/30] x86emul: support JMPABS
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
X-purgate-ID: tlsNG-bad1c0/1794407082-3BCD7034-6284A34A/10/78276251493
X-purgate-type: spam
X-purgate-size: 2706
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -1979,6 +1979,22 @@ int main(int argc, char **argv)
 
         cpu_policy.feat.movrs = movrs;
     }
+
+    printf("%-40s", "Testing jmpabs $0x123456789abc...");
+    if ( cpu_has_apx_f )
+    {
+        instr[0] = 0xd5; instr[1] = 0x00; instr[2] = 0xa1;
+        instr[3] = 0xbc; instr[4] = 0x9a; instr[5] = 0x78; instr[6] = 0x56;
+        instr[7] = 0x34; instr[8] = 0x12; instr[9] = 0; instr[10] = 0;
+        regs.rip = (unsigned long)&instr[0];
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.rip != 0x123456789abcUL) )
+            goto fail;
+        printf("okay\n");
+    }
+    else
+        printf("skipped\n");
 #endif /* x86-64 */
 
     printf("%-40s", "Testing shld $1,%ecx,(%edx)...");
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -689,6 +689,13 @@ decode_onebyte(struct x86_emulate_state
         s->ea.mem.off = insn_fetch_bytes(s->ad_bytes);
         break;
 
+    case X86EMUL_OPC_REX2 | 0xa1: /* jmpabs */
+        if ( s->ad_bytes == 8 ) /* Fetch more bytes to obtain imm64. */
+            s->imm1 = ((uint32_t)s->imm1 |
+                       ((uint64_t)insn_fetch_type(uint32_t) << 32));
+        ctxt->opcode |= MASK_INSR(s->vex.pfx, X86EMUL_OPC_PFX_MASK);
+        break;
+
     case 0xb8 ... 0xbf: /* mov imm{16,32,64},r{16,32,64} */
         if ( s->op_bytes == 8 ) /* Fetch more bytes to obtain imm64. */
             s->imm1 = ((uint32_t)s->imm1 |
@@ -1948,6 +1955,16 @@ int x86emul_decode(struct x86_emulate_st
     {
         s->modrm_mod = 0xff;
         s->modrm_reg = s->modrm_rm = s->modrm = 0;
+
+        switch ( opcode )
+        {
+        case X86EMUL_OPC_REX2 | 0xa1:
+            d = DstImplicit | SrcImm;
+            break;
+
+        default:
+            break;
+        }
     }
 
     if ( override_seg != x86_seg_none )
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -2237,6 +2237,13 @@ x86_emulate(
         _regs.ah = (_regs.eflags & EFLAGS_MASK) | X86_EFLAGS_MBS;
         break;
 
+    case X86EMUL_OPC_REX2 | 0xa1: /* jmpabs */
+        generate_exception_if(ad_bytes != 8 || op_bytes != 4, X86_EXC_UD);
+        generate_exception_if(!is_canonical_address(imm1), X86_EXC_GP, 0);
+        _regs.r(ip) = imm1;
+        singlestep = _regs.eflags & X86_EFLAGS_TF;
+        break;
+
     case 0xa4 ... 0xa5: /* movs */ {
         unsigned long nr_reps = get_rep_prefix(true, true);
 


