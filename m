Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385E8C5DF94
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2026 08:45:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399137.1635349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wymmC-00083O-9I; Tue, 25 Aug 2026 08:45:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399137.1635349; Tue, 25 Aug 2026 08:45:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wymmC-00083H-6b; Tue, 25 Aug 2026 08:45:00 +0000
Received: by outflank-mailman (input) for mailman id 1399137;
 Tue, 25 Aug 2026 08:44:59 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wymmB-000831-41
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 08:44:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wymmA-00AZJQ-Gs
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 10:44:58 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8d55fd-2eae-0a2a0a5409dd-0a2a45079e92-40
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 10:44:58 +0200
Received: from [209.85.208.45] (helo=mail-ed1-f45.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8d560a-b4ea-0a2a45070019-d155d02dd4b0-3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 10:44:58 +0200
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-6a144c8eea2so8105011a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 01:44:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a59e0126edsm14169067a12.7.2026.08.25.01.44.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2026 01:44:57 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787647498; x=1788252298; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PVJaUDGprniCHOdS15F0kmtFEIvAxLzg9FMvZh5Wvbg=;
        b=eQVZz19qPywpzlSOp1/6UNuvjsSGVaJVQSC5nlS3Mr7ucnbIeZhao3hA1j1WnLvp/q
         cn6cY1lLRguJZS9zaG+x/MpcMMROFlpCcq3JWbWxktqPSSk6I/h4j0pVcujQ2CMdv42B
         5Tsb1NnSR/jmN9hpqZwjK572G5hIH5gGja04gjcNL77Rc6Xjn/LadErRF9pVNCzuGLCF
         yhrD65A+ualLjLRtMw/V/C363fAu3a89oMMDPGyWfI017GJ1PctCViUohk1ImHTwhy4Y
         soFBdy6ss42zwMMS0x1KuzgvAk6ygi/kMQe2XLLE6Y6/2LnC6gsJuAjoTbtiftjqD/y9
         biiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787647498; x=1788252298;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PVJaUDGprniCHOdS15F0kmtFEIvAxLzg9FMvZh5Wvbg=;
        b=BtXhF6f4QweUEuQgWhLC4fsr53ElR7eo+CKdq/rh1Kf48Tc2qm2f5Ymzms9v4ZNGe9
         JWAoR/7TQvFdVw5nxhYQqOAY7p15IbCwEMUjDol51FXHgn/tEsLsuqWAF03L52e/Kpsr
         oOUUOnSEx8HmjYO4d5er9R5OdYwbYS3g8jW6RVQAVOJQiD6rwpUXni+1IsVgnWyAtjZK
         PkuJ7HnbqvMdFfbM+T9L2FPqaBDs1INmvwFg3gj+ZE854VHGPVn9Mdzo8qr6LKqgtRWA
         CoFzGGvBLIC4q8mcoceIPj0Qgsg6VZxatUEGGEtnYgrZ1Bqk0E9O5cgODr7uRlDQiC5c
         NSGQ==
X-Gm-Message-State: AFuF++l45sqTlJndtvRtkz9ajfnLCJskj0tsAluBl+xUI2IgKPMf5L+s
	kYJ9+KLKQXwbdcQU5GEd0GMESWzLsGRVuPAdjjCSL7+leespgPaC8epICknf1o17/W9iTv7J300
	+8QawUA==
X-Gm-Gg: AR+sD11Rks5/3spY9TkNeVInOvNaObvv98j2CmqJXOQAqG06u0KOf9cCkFqwgbt1VHN
	+jFL7IatecU3NPcVDf3PHwjhfPlclhJqDmEkEH4oCLY88Tl+u9iDCBanHqu3PCU+m1sOmnK6n45
	ridDgJg+KoWbgHA6niscm2pxDw+WfD/vI172c/oVdX3CFn/MoQjEX9AS7FdzUSsp4KgIKY2jGCL
	QHKq+DnjgddTOyX4kNLsshbYOoRqpuxP9EQfup2zBoTxmwHep4pC8YU2zvOE76H2YEXivvzz9+c
	aFoHxk6s+s2fXZhndHyTIAgl3EHG6c0NRaIvSJxsAQX3vO3o0zGGhFS9nacYf5X3z0Qio//OcTU
	uu5r5GOztci0ZEAuaZgAyU/J4BccV/Jqcp5Atsk8e0b1rMIyuBT+8JoK2Bwk3U6oG1sez3QiMtp
	E0BPHPleVGVb83Rwg4sKI1AjJGy6UGZWaVFFTB0nlr/YG/OO8cTtcX7NVyv+/IbVMFFEZMA5K1Q
	tgRD7BZALNC72O070JXOubgGD8iK3RBYh4f8t4Jw8GbpF2T8NZY
X-Received: by 2002:a05:6402:a0cd:b0:6a1:babc:5b9e with SMTP id 4fb4d7f45d1cf-6a582b0b815mr25053651a12.5.1787647498006;
        Tue, 25 Aug 2026 01:44:58 -0700 (PDT)
Message-ID: <2c162d3b-a038-44f6-85db-6481e1f36138@suse.com>
Date: Tue, 25 Aug 2026 10:44:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 6/6] RISC-V: place .sdata / .srodata / .riscv.attributes
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <fb75dbda-63a5-4ebd-abf6-5ce6b3b5ba3f@suse.com>
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
In-Reply-To: <fb75dbda-63a5-4ebd-abf6-5ce6b3b5ba3f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1787647498-374D3AE4-02A0BF6D/0/0
X-purgate-type: clean
X-purgate-size: 1611

Of the short-data sections, only .sbss is presently mentioned in the
linker script. Place them next to, but ahead of their "normal" data
sections.

.riscv.attributes can go towards the tail of the image, next to (ahead of)
debug info.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Seeing where .sbss lives, does positioning really not matter at all? I
would have expected that short-data sections want to live close together,
and specifically close to .text / .init.text (seeing that such data is
accessed using AUIPC). I'm puzzled that the psABI doesn't even mention
them, hence leaving it open how exactly they are to be used.

What remains to eliminate orphan section warnings is the placement of
.note.GNU-stack (which perhaps wants dealing with on all of Arm, PPC, and
RISC-V together, ideally unifying with x86) and (odd at the first glance,
but dealt with on x86 as well, i.e. may again want unifying) that of a
number of .rela.* sections.

--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -44,6 +44,8 @@ SECTIONS
 
         BUGFRAMES
 
+        *(.srodata)
+        *(.srodata.*)
         *(.rodata)
         *(.rodata.*)
         VPCI_ARRAY
@@ -92,6 +94,7 @@ SECTIONS
         SCHEDULER_ARRAY
         HYPFS_PARAM
 
+        *(.sdata .sdata.*)
         *(.data .data.*)
         CONSTRUCTORS
     } :text
@@ -162,6 +165,8 @@ SECTIONS
     /* Section for the device tree blob (if any). */
     .dtb : { *(.dtb) } :text
 
+    .riscv.attributes : { *(.riscv.attributes) } :text
+
     DWARF2_DEBUG_SECTIONS
 
     DISCARD_SECTIONS


