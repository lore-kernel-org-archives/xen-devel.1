Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7399BC54FDF
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 08:48:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1377334.1623439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpMRI-0007TW-TF; Thu, 30 Jul 2026 08:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1377334.1623439; Thu, 30 Jul 2026 08:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpMRI-0007TP-Q9; Thu, 30 Jul 2026 08:48:28 +0000
Received: by outflank-mailman (input) for mailman id 1377334;
 Thu, 30 Jul 2026 08:48:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wpMRG-0007TJ-Uu
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 08:48:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpMRG-002TpQ-Bh
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 10:48:26 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6b0fd4-e002-0a2a0a5209dd-0a2a4506ac90-20
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 10:48:26 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6b0fd9-195a-0a2a45060019-d155802bb8a8-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 10:48:26 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-496bb7cdf51so17880185e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 01:48:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49764d752dbsm78861845e9.3.2026.07.30.01.48.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2026 01:48:24 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785401305; x=1786006105; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MPEvPk/rIMlHipbTjdNeheE/8sSaPGbac6hmlR4fCYg=;
        b=cavn2RlCzA7ehFXDzyikaO5EMwm26GObCUCK7eThTxHh/YrrlraQyle0l3ZnzZiEsA
         PSVR2Vw9eCTHJ4sgLdi4S2ZUironxwltTrMYu/xFQh+Jr10DH1Sln/fXwhdhcSSb86WU
         kX5MrbmVF574LXem30Ncmr9vtaWdsx6Y/tSzeNLzd792UGEnMxMl5olCYbtSFhbShElA
         WOZNnUmJY79LJwSyUgxokZ/Wjigdfr4LH/41zdiLSZlI2OKiTWgfUGsb04c55iNqXS+g
         OIKNcErJDTLMs7RIYESgw1FHqWI4TN9jW/G4LgG83vRldTLYK1Cw5zRAmQxTtJrxkQ0N
         Kx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785401305; x=1786006105;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MPEvPk/rIMlHipbTjdNeheE/8sSaPGbac6hmlR4fCYg=;
        b=n7B/BZpyfDw8c8CwLnc5yOA7onGHUMOikIQyGP3vH5hTBZdXuQyBmuE0YP1Ppyfy7Z
         +RMoNON3kR2dI0DKLgS+PCV4ZTpXmZnif+Tuo2Tty1Bc2f5yg8VN19MGywBrLpFHJTPD
         UMTosXT/v9ttCSwP2yb7IJSgoPAU+WdiBz6wMqUwOTLCnme1cfPn6nAZ31xV7aAnfDNg
         pYTuNpx4QTLNhCeh+mO2QZUb1ChCCc0LDcfYZUC7Cqzddj4H7TLh5KyfFIFdEfgPlkWo
         w6VTvMLsKOxjkAxLunbzJUQl30+JZRbaiVxTIJ0n7ZYi81zOzjYi13CSdIzrgwZrGiqy
         40gg==
X-Gm-Message-State: AOJu0Yy8g0GdokVt6MIMIBcsvnq2v7vvLd9GdVq2tefXwqSY+G9OQ9F8
	e5rBWdvsU9aQcVaoFGzT7O+yMEHSZQVXxAFoVLH6fx9RCHVfDzd4lKG8f3RyENrGXswEZgjebG9
	UMPTcmw==
X-Gm-Gg: AR+sD13MxrWOMbrL1D079gUNubY6SIoKszgiVuSyRTd7phfx2NgY1PdQqhP6KuPP+i1
	8i5Pi8xexspzlQkXC3bVsaa8kdQOh/Ks8O+fbGffi8PHto0Cauii9zD0uJhnjCAUQHusUmu2bY3
	AI27fOESvbEEnj+zp4TsRJCOBHZnsV82wdobKWWVSt+Md8H9DNobfRYvEd4fVCN3CddfpecBi3e
	EgpHmAttuUS9osEakTr4rAPVGJheL3hyJ0yGt/BgDG7l2xNq2GUynfO/8qCqiXfZARGj7mLw+58
	UCQ0DLY9Z3EG8gIU6ly6qVgeN4GxH2cEbu/5aBDbkTuWikjAVbbIJt386LEp/ZJJ0qzx9nEATKa
	QAZfeGejh8M8cy+HIGUh/LXVtPMpf+nqTAw2LfFS1yBk222Ihv7dW7XnIVHDMANYPuqtpvDwMfe
	uc8o5RRUhJualBvOuwvDqec6l4rniOWePfhOdj5MbpXfnH+6vDKPoR9t8bLeQQMDhkPt6rUY77c
	jtzBGtqJbyVOHkpTA1a9OrdaKHe7ZiYs0pHuMVFJo9vhtuYXLOe
X-Received: by 2002:a05:600c:8707:b0:493:c182:6b08 with SMTP id 5b1f17b1804b1-49800ed12f2mr21333225e9.36.1785401305382;
        Thu, 30 Jul 2026 01:48:25 -0700 (PDT)
Message-ID: <32b8a5a6-a34a-4e4b-922b-b5daa41c6e56@suse.com>
Date: Thu, 30 Jul 2026 10:48:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: spilt vex_np from vex_none
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1785401306-F76C877B-5EC47E59/0/0
X-purgate-type: clean
X-purgate-size: 2972

..., undoing the aliasing between two distinct enums, and more in line
with how the SDM nowadays names things.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This becomes necessary in the APX series (yet to be posted), but I think
it's a good idea to do the split anyway.

--- a/xen/arch/x86/x86_emulate/0f01.c
+++ b/xen/arch/x86/x86_emulate/0f01.c
@@ -34,7 +34,7 @@ int x86emul_0f01(struct x86_emulate_stat
     case 0xc6:
         switch ( s->vex.pfx )
         {
-        case vex_none: /* wrmsrns */
+        case vex_np: /* wrmsrns */
             vcpu_must_have(wrmsrns);
             generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
             fail_if(!ops->write_msr);
@@ -120,7 +120,7 @@ int x86emul_0f01(struct x86_emulate_stat
     case 0xe8:
         switch ( s->vex.pfx )
         {
-        case vex_none: /* serialize */
+        case vex_np: /* serialize */
             vcpu_must_have(serialize);
             asm volatile ( ".byte 0x0f, 0x01, 0xe8" ); /* Binutils >= 2.34, Clang >= 11 */
             break;
@@ -154,7 +154,7 @@ int x86emul_0f01(struct x86_emulate_stat
     case 0xee:
         switch ( s->vex.pfx )
         {
-        case vex_none: /* rdpkru */
+        case vex_np: /* rdpkru */
             if ( !ops->read_cr ||
                  ops->read_cr(4, &cr4, ctxt) != X86EMUL_OKAY )
                 cr4 = 0;
@@ -171,7 +171,7 @@ int x86emul_0f01(struct x86_emulate_stat
     case 0xef:
         switch ( s->vex.pfx )
         {
-        case vex_none: /* wrpkru */
+        case vex_np: /* wrpkru */
             if ( !ops->read_cr ||
                  ops->read_cr(4, &cr4, ctxt) != X86EMUL_OKAY )
                 cr4 = 0;
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -1862,7 +1862,7 @@ int x86emul_decode(struct x86_emulate_st
     case simd_packed_int:
         switch ( s->vex.pfx )
         {
-        case vex_none:
+        case vex_np:
             if ( !s->vex.opcx )
             {
                 s->op_bytes = 8;
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -195,10 +195,9 @@ enum simd_opsize {
 };
 typedef uint8_t simd_opsize_t;
 
-#define vex_none 0
-
 enum vex_opcx {
-    vex_0f = vex_none + 1,
+    vex_none,
+    vex_0f,
     vex_0f38,
     vex_0f3a,
     evex_map5 = 5,
@@ -206,7 +205,8 @@ enum vex_opcx {
 };
 
 enum vex_pfx {
-    vex_66 = vex_none + 1,
+    vex_np,
+    vex_66,
     vex_f3,
     vex_f2
 };
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6031,7 +6031,7 @@ x86_emulate(
         pvex = copy_VEX(opc, vex);
         pvex->opcx = vex_0f;
         if ( elem_bytes == 4 )
-            pvex->pfx = vex_none;
+            pvex->pfx = vex_np;
         opc[0] = 0x50; /* vmovmskp{s,d} */
         /* Use %rax as GPR destination and VEX.vvvv as source. */
         pvex->r = 1;

