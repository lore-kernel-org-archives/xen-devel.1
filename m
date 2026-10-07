Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B72FCA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 10:52:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442161.1659720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEPFi-0004DE-TZ; Wed, 07 Oct 2026 10:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442161.1659720; Wed, 07 Oct 2026 10:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEPFi-0004D7-Pk; Wed, 07 Oct 2026 10:52:02 +0000
Received: by outflank-mailman (input) for mailman id 1442161;
 Wed, 07 Oct 2026 10:52:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEPFh-0004Bw-5c
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 10:52:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEPFg-001Bbe-F3
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 12:52:00 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac6243a-bab6-0a2a0a5309dd-0a2a450c98b8-18
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 12:52:00 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac6244f-f479-0a2a450c0019-d155802ea9c9-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 12:52:00 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-49e73611928so12142315e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 03:52:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c71d1ffbcsm4485995f8f.36.2026.10.07.03.51.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 03:51:59 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791370319; x=1791975119; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4bE8M2atturKEkKiYTQd+NDT+t5UNdSZHEAESlHSsvo=;
        b=LFzD59djpiipC/Y6a5e1BP4fYoan2mLHJMUAS/wDloyZX3va0UElCJx6afX4Q5DuPe
         CLgEIFjlS/pMOImBKH0yWXIjWt/HlRbklsuHGyoLEGpZEI5ZP9Ebp1HKQzPUn10akXWa
         tSWChyCEa825Q+zGC/4Vs5bAhaxbcBKj40dPpg21xeXkB2YBmqMjaOJ4QTn9IssjAcAd
         QWIvyxmrcWu4HT49tWRr5YZfxpE2ghaJ7tavcEiGgrO2QwKCvJ1xJN+SWrosYzlOYsfQ
         VfMvYYU0myavbWKyqF9eVfpH9tB6Vi26qFsRcG6ujaaNSue1xpaAZraNdZTXzDom0ayU
         trqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791370319; x=1791975119;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4bE8M2atturKEkKiYTQd+NDT+t5UNdSZHEAESlHSsvo=;
        b=0WSdidvi1kNzE9NB7sUq4BOHk8Xca4I+meAnJgIT2aCOmbCHFUPR4dKM9c8zrE4uZ0
         RRRfnsnmu4ZGqM5Y5BbcnQ1VLtVeBvR8rUpaMoeaxNPL9K1OxmBkABx4C2d6bB0v1gbA
         Gwnot/mwjqK4wndgzejNr36fDK0KmeDhSHRHaxaBi29c8y5HrYIlZBWkng5kivKfoGER
         tb820uvc1Ua4LBKVBikRiSUHWBdhJvszrtXrd6zF8a1m6jLV/6iuEKaJJIdlWiqvXRnI
         quWI3Y8BDx7MZjLtzVH28KLwqZSCPSmUthiwYRmZ/71KAzbzU9QRc3jCou7LRWsM4YnG
         rKEg==
X-Forwarded-Encrypted: i=1; AKwUvBywgdQ5TvdP43AY6T82717s3SOPaqYe6YKYhNq+QILZZYBg3VkjWTcgbH0nWcJKyhmPTxeF9Ua3W9c=@lists.xenproject.org
X-Gm-Message-State: AFuF++kHbzX9mSIzbGDJs+LkgJ445cRMZCFdN17YHvMk/cHLLGOVvFN1
	uIYal33faipHI+5RE41suTLs7H+HhB1Tsd98gKyw28rB08pHE8hjoE8POBR2yuEENA==
X-Gm-Gg: AYBFou1afgTw+KHp8t8LozTCGCrlHxlMPJs0IAUA5ChD3zNcLE8U4CwowQkKoENa0Ew
	VP6tLnKxBMRvc0Xw9pBhsMikujeiR6j3cZ8wOZHZzPo/qbEZ8xcsp8zrmLNPPtT5o8a6hgist30
	s864W+RTgWyS+E+CbWhIcyFtg00wbL8AEZH5hyifeftqT3D+pGAasfQIW0UkwR0LKzb8V2bynaw
	kEX/9uJw1Zh5tdBm5bUkfYRrMkVhgQW5UxOFxypCdLGgJfmF3xb5EMGdI3sEyYXU+ctr0WRu3qb
	hESBX92AtqGlNOKkr3PC6Mdr6Q4ixUeBEVZnPMPMRu7/ZYAaOGhdFeFzQQI0VJWSAYPisN4mVng
	VkrJuKGuVXsinfU7pkIKEOzOGcL6a64j44I658/ProCcCKrxmhucSB3Xn3AAmzSxwtXyfQv7L/K
	gWCBfWRpEPZc7WlgO1ipZYn3HVFgX7sXeuo1vRczBB7DdD2DrCHJzH/39+0DSFVn2XCOCLcSNCe
	OWMszZhgchOUtFo8jnnz9RGsNxBid78JltkF2DHZee/gUagD+de4pAOsf6cOw==
X-Received: by 2002:a7b:c7c5:0:b0:4a1:6df8:caa6 with SMTP id 5b1f17b1804b1-4a178a2be2bmr79405205e9.12.1791370319589;
        Wed, 07 Oct 2026 03:51:59 -0700 (PDT)
Message-ID: <6f8521ad-e853-4b07-9916-044e6ed5a1f8@suse.com>
Date: Wed, 7 Oct 2026 12:51:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/18] x86/PoD: map one page at a time in
 p2m_pod_zero_check()
To: George Dunlap <gwd@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261007104051.48841-1-gwd@xenproject.org>
 <20261007104051.48841-2-gwd@xenproject.org>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <20261007104051.48841-2-gwd@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1791370320-01EC2A5B-A2B11E70/10/78276251493
X-purgate-type: spam
X-purgate-size: 2373

On 07.10.2026 12:40, George Dunlap wrote:
> p2m_pod_zero_check() maps every page of its batch that passes its
> checks, up to POD_SWEEP_STRIDE (16) of them, and keeps them mapped
> across the p2m lookups and updates which follow, each of which maps
> page-table pages of its own.  Its callers hold mappings too: the p2m
> lookup which found the entry to populate still has its page-table page
> mapped, and a PV mmu_update() the L1 page it is writing.
> 
> map_domain_page() cannot always provide that many at once.  It uses the
> mapcache on behalf of PV vCPUs only: in debug builds for every page, in
> release builds for pages beyond the reach of the directmap in PV guests'
> page-tables (5TiB, 3.5TiB with CONFIG_BIGMEM).  The mapcache has
> MAPCACHE_VCPU_ENTRIES (16) slots per vCPU of the domain, shared by its
> vCPUs, and a mapping which finds no slot free or reclaimable hits the
> BUG_ON() in map_domain_page(): the host crashes.
> 
> The sweep runs in the context of whichever vCPU populates a PoD entry
> while the domain's PoD cache is empty.  The guest's own vCPUs, being
> HVM, map through the directmap; a PV vCPU gets there when its domain
> maps or copies the guest's memory: a device model in dom0 or in a stub
> domain, a backend doing grant copies.  A PV domain with a single vCPU,
> as a device-model stub domain or a dom0 booted with dom0_max_vcpus=1
> is, has 16 slots, and a sweep over 16 candidate pages needs more.
> 
> The sweep has mapped its whole batch at once since 9ad9a1609fbe ("PoD
> memory 5/9: emergency scan"), when x86-64 reached all memory through the
> directmap.  The per-vCPU budget came with the mapcache's return to
> x86-64 in 4b28bf6ae90b ("x86: re-introduce map_domain_page() et al").
> 
> Map one page at a time instead, as p2m_pod_zero_check_superpage()
> already does: map a page for the quick check and unmap it again, and
> map it anew for the full check after the p2m update and the TLB flush.
> The checks and their order are unchanged.  Each page is mapped twice,
> which costs little next to scanning it, and the error paths no longer
> have mappings to undo.
> 
> Fixes: 4b28bf6ae90b ("x86: re-introduce map_domain_page() et al")
> Assisted-by: Claude Code:claude-opus-5-5
> Signed-off-by: George Dunlap <gwd@xenproject.org>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


