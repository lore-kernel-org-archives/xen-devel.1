Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E336606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 09:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OLQpEQhu
Received: from list by lists.xenproject.org with outflank-mailman.1485355.1688580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRRO7-0002IW-Ps; Thu, 12 Nov 2026 09:46:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485355.1688580; Thu, 12 Nov 2026 09:46:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRRO7-0002IP-MO; Thu, 12 Nov 2026 09:46:35 +0000
Received: by outflank-mailman (input) for mailman id 1485355;
 Thu, 12 Nov 2026 09:46:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRRO6-0002IJ-B5
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 09:46:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRRO5-00GikK-G9
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 10:46:33 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af58aed-bab6-0a2a0a5309dd-0a2a4504e836-44
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 10:46:33 +0100
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af58af8-b57f-0a2a45040019-d1558034dca8-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 10:46:32 +0100
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4a60f9474c4so49868705e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 01:46:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4e258e8dsm88660515e9.4.2026.11.12.01.46.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2026 01:46:31 -0800 (PST)
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
        d=suse.com; s=google; t=1794476792; x=1795081592; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eHoEZOhCLsy6xeN21p2gmlzbTzw9O7oEZoifZdgeMek=;
        b=OLQpEQhuMcV5H5CCxIRYaHF5yYdFs3ZSZj4T92mmQajRAE1ktiOUjVKn4H3pJw78v3
         lOwx81cVjMCZfPAfaKWLjF8v81DOu5DNIax5IQgtWmeUtHm+Ip14NOHT1GfQiw7OL8mO
         VMykRqIiicwXEba3kVRQlni/au5b4NWH6ZsidlPmRZDZBlFUVl7eEHYF785dDz63wShF
         l2u6MpPKI4DqcJkcm9uTZeYRhnt3fUwqLuzWC6AAth69wu/tBpVz0PKYVHbYoWEdg/BF
         AE89KkuJxPzO9KgsPR1viwu80UTj1hJVVbwO3WrJ5HQW2fUv4kjIUoCO6YYnyf5bPI9l
         9g+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794476792; x=1795081592;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eHoEZOhCLsy6xeN21p2gmlzbTzw9O7oEZoifZdgeMek=;
        b=ZnU2lBIhH6QdEYw6D9YpWlkzHEjdLhZhF/6mzrewrQeMXeni5ei8H380WsZi2wh+Uc
         0WOB5wD8oAH4fTbEQfQDx8EjQ09Cwl8f9J+GjNjrJLOXNHjk1XGS9GXqjM0tIJMi9aUQ
         NooVo04kLVU1q6hO4hXkv9SXjpp56tyFbHgQQGffrfvH+64g4tUU0c06cZIFHeS+Nmef
         ZBPBDm8J95vcQgDHJm5MhC89Qad+htW/k+7dVU0F0QVMdaxWpZCEsY9pIrX2N8i2MPFZ
         Ahxn7YQvZv9lqrF+AWyxoS1NHBX5YkiEPNIXabqQzRF5+sD6DprS82oKsOZcmL72BoZv
         aVXw==
X-Forwarded-Encrypted: i=1; AL+hErGPTpU9wKsLDUf4JPXm6s9cyE3z5gFbWtzRjvmSyTPtmdRnKIktzwQLSt02929OTtjQTEt9d7KFrxU=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8oD9F19nsH9Ej2NJcEY5cB8yzNvGLW5EO7eoZamywywg0FeE3a
	Crf7UKcNDFmobygQZlJ8uatWw6CFli+KRst9LJzXQZtxmHOMYYKzfj8gJCGUfbeJpQ==
X-Gm-Gg: AYBFou3Yw5DcEo9etvACdy/BaO84FNZl+37FhAX/jCVQzImp47EANwnXnb4QSHyiAVH
	yNF1UwoGZyC7tvotmKD2vZvhMuYvbUJz2khZdiOXpAUPIBDm/gt6wfpHUf8Rg0KXM6MfWZoTor9
	v07LPtFfQl+2rqnGaVPC4jh7HhNqcwvkWk33930UIgTPxH3OAmGiRUxVYmIoi3RnFGo6nqaoyXm
	zX1x1g0ob+24gJyks2ANe07Y5ldipMHNSH9TM5BtRJypMLddcNAskgavWFe7IPEr7XCWMD4/vPI
	QrdKXgzbnyyDN2S+E5svWfENBshXhgQ/G/sDKQ+ctTjJPKkd/BX3N1jUuIzNNeNCH8FVFzVstYH
	vI2N8e71Ywg8XQ/wuTIUmU40kTTFe9sc7ta8nT1qxonw0bitcIEIIGzmexAMbKAxKVAyb6NZran
	ifSQyv4Urlba3onx0pWYvx6vzxzc4KfUR1saKP9oTVfZi7krrRPVZPt9sCUr+akb5x8OqWz3sZu
	pc/7BsNwOO+NuFAXxgCVUeZ2l2VFvkNv6bMGNagRs372SiNf3VL7HZed50PX1ilm3p1xndyfS/Y
	VAeoQ5kvjQbq/5xP+yob04GZD/+Z0RN0MLOGOhM1sSBrDgCznzytw+BGM7IPNJdN6f7zmoaZhCn
	gcd0blwZqeB+Fco4MO5GioNesB5cLzRgSN7JCLv0=
X-Received: by 2002:a05:600c:840e:b0:4b0:c1ae:829 with SMTP id 5b1f17b1804b1-4ba093a9516mr94187025e9.30.1794476792158;
        Thu, 12 Nov 2026 01:46:32 -0800 (PST)
Message-ID: <ca582cff-5ef1-4bca-ad9d-fec4bcdefc69@suse.com>
Date: Thu, 12 Nov 2026 10:46:31 +0100
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
 <cffc77e4-4904-4958-ae0c-48da52b42327@suse.com>
 <CAFLBxZZHTc7AuRjNtoxrGSn_R53SaEgf23_u_7CidYp9Sta-6g@mail.gmail.com>
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
In-Reply-To: <CAFLBxZZHTc7AuRjNtoxrGSn_R53SaEgf23_u_7CidYp9Sta-6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1794476792-532CCB50-A14F801A/10/78276251493
X-purgate-type: spam
X-purgate-size: 6288
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12.11.2026 10:30, George Dunlap wrote:
> On Thu, Nov 12, 2026 at 8:28 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 11.11.2026 18:14, George Dunlap wrote:
>>> For a 32-bit PV guest, switch_compat() replaces a shared_info page
>>> above 4GiB with one below, and drops the old page with a bare
>>> put_page().
>>>
>>> Unfortunately, this violates the expected
>>> xenheap-page-shared-with-guest freeing discipline.  Xenheap pages
>>> don't start with a reference count, and aren't put back into the
>>> allocation pool after their reference count drops to zero; they're
>>> removed from the domain's xenheap list, but someone needs to
>>> explicitly call free_xenheap_page() on them for them to return to
>>> their pool.
>>>
>>> d->shared_info here only has a non-zero reference count because it was
>>> shared with a guest; and the thing that holds that reference is the
>>> PGC_allocated bit.  Dropping the reference without having been the one
>>> to clear the PGC_allocated bit puts the page in an invalid state.
>>>
>>> If there are no outstanding references to d->shared_info when
>>> switch_compat() happens, the result for pages moved this way is merely
>>> a memory leak: the page is removed from the xenheap list, and nothing
>>> ever calls free_xenheap_page() on it.  So whenever this path is
>>> triggered, a page is leaked.
>>>
>>> Theoretically, if there *is* an outstanding reference to
>>> d->shared_info, *and* that reference is still held when the domain is
>>> destroyed, then the result is a reference count underflow: Because the
>>> reference count never drops to zero, the page stays on the xenheap
>>> list; then during domain destruction, relinquish_memory() walks the
>>> list, sees the PGC_allocated bit, and calls put_page() again --
>>> potentially dropping the page count to zero.  When the other reference
>>> holder drops their reference, the count underflows.  (put_page() only
>>> ASSERT()s that the count is non-zero, so this wouldn't cause a crash
>>> in a release build; and the page is never freed, so other potential
>>> hazards of general ref count underflow are avoided.)  Fortunately this
>>> is impossible with the in-tree toolstack, which only switches a domain
>>> while building or restoring it, and doesn't have a mapping of
>>> shared_info that it holds across that call.
>>>
>>> Release the page the way domain destruction releases d->shared_info:
>>> drop the allocation reference with put_page_alloc_ref(), as
>>> relinquish_memory() does, which clears PGC_allocated and takes the page
>>> off the xenheap list once nothing else refers to it, and free it with
>>> free_xenheap_page() once an RCU grace period has passed.
>>>
>>> The free waits for the grace period because do_settime() writes every
>>> domain's wallclock holding only wc_lock and the domain list's RCU read
>>> lock, neither of which excludes switch_compat(), through a pointer it
>>> may have read before the switch.  The RCU callback uses the domain's
>>> own RCU head, d->rcu, and holds a reference to the domain.  That
>>> reference keeps the domain from being destroyed, and its struct freed,
>>> before the callback has run.  It also keeps d->rcu's only other user,
>>> domain_destroy(), from queueing the head in the meantime; if the
>>> callback drops the last reference, domain_destroy() queues d->rcu
>>> again, which RCU has finished with by then.  No other reference to the
>>> page is expected: with no memory, the domain has no page tables that
>>> could map it, and the in-tree toolstack holds no mapping of it across
>>> the switch.  If something holds one all the same (a toolstack that
>>> mapped the page before the switch, for instance), leave the page alone
>>> and leak it, rather than free a page that is still in use.
>>>
>>> Freeing the page relies on "tools/libs/guest: re-read dominfo after
>>> changing a PV guest's width on restore", without which restoring a
>>> 32-bit PV guest maps the replaced page by the frame number it read
>>> before the switch.  Once the page is freed, that frame can come back as
>>> one of the restored domain's own pages, which restore would then write
>>> the saved shared_info into.
>>>
>>> Also allocate the new page into a local variable rather than straight
>>> into d->shared_info: if the allocation failed, a concurrent
>>> do_settime() could dereference the NULL pointer before the old value
>>> was restored.
>>>
>>> Fixes: 8a9255405ca6 ("x86/domain: adjust limitation on shared_info allocation below 4G")
>>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>>> Assisted-by: Claude Code:claude-opus-5-5
>>> Signed-off-by: George Dunlap <gwd@xenproject.org>
>>> ---
>>> Changes in v2:
>>> - If the page is still referenced once its allocation reference has
>>>   been dropped, leak it rather than free it (Jan).
>>> - Depends on a new patch, "tools/libs/guest: re-read dominfo after
>>>   changing a PV guest's width on restore".
>>
>> Actually, is there a dependency here as in "must be applied in this
>> order"? It looks to me as if the 2nd patch going in first wouldn't
>> make the situation worse.
> 
> Before patch 2, the stale frame will always have a refcount of 0, so
> the map will always fail, causing the restore to fail.  (And in the
> case of a live migrate, causing the attempted sending domain to
> resume.)
> 
> After patch 2, the stale frame may be in one of three states:
> 
> a) Free, refcount of zero.  libxc's map will fail the same way,
> failing the restore.
> 
> b) Allocated to a different domain.  This will also fail, because it
> will have the wrong domain, failing the restore.
> 
> c) Allocated to the same domain.  In this case, the map will succeed:
> libxc will restore the contents into the wrong page, and then write a
> truncated frame into the start_info that it passes to the guest.  This
> is a lot worse than the failed restore.
> 
> In Claude's experiments, on an idle system, the page gets re-allocated
> to the same domain 10/10 times.

Hmm, all of this to me reads like an analysis of what happens if only
patch 1 went in. But the question was whether putting in patch 2 without
patch 1 would cause things to be worse than before.

Jan

