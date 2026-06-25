Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8745CCDB479
	for <xen-devel@archiver.kernel.org>; Thu, 25 Jun 2026 13:05:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1345602.1604416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcjlK-0006xM-2t; Thu, 25 Jun 2026 13:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345602.1604416; Thu, 25 Jun 2026 13:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcjlJ-0006xF-W0; Thu, 25 Jun 2026 13:04:57 +0000
Received: by outflank-mailman (input) for mailman id 1345602;
 Thu, 25 Jun 2026 13:04:56 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcjlI-0006x9-NU
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 13:04:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcjlH-00DX5K-L9
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 15:04:55 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3d2772-bab6-0a2a0a5309dd-0a2a450b80b0-8
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 15:04:55 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3d2777-ac48-0a2a450b0019-d155dd29c086-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 15:04:55 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-46cbe01d4b6so1157348f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 06:04:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c2279bc77sm14898952f8f.32.2026.06.25.06.04.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 06:04:54 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782392695; x=1782997495; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FVIPN8pSxaqWMTYph54uStLbwSMZzn3jochsu9C1I+8=;
        b=eXZ+ZNF86HdwXlYeBYd8TTcHev9u5BS3WkwW9ZFv8Img8TUFp01uOBnBA0eaZ7g2vV
         WwmHaxDD9cAf5JrtIcBPUFkfQimBqQCduJt4QglJv6PQe2nE+JX2UgnTsB17Zq47mb/s
         DUFSpn2iBqRhzH1HlWV197qMIg5L3mMh1NuQc+ksNUhz8KKkgHKgQjFSgGBqWIY+8XPQ
         cFY2h/+oRO+FPxHcS9f14yRdfMyrwP0gQ8pk0IwV0zmmDUnruw6tZWKfZpbJQsExnCVY
         bNaqz3y8Rwlh2AXMPvAzHhnhK6sAFv6X9V85w3xQivONe29hLhbtv10pcACGaKk5IZ6W
         QA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782392695; x=1782997495;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVIPN8pSxaqWMTYph54uStLbwSMZzn3jochsu9C1I+8=;
        b=S5EFDaPM5GU9ylmJ65Bp7NixawJS2mGf0XdKvwPeV6klMYQd+RYfee4YCHEHGa4Xel
         0sk79SPo1fvT/y2sReUirr9BliBuskx2LzTEC5h3QBRvUFe0ZB2NKhfJMpNBYidvf2sR
         12O0C2tsWSWC4vsRZDttkMEuIl8bNnHipFurEHJYx+aAy4sqXoOoO46KKrCN1bZXV9xs
         MaOadEKbmb9QYi9/1bFPB1JSF0jGN3Ufv+ynNUg3T7+wg7W04RtBp46J6bQmxyGiXDdN
         sxjjlW4OAf4LByYJe0MXNnz9HiMzKWLzgMGepDWekqqx1V0n2nhzHEjJ8c1BS6/2omMR
         /fUA==
X-Forwarded-Encrypted: i=1; AHgh+RoiAGi34LZEwpqrtrpYD77YwIDdYom/RAkAMLYHZHi1xlrldCT/4Nvnx+eG7N6CaKRSSYvog997+NU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzcC6UBPaR3c7o580N3hyRW28OaBbPSzgcSQg2Mrfu/8x9UVwmP
	6ef6YvdLm00PxZCT2hYG+mBcNpxTDyQl5OJ5Hr/qxjFOeEVq5EOQ5AYDS+9UKq+KQQ==
X-Gm-Gg: AfdE7clsE690qdNby0OD/Kd/CfGE5TRlOldU+WlxNNJbPyIriIm4gYY5+W7lc+zub4h
	p6wvSkF804YckoDLdrB4CVm0RITRZvi4xGhuXCnvL2dGPpDYdsbvV/tA/s+sIdIDPSd0MbJmWif
	w19vJ2c7bT0KlsBqGpExxewe7p8ML4/N9n9zpn+njOR/8v3B4wjOwT6l1FmM2k5BSANVaVwV9y2
	daG5wtinEaOj3XCvv8fhe0Mc7Zs2t3BoT5Jiwxn+5VPhXu96QqTZebyQgsXVombOT8WcnBDy+wZ
	8n9aXvEDfECW9Wz7rizxHSSB3HKUCtRjKhXQPaqCysyz4DP2pBz8NbvdFyPXp1vfY5jIPjA0Y/+
	9T3zanZTVuZBkrRdO67s9Cw781726H9ddMA/4gclGNAMQTzQOMqC6R1JSANzRF+OfXmzY/mGQ+a
	ZfdAKgZsIsOeqc6Sg/5i4AQEraqDysl1HwUVaVr5uvOchi5dC8B0Q/wBCnNP3rI+9XXKh6+R83m
	c7s
X-Received: by 2002:a05:6000:29d2:b0:46d:d5da:f0aa with SMTP id ffacd0b85a97d-46dd5daf1ffmr2580001f8f.45.1782392694757;
        Thu, 25 Jun 2026 06:04:54 -0700 (PDT)
Message-ID: <ca45cbd3-8f39-4017-b2f9-e69b8a708188@suse.com>
Date: Thu, 25 Jun 2026 15:04:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] xen/mm: Introduce per-node free page counter
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <agarciav@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1778272036.git.bernhard.kaindl@citrix.com>
 <a0b83b0781319009c3862389469dc59db59e0b29.1778272036.git.bernhard.kaindl@citrix.com>
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
In-Reply-To: <a0b83b0781319009c3862389469dc59db59e0b29.1778272036.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1782392695-A4F2E220-207EA23B/0/0
X-purgate-type: clean
X-purgate-size: 3045

On 08.05.2026 22:27, Bernhard Kaindl wrote:
> From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> 
> Add node_avail_pages[], updated under heap_lock in sync with
> avail[node][zone] to cache the per-node sum of free pages.
> 
> Use it in avail_node_heap_pages() to avoid summing all zones on each
> call. Guard it with nodeid < MAX_NUMNODES and node_online(nodeid).
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
> ---
> This patch was originally sent by Alejandro Vallejo:
> https://lists.xenproject.org/archives/html/xen-devel/2025-03/msg01130.html
> 
> I use node_avail_pages[] in avail_node_heap_pages() as an optimisation.
> 
> Verification of the changes:
> 
> 1. node_avail_pages[node] is updated whenever avail[node][zone] changes,
>    so the two remain in sync.
> 
> 2. avail_node_heap_pages() previously summed all zones of a node and now
>    returns node_avail_pages[node], so the same free buddy pages are
>    counted.
> 
> 3. avail_node_heap_pages() returns 0 for offline nodes and for nodes
>    >= MAX_NUMNODES as before.
> 
> 4. avail_node_heap_pages(-1) returned the sum from all nodes, equal
>    to total_avail_pages, but this is not used by current callers.
>    avail_heap_pages(z, z, -1) is used by other callers for that instead.
>    To avoid dead code, a check for -1 to implement this is not added.
> 
> Update locations:
> 
> - free_heap_pages() increments node_avail_pages[node] alongside
>   avail[node][zone] when pages are freed, including during heap
>   initialisation.
> 
> - alloc_heap_pages() decrements node_avail_pages[node] alongside
>   avail[node][zone] when pages are allocated.
> 
> - reserve_offlined_page() decrements node_avail_pages[node] alongside
>   avail[node][zone] when pages are offlined.
> 
> Colored pages do not go through the buddy allocator.
> Since they do not update avail[node][zone], they are
> not reflected in node_avail_pages[node] either.
> 
> N.B. Current callers already iterate over online nodes only.
> 
> Changes since v6:
> - Preserved the 0 return for offline nodes and nodes >= MAX_NUMNODES.

Hard to identify what v6 was (and who, if anyone, asked for the change) when,
afaict, the patch subject changed.

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with ...

> @@ -2831,7 +2837,9 @@ unsigned long avail_domheap_pages_region(
>  
>  unsigned long avail_node_heap_pages(unsigned int nodeid)
>  {
> -    return avail_heap_pages(MEMZONE_XEN, NR_ZONES -1, nodeid);
> +    if ( nodeid < MAX_NUMNODES && node_online(nodeid) )
> +        return node_avail_pages[nodeid];
> +    return 0;
>  }

... a blank line inserted ahead of the "main" (not really here, just by its
indentation) return.

One other remark: With the function called from just a sysctl and a
keyhandler, the direct array access is likely fine. Generally it would
want to be array_access_nospec() though, when accessible from guests.

Jan

