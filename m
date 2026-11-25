Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39372606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 12:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HM16uqD6
Received: from list by lists.xenproject.org with outflank-mailman.1502324.1698295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWCGc-0006kF-62; Wed, 25 Nov 2026 12:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502324.1698295; Wed, 25 Nov 2026 12:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWCGc-0006k8-2f; Wed, 25 Nov 2026 12:38:30 +0000
Received: by outflank-mailman (input) for mailman id 1502324;
 Wed, 25 Nov 2026 12:38:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWCGa-0006k1-GP
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 12:38:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWCGZ-002ZfG-TC
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 13:38:27 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b06d6ba-bab6-0a2a0a5309dd-0a2a4501ca6a-30
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 13:38:27 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b06d6c3-5bcc-0a2a45010019-d155802edcf1-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 13:38:27 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4bb6c7b6dbdso52939275e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 04:38:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884ab091sm738926915e9.11.2026.11.25.04.38.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 04:38:26 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795610307; x=1796215107; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R0FAKVT2FOJyZlVRmNm6+8dthuWEs0O8l+2y0gPsq5c=;
        b=HM16uqD6bz68CGm/PtRSZ9M3ry0jaWQdO3Gxrhc9dBEa7A1ytIzafNod1Vp8DUHKBk
         ElEz4H9pj69rn1EWgJbr/6F1eGfMFlKlR+3818g7YSFvQ1toXjOn0ZCEbDKIXzhUoHc2
         rQ/Wq/eU+O8dLPNMrXzuzyI0f/nDSP27Qv7fqYqII6Vi2Ue7rRMBIe0zJTE5t1XFf8dc
         76JR88O4r1Sv9srOxspOHQ68ViTjMIYmkhY7GlEGp8gW6aUaZAo2nkbmP+T+KxlVPBRR
         vtgQJN4FOoegquhv4UZJkJZZNtLu121Kf5WVZOXSqGXkyb+yPtWW+aMBbj4wS5WxFD/2
         piNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795610307; x=1796215107;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R0FAKVT2FOJyZlVRmNm6+8dthuWEs0O8l+2y0gPsq5c=;
        b=dDwEeNb4ZOUpHgVTlYSOEmBRBn2A9atmQBkg1yYX6yW6x9snNZP8Bv4tALGV1RUsM/
         rADdhN6Wm7glY2DnOdWfafbbFK9r/qaCZpmbny/YImu4SXJHjKn5jwetr6iaIsGwzrui
         BNN7lnrrlSPkK0C2geI1roJLqmAFn/ljdvo1Oc+w9hHJog1by/xFdHh46/TLxcrlBEei
         /d5+VZlPHfISu0MTYpfOpYc7UWWk6jVk4zhOnp48WJIxNZPMfaLpz1ta+BIE/2y7OHQA
         jFg15aFZrQxyPL7EXCpL0vJWXigd9cV8ylOoD8H5TylG8pO6ZoBf2yOE7fk9rDI2Egi0
         vCHw==
X-Gm-Message-State: APuU4Z8fl/FjC44IhL6vrk5xDdl7FSoTU0XRCztkngFwD6icPfeDnVb9
	/1zMPp6VkIDW2OLAjofER6R6Q4KNehmfTjiCcXCxjEy6zEPtZiSxpofti6B5khnk8PmREqs2Yni
	DaWoIYw==
X-Gm-Gg: AZFdTZeT04TEGTQlLOZTGH7YqwJOnTFGRlGC9wGrwp9lCFiV2sOI1pffoOlby5TCQ4c
	HrQRvdWRCTt79YnI2aIBERLNt57Da5J4UH+CWcnMO1CC1l+hhtyH2l9XCBlVuioCZmncA0B5jYq
	95kAOI2HqFJmiaNOur4ZONRzS62Wifr1l8koLjfx8OuKyYn+jMv+XnrgyR2wh8LyHBc0WoY4WB2
	ikC0DK0bvDarSAYf5K2o9BJFQr+nSfUsDrZpI6LjeVUkt1UVetW+mpw9ikyuNpiYAKuvusKNH+6
	65Pr9K75qihhocH3jYnMa8cRCKdsMax2HuUqSz1DiYLNZm2F/EhvCKepKWePOoPd81M8xOhUQPS
	C0tm9+WMc1cuwCHFyiv/+DvsEHr1EJNl14ucIDB0/A73Tk2xCPk7jXVyeUKw7w5h/81ro05wAN3
	p/9mJ7HFuDbxniYYCHVcdIfciwzxkp/gRDIbsA9I+6WuB6MahypQO2WCKsSBrVSA5oNgwNQDkfl
	4HbG8LyD3vdw0uaUFDxq794kHRYRv/3BAYCl2CyjtAWkjauaRoFsm4D2IUGKufjBVDoFulmc+LY
	Qz+02qiI3GBmWG8Ng4SkpKxcCf8AyqOVTJQEC2flaFmDyTSaohXFRL9UU8tDCVM5hZx74pSTLWh
	FD/9CZl7515gzLhjhAQ==
X-Received: by 2002:a05:600c:3b94:b0:4bb:6f41:39be with SMTP id 5b1f17b1804b1-4bb8880ca3cmr450751705e9.15.1795610307139;
        Wed, 25 Nov 2026 04:38:27 -0800 (PST)
Message-ID: <d9b1f4c5-45ca-4654-90a7-7211c815b238@suse.com>
Date: Wed, 25 Nov 2026 13:38:26 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, George Dunlap <gwd@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PoD: replace p2m_is_ram() uses
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
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1795610307-BEED25FD-6E3EB57B/10/78276251493
X-purgate-type: spam
X-purgate-size: 2383
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Only truly normal pages should possibly be subject to conversion to PoD;
all types covered by p2m_is_ram() but not covered by p2m_is_pageable()
aren't suitable candidates. Therefore (ab)use the latter here.

Fixes: 41aa0b62699e ("PoD memory 4/9: Decrease reservation")
Fixes: 9ad9a1609fbe ("PoD memory 5/9: emergency scan")
Fixes: ca2b511d3ff4 ("x86/ioreq server: add DMOP to map guest ram with p2m_ioreq_server to an ioreq server")
Reported-by: Roger Pau Monné <roger.pau@amd.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course, to avoid the abuse, we could also introduce p2m_is_poddable().

--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -542,7 +542,7 @@ decrease_reservation(struct domain *d, g
         n = 1UL << min(order, cur_order);
         if ( p2m_is_pod(t) )
             pod += n;
-        else if ( p2m_is_ram(t) && !is_special_page(mfn_to_page(mfn)) )
+        else if ( p2m_is_pageable(t) && !is_special_page(mfn_to_page(mfn)) )
             ram += n;
     }
 
@@ -630,7 +630,7 @@ decrease_reservation(struct domain *d, g
             pod -= n;
             ret += n;
         }
-        else if ( steal_for_cache && p2m_is_ram(t) )
+        else if ( steal_for_cache && p2m_is_pageable(t) )
         {
             /*
              * If we need less than 1 << cur_order, we may end up stealing
@@ -770,7 +770,7 @@ p2m_pod_zero_check_superpage(struct p2m_
          * + None of the mfns are likely to be mapped elsewhere (refcount
          *   2 or less for shadow, 1 for hap)
          */
-        if ( !p2m_is_ram(type) )
+        if ( !p2m_is_pageable(type) )
             goto out;
 
         if ( i == 0 )
@@ -927,7 +927,7 @@ p2m_pod_zero_check(struct p2m_domain *p2
          * If this is ram, and not a pagetable or a special page, and
          * probably not mapped elsewhere, check it; otherwise, skip.
          */
-        if ( p2m_is_ram(types[i]) )
+        if ( p2m_is_pageable(types[i]) )
         {
             const struct page_info *pg = mfn_to_page(mfns[i]);
 
@@ -1063,7 +1063,7 @@ p2m_pod_emergency_sweep(struct p2m_domai
     {
         p2m_access_t a;
         (void)p2m->get_entry(p2m, _gfn(i), &t, &a, 0, NULL, NULL);
-        if ( p2m_is_ram(t) )
+        if ( p2m_is_pageable(t) )
         {
             gfns[j] = _gfn(i);
             j++;

