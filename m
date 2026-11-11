Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA51606A337
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 15:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VbZ/irW5
Received: from list by lists.xenproject.org with outflank-mailman.1484214.1687578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRA2u-00030d-V4; Wed, 11 Nov 2026 15:15:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484214.1687578; Wed, 11 Nov 2026 15:15:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRA2u-00030W-RR; Wed, 11 Nov 2026 15:15:32 +0000
Received: by outflank-mailman (input) for mailman id 1484214;
 Wed, 11 Nov 2026 15:15:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRA2u-00030Q-7O
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:15:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRA2t-009wwU-KC
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:15:31 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af48686-8faa-0a2a0a5109dd-0a2a450bcfbc-32
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:15:31 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af48693-b7e8-0a2a450b0019-d1558035d803-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:15:31 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a210470b49so27218345e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 07:15:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba08de826asm47774935e9.0.2026.11.11.07.15.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 07:15:30 -0800 (PST)
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
        d=suse.com; s=google; t=1794410131; x=1795014931; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6tjMTwythJM84W+eSJC5eZ2aQ0/4M+PoST7TJgIK1JM=;
        b=VbZ/irW5v6OIR1Aj8A+23VfIit3NfZ9P016txOsO2jQCIRHP/PzYHV1uEdsDJagcGr
         tCm0j4Rmb5V0DK7ZUq0qEbgBM/ZMfUEBgEUiklPomv4MyHBDlJj+FhBRxWR4oWzj7blZ
         nIyhrsYKh516ujGJyhYxI9m7/NdXnkBA73s5eMIT9k0d6iJmrnczTDsMBDOTwVE1FmiL
         5u9fVxSLrI8QdRk5ZW7xkuzf9XHqUbQG+3oMB+vt9mV9wCE9FjdCjXuWR0Q48qbSctk2
         +qm9wqWpvOc6IfNkhTuVmlA4CROQh1RftQ5eA4HoUWPYqyfYNNcVyYIfjpVtTo9IlTLg
         05lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794410131; x=1795014931;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6tjMTwythJM84W+eSJC5eZ2aQ0/4M+PoST7TJgIK1JM=;
        b=QOHBriid5oKkoWj2iOQTji2g38QYBAH3j+udZdA0ORFa0aqB/lWnqa+vM/uY8tG7tx
         IDNGJyZmkV7bK1gPG3LeqWG9MmVCVzKezI7w6Hc0nvtEI7lqFyYK3eJN58phVzctGvqW
         IczE2ISCojWagcET2D/w5MhRWsdsy0xJYYNl8MevPy1rtUu747gdCyj3rnu4ZGn8F1SP
         SurZLspo1Nwz0CoO3FkaRpmmdhBxxcBOC/U6c9hmY+yTWcWMAVBLH36MdIFsDm15PVO2
         jvRfDrevJOO/SI93SJvHS2TBSjqhtUgcZYnQbEt27ivbGGLHb4AW8ymvoVq4B8DDG0Ue
         T+Ew==
X-Gm-Message-State: APuU4Z9LjZLDVNvW57eOxNOEzdmIxQh8i5G0CZMDPc3Q6MsTaFBQt+Hg
	8nThTD6G4l3dSv4TDe/X4twHeTqL/hLmoODTjHQ2jFfA0GveAH+FFh7S8s3mjEQcLlxM3WZBOut
	Kb5dZ4g==
X-Gm-Gg: AYBFou3jtEH79f0GqRIitfY2GHyr51ybkHl2grMatQwHEZM/NiuRwtrdr75j9BX/V6R
	xwqCGtEWBfPIIZZOIEJ42Rwt0p/TKRCoYHlD0ltbFdYCHO23DKfkrLIsrckqCcR40KSSl6CaIhy
	wSvsriTktxQytQUB6yPx8wV/wVXbTD7s/xvoCA8WWIRWkeNJaFKXch61zpJesZFrlv7gyQZdBNT
	3nau06taLRhdyP8JYjvlPwab4CWBpyVDyKDCMpH+JZ0xvMMKOvDk3VoVVoOWavFKUr5mf/CdrfE
	ToaWBSmQHo7DxvIAe+ovU31ysEUSu30BImklWfbqORFACQwfxwwN2bXVRyp0GXYY/czax7BFA4W
	1qwsci/3EsBVHTokyMHAwQJ7P++uSdC3MA75KegLh9xVBOVIZLmRvy/tM5vefJPx0ERgHKG8tL+
	JurErEuFQhGMGAsVrZrCwdewr1xcp3ZaToeFzlls7fSnSIo7ewNdhMjfErUK2VOb5/Gr4uxZs5R
	QTtbZHESANueHHaW3QvZy+2iC1EOhsZbJW4mPwDPVeznnERh5MHzMfL8wWbWr+od8oQUVil6vxg
	u/shaPACx6cLkW5QYXKGSnP1lDn8TpysccxoMHg4oIcovLZH3UQy39EEJXQ4QXfxdAKN+1dAiVI
	os0QJnvIs7gog29rGog==
X-Received: by 2002:a05:600c:4e0e:b0:4a8:b8b4:6226 with SMTP id 5b1f17b1804b1-4ba093ae6f2mr47675685e9.28.1794410130967;
        Wed, 11 Nov 2026 07:15:30 -0800 (PST)
Message-ID: <76bf0a66-c200-4c78-81ce-5084922abf22@suse.com>
Date: Wed, 11 Nov 2026 16:15:29 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 18/28] x86: permit guests to use AMX and XFD
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>
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
X-purgate-ID: tlsNG-42698a/1794410131-A88C99EA-E5C02800/10/78276251493
X-purgate-type: spam
X-purgate-size: 3863
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These features are marked experimental (for only limited testing having
been done so far) and opt-in for guests.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: AMX-FP16 and AMX-COMPLEX. Re-base.
v3: New.

--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -20,6 +20,7 @@ The format is based on [Keep a Changelog
    - Support for AVX10.2. (Experimental)
    - Support for AVX10-V2-AUX. (Experimental)
    - Support for APX. (Experimental)
+   - Support for AMX and XFD. (Experimental)
 
 ### Removed
  - On Arm:
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -91,6 +91,10 @@ For the Cortex A77 r0p0 - r1p0, see Erra
 
     Status: Experimental
 
+### x86 AMX and XFD
+
+    Status: Experimental
+
 ### IOMMU
 
     Status, AMD IOMMU: Supported
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -182,7 +182,7 @@ XEN_CPUFEATURE(XSAVEOPT,      4*32+ 0) /
 XEN_CPUFEATURE(XSAVEC,        4*32+ 1) /*A  XSAVEC/XRSTORC instructions */
 XEN_CPUFEATURE(XGETBV1,       4*32+ 2) /*A  XGETBV with %ecx=1 */
 XEN_CPUFEATURE(XSAVES,        4*32+ 3) /*S  XSAVES/XRSTORS instructions */
-XEN_CPUFEATURE(XFD,           4*32+ 4) /*   MSR_XFD{,_ERR} (eXtended Feature Disable) */
+XEN_CPUFEATURE(XFD,           4*32+ 4) /*a  MSR_XFD{,_ERR} (eXtended Feature Disable) */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:0.ebx, word 5 */
 XEN_CPUFEATURE(FSGSBASE,      5*32+ 0) /*A  {RD,WR}{FS,GS}BASE instructions */
@@ -287,10 +287,10 @@ XEN_CPUFEATURE(TSXLDTRK,      9*32+16) /
 XEN_CPUFEATURE(PCONFIG,       9*32+18) /*   PCONFIG instruction */
 XEN_CPUFEATURE(ARCH_LBR,      9*32+19) /*   Architectural Last Branch Record */
 XEN_CPUFEATURE(CET_IBT,       9*32+20) /*   CET - Indirect Branch Tracking */
-XEN_CPUFEATURE(AMX_BF16,      9*32+22) /*   AMX BFloat16 instruction */
+XEN_CPUFEATURE(AMX_BF16,      9*32+22) /*a  AMX BFloat16 instruction */
 XEN_CPUFEATURE(AVX512_FP16,   9*32+23) /*A  AVX512 FP16 instructions */
-XEN_CPUFEATURE(AMX_TILE,      9*32+24) /*   AMX Tile architecture */
-XEN_CPUFEATURE(AMX_INT8,      9*32+25) /*   AMX 8-bit integer instructions */
+XEN_CPUFEATURE(AMX_TILE,      9*32+24) /*a  AMX Tile architecture */
+XEN_CPUFEATURE(AMX_INT8,      9*32+25) /*a  AMX 8-bit integer instructions */
 XEN_CPUFEATURE(IBRSB,         9*32+26) /*A  IBRS and IBPB support (used by Intel) */
 XEN_CPUFEATURE(STIBP,         9*32+27) /*A  STIBP */
 XEN_CPUFEATURE(L1D_FLUSH,     9*32+28) /*S  MSR_FLUSH_CMD and L1D flush. */
@@ -314,7 +314,7 @@ XEN_CPUFEATURE(FRED,         10*32+17) /
 XEN_CPUFEATURE(LKGS,         10*32+18) /*   Load Kernel GS instruction */
 XEN_CPUFEATURE(WRMSRNS,      10*32+19) /*S  WRMSR Non-Serialising */
 XEN_CPUFEATURE(NMI_SRC,      10*32+20) /*   NMI-Source Reporting */
-XEN_CPUFEATURE(AMX_FP16,     10*32+21) /*   AMX FP16 instruction */
+XEN_CPUFEATURE(AMX_FP16,     10*32+21) /*a  AMX FP16 instruction */
 XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
 XEN_CPUFEATURE(LAM,          10*32+26) /*   Linear Address Masking */
 XEN_CPUFEATURE(MSRLIST,      10*32+27) /*s  {RD,WR}MSRLIST instructions */
@@ -359,7 +359,7 @@ XEN_CPUFEATURE(MSR_IMM,            14*32
 /* Intel-defined CPU features, CPUID level 0x00000007:1.edx, word 15 */
 XEN_CPUFEATURE(AVX_VNNI_INT8,      15*32+ 4) /*A  AVX-VNNI-INT8 Instructions */
 XEN_CPUFEATURE(AVX_NE_CONVERT,     15*32+ 5) /*A  AVX-NE-CONVERT Instructions */
-XEN_CPUFEATURE(AMX_COMPLEX,        15*32+ 8) /*   AMX Complex Instructions */
+XEN_CPUFEATURE(AMX_COMPLEX,        15*32+ 8) /*a  AMX Complex Instructions */
 XEN_CPUFEATURE(AVX_VNNI_INT16,     15*32+10) /*A  AVX-VNNI-INT16 Instructions */
 XEN_CPUFEATURE(UTMR,               15*32+13) /*   User Timer */
 XEN_CPUFEATURE(PREFETCHI,          15*32+14) /*A  PREFETCHIT{0,1} Instructions */


