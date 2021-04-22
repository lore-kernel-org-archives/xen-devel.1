Return-Path: <SRS0=VIWx=JT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 013ACC433ED
	for <xen-devel@archiver.kernel.org>; Thu, 22 Apr 2021 14:53:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9895A6141C
	for <xen-devel@archiver.kernel.org>; Thu, 22 Apr 2021 14:53:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9895A6141C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.115530.220452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZahw-0005YC-Ac; Thu, 22 Apr 2021 14:53:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115530.220452; Thu, 22 Apr 2021 14:53:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZahw-0005Y3-6q; Thu, 22 Apr 2021 14:53:32 +0000
Received: by outflank-mailman (input) for mailman id 115530;
 Thu, 22 Apr 2021 14:53:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZahv-0005Xr-Ay
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 14:53:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ee80abb-0a83-4cae-83a6-abef09b90889;
 Thu, 22 Apr 2021 14:53:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B094CAEC6;
 Thu, 22 Apr 2021 14:53:29 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 8ee80abb-0a83-4cae-83a6-abef09b90889
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619103209; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6sH9ZStUceyjzleVNMQ/IZlMigDXrBHjCjtxo39B/zw=;
	b=mmEZ8yopdhasVdP8JPkF1gdcQ9LRt5DkRhQday7xIOXKH/wtWcIza0syOhw0SxQnsY8CCr
	bT7zuZUJEZnTIgYSasDqiOVscO2FvFjNgJedH/ltWvuqyDAkuumdC1zdxR3eOE1Ld2OeLV
	qMnEh8eo1RjdUH6oC3m6BcKcBKeUyAQ=
Subject: [PATCH v3 15/22] x86emul: support TILERELEASE
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Message-ID: <08ce1e1f-f521-3e7d-3f7c-206e8ba0afa3@suse.com>
Date: Thu, 22 Apr 2021 16:53:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This is relatively straightforward, and hence best suited to introduce a
few other general pieces.

Testing of this will be added once a sensible test can be put together,
i.e. when support for other insns is also there.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1335,6 +1335,7 @@ static const struct vex {
     { { 0x45 }, 2, T, R, pfx_66, Wn, Ln }, /* vpsrlv{d,q} */
     { { 0x46 }, 2, T, R, pfx_66, W0, Ln }, /* vpsravd */
     { { 0x47 }, 2, T, R, pfx_66, Wn, Ln }, /* vpsllv{d,q} */
+    { { 0x49, 0xc0 }, 2, F, N, pfx_no, W0, L0 }, /* tilerelease */
     { { 0x50 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpbusd */
     { { 0x51 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpbusds */
     { { 0x52 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpwssd */
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -247,6 +247,10 @@ int emul_test_get_fpu(
             break;
     default:
         return X86EMUL_UNHANDLEABLE;
+
+    case X86EMUL_FPU_tilecfg:
+    case X86EMUL_FPU_tile:
+        return cpu_has_amx_tile ? X86EMUL_OKAY : X86EMUL_UNHANDLEABLE;
     }
     return X86EMUL_OKAY;
 }
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -475,6 +475,7 @@ static const struct ext0f38_table {
     [0x43] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0x44] = { .simd_size = simd_packed_int, .two_op = 1, .d8s = d8s_vl },
     [0x45 ... 0x47] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0x49] = { .simd_size = simd_other, .two_op = 1 },
     [0x4c] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
     [0x4d] = { .simd_size = simd_scalar_vexw, .d8s = d8s_dq },
     [0x4e] = { .simd_size = simd_packed_fp, .two_op = 1, .d8s = d8s_vl },
@@ -2046,6 +2047,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_avx512_4fmaps() (ctxt->cpuid->feat.avx512_4fmaps)
 #define vcpu_has_avx512_vp2intersect() (ctxt->cpuid->feat.avx512_vp2intersect)
 #define vcpu_has_serialize()   (ctxt->cpuid->feat.serialize)
+#define vcpu_has_amx_tile()    (ctxt->cpuid->feat.amx_tile)
 #define vcpu_has_avx_vnni()    (ctxt->cpuid->feat.avx_vnni)
 #define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
 
@@ -9500,6 +9502,24 @@ x86_emulate(
         generate_exception_if(vex.l, EXC_UD);
         goto simd_0f_avx;
 
+    case X86EMUL_OPC_VEX(0x0f38, 0x49):
+        generate_exception_if(!mode_64bit() || vex.l || vex.w, EXC_UD);
+        if ( ea.type == OP_REG )
+        {
+            switch ( modrm )
+            {
+            case 0xc0: /* tilerelease */
+                host_and_vcpu_must_have(amx_tile);
+                get_fpu(X86EMUL_FPU_tilecfg);
+                op_bytes = 1; /* fake */
+                goto simd_0f_common;
+
+            default:
+                goto unrecognized_insn;
+            }
+        }
+        goto unimplemented_insn;
+
     case X86EMUL_OPC_VEX_66(0x0f38, 0x50): /* vpdpbusd [xy]mm/mem,[xy]mm,[xy]mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x51): /* vpdpbusds [xy]mm/mem,[xy]mm,[xy]mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x52): /* vpdpwssd [xy]mm/mem,[xy]mm,[xy]mm */
--- a/xen/include/asm-x86/cpufeature.h
+++ b/xen/include/asm-x86/cpufeature.h
@@ -133,6 +133,7 @@
 #define cpu_has_avx512_vp2intersect boot_cpu_has(X86_FEATURE_AVX512_VP2INTERSECT)
 #define cpu_has_tsx_force_abort boot_cpu_has(X86_FEATURE_TSX_FORCE_ABORT)
 #define cpu_has_serialize       boot_cpu_has(X86_FEATURE_SERIALIZE)
+#define cpu_has_amx_tile        boot_cpu_has(X86_FEATURE_AMX_TILE)
 
 /* CPUID level 0x00000007:1.eax */
 #define cpu_has_avx_vnni        boot_cpu_has(X86_FEATURE_AVX_VNNI)


