Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBD6CC6B03
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 09:05:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446785.1662875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGYSD-0005gy-Ew; Tue, 13 Oct 2026 09:05:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446785.1662875; Tue, 13 Oct 2026 09:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGYSD-0005gr-CB; Tue, 13 Oct 2026 09:05:49 +0000
Received: by outflank-mailman (input) for mailman id 1446785;
 Tue, 13 Oct 2026 09:05:48 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGYSC-0005fw-4V
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 09:05:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGYSB-00CGXx-39
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 11:05:47 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acdf468-8faa-0a2a0a5109dd-0a2a4507e806-14
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 11:05:47 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acdf46a-b4ea-0a2a45070019-d155802cecfe-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 11:05:47 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4a1688d7769so22758605e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 02:05:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18d12fe04sm216034835e9.4.2026.10.13.02.05.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 02:05:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1791882346; x=1792487146; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J8/RNEe1LKfSGu/L13fCO0FEseR/7iXO6dPS72xbEQc=;
        b=aZCKUm7eHRPW2Th12/gcAUP7wPBvhlvnXAnC1+/I/M8KEN8n9Au46RylSx1XswaeUF
         kgdNPgBV1Pto6zjM1nmWjRC4ctdKdQgUCglGb1BS2Xbyz33evCxu8eOXwU8E3yopJZJ8
         4H3sjNJyAmYHmw1LldovUmWYj1/qJ4izgb51ViFGQy2YKuV20kYhOsHNM6FBPvq/pY8a
         XbJod5xWy1f9/OysnDKEt+e9rH0bd1ktprBHt6GGpNo6fusSl4iYOoFCplPWWori+Liz
         oVvxxcCP6rCM4N+Rrx2CYuKWw++noMhKTNQQr4WyCpE+qTVh5SdHAC77zutswDAlj8ln
         DEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791882346; x=1792487146;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J8/RNEe1LKfSGu/L13fCO0FEseR/7iXO6dPS72xbEQc=;
        b=oX/tmQRzPGLHJZvda/Iy1wguRuHN64YkisB4FD1ZMiF9BBYQVtR1Cqbrmam2rpzaAr
         wTGONkE4yt0EEcx8DsjyNbLLKl4H0jyHnY1B6EE7ycKrHs86PzRbgcH90PtH4kzvAhdK
         9LmxPe7QgOs5n+CR4MnhEUmm5+OSjJkTrHpuSXodhj1Ma3WN3OIBOcpSKH151kXNZVDC
         MSRiScJDND4XMCCuPHQ1ofLKMddbP/yXxEGqFmxROVqeSAD61OX/jkdwqFY+pAenEjLo
         WY4TfRxyAAv6aWSyiyxnNmKYUVKOTGgStep6kxd6WZvQsC6B2JhCN8++xNh+4yE6016O
         CJ6g==
X-Gm-Message-State: AFq9FYLQMNORbDMtpSkgknUKV4Vw2QJR1BdW6twL3w7JzSOWYsR20/TF
	IxNn/qJiSeCV64ia/Iv0CsGrhakroj9c/KURqO9ZA3snfaSOeS3KmOGR4Ri69wSK7ZPMDsenOZN
	UBifnnw==
X-Gm-Gg: AYBFou35/TEAWT7YA7gAMbUO/mVlF28r0n8bMfFsZ3CRspdmjZz6tBS+lr5deQX8hsb
	Y+i54d5QvLzr8+c2VDHU47ShBj53ci6ynj06aIMOCivOm07y2OSQcjOYjCFZFp+yBk7eIuQ+NLS
	rP929h/x0wwi7eBdCV9nGJ7EB/PTfHIjQUDto23jW5AxDVpkifQvPIk4tz6ppCHcsDNDuKRaIDN
	OCWMzn/xii7EcNlTC/KnWNsJ0fCokaEHQNsVIOo0sTORWMr3BiWMMOZVqwenoc4yM7f4l2p0Hff
	6vQcuNDP0YuFl8hhRJBDU387aeexxreP5XjXHA54q7PCSGmepgPZ9xLxtPnw91ZERspWsmxEGr1
	0FjUXbVBhugIzDsSBX0Z0Q9ZOXkKUqkf/W1OMRfUYhY8MJlTROIAmvy/Ppr1H6wDgMY7ejxm4/s
	ObcE35JNzOME92EMksH70xPLz2aAwN1ycRX6cjchxxZ9SbZQV/1gBNRomvjCcqcqNMqdZnLYRO5
	i4psrJQeTRL0iSgcLEIM6M91xME7ZWG+l1QevM2hR4HFQIn+Vqm4WJcYpSriw==
X-Received: by 2002:a05:600c:198c:b0:4a0:1c0e:b136 with SMTP id 5b1f17b1804b1-4a18e4cdbfbmr237371805e9.29.1791882346406;
        Tue, 13 Oct 2026 02:05:46 -0700 (PDT)
Message-ID: <d7ddc188-0e92-46c3-a38b-9a628eb60cd2@suse.com>
Date: Tue, 13 Oct 2026 11:05:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/2] x86: constify local variables in mapcache_current_vcpu()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <942facb0-c42b-4f09-9081-6cfb006c7bfc@suse.com>
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
In-Reply-To: <942facb0-c42b-4f09-9081-6cfb006c7bfc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1791882347-35CC7AE4-8121BE56/10/78276251493
X-purgate-type: spam
X-purgate-size: 1646

As of the referenced commit v won't be returned from the function anymore.
Yet that was the sole reason for it to not be pointer-to-const. curr,
which was introduced by that change, had no reason to be pointer-to-non-
const from the start.

Amends: 622c9a5ba95d ("x86/mm: accurately track which vCPU page-tables are loaded")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I was heavily tempted to also replace the smp_processor_id() at this
occasion (by curr->processor). With gcc16, that leads to the function
actually being inlined (in debug builds), i.e. a significant change in
generated code, and a measurable increase in code size. From the function
being declared "inline", that looks to have been the intention, yet then
that use of "inline" doesn't quite fit our principles. The main reasoning
for this as a secondary change would be:
- "curr" could be dropped (instead of having const added) if code
  generated from ASSERT() wouldn't matter quality-wise,
- if generated code quality matters there, then the unnecessary use of
  smp_processor_id() should matter, too.
However, an adjustment along these lines may better fit in a subsequent
change dealing with the repeated this_cpu() here.

--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -20,8 +20,8 @@
 
 static inline struct vcpu *mapcache_current_vcpu(void)
 {
-    struct vcpu *v = this_cpu(pgtable_vcpu);
-    struct vcpu *curr = current;
+    const struct vcpu *v = this_cpu(pgtable_vcpu);
+    const struct vcpu *curr = current;
 
     /*
      * During early boot pgtable_vcpu is not set, callers must handle NULL.


