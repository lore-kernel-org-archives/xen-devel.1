Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD90606A32A
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 07:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ciBxMHp7
Received: from list by lists.xenproject.org with outflank-mailman.1500635.1696704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVkkr-0006zt-Sl; Tue, 24 Nov 2026 07:15:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500635.1696704; Tue, 24 Nov 2026 07:15:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVkkr-0006zl-O0; Tue, 24 Nov 2026 07:15:53 +0000
Received: by outflank-mailman (input) for mailman id 1500635;
 Tue, 24 Nov 2026 07:15:51 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVkkp-0006zf-Gg
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 07:15:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVkko-000Z0D-Ek
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 08:15:50 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b0539a2-bab6-0a2a0a5309dd-0a2a4501b9dc-12
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 08:15:50 +0100
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b0539a6-5bcc-0a2a45010019-d155dd2eb840-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 08:15:50 +0100
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-4a42b34e930so3631862f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 23:15:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6c43563esm27377180f8f.57.2026.11.23.23.15.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2026 23:15:49 -0800 (PST)
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
        d=suse.com; s=google; t=1795504550; x=1796109350; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NIFoQ6PeFqzt116XUapoVE3J7XEKvbs+tVoReqnLgCU=;
        b=ciBxMHp7OU4gWG4C5CsddhfU74jj/qGNn1fzvuk5fKZh2p7qFhCyfst6cuhJWq+JYx
         cVv8/4NroXrzf+xxqWBNxE6FwAf+UtR/zXiSprBlrBVDOc9YXuauimzv4WKjF9IjomzN
         oRruCtr+CwqJ3eqwnA9cu/umKsHxnQtxHWy01/B25wDCER/HxLccIZLHCpOzgG63EaPA
         O9GCj/ox52rE0wv3boZfoG9Hy5/6v2XBDQafqPWzmvvg/44jq75K/Ed0KzakBCWGhqm9
         hc8SMa05yjPBAQJwR3X2f2Fi9GJdbRY/kgGxfUmIQmPz9lwFs8kwfmAlmg08YPkDW1gy
         AR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795504550; x=1796109350;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NIFoQ6PeFqzt116XUapoVE3J7XEKvbs+tVoReqnLgCU=;
        b=bXzlbllDGsuwv3zNxjc5m+mU49qxSG5zW0xMOjoDkvpQqep6khjzmQyCcStGErdL0g
         JrcUD6sCxXd4qq55Lus05rxF1xVOu42qxHfzZEUt6p4EgCX49tFk+Alg5hYKOFP7/r4R
         Iks6buKLExcGRSTxmPXJF+woLx6AX62nKs83r8wmbUcu/G9rT/4xV73Qfdl+A5M/5pbA
         DFeY3K3VZ4h+CfxQ5WbIqG4iumXzGbc9yuspY/PVNT0b5Jm2FbsU5+FQAlfrr8ATzzWf
         99GGh41IhI9K70/PYsxRFscuxAInN6Bepsdo+1h7iI/+I7Bets+7JVRtmIIZJGFKx0RQ
         ojiA==
X-Forwarded-Encrypted: i=1; AL+hErFI60TVBaAQ1rfCUB0DZJ2IdN7opcZPKLtxwmxFzMuGARwcIsbuWC1WwRWZHJur57a9haASbbXIk6c=@lists.xenproject.org
X-Gm-Message-State: APuU4Z92DJ18VDzxEtmH1MR3+fiWI9i2CftNBIFuC4vi33FkywoCLDLM
	u8ihnpFLPz/71f3QzkmcuQxqEjXiB9QA+mXqyTOfsFEWOpSanF6OK0weHXOa97HCeA==
X-Gm-Gg: AZFdTZfiSZkEsW3vSU98U6Xr48u9WvOaSBDwYQUoo4NLbOnpMYFxs/uW/7h5LenIxG6
	NQeTGpTdCW5MrOFVFzWo5EALsD4OLfF1lvc7Ut7ycG49wxZEI/LI9jabGl19Q+b1feTuDAQNtIt
	Ne60dTxUmn8OQUb7Vkot5WUNRrTeDh60lFCVjPedDFnlRFDSLTVyKV2ov0JCbo/FOHl+nbUJa0M
	qdSvt5ZfxbNCTuMNyhAJib41gKw01B/78S7zBgGJjI3s6n4pP7RU5or5Er7sMF7xuWrs048tKfS
	AdxI/OCGnsLkU4+D8ToYCi32sCZvyCgCKuEhQ1i/j4EPuHuJay0rkGRIPxSJ0YXce5vdU4Sx6WM
	Kef/FzFoBOEyNNGsjkLo9FoAsikDgdZxL8lLI/iRk3Ky3yVGNQkzc+yKqoccUJqy00dvPAD8vEG
	fWeE3DL9lvyDBGb/PMUjuGbe/s5yHDDMKgUotymEFWy0BY4AdGGx5iX0B35lZ24qxXbYwEiHTE2
	2rUBTCflkfC6Q/iHXG7d8jWFLVbG5Q3phzKpjYsjr6yRiymuBz+BNoeEFCg1spc6M7NEZhTbSNe
	0SEBfacw2lapVmYdAJVTIRqEMSpKHV6ZzZcPgqfbN3T3A44EVe7VUYtzG6q+2GBtaQnr8t90QeJ
	Ho+Od+ziF72/YD0eUWA==
X-Received: by 2002:a05:6000:491d:b0:4ab:f5b0:a7fa with SMTP id ffacd0b85a97d-4b598a60967mr6282401f8f.33.1795504549684;
        Mon, 23 Nov 2026 23:15:49 -0800 (PST)
Message-ID: <8603af36-0c55-48e7-8440-db86f87f13f5@suse.com>
Date: Tue, 24 Nov 2026 08:15:48 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/p2m: don't request mapcache invalidation for altp2m
 removals
To: =?UTF-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <ml@icedev.pl>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Tamas K Lengyel <tamas@tklengyel.com>,
 xen-devel@lists.xenproject.org
References: <20261123040805.23963-1-ml@icedev.pl>
 <4739bbe4-f69d-4f6c-9878-4da1e620937c@suse.com>
 <CAJ_Okw5b-BagzxirVYnvWBo--H4L5rdrEfH7guaasDbRx5a1+w@mail.gmail.com>
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
In-Reply-To: <CAJ_Okw5b-BagzxirVYnvWBo--H4L5rdrEfH7guaasDbRx5a1+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1795504550-4E15B5FD-F9EEC6F6/10/78276251493
X-purgate-type: spam
X-purgate-size: 2742
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23.11.2026 16:36, Michał Leszczyński wrote:
> On Mon, 23 Nov 2026 at 14:23, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 23.11.2026 05:07, Michał Leszczyński wrote:
>>> From: Michał Leszczyński <ml@icedev.pl>
>>>
>>> Since commit 588d961d15d1, p2m_remove_entry() requests a mapcache
>>> invalidation for every removal, including altp2m entries removed via
>>> p2m_change_altp2m_gfn(). Device models map guest memory through the
>>> host p2m, so such removals cannot leave them with stale mappings.
>>>
>>> When the request is issued by another domain, every vCPU of the guest
>>> synchronously broadcasts IOREQ_TYPE_INVALIDATE on its next hypercall.
>>> DRAKVUF triggers this whenever it removes the last breakpoint from a
>>> page.
>>>
>>> This was measured on Xen 4.22.0 with QEMU 9.1 and a 2-vCPU Windows 10
>>> guest, benchmarking a dummy application which calls NtCreateFile in a loop
>>> while DRAKVUF's filetracer plugin is tracing those calls. On every such
>>> syscall entry, the plugin places a temporary trap on the return address,
>>> to be able to observe syscall's return value. The trap is removed after
>>> the observation is made. Thus, every syscall translates to altp2m entry
>>> addition and removal under this benchmark scenario.
>>>
>>> Without this change, each traced call took about 8.1 ms.
>>> With patch it goes down to about 0.19 ms (~43 times faster!)
>>>
>>> Only request the invalidation for the host p2m.
>>>
>>> Fixes: 588d961d15d1 ("IOREQ: refine when to send mapcache invalidation request")
>>> Backport: 4.15+
>>> Signed-off-by: Michał Leszczyński <ml@icedev.pl>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> Aiui the argumentation equally applied for nested P2Ms, even if the description
>> doesn't mention that case at all (but the code change covers it).
>>
>> Jan
> 
> As far as I understand, the device model only uses the host p2m to map guest
> memory (foreign mappings/ioreq handling), so it doesn't need to be in sync with
> changes made to any other views.
> 
> Moreover, no code path currently calls p2m_remove_entry() providing a
> nested p2m as an argument. Should such a path appear in the future, the
> p2m_is_hostp2m() check would still be correct.
> 
> I'd suggest replacing the second sentence of the first paragraph of
> the description
> with:
> 
> "Device models map guest memory through the host p2m only, so removals
> from altp2m or nested p2ms cannot leave them with stale mappings."
> 
> Could this be adjusted on commit? Otherwise I'm happy to send a v2.

No problem adjusting on commit.

Btw - I got three similar but not identical replies. I hope I didn't miss
any subtle difference.

Jan

