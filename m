Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF0E606A335
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 13:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BSqHEck7
Received: from list by lists.xenproject.org with outflank-mailman.1481777.1685696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQlmT-0008AK-Ei; Tue, 10 Nov 2026 13:20:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481777.1685696; Tue, 10 Nov 2026 13:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQlmT-0008A8-AN; Tue, 10 Nov 2026 13:20:57 +0000
Received: by outflank-mailman (input) for mailman id 1481777;
 Tue, 10 Nov 2026 13:20:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQlmS-0008A2-06
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 13:20:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQlmR-006DMM-D4
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 14:20:55 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af31a2b-2eae-0a2a0a5409dd-0a2a450ae736-42
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 14:20:55 +0100
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af31a37-f2d2-0a2a450a0019-d155802ccd25-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 14:20:55 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4a20bdaf39cso21537825e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 05:20:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba02387ad9sm74358935e9.5.2026.11.10.05.20.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 05:20:54 -0800 (PST)
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
        d=suse.com; s=google; t=1794316855; x=1794921655; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9Y5FefKYQGHjju5gxChqLuvtSJTFYHIjDOUB5O7rSA=;
        b=BSqHEck7+TSHQDysfVZ0kcQjJxfAVyhFx0FrECFp9SQjA2DGiu07GO0GxTUIKXNv31
         i1rCEHY2eGIG9h6eQ+eRFaG+HURV4/2QI0KeMBWcbb/txr1kKFIfNXgj1Am4RYWi1Vyi
         XIq5Lksx3RzcvJCJpayvPgfS7qvuWOJsP03f+eVuElLUzmXmTf2skytYyJyoy7Oa5kdI
         /LdCK6xD8VuCSZEF/bs/RwraW3iLa02+qF/dcvdjNnycsaV+PM5nUiRqoO4F74ntLPXn
         00Rk0rvLaeP+SQpgKctWeZuTPmMw1pcnzxqHVip+Uwl8rc+Z0KdaQ/v8YyE5vaMKS8k5
         cOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316855; x=1794921655;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t9Y5FefKYQGHjju5gxChqLuvtSJTFYHIjDOUB5O7rSA=;
        b=o0E0T1Qy9V5snxAcl7nQzcdyqQitTH6RLENFmLYh5egh8rpxcXXck0CTBUvzBftnmS
         XwgRwKHqQJtYI7Gmm0ir7jPOJxbeynAJ3J918nPVQc8FjlfcC3ouz8hU+WkmY3alrvIG
         EjSIc2ZWuxG7hkjgzknSnJmZ4t3yLoTCQ4rMjAcukt5Ir0m4htUNymh8zFV69CKEQo9Z
         YVIIe4Yr/mSivq3fmT3ZehtumX8GudEX3vbWcOznsZfYXqvQRxeUCvDgUx1iKQONFA8m
         9LQlbxIp+juaIyFXdds+nxmQXQvFSMl0Qh8MOo0/FbuPF0xrM+ullpQqez2XRvujTNS1
         9gcw==
X-Forwarded-Encrypted: i=1; AL+hErHaiiuUutw0eq9sWGGkCNgHixfUy7YwQgiwpo0SPcH1OqYKVhSlbq+TzDKHRcvA5BqSavYh93sSz8o=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/AlQW9VW1p9pfUN0ctwDdMa+6psg5PtR89goo7Y7GZ1ug9ETo5
	PKtvO/wZ8m2xGzyb1XpGe8Kps3yeLN3ljR5hZrz7FnJSqZlAnil1ulT3wj+lSQCqtA==
X-Gm-Gg: AYBFou2uH9fbT35oV8Hhf0Q5eSzTOHqWQQm60mzUIQEL3jlmQp/FOyah+8Wm2Yt25Oz
	yRskHAjv2VdyuooUY/20iYqVGicEfzMAc3QsMFnaC09Di2nn5iGvPc0TBygb36vZltfuyl5jXo1
	1hBOhaD/tSJ0G8SQrrfETu3vOngd42wLwL75r4xwyfLtxIWUYD5xmg8ehP9Kv/gDb74cAO9oDoA
	5d3J0XNN5LsQ2ar63ku5WIHb6X6MR9BETmQlzKyHdHrJIeEy40W2vV8jLBSsjCjh3A1ZbJj7JEz
	Fo3nh9peJczs6Zh2A0nWb5dhVu8yL6O3e6e65jiGf0m5jbG2fD/tGP+EGrUatbW+/n7G7etLGye
	7TaW7v/8UmqSXo2tWhUwG/hGg23mXNjuEocJn1/lQAq4D4N/AK9HLqya3snDFH0Tm5GYDI0SSnY
	laFtKB0KwND4aXztiLSj6/ARlxg6UMyqATId7p6kJWPFIjxXqEG2JUoLRqEUgyuKDQSBg0ZT32L
	FhiuETs4HESef2DsaN+NIyrhJswjm0N+wdYehiEwqPPUGPK4uyqzigb20L9JjNu1hu9VEpSnWEG
	YfKUjgek21YwFehyuOzq+n+eNYm593b+5EAyU9EA+I0gBnsK9wE4HVP6V4657+lmqExejKW9vi5
	09NV4w7hExPvQNN81
X-Received: by 2002:a05:600c:474c:b0:4a1:acaa:9d4c with SMTP id 5b1f17b1804b1-4ba0234f937mr46634615e9.25.1794316854541;
        Tue, 10 Nov 2026 05:20:54 -0800 (PST)
Message-ID: <8d2ecf68-6c34-4a59-9fbf-0e3f67a338d7@suse.com>
Date: Tue, 10 Nov 2026 14:20:53 +0100
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
 <ec93ec9a-2fd3-4dcc-94f8-35376cb03363@suse.com>
 <CAFLBxZbndoe49Zcurk6ZM04niye=jRsEcD_=mnSoKQUuXPRZew@mail.gmail.com>
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
In-Reply-To: <CAFLBxZbndoe49Zcurk6ZM04niye=jRsEcD_=mnSoKQUuXPRZew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1794316855-50CCBCFC-E4759C7F/10/78276251493
X-purgate-type: spam
X-purgate-size: 5961
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10.11.2026 13:24, George Dunlap wrote:
> On Tue, Nov 10, 2026 at 11:33 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 10.11.2026 12:05, George Dunlap wrote:
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
>>> the switch.
>>
>> Yet there's still the theoretical possibility of there being some other
>> mapping. In such a case imo we'd better avoid the freeing, accepting
>> the leak (with a log message perhaps).
> 
> [snip]
> 
>>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>>
>> Did I? (I don't seem to recall.)
> 
> I sent an earlier version of the patch to the security team due to the
> theoretical underflow (which was in the end deemed not a security
> issue); that version kept the page and freed it when the domain was
> destroyed.  In response, you wrote:
> 
> 8<---
> 
> As to the patch: I understand the need for deferred freeing of the
> page, but does it really need deferring as much? Wouldn't RCU-based
> freeing suffice (there can't be any other references to this page
> without the domain having been launched, or without the domain
> having at least some memory assigned to it, so it could have page
> tables referencing the page)?
> 
> --->8

Oh, I see.

> Which, naturally, required me to become familiar with how Xen's RCU
> system worked enough to get it implemented.  (Claude did the writing,
> but I need to understand things well enough to direct it and review
> the results.)  I don't think it's unreasonable for me to be annoyed
> that you're now saying you want it back the way I wrote it originally.

But I didn't ask for that. Now that I read your reply, I think I see
how you may have extended my reply to arrive there, though.

What I asked for here is that we free the page if its refcount is zero
(the common case), exactly as you do (via RCU). Yet we would skip the
freeing (and leak the page) in the unexpected case of the refcount not
being zero after the put_page_alloc_ref().

> Now that we have the RCU version implemented and tested, I think we
> should keep it.  It's safe now, and we can keep it safe in the future.
> If you want we could add a comment to the field warning that no
> references should be taken to it because it may change; but honestly
> that seems like overkill to me.

For the field I'm not concerned - it's purpose is clear, and anyone
trying to add obtaining of a ref using it as input will hopefully be
caught the latest during review. It's a ref existing ahead of the
put_page_alloc_ref() which worries me (some).

Jan

