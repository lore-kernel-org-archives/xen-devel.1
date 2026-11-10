Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB180606A33F
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 11:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OSnWch/k
Received: from list by lists.xenproject.org with outflank-mailman.1481559.1685462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQk6e-0003d6-Un; Tue, 10 Nov 2026 11:33:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481559.1685462; Tue, 10 Nov 2026 11:33:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQk6e-0003cy-RF; Tue, 10 Nov 2026 11:33:40 +0000
Received: by outflank-mailman (input) for mailman id 1481559;
 Tue, 10 Nov 2026 11:33:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQk6d-0003ce-2j
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 11:33:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQk6c-00ASb5-4v
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 12:33:38 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af3010f-8faa-0a2a0a5109dd-0a2a4505d8be-12
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 12:33:38 +0100
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af30111-4cb1-0a2a45050019-d155dd2be1c7-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 12:33:38 +0100
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-48dee593f18so1244370f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 03:33:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498365ccbccsm4454484f8f.44.2026.11.10.03.33.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 03:33:37 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794310417; x=1794915217; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=udCMXEQywFfi6rO8dywnJAQ9jWliX0hptGtxPoKw7GI=;
        b=OSnWch/kRxxm9uHhANotKGg6E2VqXzgwARYJI10td2P8a3eZoydtQcDW6oHKOVfysn
         z1hJ91NxP6hbflN0waPHx9s1XlSdSFKWalY8VJIjRRQuBgX8nM8lA012Ukbucxd6wWu1
         GXzKyI6CwjXum0jcu38w6XHCmH3mn3YedJQY8hxYds2XVOgijq5mlurgRz+JN2cLjsFT
         Qx4fp35XlLmAcPL+Emal5M+rhdBCiRn0yqnO/I7zRutWVtrIBKMB2iWn36Tw4YmtV+hC
         Oe9dGpCW7VRuqM34rdyAxj838Gj+rb10Xl+uT1dVvKeiD5ph5fLmG5slpW1190Pt83vy
         N96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794310417; x=1794915217;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=udCMXEQywFfi6rO8dywnJAQ9jWliX0hptGtxPoKw7GI=;
        b=WqoeL/Y5ISSXJK+Z43vidtXZSGtrenTO/JxCtgPdDMST+DvtLwKdS9aOAGYbw74JKu
         CKqn7xMu8/HdPXbvEXNdHPULzqdDgMOLCQ4UkWP3aHNNx1gsFtuinWRRr6o65VO1jycH
         ipwFrqhCA4AxfptnWvxrO0v7r+AZrBmmOstbDeZ/4NEOtg2OFUoWwtLNz88aU3oBwBIp
         d6SjAWqTEKzge4zPdV1TmgiME1i37ibPZ2zy/m/t3nL1RKLAOEALl6bw8qq37DPr3QZI
         0Xxfeigz7edm/Si/r3QTnm29ju9ig8YVY0HgSo7ECYD1j41QdZQtYJaQzCTgMrNxdg/e
         1rBg==
X-Forwarded-Encrypted: i=1; AL+hErH2qSji92kiqxhDI3QjdfA4JW6OeXR7yLIm+Kqj8OqI6m0iiS8mQnS58U8YvNzhD7s2ALAqUvu1yUI=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9Z+kfJdFcNeoqyM54Z6sscl2d6vpXuPXiQWQnzT/uPaLwXuiZE
	fd/r19FdG6XQGD+74CVKyy9bz45db2fjX1t7kiSDHlQPH8R5XOljFC76t9IUf8kPrw==
X-Gm-Gg: AYBFou2UcD/Z6Ppn/M83eUe14vW0YiZWJbwI0p3bXRChgwLeUB6b6PElXllLupSyEzn
	wQn2EbvMGTcsdjqoXnTW939DVQUE+FVwsD0AsJpvuzorznSqMYTAcRPEp3DheyR48DCYZ3t9qRO
	dVBQ5JktctMe8+E7hR3Bd3Du6m2Elrs0JVnaYQQIVLJrj5n5CCb770yuf9uN+ra5pT7ARk9HbFh
	IRcnVxS5OV9xtVOvq0zxstggSbToU37LR7FkMidngE+q6MlZjdrvKsjzBUpnO643IRNhSqC3hoK
	4qLhQtXrLaePhbL4tPp4DQZN/JTQ7OmXFWH+zuk3oqI1WsoqH/QtB7rYvU28+Np0GP4s1g+c8PR
	0evYz/xuyMeEBV40qa+BtKG7MMwIl/mf/F2GwxbFpKgYnpb9Gz4w8qzPC80J8HPff1FZTDEdV4M
	4xh+O7Cf1wrYyvYUlNQp8eqvSzDYUsJb0p5laNM4cxOO4ktxSpEdMuX4bQf1ke3oRsBGR9U2Pop
	L0VD6h+EK57a29jm5MmbTH4q2eX+7FYG73wdvtK/L6q1+pRWSkh46q2SSj+PUrhSl5pHaWW5/3N
	FQbKXBfJ5Oo64VO24dzC3zJRgFLv6KQ/rgw2QqYhBNPdrz6smcSmuII8OWA9MX4EYxvRzNYym4G
	A6HKfODvlgF+sr8VdBZzVFmtW4DFGOO9ZxvQziw==
X-Received: by 2002:a05:6000:38c:b0:48d:deaa:4dbb with SMTP id ffacd0b85a97d-4982fc48095mr3623451f8f.40.1794310417398;
        Tue, 10 Nov 2026 03:33:37 -0800 (PST)
Message-ID: <ec93ec9a-2fd3-4dcc-94f8-35376cb03363@suse.com>
Date: Tue, 10 Nov 2026 12:33:36 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pv: free the shared_info page switch_compat()
 replaces
To: George Dunlap <gwd@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261110110500.27221-1-gwd@xenproject.org>
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
In-Reply-To: <20261110110500.27221-1-gwd@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1794310418-F78BE2A1-4ADDB4E2/10/78276251493
X-purgate-type: spam
X-purgate-size: 4002
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10.11.2026 12:05, George Dunlap wrote:
> For a 32-bit PV guest, switch_compat() replaces a shared_info page
> above 4GiB with one below, and drops the old page with a bare
> put_page().
> 
> Unfortunately, this violates the expected
> xenheap-page-shared-with-guest freeing discipline.  Xenheap pages
> don't start with a reference count, and aren't put back into the
> allocation pool after their reference count drops to zero; they're
> removed from the domain's xenheap list, but someone needs to
> explicitly call free_xenheap_page() on them for them to return to
> their pool.
> 
> d->shared_info here only has a non-zero reference count because it was
> shared with a guest; and the thing that holds that reference is the
> PGC_allocated bit.  Dropping the reference without having been the one
> to clear the PGC_allocated bit puts the page in an invalid state.
> 
> If there are no outstanding references to d->shared_info when
> switch_compat() happens, the result for pages moved this way is merely
> a memory leak: the page is removed from the xenheap list, and nothing
> ever calls free_xenheap_page() on it.  So whenever this path is
> triggered, a page is leaked.
> 
> Theoretically, if there *is* an outstanding reference to
> d->shared_info, *and* that reference is still held when the domain is
> destroyed, then the result is a reference count underflow: Because the
> reference count never drops to zero, the page stays on the xenheap
> list; then during domain destruction, relinquish_memory() walks the
> list, sees the PGC_allocated bit, and calls put_page() again --
> potentially dropping the page count to zero.  When the other reference
> holder drops their reference, the count underflows.  (put_page() only
> ASSERT()s that the count is non-zero, so this wouldn't cause a crash
> in a release build; and the page is never freed, so other potential
> hazards of general ref count underflow are avoided.)  Fortunately this
> is impossible with the in-tree toolstack, which only switches a domain
> while building or restoring it, and doesn't have a mapping of
> shared_info that it holds across that call.
> 
> Release the page the way domain destruction releases d->shared_info:
> drop the allocation reference with put_page_alloc_ref(), as
> relinquish_memory() does, which clears PGC_allocated and takes the page
> off the xenheap list once nothing else refers to it, and free it with
> free_xenheap_page() once an RCU grace period has passed.
> 
> The free waits for the grace period because do_settime() writes every
> domain's wallclock holding only wc_lock and the domain list's RCU read
> lock, neither of which excludes switch_compat(), through a pointer it
> may have read before the switch.  The RCU callback uses the domain's
> own RCU head, d->rcu, and holds a reference to the domain.  That
> reference keeps the domain from being destroyed, and its struct freed,
> before the callback has run.  It also keeps d->rcu's only other user,
> domain_destroy(), from queueing the head in the meantime; if the
> callback drops the last reference, domain_destroy() queues d->rcu
> again, which RCU has finished with by then.  No other reference to the
> page is expected: with no memory, the domain has no page tables that
> could map it, and the in-tree toolstack holds no mapping of it across
> the switch.

Yet there's still the theoretical possibility of there being some other
mapping. In such a case imo we'd better avoid the freeing, accepting
the leak (with a log message perhaps).

> Also allocate the new page into a local variable rather than straight
> into d->shared_info: if the allocation failed, a concurrent
> do_settime() could dereference the NULL pointer before the old value
> was restored.
> 
> Fixes: 8a9255405ca6 ("x86/domain: adjust limitation on shared_info allocation below 4G")
> Suggested-by: Jan Beulich <jbeulich@suse.com>

Did I? (I don't seem to recall.)

Jan

