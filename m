Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DA1606A323
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 11:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=I1jFDI4R
Received: from list by lists.xenproject.org with outflank-mailman.1485641.1688791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRTHK-0003pZ-2M; Thu, 12 Nov 2026 11:47:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485641.1688791; Thu, 12 Nov 2026 11:47:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRTHJ-0003pS-Vw; Thu, 12 Nov 2026 11:47:41 +0000
Received: by outflank-mailman (input) for mailman id 1485641;
 Thu, 12 Nov 2026 11:47:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRTHH-0003mf-Ro
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 11:47:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRTHH-002uw8-4i
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 12:47:39 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af5a74f-2eae-0a2a0a5409dd-0a2a4508dc86-32
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 12:47:39 +0100
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af5a75a-f659-0a2a45080019-d155dd2ac5e8-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 12:47:39 +0100
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-49318428d98so2238709f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 03:47:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498369a3fd2sm17047711f8f.52.2026.11.12.03.47.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2026 03:47:38 -0800 (PST)
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
        d=suse.com; s=google; t=1794484058; x=1795088858; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFzUbNmeeFcb1CUAG5I30PaPyIGPOjIiV0yIqq+rSxk=;
        b=I1jFDI4R2JwvycvlP2MNCIsvGqH5evOzGeDPwjbp0FWcA8QduMMoWLLs41a4qwdPuC
         rOZQi6anr+S5VBm0prCkoARvFxYkXb40gZ0NJYgB78Qm3eLQ7+H+IWlYoV4Z0s2E08B2
         hjWmbcvGtFjdstcCJ//sMF1JBJ4inz1+l5T3BL/FN1Nb+vebRSBoA7R8t20zidkUjMU/
         3dDBS5/mDG5nnD4FsP1oG4TxoJN6N9akj94ydwIwC9ZQVJhgwNGXGKlcpkdOEG/KAWaE
         NxiDh2l+i/trWhBTWfgjAlv4ne5v6sStKFp0QvriG6d1aicxgM+3kvRDBQTX8ldwie1W
         g/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484058; x=1795088858;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFzUbNmeeFcb1CUAG5I30PaPyIGPOjIiV0yIqq+rSxk=;
        b=qaHKBkmHG9lY6bCb21D8dFahYNkZnY9ucVIlbFXDRdSEFqqWdATcRDoFsAqfJl98Nd
         KEcehCBEqiC8FFV4jVHT9NVoW8cZotzuScZ5DycGZqwoeyk7lN+Lz0HXKpjHJkrlxMcs
         0c91BnvRh+KvpWABi6xhUX+AJaA3vZAiTJT8SU73xEdvYdszHSOzFohdb76kBFa12jHE
         CqmY2tkJg3nqG3olBNrjVl1Lv6LgVwNbkgUqbLrt99gRcI5p8vG0HG8JXJf62h9Piixz
         LVgQ8TDZWivlmaO3fK9LNgPMQINd+4DwkkVLM5y2EZ1NjH/PmIba/4meTDbIawXJ+jnL
         0UCw==
X-Forwarded-Encrypted: i=1; AL+hErGMaStjftzUtQxw99u/SP+DP1U9wdUGGBsw8Z1rZxtgX00eIkTReuH86+WoCb8/Mj2hYSUvO+VfOCE=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9FIhnkc3JtvCN/DiZ/m/zFKLb+VFj4kHLtPuR8I+nviUtt4nM/
	ahifmqgiwMMCHNKluuxRDYtsOPxPN70f8MQeIo+Iq5uXRTT5aj6p6mjlTEiLo+CuTOfxxX/0Mw8
	XMmp6KA==
X-Gm-Gg: AYBFou3Jl4UZXNK49I7q4bXGsqnxfT7QmGS0ck1jX8SZLL4G12kM1A94nx8tmCupBi2
	gD6pNqHiTOH1S8EUd0Cgec52glOpUhh/nt12nmtLIMvMB73KFXcWWS/TBarjkPV6WQhPs1Tc4c8
	3rkwPRt/rTdkPZw+4q7iVRIRnIN/51FXEROrTrPd+87Dv+Zu4DwvBv15fxkGvwOCNm2mfg2i+3s
	o1rjHwBHVdrCy9ZglooVqh1UajuQnBWSniviJelvEkYtz3U15qqTRf4auQH4YKq5KNYpnTKmLm8
	fKZRGrCCqUAu0s8RBX/6LMp7ieDeW7X+RyDUYFubvVonjYqs49ESqzsOCrSTQ1BHqlcFhEvUyMA
	aBgEQx1fMb5P7R6FWZ6jswt5YPRLmxKk9QZ5B82p39sALBxTkENzWby3toB6K5RTXYNSAhQEY82
	aiAE8/z1p7A3fQhO6QTV/vkFLgR6M2ki/bpyo97DG5pOqcYj+YXUoOOizrcNFz445WeXENssALQ
	brDp5P8hOyASb8h1oISXOGZkP8d07RiODBdFC3L1VRkCQkmGct+o6VlyT5RyljLkrJN/Xx7iiF0
	g4ohp2Yd5pmzEtJdtqEgbUuAxSSBNTAiPw+iWYGCU2bZJjbpTwnN2QWh6TgMuM55BnhFEsjFBU5
	mhRri9b2+ht5CAcwB
X-Received: by 2002:a5d:59ca:0:b0:48f:bcdf:6f68 with SMTP id ffacd0b85a97d-499c68d4ab5mr9569751f8f.37.1794484058400;
        Thu, 12 Nov 2026 03:47:38 -0800 (PST)
Message-ID: <a994168d-23c0-44c2-bafa-a7aacfc1851d@suse.com>
Date: Thu, 12 Nov 2026 12:47:37 +0100
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
 <ca582cff-5ef1-4bca-ad9d-fec4bcdefc69@suse.com>
 <CAFLBxZb7i_kaS4--HGk3a81wK1HQ1V-itCJu4nF8jB_f0-YrhA@mail.gmail.com>
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
In-Reply-To: <CAFLBxZb7i_kaS4--HGk3a81wK1HQ1V-itCJu4nF8jB_f0-YrhA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1794484059-CE34587B-A7125EE1/10/78276251493
X-purgate-type: spam
X-purgate-size: 7404
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12.11.2026 11:49, George Dunlap wrote:
> On Thu, Nov 12, 2026 at 9:46 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 12.11.2026 10:30, George Dunlap wrote:
>>> On Thu, Nov 12, 2026 at 8:28 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 11.11.2026 18:14, George Dunlap wrote:
>>>>> For a 32-bit PV guest, switch_compat() replaces a shared_info page
>>>>> above 4GiB with one below, and drops the old page with a bare
>>>>> put_page().
>>>>>
>>>>> Unfortunately, this violates the expected
>>>>> xenheap-page-shared-with-guest freeing discipline.  Xenheap pages
>>>>> don't start with a reference count, and aren't put back into the
>>>>> allocation pool after their reference count drops to zero; they're
>>>>> removed from the domain's xenheap list, but someone needs to
>>>>> explicitly call free_xenheap_page() on them for them to return to
>>>>> their pool.
>>>>>
>>>>> d->shared_info here only has a non-zero reference count because it was
>>>>> shared with a guest; and the thing that holds that reference is the
>>>>> PGC_allocated bit.  Dropping the reference without having been the one
>>>>> to clear the PGC_allocated bit puts the page in an invalid state.
>>>>>
>>>>> If there are no outstanding references to d->shared_info when
>>>>> switch_compat() happens, the result for pages moved this way is merely
>>>>> a memory leak: the page is removed from the xenheap list, and nothing
>>>>> ever calls free_xenheap_page() on it.  So whenever this path is
>>>>> triggered, a page is leaked.
>>>>>
>>>>> Theoretically, if there *is* an outstanding reference to
>>>>> d->shared_info, *and* that reference is still held when the domain is
>>>>> destroyed, then the result is a reference count underflow: Because the
>>>>> reference count never drops to zero, the page stays on the xenheap
>>>>> list; then during domain destruction, relinquish_memory() walks the
>>>>> list, sees the PGC_allocated bit, and calls put_page() again --
>>>>> potentially dropping the page count to zero.  When the other reference
>>>>> holder drops their reference, the count underflows.  (put_page() only
>>>>> ASSERT()s that the count is non-zero, so this wouldn't cause a crash
>>>>> in a release build; and the page is never freed, so other potential
>>>>> hazards of general ref count underflow are avoided.)  Fortunately this
>>>>> is impossible with the in-tree toolstack, which only switches a domain
>>>>> while building or restoring it, and doesn't have a mapping of
>>>>> shared_info that it holds across that call.
>>>>>
>>>>> Release the page the way domain destruction releases d->shared_info:
>>>>> drop the allocation reference with put_page_alloc_ref(), as
>>>>> relinquish_memory() does, which clears PGC_allocated and takes the page
>>>>> off the xenheap list once nothing else refers to it, and free it with
>>>>> free_xenheap_page() once an RCU grace period has passed.
>>>>>
>>>>> The free waits for the grace period because do_settime() writes every
>>>>> domain's wallclock holding only wc_lock and the domain list's RCU read
>>>>> lock, neither of which excludes switch_compat(), through a pointer it
>>>>> may have read before the switch.  The RCU callback uses the domain's
>>>>> own RCU head, d->rcu, and holds a reference to the domain.  That
>>>>> reference keeps the domain from being destroyed, and its struct freed,
>>>>> before the callback has run.  It also keeps d->rcu's only other user,
>>>>> domain_destroy(), from queueing the head in the meantime; if the
>>>>> callback drops the last reference, domain_destroy() queues d->rcu
>>>>> again, which RCU has finished with by then.  No other reference to the
>>>>> page is expected: with no memory, the domain has no page tables that
>>>>> could map it, and the in-tree toolstack holds no mapping of it across
>>>>> the switch.  If something holds one all the same (a toolstack that
>>>>> mapped the page before the switch, for instance), leave the page alone
>>>>> and leak it, rather than free a page that is still in use.
>>>>>
>>>>> Freeing the page relies on "tools/libs/guest: re-read dominfo after
>>>>> changing a PV guest's width on restore", without which restoring a
>>>>> 32-bit PV guest maps the replaced page by the frame number it read
>>>>> before the switch.  Once the page is freed, that frame can come back as
>>>>> one of the restored domain's own pages, which restore would then write
>>>>> the saved shared_info into.
>>>>>
>>>>> Also allocate the new page into a local variable rather than straight
>>>>> into d->shared_info: if the allocation failed, a concurrent
>>>>> do_settime() could dereference the NULL pointer before the old value
>>>>> was restored.
>>>>>
>>>>> Fixes: 8a9255405ca6 ("x86/domain: adjust limitation on shared_info allocation below 4G")
>>>>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>>>>> Assisted-by: Claude Code:claude-opus-5-5
>>>>> Signed-off-by: George Dunlap <gwd@xenproject.org>
>>>>> ---
>>>>> Changes in v2:
>>>>> - If the page is still referenced once its allocation reference has
>>>>>   been dropped, leak it rather than free it (Jan).
>>>>> - Depends on a new patch, "tools/libs/guest: re-read dominfo after
>>>>>   changing a PV guest's width on restore".
>>>>
>>>> Actually, is there a dependency here as in "must be applied in this
>>>> order"? It looks to me as if the 2nd patch going in first wouldn't
>>>> make the situation worse.
>>>
>>> Before patch 2, the stale frame will always have a refcount of 0, so
>>> the map will always fail, causing the restore to fail.  (And in the
>>> case of a live migrate, causing the attempted sending domain to
>>> resume.)
>>>
>>> After patch 2, the stale frame may be in one of three states:
>>>
>>> a) Free, refcount of zero.  libxc's map will fail the same way,
>>> failing the restore.
>>>
>>> b) Allocated to a different domain.  This will also fail, because it
>>> will have the wrong domain, failing the restore.
>>>
>>> c) Allocated to the same domain.  In this case, the map will succeed:
>>> libxc will restore the contents into the wrong page, and then write a
>>> truncated frame into the start_info that it passes to the guest.  This
>>> is a lot worse than the failed restore.
>>>
>>> In Claude's experiments, on an idle system, the page gets re-allocated
>>> to the same domain 10/10 times.
>>
>> Hmm, all of this to me reads like an analysis of what happens if only
>> patch 1 went in. But the question was whether putting in patch 2 without
>> patch 1 would cause things to be worse than before.
> 
> I'm a bit confused.  Are we talking about the same patch 1 and 2?  If
> we put in the current patch we're discussing, "[PATCH v2 2/2] x86/pv:
> free the shared_info page switch_compat() replaces", without 1/2, then
> we'll have the issue described above until patch 1 is applied.

Right, but is this any worse than the situation without either patch
applied?

>  1/2
> fixes the stale-shared_info-on-restore problem before 2/2 enables the
> old shared_info to actually be freed and reused.
> 
> I don't see how putting patch 1/2 in without patch 2/2 would cause the
> issues described.

No question that applying in-order will yield a good result. The question
is whether I need to wait with putting in patch 2 until patch 1 has been
acked.

Jan

