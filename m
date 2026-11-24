Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704DA606A322
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 13:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EqWTT1bi
Received: from list by lists.xenproject.org with outflank-mailman.1500935.1696979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVqbR-0002Bw-ID; Tue, 24 Nov 2026 13:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500935.1696979; Tue, 24 Nov 2026 13:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVqbR-0002Bp-FO; Tue, 24 Nov 2026 13:30:33 +0000
Received: by outflank-mailman (input) for mailman id 1500935;
 Tue, 24 Nov 2026 13:30:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVqbP-0002BR-N1
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 13:30:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVqbP-005TLt-2O
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 14:30:31 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b05916e-e002-0a2a0a5209dd-0a2a4505c8a4-28
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 14:30:31 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b059176-4cb1-0a2a45050019-d1558030f1bb-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 14:30:31 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4bb9d8e8e90so16330485e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 05:30:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6c61e53asm29153876f8f.59.2026.11.24.05.30.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2026 05:30:28 -0800 (PST)
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
        d=suse.com; s=google; t=1795527030; x=1796131830; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VU46UnoOFTSTF+vejMzYzFOZJoLf0Fed7xBJUJ6z7T4=;
        b=EqWTT1bi+jqHAaNY5D52tHScOKO2nCMFXGlEFH1DkfYX29eJ+7bOFVI5ZEqgZKw9YK
         bPBKz06fgYferxNvCtPGmymaI1wydfzWfjyHJ06z7avKXo8hcgIqBYRode8Wx6yCHaci
         RaR7EqMb/BbNkMzrHDDyNLWf3oMWD1JAdYu4I11iZ/wyW6JggtKUf7hjq6m5KQ/4taub
         Sw9p5HjFpdBMJXpv0OFjgfTA3BpnOs4Xeb0rWCHc32o6UT3nzzi7l8sVOOo6s6oVsVTz
         tQBx8PPpxesPiZzn04iIBzfbFbktIqsAgNY6Tt+etUwG9fuAhx3JQEWpkf34rXj6GDe/
         +KHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527030; x=1796131830;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VU46UnoOFTSTF+vejMzYzFOZJoLf0Fed7xBJUJ6z7T4=;
        b=A1Z7Qn7gWyUXymwcc1Ib0c5Gjs/w6040e80z2Sr0K+8evP3x1cKrwwmplcweP1JisO
         TBYp14ORs5QqqQActbfYWCdkK//1QD/l2ispDRXCJvyIwzN6lKihzWBl7sHZiBtjOTyJ
         UngCvbKA5oGlcMvVuvJbBvB7BUI69EUGQlURpLLS9XMmxbZugtJC0GXpHua4pr6ViOfc
         hHrnoXaoL1K7q+ts5W/xzSFI0kzFT864/BIPQh2ejXR/iZzFq8budMP8ggZy4npvsoR/
         e6A7IWSnOmTyQhREBC6Y8HbtDCwBW+s7Sd6guBGiaEN0mhmNsedhVih9EnJibxNXZIt8
         gRhw==
X-Gm-Message-State: APuU4Z/M5riiJBlOcYuJOQ+EeNqSc/CHJmB9WIUbS9ZknTS/t1hipXQx
	zCf2Om3RPq7cLzoIzt+RBQyWLSW9SM/8jhbIdXA6LOry+7BQ4Wl1Y9UZS7kO5TO5/vvDflmBjfj
	nU8Jowg==
X-Gm-Gg: AZFdTZfZ2Sn8ZYQB/OgSYjHxjSE/gf6PZeA2AKt/KQyepdDAlapJU8I6wndarVKXxs4
	Whzajz/mzdV62Fk/LUJZ+kGiPTAQE8eZqoNGf+fdc3fBuyPDPIVkYdPfrmPUf0x3+4Sz8IanZIY
	gV6mfDgt8mvXoKXffPglFBAoi60+8IGPFnokwXDh1zdy7zqEBpKqayaFyB5FE9o1B3KCz73Z7BM
	7POypYtxmOlbPYbPxNb9vt201YS5A08aj/B9jLlXd/hheSpDUeNBa99Pv6907iGZcBHFOwknq3q
	tFUSsLflS+gI8ARF3OBSY1H7u5OjDae0M3gETtfLguRN4wh/VEKIFRzjmmaISan38wOREnC/DqC
	nM3F/WlljMBQeN8z/52VnrRbU7lnzZ2+r09ipcqFJzyC2qfmO2nYI0MHJSfb4omxNX1rlxOQInH
	tvr7mAaAd4S4rlktnATRHiWalzI9i9WN7Jpjvf2ua3EbN9Qare/VkQ+7TeRaGwy0Q+SC1M92dzU
	JRDYudloj292PFhTaHQiEx48UgfIKbiwQFULHQ0hvqSEp8vvt92YXCm1scZdnjiVKSTWfo0uvH8
	UDhFZeHUyZcu3uxoY92CzLfrBUWxVHao08XJiYcFi+tPdH2dIARtDPIVYi0lqvgfLtGglZt7oLA
	nU1qrIA6E+Jx9gpSb
X-Received: by 2002:a05:600c:3ba3:b0:4bb:7571:5743 with SMTP id 5b1f17b1804b1-4bb88813444mr336422175e9.27.1795527029209;
        Tue, 24 Nov 2026 05:30:29 -0800 (PST)
Message-ID: <ef9d7231-32c5-4b7d-aa8c-b54cc0c48349@suse.com>
Date: Tue, 24 Nov 2026 14:30:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/2] x86/PV: correct descriptor read sanity check
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <ba2a2c31-24c4-4ca2-a2db-fa3745ce2fcb@suse.com>
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
In-Reply-To: <ba2a2c31-24c4-4ca2-a2db-fa3745ce2fcb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1795527031-F54AC2A1-88CB444A/10/78276251493
X-purgate-type: spam
X-purgate-size: 1370
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Checking what LAR returns against what we read from the descriptor table
requires that we check unaltered values. The clearing of L therefore needs
limiting: Do that just in *ar, and use the then unaltered desc.b in the
BUG_ON() instead.

Fixes: 8d6e195a2def ("Adjust emulation code to deal with compatibility mode guests")
Reported-by: Roger Pau Monné <roger.pau@amd.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/pv/emulate.c
+++ b/xen/arch/x86/pv/emulate.c
@@ -37,11 +37,12 @@ int pv_emul_read_descriptor(unsigned int
             return 0;
     }
 
-    if ( !insn_fetch )
-        desc.b &= ~_SEGMENT_L;
 
     *ar = desc.b & 0x00f0ff00;
-    if ( !(desc.b & _SEGMENT_L) )
+    if ( !insn_fetch )
+        *ar &= ~_SEGMENT_L;
+
+    if ( !(*ar & _SEGMENT_L) )
     {
         *base = ((desc.a >> 16) + ((desc.b & 0xff) << 16) +
                  (desc.b & 0xff000000U));
@@ -57,7 +58,8 @@ int pv_emul_read_descriptor(unsigned int
             asm volatile (
                 "larl %2,%0 ; setz %1"
                 : "=r" (a), "=qm" (valid) : "rm" (sel));
-            BUG_ON(valid && ((a & 0x00f0ff00) != *ar));
+            BUG_ON(valid && ((a ^ desc.b) & 0x00f0ff00));
+
             asm volatile (
                 "lsll %2,%0 ; setz %1"
                 : "=r" (l), "=qm" (valid) : "rm" (sel));


