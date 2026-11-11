Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DA5606A88E
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 15:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LX9re6gN
Received: from list by lists.xenproject.org with outflank-mailman.1484114.1687477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9xc-0005Hq-4S; Wed, 11 Nov 2026 15:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484114.1687477; Wed, 11 Nov 2026 15:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9xc-0005HI-0K; Wed, 11 Nov 2026 15:10:04 +0000
Received: by outflank-mailman (input) for mailman id 1484114;
 Wed, 11 Nov 2026 15:10:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9xa-0004vV-VT
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:10:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9xa-00B9W1-51
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:10:02 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af48548-8faa-0a2a0a5109dd-0a2a4501bb1a-6
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:10:02 +0100
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af48549-5984-0a2a45010019-d1558034bd92-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:10:02 +0100
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4a4d7ae1ae9so30315905e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 07:10:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4988f5b1ce3sm9875989f8f.14.2026.11.11.07.10.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 07:10:01 -0800 (PST)
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
        d=suse.com; s=google; t=1794409801; x=1795014601; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HdWkJonNTG0SjeO8q3p5ecEM3PnVNlFpISGnraMjkhw=;
        b=LX9re6gNyYtchi2WJkNOIqDdL6WUg97806bjSKgWuL7nJ8ceAktlIknNSIe0Dd816h
         aXhY4aFwiTTkswUorJ//HbLOrsLvRIOH2jjd1jPesQMcgHP6nyBcx6U2OZQRgbXTn17s
         IW2cDJyrWMHEAHDVFneHQof7sC/1gD/NFYTr5s4BK35kmwD+fCH7yxeFDR3KkKxssLBk
         Hxt/eTpfXlKx0D93Hceg3DjmJcROgy1Xpc9j89WFNbCmzE9DBSl70iYNTaOeU6efXQWj
         6E7sulsOOlkhNqYfWwlHlYtdon5Ew3stex9OHcuI9pp0YpY/uncAV8GtbonFZToZQdZ1
         pnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794409801; x=1795014601;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HdWkJonNTG0SjeO8q3p5ecEM3PnVNlFpISGnraMjkhw=;
        b=uo+O7co5sEIJyJiPt5/4rSSco058eI1O3CZ1wObPSPJLZtEFuAaYfyXv5E8JntStDM
         ZiCGLqu3/b2Lw77q1MY9s83Xp8iLugqc3ZTAHM2dvQzyOwRL0uk1m8RW6G+B8wbYH01C
         qi1odFEUDcqBuOxa+V0480OCj8JtM8OIytZ3+X6dowQTlNb92aThEoQv8B4/m0uZsS1n
         c1d87GKSMMped2FLigI8ux9eTDzK6hepcHNQ/Rpkrpl7RNxuNvWSFjdbHMcKbD/cfuKu
         OeWFeH6KUxBpE16X/7v40yVMSayEzqAdgGJ0iHjowJ+p1WvqgwzCg9ciair3B9aDKZkm
         dOUA==
X-Gm-Message-State: APuU4Z/t/bCZ2duBX1SMWNORdkiHDSB2c3iXWBk8BM0AjGETuki/Wwp+
	ZFo7c5au9BLnrKOloMNLQbWIgvVpm29KfGkp4al+r56GTK040xb4TA9lFt3KlKIlRVxL1KO33Ub
	Yir+SBg==
X-Gm-Gg: AYBFou3bffUx5LRGhxaj8Zu8U72zA2LPIa9/ky0wTbeT4x7KjFiDOdkk5vYyBp7mZqy
	rB+ODvIQKSinSYXQTlbP4WMXnAyZICFxqzO44clR9ST5hhHKzVjC0AIeqoPEVK/Lg4bDuJS8nO4
	jXUOTJzQO2vlTamAqAEHthD/XlMCoXE5+efh/gd6e3y07RZz4RHVGEMYKObYSsquPP7/73EyCLv
	mAj/BywQaDp8Dfp3VGoTSN+RL9b2rAm4YqPnAVEfmVDWrosnRcUuSw7sXBfO1BBqmYS8RDpSVwJ
	yGwN9mwhOudR2dPtKCP/eldR0jpyhqtNhb8/9/yYQquxmu1F/lmKBgeHQx+2lY0BaOFkHZ3vU+j
	PZcU/9fsuobrBRDYtsOCAB8tkuwt0cZ2XE20Z0Sfv353VOHMn9UAHmpzvSdD3DyaJksXd6CPAt9
	pDJbZ9e0xnQnXNdDG5uY1OJX0Jtis/rpvJ8gixwUTsh4fma7uN1tSN14Gi4c+ETSJBzFZNPyp7v
	PzaLOOfGMU8Ylj68GULXZ0uTOMcf1Z5lPbwHL6+L1HWgCWaAUuLd7PPqWuLraD1LRix9NGSGS5X
	s1xAo8j+PC6KqOj5jx4+qyGBJE6TldLAZ10RISlxxVAz6FloWMzumCS8O2Jswhqcj1RiXynmq59
	aY9ifjvG0Kx4NOCC88nTRJpe46+KyQgur2otqE5k=
X-Received: by 2002:a05:600c:3e87:b0:4b7:6a8b:9df2 with SMTP id 5b1f17b1804b1-4ba0936f37bmr48040575e9.25.1794409801536;
        Wed, 11 Nov 2026 07:10:01 -0800 (PST)
Message-ID: <175d5317-8670-44f0-a24c-b5379b2399fb@suse.com>
Date: Wed, 11 Nov 2026 16:10:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 08/28] x86emul: introduce X86EMUL_FPU_{tilecfg,tile}
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
X-purgate-ID: tlsNG-d62444/1794409802-BEC61757-D7825061/10/78276251493
X-purgate-type: spam
X-purgate-size: 3704
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These will be used by AMX insns. They're not sensitive to CR0.TS, but
instead some are sensitive to XFD.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: Use X86_EXC_*. Re-base.
v3: Separate X86EMUL_FPU_tilecfg. Use XFD alternative logic instead of
    checking CR0.TS.
v2: New.

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -425,6 +425,14 @@ int x86emul_get_fpu(
             return X86EMUL_UNHANDLEABLE;
         break;
 
+    case X86EMUL_FPU_tilecfg:
+    case X86EMUL_FPU_tile:
+        ASSERT(mode_64bit());
+        if ( !(state->xcr0 & X86_XCR0_TILE_CFG) ||
+             !(state->xcr0 & X86_XCR0_TILE_DATA) )
+            return X86EMUL_UNHANDLEABLE;
+        break;
+
     default:
         break;
     }
@@ -434,6 +442,7 @@ int x86emul_get_fpu(
     if ( rc == X86EMUL_OKAY )
     {
         unsigned long cr0;
+        uint64_t xcr0_needed = 0;
 
         fail_if(type == X86EMUL_FPU_fpu && !ops->put_fpu);
 
@@ -458,15 +467,46 @@ int x86emul_get_fpu(
             /* Should be unreachable if VEX decoding is working correctly. */
             ASSERT((cr0 & X86_CR0_PE) && !(ctxt->regs->eflags & X86_EFLAGS_VM));
         }
-        if ( cr0 & X86_CR0_EM )
+
+        switch ( type )
+        {
+        default:
+            if ( cr0 & X86_CR0_EM )
+            {
+                generate_exception_if(type == X86EMUL_FPU_fpu, X86_EXC_NM);
+                generate_exception_if(type == X86EMUL_FPU_mmx, X86_EXC_UD);
+                generate_exception_if(type == X86EMUL_FPU_xmm, X86_EXC_UD);
+            }
+            generate_exception_if((cr0 & X86_CR0_TS) &&
+                                  (type != X86EMUL_FPU_wait ||
+                                   (cr0 & X86_CR0_MP)),
+                                  X86_EXC_NM);
+            break;
+
+        case X86EMUL_FPU_tilecfg:
+            break;
+
+        case X86EMUL_FPU_tile:
+            xcr0_needed = X86_XCR0_TILE_DATA;
+            break;
+        }
+
+        if ( xcr0_needed && ctxt->cpuid->xstate.xfd )
         {
-            generate_exception_if(type == X86EMUL_FPU_fpu, X86_EXC_NM);
-            generate_exception_if(type == X86EMUL_FPU_mmx, X86_EXC_UD);
-            generate_exception_if(type == X86EMUL_FPU_xmm, X86_EXC_UD);
+            uint64_t xfd;
+
+            fail_if(!ops->read_msr);
+            rc = ops->read_msr(MSR_XFD, &xfd, ctxt);
+            if ( rc == X86EMUL_OKAY && (xfd & xcr0_needed) )
+            {
+                fail_if(!ops->write_msr);
+                rc = ops->read_msr(MSR_XFD_ERR, &xfd, ctxt);
+                if ( rc == X86EMUL_OKAY )
+                    rc = ops->write_msr(MSR_XFD_ERR, xfd | xcr0_needed, ctxt,
+                                        false);
+                generate_exception_if(rc == X86EMUL_OKAY, X86_EXC_NM);
+            }
         }
-        generate_exception_if((cr0 & X86_CR0_TS) &&
-                              (type != X86EMUL_FPU_wait || (cr0 & X86_CR0_MP)),
-                              X86_EXC_NM);
     }
 
  done:
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -85,6 +85,8 @@ enum x86_emulate_fpu_type {
     X86EMUL_FPU_ymm, /* AVX/XOP instruction set (%ymm0-%ymm7/15) */
     X86EMUL_FPU_opmask, /* AVX512 opmask instruction set (%k0-%k7) */
     X86EMUL_FPU_zmm, /* AVX512 instruction set (%zmm0-%zmm7/31) */
+    X86EMUL_FPU_tilecfg, /* AMX configuration (tilecfg) */
+    X86EMUL_FPU_tile, /* AMX instruction set (%tmm0-%tmmN) */
     /* This sentinel will never be passed to ->get_fpu(). */
     X86EMUL_FPU_none
 };


