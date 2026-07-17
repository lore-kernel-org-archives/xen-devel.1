Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E89C4451C
	for <xen-devel@archiver.kernel.org>; Fri, 17 Jul 2026 14:07:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1365004.1615800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkjCt-0007QG-M7; Fri, 17 Jul 2026 14:06:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1365004.1615800; Fri, 17 Jul 2026 14:06:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkjCt-0007Q9-JP; Fri, 17 Jul 2026 14:06:27 +0000
Received: by outflank-mailman (input) for mailman id 1365004;
 Fri, 17 Jul 2026 14:06:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wkjCs-0007Q3-4P
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 14:06:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkjCr-002XD9-6Z
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 16:06:25 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5a36df-bab6-0a2a0a5309dd-0a2a4505a258-2
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 16:06:25 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5a36e0-4cb1-0a2a45050019-d155dd34c809-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 16:06:25 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-475417f010dso4235610f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 07:06:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63eeb360sm4210830f8f.34.2026.07.17.07.06.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jul 2026 07:06:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1784297184; x=1784901984; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cyz/pOWmvDaPM3OJ65I6Hf+HbW3t+LcOA3wb/2W+hKU=;
        b=F3hnZj/2E1VNySOahApDYiPTxC/v3UtDNc5JLKDYzBSWDI8DqQxxA5QqaqI/EgfH+l
         GL+U1RBXbI7eegGeyCecPJqkC6eQryT12B1uy4DM1ITiAYFxOv5hbMbM+Fthkom1Bw6j
         58GMcYTSndS/By/8Cu0OSXY3NFUn+cEeDtZQrFQMqFt76lCtnD/8BtX+ieep/iXYhUHC
         AnB9mZAjkiDvyRI1gqib/Toep6z35T3w0kBF9KepFNod8lEBhpoOedKefyfaQL2qHhHT
         bHca4g6aKlru/HcJJTCajgVd27o7bnmCJnB4LBDVKy01MZ3r2wvYux17cw/U4FbnSf7m
         55QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784297184; x=1784901984;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cyz/pOWmvDaPM3OJ65I6Hf+HbW3t+LcOA3wb/2W+hKU=;
        b=NeTFWnefy+0kplL4lcvLHtXp3M1/YYN1KnBMr5SIV5WJhjinOSKMkqqFdHh7rqbH2O
         ZjtfVURzl1yvkt3XTXRjYxgqJ/+16cZtrw13KXxAZI+Jfmsx57NfVQUZb1XhEz32ppVm
         5kNsGT+Q/TSbFXFBb9HxblpWHaWWo7cRZ9usGk3h/zoG9oNVmiM5TosAC9sqz63YC0kF
         HgI0kpvuGoTI8nMEASOYyFpE90suWg+LuQGNYiKLOlLZSqiRW4rSCx2SnT46z3Kzz51v
         PQr7pDYNsh7xF7h8MamH4BRQA304fKJZ9DiNiKPnZA4zLqR+BaYdj4GeoaXSJXy0nJPq
         hWaQ==
X-Gm-Message-State: AOJu0YwUnT306gjnpsUgutqWsQUJeA3Nx8cYc9sgqiOBAGbMtHI2lIn6
	eLU7vZeZm8rlHiwfjBYFoJXaLXakjY5wPLVawsKkmLRAvZB4U15ZpD4HbZU57Ei8+1vshcOURTq
	zb76qkg==
X-Gm-Gg: AfdE7cl5I86rG8Yl7hLcZ6CJdE1eCewpgsJg71IlphXIzXSt9q7ySIp58eBpabL/Du6
	gXXrfTq8S7+uhUx3Eo37T8mkCYFvTnJOO4NhKXcIRPLgbe6a7cXh+zcSIDFpW8oIz662b4HYivD
	3r3CpfCl0qbtTnJA0OsO3kSQxI1NSTB50ht6kTtHYQM/Oobgzd7fIgUskCjVXHJuXc6LWz+Ndi7
	miiLGCCdt7V3DDzV30RYCxMvCV0WoEs0jvb42EVU7Yb7klogpaiom2jDgP0dPlf9n3kMXkfxUx6
	BunpXOSxW45Jsve5+ZzUWMqxWZkPU1PHGAcwlAW2jHG3Gx83fmGURUOZXe0ZqGQWGuc5DARsh3v
	eam844ha18EkdSIdDPwqN7/eV59m4Qz5QzTXKgiX33zabHK+G09veMqzYprIWqqQdtBax0bjZcG
	u0CnTCF1zPEAmv5Xc+HNxXkbPgz2/ioSHbITYoYP+mylVZdaw8GGcslGnDPrqIezMZ1U3nH0AzU
	VdC
X-Received: by 2002:a5d:5f94:0:b0:47f:5289:d5e1 with SMTP id ffacd0b85a97d-47f62337871mr3489042f8f.37.1784297184419;
        Fri, 17 Jul 2026 07:06:24 -0700 (PDT)
Message-ID: <0c34b3d1-2567-4d08-811b-12f9d49f95d7@suse.com>
Date: Fri, 17 Jul 2026 16:06:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: prune an excess EVEX.Z check
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
X-purgate-ID: tlsNG-c201ff/1784297185-F78BE2A1-5923A729/0/0
X-purgate-type: clean
X-purgate-size: 870

DstMem processing early in x86_emulate() raises #UD when EVEX.Z is set
with a memory destination. Open-coded checks like this one are therefore
dead / unreachable code, violating Misra rules.

Fixes: 4037a62ef93e ("x86emul: support AVX512F floating-point conversion insns")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7348,7 +7348,7 @@ x86_emulate(
         if ( evex_encoded() )
         {
             generate_exception_if((evex.w || evex.reg != 0xf || !evex.RX ||
-                                   (ea.type != OP_REG && (evex.z || evex.brs))),
+                                   (ea.type != OP_REG && evex.brs)),
                                   X86_EXC_UD);
             host_and_vcpu_must_have(avx512f);
             avx512_vlen_check(false);

