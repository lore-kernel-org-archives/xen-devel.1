Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306FE606A321
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 08:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=aznVB4YF
Received: from list by lists.xenproject.org with outflank-mailman.1485253.1688484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRQA6-0004dX-IR; Thu, 12 Nov 2026 08:28:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485253.1688484; Thu, 12 Nov 2026 08:28:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRQA6-0004dQ-Fc; Thu, 12 Nov 2026 08:28:02 +0000
Received: by outflank-mailman (input) for mailman id 1485253;
 Thu, 12 Nov 2026 08:28:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRQA4-0004dK-KH
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 08:28:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRQA3-00Bv9x-JE
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 09:27:59 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af57883-2eae-0a2a0a5409dd-0a2a450b8432-34
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 09:27:59 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af5788f-b7e8-0a2a450b0019-d1558035ac65-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 09:27:59 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a59100fa83so34864165e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 00:27:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498367b99bcsm16091863f8f.51.2026.11.12.00.27.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2026 00:27:58 -0800 (PST)
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
        d=suse.com; s=google; t=1794472079; x=1795076879; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EzFpnCNGaKglmEiJQRb6ywKMrRwLOaNCXkqFMUS0gEk=;
        b=aznVB4YFzG7fSSWhvaG/BC180UuMXEdIRvZO2y5NI8FlyAUx56/YTCLeZMDn9lKzZ/
         0pbEru0aDky/FpxvlEixHa76OvjiCZqUu3KwKH6sR36svaurzNAmEZxZ+SVozMXGP0PN
         YWETeMva2gCtNDcocHa831OF4FKQGELDha2L4Bgzj5LofdqudRzGs0GJXetR2FBNaIao
         JbbMc/KezYdaHXkPFY3uCkoQj/q/twLkrJOYBc2tVrnXwce1IKxGhpmtGsoNSD4Ty3md
         I10ZelDCKhPzqhFIdEcEUKEqogLWXj53higvKQtx13zwLW+NCffDKU892P7jachzEwov
         A3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472079; x=1795076879;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EzFpnCNGaKglmEiJQRb6ywKMrRwLOaNCXkqFMUS0gEk=;
        b=dZyZgxO16XqlyiT0PHQRUhnq+Pxp2YUGQaEkOq4e1S8q+n5bb0gtLv3SoTN7yQJKHW
         +yCgxiD7HPzGyt8wiCx9zj6+TpRChFB4NnG4hF7mNb3CzJyv4iblEH//V/oLk1ffV4hW
         oEf2bX7fppTO3V9Hiy4K4Sh6SIRpfhyj9wIbLBZhYhWW1oJq97y3sRLrP1CvSiLHh00V
         Xa5hjtoIP+l4zLblbHGNFaUqJb4KtlWCWRo4aG6X6UxXpuRBwY9LgwKXaTdVO+qLfUY7
         jLc//ZYTvfKcdGNO8On0dW0HCByPbBZSfPj0EdlL2q4I/ZlRVTzyNEcTs/zvQvOMyGS/
         MFLg==
X-Forwarded-Encrypted: i=1; AL+hErGoQMPhw+ryR7JorYDqeIknaGJzPE2a+dDwGVc5N224xZTIbx7N0wYkkIuScd2RqT94Z5OauSWmUmA=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9D4BijgyNc4kA2g6ygGJQry9BXAKMXDQsOK14v3D51zyYWtCrh
	DsijRrrCUe+ym1qOKd1PfQojPHTIwPBma6480I0GJAwZ/rEfcX2urYugsFWtBFPU6w==
X-Gm-Gg: AYBFou1f3sc0I9YhwViqaCXEadlx2mMNlD2eb3wW/wBdNCb/ElFo5WgyNm2RfcnfY3J
	oR/5PHmIj209VTtxoku8iJqXsCeiL07syovEU2mDW3zO8Ogd/G/F1MEj7SwTCd8jEqeNJRuXj25
	XV57hl/hNFBqU1LuRdrMgKEpF3NqgDJgmfoGYprfZUcBkMwlUuUXqpYR7GZM1KsU+2h8BP+RYGq
	KGnRY2L4HHNahsc58ZWlgtKMuBlCjQ/MolMWkHgtXNdP/SbzCDb17AZxoz6g2qql2GExuhdBvrl
	W8bkDHthqmc1mWjxvYa6OUhF3Fjbh30YtUXT0Fh5woXx1xxLCDIXzi56lP26mjAVf5XXRqzY2lm
	sCLc/i2xUVJgtDZcxHIJD2CQXy5o6UcMk91cXecygF/i+ANuS+DoeL1m0UQdhvcGbj+kr19J+kv
	x8rwkX8d7yE9+hJjs8chZI/vnJ9+94kixOSOgxFW9sEntsP/XSpOtDg+OJB8s/KauQTlo0+0rTS
	ukzTA5wOtZ9pgWVLluekfS+UYcfRotafUrdgh773TzI0kPH3RBb92aZZXAUf1u9cJWY1bQATBo5
	U51wlfzhL1jWU3XMcsjWkY5ZfkgBD21TY26n84TUUGMs9nfNV8mDt6w+FodEe7mKA5DjxylR1K/
	AfYMjbDwO6agresCX
X-Received: by 2002:a05:600c:19c6:b0:4af:83ad:8f70 with SMTP id 5b1f17b1804b1-4ba093b1bb8mr84846455e9.35.1794472078615;
        Thu, 12 Nov 2026 00:27:58 -0800 (PST)
Message-ID: <cffc77e4-4904-4958-ae0c-48da52b42327@suse.com>
Date: Thu, 12 Nov 2026 09:27:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/pv: free the shared_info page switch_compat()
 replaces
To: George Dunlap <gwd@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261111171441.23101-1-gwd@xenproject.org>
 <20261111171441.23101-2-gwd@xenproject.org>
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
In-Reply-To: <20261111171441.23101-2-gwd@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1794472079-ABED69EA-8E15C7C9/10/78276251493
X-purgate-type: spam
X-purgate-size: 4898
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11.11.2026 18:14, George Dunlap wrote:
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
> the switch.  If something holds one all the same (a toolstack that
> mapped the page before the switch, for instance), leave the page alone
> and leak it, rather than free a page that is still in use.
> 
> Freeing the page relies on "tools/libs/guest: re-read dominfo after
> changing a PV guest's width on restore", without which restoring a
> 32-bit PV guest maps the replaced page by the frame number it read
> before the switch.  Once the page is freed, that frame can come back as
> one of the restored domain's own pages, which restore would then write
> the saved shared_info into.
> 
> Also allocate the new page into a local variable rather than straight
> into d->shared_info: if the allocation failed, a concurrent
> do_settime() could dereference the NULL pointer before the old value
> was restored.
> 
> Fixes: 8a9255405ca6 ("x86/domain: adjust limitation on shared_info allocation below 4G")
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Assisted-by: Claude Code:claude-opus-5-5
> Signed-off-by: George Dunlap <gwd@xenproject.org>
> ---
> Changes in v2:
> - If the page is still referenced once its allocation reference has
>   been dropped, leak it rather than free it (Jan).
> - Depends on a new patch, "tools/libs/guest: re-read dominfo after
>   changing a PV guest's width on restore".

Actually, is there a dependency here as in "must be applied in this
order"? It looks to me as if the 2nd patch going in first wouldn't
make the situation worse.

Jan

