Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8F3C982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 10:41:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428585.1651446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xvu-00038o-LL; Tue, 22 Sep 2026 10:41:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428585.1651446; Tue, 22 Sep 2026 10:41:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8xvu-00038h-Hj; Tue, 22 Sep 2026 10:41:06 +0000
Received: by outflank-mailman (input) for mailman id 1428585;
 Tue, 22 Sep 2026 10:41:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8xvt-000385-05
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 10:41:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8xvs-005Mj6-D7
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 12:41:04 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab25b39-e002-0a2a0a5209dd-0a2a450c8f74-16
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 12:41:04 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab25b40-f479-0a2a450c0019-d155dd32a90c-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 12:41:04 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-48442ea8f59so354503f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 03:41:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4886277e84dsm4339915f8f.20.2026.09.22.03.41.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 03:41:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1790073664; x=1790678464; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ufeWPTw2a32SZPJ7XqPuk3knJu3zYqx8RaOhX4Rhsds=;
        b=PsLcXOSgdnD2mk6oyCADDAE09QfHh4o4kgZloyWSOF4qbWZelh76OhTTxHpviHUrb7
         1IOoU6sYU9nb2BpAJJR5RN7SxSTGRzPrS6OvjLbn2ad8KVFcA8krZGEO463Uo5F9AWpr
         ai5pkxs+yTrJC95evssN9FdrzISE8nsmjzbV112Dq3l7NhQO7JdYmrv28VT7aG9sff8B
         8g7t6xS+wvffU8mWalUGa8rp40ftSKM20UlLwvQAwElLKyk5ZlzjsJRMGj5FPpEjY5N3
         zSM/QMhPBkbRM32SFDSjCe0nmp0yZtesxDpMaqbMKGvNU7yDBnQe56vfCRvYeu2cyCEq
         LsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790073664; x=1790678464;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ufeWPTw2a32SZPJ7XqPuk3knJu3zYqx8RaOhX4Rhsds=;
        b=s7izs/90DaCbedHbxfjQDii/ly0Y5LYJs2qNf9aeZKV8aHff3mlFTlsPQ1oy0tthsR
         h0FYQDLT3GfAMiBDaHubM4dYulVQxWpDSWi5ra2ufInngklymgRW4JMxXEkAGIQfdVka
         OpftQJMM1Fr5ZTCFgJ1A+j158RP3OLydhGZ8eWcATEo+oSfTt6BdBQJzDIsS4DtK57Ez
         WX+qcLAjxyxdSJYwgtvJ0KoPhlugFKw7reK2YDbBTJa4+bpp1tjubcWJkuJnaPtCsS4M
         9v6jmPTStY14T9LZcOZ96N41cWKJb3gxk1gzRriXgbou34/kLpporj/YlAKR9LtNlNft
         qwHQ==
X-Gm-Message-State: AFuF++m7aq+v/NZImVEd14wrrxqWZ1Ck9G/r403J2YG7oMaiMNXCSh1i
	YoFUQ2tiT2o84yv/Sd2aa6VsZQS9Qae67JjA7o8z8NomTcS7LTJA/3+IAYktbROvHkUmFstKnjg
	FGGH7Og==
X-Gm-Gg: AYBFou2kL/2y6qDDA2kID09fIrEJGcHGnVxVch0rEspLwZV9Wtyp+J/dulkqeFDaCNF
	44oE6F2CNUgXejHd2RrTQkLpMplYajsqq+3CcN0TME8ahC5usLlq2R1S/1SXcxJKo2R7XSj3347
	rduRBT4DsudwlJ+7tq4n6Fal+1XcjQ5i7aP0Chxq186iYFVAslmHvci/fQWyB8d18j8tY5dJTbZ
	1g2rqX/6HM2FV6W7KNcBb1vIlok/a5kkngI9csfRaE8oOcRtKN0U0sx/3dWAL4qtDQIqu2p9hTN
	24DVMcARwi9OiMxp7HWhOlIho1wyMfdACxLsNXeFMa0pi+2uf42cFv4Q2a0g/oXolX0ZQvl9rdB
	JzM/d8/DIQcObTAgE9o/AjhAOehSymzvlN/pjtR/PDj1YiLD5n3ynTxFF2zftLQYL1wS4IbXwOx
	EZn+jdT+2IgtOyrPRGNZhqoKoNY0ucQb3k1daA4PsWb+nSohGw3v62WSv5PzYbshb6RVsmoaZ4P
	30xyt/RDMf2lsdxSojTdoMM559pAqMZ7w3UdHQoGN928eg7roViVVbJuMHpfHQ=
X-Received: by 2002:a05:6000:4303:b0:487:9bb:a875 with SMTP id ffacd0b85a97d-48860f7eb5bmr3761591f8f.3.1790073663620;
        Tue, 22 Sep 2026 03:41:03 -0700 (PDT)
Message-ID: <cfcb65ff-1189-40d7-8880-6015bfccedbd@suse.com>
Date: Tue, 22 Sep 2026 12:41:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Arm: drop ENFORCE_UNIQUE_SYMBOLS=y workaround again
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
X-purgate-ID: tlsNG-d25034/1790073664-772D8A5B-C538156D/0/0
X-purgate-type: clean
X-purgate-size: 2203

Both arm<NN>/head.S and arm<NN>/mmu/head.S have a local symbol "fail".
Without a .file directive locals will be associated with the path-less
object filename (head.o). Hence the two symbol names collide. Add .file,
also in arm<NN>/mpu/head.S for consistency.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Likely other .S files should also gain .file, but for now that's largely
cosmetic and hence is left out.

--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -91,9 +91,6 @@ include scripts/Makefile.link
 # Suppress orphan section checking for the time being.
 orphan-handling-y :=
 
-# Downgrade duplicate symbol errors to warnings for the time being.
-syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SYMBOLS) := --warn-dup
-
 .PHONY: include
 include:
 
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -17,6 +17,8 @@
  * GNU General Public License for more details.
  */
 
+        .file __FILE__
+
 #include <asm/page.h>
 #include <asm/early_printk.h>
 
--- a/xen/arch/arm/arm32/mmu/head.S
+++ b/xen/arch/arm/arm32/mmu/head.S
@@ -5,6 +5,8 @@
  * Arm32 MMU specific start-of-day code.
  */
 
+        .file __FILE__
+
 #include <asm/page.h>
 #include <asm/early_printk.h>
 
--- a/xen/arch/arm/arm32/mpu/head.S
+++ b/xen/arch/arm/arm32/mpu/head.S
@@ -3,6 +3,8 @@
  * Start-of-day code for an Armv8-R-AArch32 MPU system.
  */
 
+        .file __FILE__
+
 #include <asm/arm32/macros.h>
 #include <asm/arm32/sysregs.h>
 #include <asm/cpregs.h>
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -20,6 +20,8 @@
  * GNU General Public License for more details.
  */
 
+        .file __FILE__
+
 #include <asm/page.h>
 #include <asm/early_printk.h>
 
--- a/xen/arch/arm/arm64/mmu/head.S
+++ b/xen/arch/arm/arm64/mmu/head.S
@@ -5,6 +5,8 @@
  * Arm64 MMU specific start-of-day code.
  */
 
+        .file __FILE__
+
 #include <asm/page.h>
 #include <asm/early_printk.h>
 
--- a/xen/arch/arm/arm64/mpu/head.S
+++ b/xen/arch/arm/arm64/mpu/head.S
@@ -3,6 +3,8 @@
  * Start-of-day code for an Armv8-R MPU system.
  */
 
+        .file __FILE__
+
 #include <asm/mpu/regions.inc>
 
 /*

