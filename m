Return-Path: <SRS0=VIWx=JT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F57C433ED
	for <xen-devel@archiver.kernel.org>; Thu, 22 Apr 2021 14:55:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06D6361406
	for <xen-devel@archiver.kernel.org>; Thu, 22 Apr 2021 14:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06D6361406
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.115548.220488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZajW-0005xa-9o; Thu, 22 Apr 2021 14:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115548.220488; Thu, 22 Apr 2021 14:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZajW-0005xS-6i; Thu, 22 Apr 2021 14:55:10 +0000
Received: by outflank-mailman (input) for mailman id 115548;
 Thu, 22 Apr 2021 14:55:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZajV-0005xM-1u
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 14:55:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d38beecf-193e-4509-a67c-88b993647bf2;
 Thu, 22 Apr 2021 14:55:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 67C13B16D;
 Thu, 22 Apr 2021 14:55:07 +0000 (UTC)
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
X-Inumbo-ID: d38beecf-193e-4509-a67c-88b993647bf2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619103307; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wgsKprQTlfADQ7Dypqlzd3WaFpCIjsLFSBPxGBvAlYo=;
	b=Z5jbW+Ic6sr7FGZtl64EWJU2IZjQNZ4aS32ryqANItdFgZJu5ix68GkEcRx1AEMMDGqBxM
	zQdX2Kb5I7w3RMwMNINosct+C+hM8k16O5KdVQ7xEILlaSZMRAhrnEjKJruYxQBkvug+X0
	55croDHU8wUqhVoK23YwLB9BmoB3Swc=
Subject: [PATCH v3 18/22] x86emul: support TILEZERO
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Message-ID: <d9d2a273-e366-c007-ddbd-a94ba3c18fb5@suse.com>
Date: Thu, 22 Apr 2021 16:55:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This is relatively straightforward, and hence best suited to introduce a
few other wider use pieces.

Testing of this will be added once a sensible test can be put together,
i.e. when support for at least TILELOADD (to allow loading non-zero
values in the first place) is also there.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1338,6 +1338,7 @@ static const struct vex {
     { { 0x49, 0x00 }, 2, F, R, pfx_no, W0, L0 }, /* ldtilecfg */
     { { 0x49, 0x00 }, 2, F, W, pfx_66, W0, L0 }, /* sttilecfg */
     { { 0x49, 0xc0 }, 2, F, N, pfx_no, W0, L0 }, /* tilerelease */
+    { { 0x49, 0xc0 }, 2, F, N, pfx_f2, W0, L0 }, /* tilezero */
     { { 0x50 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpbusd */
     { { 0x51 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpbusds */
     { { 0x52 }, 2, T, R, pfx_66, W0, Ln }, /* vpdpwssd */
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -3725,6 +3725,31 @@ x86_decode(
 #undef insn_fetch_bytes
 #undef insn_fetch_type
 
+#ifndef X86EMUL_NO_SIMD
+
+static void sttilecfg(struct x86_tilecfg *tilecfg)
+{
+    /* sttilecfg (%rdi) */
+    asm volatile ( ".byte 0xc4, 0xe2, 0x79, 0x49, 0x07"
+                   : "=m" (*tilecfg) : "D" (tilecfg) );
+}
+
+static bool tiles_configured(const struct x86_tilecfg *tilecfg)
+{
+    return tilecfg->palette;
+}
+
+static bool tile_valid(unsigned int tile, const struct x86_tilecfg *tilecfg)
+{
+    /*
+     * Considering the checking LDTILECFG does, checking either would in
+     * principle be sufficient.
+     */
+    return tilecfg->colsb[tile] && tilecfg->rows[tile];
+}
+
+#endif /* X86EMUL_NO_SIMD */
+
 /* Undo DEBUG wrapper. */
 #undef x86_emulate
 
@@ -9584,6 +9609,29 @@ x86_emulate(
         }
         goto unrecognized_insn;
 
+    case X86EMUL_OPC_VEX_F2(0x0f38, 0x49):
+        generate_exception_if(!mode_64bit() || vex.l || vex.w, EXC_UD);
+        if ( ea.type == OP_REG )
+        {
+            switch ( modrm_rm & 7 )
+            {
+            case 0: /* tilezero */
+                host_and_vcpu_must_have(amx_tile);
+                get_fpu(X86EMUL_FPU_tile);
+                sttilecfg(&mmvalp->tilecfg);
+                generate_exception_if(!tiles_configured(&mmvalp->tilecfg),
+                                      EXC_UD);
+                generate_exception_if(!tile_valid(modrm_reg, &mmvalp->tilecfg),
+                                      EXC_UD);
+                op_bytes = 1; /* fake */
+                goto simd_0f_common;
+
+            default:
+                goto unrecognized_insn;
+            }
+        }
+        goto unrecognized_insn;
+
     case X86EMUL_OPC_VEX_66(0x0f38, 0x50): /* vpdpbusd [xy]mm/mem,[xy]mm,[xy]mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x51): /* vpdpbusds [xy]mm/mem,[xy]mm,[xy]mm */
     case X86EMUL_OPC_VEX_66(0x0f38, 0x52): /* vpdpwssd [xy]mm/mem,[xy]mm,[xy]mm */


