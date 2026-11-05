Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0E8606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 13:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SWYW/4wI
Received: from list by lists.xenproject.org with outflank-mailman.1474686.1681677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOxc5-0006vS-8w; Thu, 05 Nov 2026 13:34:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474686.1681677; Thu, 05 Nov 2026 13:34:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOxc5-0006vL-6I; Thu, 05 Nov 2026 13:34:45 +0000
Received: by outflank-mailman (input) for mailman id 1474686;
 Thu, 05 Nov 2026 13:34:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOxc3-0006pe-De
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 13:34:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOxc2-009qG4-PS
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 14:34:42 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec85ef-2eae-0a2a0a5409dd-0a2a4503d530-8
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 14:34:42 +0100
Received: from [209.85.218.46] (helo=mail-ej1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec85f2-fae8-0a2a45030019-d155da2ed5b4-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 14:34:42 +0100
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-c49b431f022so31451466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 05:34:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0e140fcasm174955266b.1.2026.11.05.05.34.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 05:34:41 -0800 (PST)
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
        d=suse.com; s=google; t=1793885682; x=1794490482; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nRoV9beagea783Ja6NbKXTJm/ZIqSGgGKZTTcQHFyvI=;
        b=SWYW/4wIIGIvef1pF01qWIK117vn/KZEuR+t531TsxVdCSgWjD+HrVkoZIOzu6J3mG
         Od9uBA2yF76zK17Q8UQ+U0qzSCb7W58XDxWEMFeR44QsYfrPPvsA5n97omOJZmeyD3qw
         oVqKDLI9rm3IgR7X7hbC2ZuJF0f+ArDkT06PtgzbcyXYITI7B7b9jsnOspwyVj0HePyB
         50Qonj3+4ghNO80iFREnKCxXNOHHLYKCYMkSrfi1XihifxhUyHg70eVpwPWXQgk/W3Wc
         dbN4WRWTKUi0lPeeB8ZxdiNtuYgRxNq20qZ91c4wzEQ93pQT6GYXLWFymSPQ3Yf60u4r
         fNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885682; x=1794490482;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nRoV9beagea783Ja6NbKXTJm/ZIqSGgGKZTTcQHFyvI=;
        b=i2OkbiNsuuh5LmNQKX8Cn3rAdpqlt755zQmTmFkwzvnLFwVyVz2L0PQcZS2XTYg7XC
         brGJWmaa6wZOK2c9BxxhpIfR6ce4OsqFBl9f7/z3I9I4Q2yafWV4W2sbm1YtTR7jtbjE
         zEt1Jg/ul0IgSL6ale8cclZfDFvYzT96fCMTSdgrEUcv1Fx5/gu98E05QAdsFnQ5rdh1
         UaJohcSHgaRvpwStKgaZY5ayG1LK5vN1sPtEljsw2cBkNcNRukabB2fM0FnfK7599Y5x
         +kIJE/cLkcERSHLsjctn/9jFL7fLYQUmH85HlCZR6PgpntnYgjklGkzh0esrFge0lPTT
         IYzA==
X-Gm-Message-State: APuU4Z8mnK8r7I83zFdWK0ErELVNUEP6yXuEkBBFwzlpU3lo/5azR1lk
	gpK4IW7F8FhFqMTz9Kx9lwuRtpY9e6j3pmXQbNUrpZRHh3Y2yjiDmSgNAIGjSenwrteZ9rix4++
	nTt90lQ==
X-Gm-Gg: AYBFou3mLfDKvkhwAyK7pGScPxW6/DRexvAeMSvnoz/5nZ0prefSmrFWMuVq38DOmin
	AOdzkcD1xC0FiLWfD+u2qKm4qsLDLrmKYLE6/wNVajOW92/hJJ8N2CW40ce4pYviQ8FGY0AcaSD
	e4BtpjOShnLssw7J/xoxQyRKd5BCc7ToTafu3fdQ4tXJ1gyZ9IF28L549L4i7yA08V0ggUpZ+Fo
	HsjRr3CMNime1yjoxSM3A0VNhZl11hCjJjHBIR7mJpe6Z1bdy4+o3wFfgwpEPWmd5jKXzfVT5wb
	Glkh7v5NEOWut//lwNchRh32dvM6361Bl4wiaBI2S5iz+GPY6Ri2N5vkWzAXrEFKCBSSiqDMBJZ
	9D50NvRJwHR/J6eejyOfdYfWHpNgYxSh+TUzie6ZIgvXdYmgkncEml9B3h0wTiMrsu134vEVhN/
	q964+vnFjhjhMM9Hb5v82BXEX+GABERARzcPK9qeK8Z4eUdJgbQb9YgtuRTf0vdV2zXF7tQ3Y10
	m9B6rSSxqIyKG0I+RLmvMNrRmEsmWtqmxQqhynzJzzshtzhiYMFUJV+W5+qNnoqYPJM7bhgwTZV
	ZzQZlQwUJKInpW/sMCY4Ksrhu5ZtPSEpa/jWdCHP0zHt1dM/7jBUjpGhYTObRbnCNLN+B0kgRau
	9dw==
X-Received: by 2002:a17:907:6d06:b0:c34:c5e8:1dc5 with SMTP id a640c23a62f3a-c4ca7a7255cmr1667128066b.20.1793885682239;
        Thu, 05 Nov 2026 05:34:42 -0800 (PST)
Message-ID: <b314f59f-de9c-4537-93a5-c60603e62a58@suse.com>
Date: Thu, 5 Nov 2026 14:34:41 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 06/14] x86/PVH: lift E820 alignment requirement
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <a1f88104-14ae-400c-b950-163d5a7e552b@suse.com>
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
In-Reply-To: <a1f88104-14ae-400c-b950-163d5a7e552b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1793885682-6D8D54E9-A424904B/10/78276251493
X-purgate-type: spam
X-purgate-size: 2102
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Before reordering things (to move in particular pvh_steal_ram()
invocations ahead of the pvh_populate_p2m() one) drop an undue (and as it
turns out unnecessary) assumption: find_memory() doesn't really depend on
E820 regions to end on page boundaries. (Note that the check of "start"
was pointless, as just before "start" was aligned to a page boundary.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Really the assumption towards the start of regions doesn't look to be
relevant either, yet I thought I'd limit the change to the minimum needed.
---
v2: Drop leftover (pointless) assertion altogether. Further shrink
    comment.

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -365,6 +365,9 @@ static __init void pvh_setup_e820(struct
          * that's the minimum granularity of the 2nd stage translation. Since
          * the p2m code uses PAGE_ORDER_4K internally, also use it here in
          * order to prevent this code from getting out of sync.
+         *
+         * Note that this is only for pvh_populate_p2m().  Subsequent uses of
+         * pvh_steal_ram() will break the length part.
          */
         start = ROUNDUP(entry->addr, PAGE_SIZE << PAGE_ORDER_4K);
         end = (entry->addr + entry->size) &
@@ -505,10 +508,7 @@ static paddr_t __init find_memory(
                                  PAGE_SIZE);
     unsigned int i;
 
-    /*
-     * The memory map is sorted and all RAM regions starts and sizes are
-     * aligned to page boundaries.
-     */
+    /* The memory map is sorted. */
     for ( i = 0; i < d->arch.nr_e820; i++ )
     {
         paddr_t start, end = d->arch.e820[i].addr + d->arch.e820[i].size;
@@ -519,8 +519,6 @@ static paddr_t __init find_memory(
 
         start = MAX(ROUNDUP(d->arch.e820[i].addr, PAGE_SIZE), MB(1));
 
-        ASSERT(IS_ALIGNED(start, PAGE_SIZE) && IS_ALIGNED(end, PAGE_SIZE));
-
         /*
          * NB: Even better would be to use rangesets to determine a suitable
          * range, in particular in case a kernel requests multiple heavily


