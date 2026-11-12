Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED2B606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 06:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eNXqQIT9
Received: from list by lists.xenproject.org with outflank-mailman.1485165.1688450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xROST-00051R-6I; Thu, 12 Nov 2026 06:38:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485165.1688450; Thu, 12 Nov 2026 06:38:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xROST-00051K-2Z; Thu, 12 Nov 2026 06:38:53 +0000
Received: by outflank-mailman (input) for mailman id 1485165;
 Thu, 12 Nov 2026 06:38:52 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xROSR-00051E-Vl
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 06:38:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xROSR-001t2C-Cc
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 07:38:51 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af55ef5-8faa-0a2a0a5109dd-0a2a45099eb8-6
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 07:38:51 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af55efb-be1a-0a2a45090019-d1558036ec4f-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 07:38:51 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a2d6d01ecbso24931815e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 22:38:51 -0800 (PST)
Received: from ?IPV6:2003:ca:b726:28fe:61da:a0a6:3f98:b9fb?
 (p200300cab72628fe61daa0a63f98b9fb.dip0.t-ipconnect.de.
 [2003:ca:b726:28fe:61da:a0a6:3f98:b9fb])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba0951fe22sm121158765e9.3.2026.11.11.22.38.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 22:38:50 -0800 (PST)
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
        d=suse.com; s=google; t=1794465530; x=1795070330; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j0Rbtz5AI4DbVqIEwJb6xvcz0v8TPq++B5rCvg5lXZQ=;
        b=eNXqQIT9ndud1EFhrYFot+WLl3HTMC1vtZ3nxhetNs4TWA4CqtHw4QfzCiJuWXu2de
         ytPd0Qd8I7Z2FQbxvTREud8gOOiUwqnLC1WZ+QwsgHrfcs4dvsuoN0sQAP1Q6yx7QPF8
         Ilu+UmgsA2IRIDvSSRaJrtzD7WoBElYwftgd4jjE8bGd/HKWYQPurQrfEFeNr5hlBhl2
         NbyV6PdIKe+dkosm3CZIU/vY1LlvuYdrRecIXYU2g+PsMP0Lp5EJL7bCgIczEiyvIR4u
         lXVu3/AnRuU20h08VaAAj43F9Rgh8/B3ZoHu5xOBbyvcCZbd2LcmOfno5c8CrNYpn8Mi
         d75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465530; x=1795070330;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j0Rbtz5AI4DbVqIEwJb6xvcz0v8TPq++B5rCvg5lXZQ=;
        b=2y26+w7u0XJB+9Kbmqqoo4VBhFdja7rMkyRbsgKErDETpXXaWGV1OFRrU3bAwjxym3
         PIMxE8M4Drp2br/mcLzTjvRnEXQevHKxT/p+f8fWdJkwqWaPXRkt5tR3BCkMZoh0HWc9
         O9fIz2Wpw1DrKsHqc0XWi4Tnbrod/QllZkPE/sdTHX/9ypIF2hkpcNg7eGabtwwOQ6YU
         ynskC4xY2G8WkGdLdo9JsABnBdv0PkCj04aFrCt5t++HWGyh1HTbXqSjxonNisc6wl+Q
         OdyA4joiD9ERKmdVcsZSRp7kAHRW7mwHi/tjhzzorgV9XPVKAW+c89bncz8Wmkkpo+wQ
         LxZA==
X-Forwarded-Encrypted: i=1; AL+hErHxRSpFyVUVD1b8h7/TiCXrr7WmznOzHFvpSY1430RywJ0IPL3Sc+b06RHXnyAsuI/DJLnHjtczBv4=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8qJkrpSJTfSF7K/qRcz3Dsj185Dj/lo+LxM0J42NTcvmzkZ5ZB
	+CMo2pNlTJ/yFgAhOSGb1WWHjaK99Gr1NAq8gXyekC3YVdxO0dg8dn4Gy2dshs8dZr/W5E38Axy
	3D64=
X-Gm-Gg: AYBFou0dG9h48jOMbhs/ESIZaUeP1i2Om89FuJkYeobMn3xA+pEvKN/7t5yYZZLR9AZ
	CjxMdVaUFqPL2cLyci2vQh8i+MtkXNP1h1Ew2xu08wjO7RWpCleDJ4apos7UQB/raVqpItDrCRx
	cbU8EpNCCg/vmeByHXIBi7b7H3BLjAe9h0Lz/wo8BEK8pqFZDQsn7QOOq3kFqml27SyjmlwfKEy
	YRWCqBbmXpmijRIUyP3/pi08d8IKr6Rdhxwy+ZRXHaEuItATVl7Rj6nBx0EJkhLch1rMFq+MdXY
	natcwZrMl6UoULuFTDnSYTynMqr+WbHwyVXGUpKRNWVeiuq1d1WGaWq/AipfMeVNVNWS/JFo1sA
	yMfiLdmhMD9WV9wTMNI2dUNDQnZeL4JJYEAwsEwoyZXbLj8l9AjloSCFHZyfBsc41pSqNpi7Ec8
	ej8t2beSVVRUJPDoNVtQlwp+QeCK6vCX+NgfieTkzylifihdV+s8Uoi5iMzezMVudxgEMRBsl7O
	s9Pb1fSlbS2qVKd6qaeWRv5xhI2yOhLLyCRG4qxn29hTfsjIu0KOpH/kLN+Ac+/Gr6xLU3jc/GG
	nj3wsGFVAgZQmSJnMzCsWQSbzcpf5ptMkwgf0h6SM2xtCWrIdJKeUMXUQYmzV0osdkx1QuQ5ttS
	EGMEFzkEScoaJtXpRW7JDJQT30QlrSZWrcEuV2FXYfP8Hqal0a1UJ0lfpTwiU9QCuxlGKA/RI8i
	LrxF9y8DM=
X-Received: by 2002:a05:600c:6089:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4ba09376ccfmr77752675e9.16.1794465530642;
        Wed, 11 Nov 2026 22:38:50 -0800 (PST)
Message-ID: <4d980944-41da-4ddf-b01a-74ab6a267167@suse.com>
Date: Thu, 12 Nov 2026 07:38:50 +0100
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
X-purgate-ID: tlsNG-bad1c0/1794465531-FC817034-F46784A2/10/78276251493
X-purgate-type: spam
X-purgate-size: 4507
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>


