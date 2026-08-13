Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E15C5B572
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 14:23:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390096.1630642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuWKQ-0007Vy-V9; Thu, 13 Aug 2026 14:22:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390096.1630642; Thu, 13 Aug 2026 14:22:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuWKQ-0007Vr-S7; Thu, 13 Aug 2026 14:22:42 +0000
Received: by outflank-mailman (input) for mailman id 1390096;
 Thu, 13 Aug 2026 14:22:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wuWKQ-0007Vl-2E
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 14:22:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuWKO-009mxD-Uo
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 16:22:40 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7dd32b-2eae-0a2a0a5409dd-0a2a4504c994-8
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 16:22:40 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7dd330-b57f-0a2a45040019-d155802de0cd-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 16:22:40 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4956242332dso19990745e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 07:22:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49982165351sm65074155e9.10.2026.08.13.07.22.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 07:22:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1786630960; x=1787235760; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ECr555QZLT6kRJTA0iO1Xz3kSXCmzKIzM06GCqF+zV4=;
        b=SxdX19xOWcrgKP3z+m8THWkm8N8y5b4Me2Xcw6/Ru0EF9i8UQiFnrziH8agkkIIK+Q
         IxaogdPmh/c+SqaBqwTvnJgqGuwrmKCNwtZj0VPbly7H4Icpuc+SnHhPHsGN7yTNH3FT
         oTXfKKQFGD4TUjsP4cskvbOfDR/qeA/YUIX7Mcg7a23/ZxG2PwijhzC/pZoftWv/V0dg
         QL/N/U6aXsmWc9gdwQhwuJK0FkJT9tXQKUEMtD7GRraCxsgNB9jaiTtspGKGvvTNHGgW
         Y2MeE43bzL7hkd1RwTEXrwLmqxRAwFoNbfSoCL3BHRQpr2D9WqQuhevGiIulGj/9Sj/P
         OzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786630960; x=1787235760;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ECr555QZLT6kRJTA0iO1Xz3kSXCmzKIzM06GCqF+zV4=;
        b=HFrzH+SPcFgeMIXBxzR/R52N00qOfWBhNwiH04M4eUcEpb7XUJN5+XcsJ0tO24y9EG
         pmnDb6K0/UQBJRuBCpg8eSWwymNLgK6Y4rwwIbWVTav2vcXAVLLjaj7up9kYBqPxupJx
         vt+ySLVQqO2cteI1rwxWciGFiWtCDAwt8T1gdXve0/Xu8eEv1PUsMGoWyng+kp8ZlNN8
         PD6JesogdDCgROwERIj0cT+B3g5K/XWbLgrS9grFJbHAvhih2k1wzQBa3Rg1BsbpT94T
         VEArBPRwYzw1iRYWsSyBnYApEqw9PW8NAvtVAutm5dolYydrJdLI70mM9Fvjp+NUpeHN
         ZeYg==
X-Forwarded-Encrypted: i=1; AHgh+Rp+CQ3TwiJINsyp8ICGX9UXA2c6roIqMJvseWg/ll6Sx4vsqQMos8c4aJYLzU7+jdKa6KLKWFlumtU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqQJx3by+5qH9AFjYby6t3K9GZR5zB7CDaNdpmmGu3wPEW/0Zn
	OdRFZSd9inprj9fy2db2xmrsZnJf7w/1Ack4YRenD79N7R1rpyvObTisdv8A7+/MQQ==
X-Gm-Gg: AR+sD13EQZncqwXhTDKaldLD6K3tz2oXEsBde42loMK3OOYMYqoQd31iuhBl6QRpKNd
	YbmUvfiBksuX0qApUKMrF/R6X0tLafDS9/5L6yLkWjSR9LXcrVVwDeAZZN9mBYoT27xWZHStIin
	Covu8oAyNPQxRL7/ThX67rRRfFXOoply1Ac6tEHIZrXlYSbDXQHzsbbmavysmr4Usngu5VLyNhd
	QAUP0CMuQN9pTDJIuUTcQRmUUAOWPEgwAhDMzu48fhLuo//o9l5UF1bYaq13ELoOnTI1XkfJpXa
	7WRy/Ac4kX6V0MEwQcj7QmsUq6ZIpNJ0H72oma1Ts2vRrqJSmatMPeM+wezkLI11zJJ+JHRlNdU
	sCdT32BHKx5HzkBqzQCY1i6lCA/l3zq92CxX62hxSwnk6lu2Z8u7AJ0/nUNs0ktSD+4htmDkvkc
	9Eezz+LChqYogASrZwkgQKQlaa4bNHgZ40gLxxd6xMpDKTeK7e2QzLOifXyQisE/aNVVTjuTk0s
	551Nd5UgWnfLxZI8uB585F6Cddl7ig4SJrBe+yWJSK7iT/JouOB
X-Received: by 2002:a05:600c:3b9f:b0:499:4d4d:822a with SMTP id 5b1f17b1804b1-499821d77f5mr70254415e9.17.1786630960055;
        Thu, 13 Aug 2026 07:22:40 -0700 (PDT)
Message-ID: <b10dbef6-a467-49d0-858e-d88f268e2dfd@suse.com>
Date: Thu, 13 Aug 2026 16:22:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 7/10] xen: implement new foreign copy hypercall
To: Frediano Ziglio <freddy77@gmail.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20260810103018.54564-1-frediano.ziglio@citrix.com>
 <20260810103018.54564-8-frediano.ziglio@citrix.com>
 <43d1ce4a-3a49-42c9-b277-47a89698513f@suse.com>
 <CAHt6W4enamC9rVMK98+q=pWCuXQL1DPgNTCGWMVR-Q2NvX8uTw@mail.gmail.com>
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
In-Reply-To: <CAHt6W4enamC9rVMK98+q=pWCuXQL1DPgNTCGWMVR-Q2NvX8uTw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1786630960-C16D2B50-1F815ECC/0/0
X-purgate-type: clean
X-purgate-size: 9830

On 13.08.2026 16:03, Frediano Ziglio wrote:
> On Thu, 13 Aug 2026 at 10:41, Jan Beulich <jbeulich@suse.com> wrote:
>> On 10.08.2026 12:30, Frediano Ziglio wrote:
>>> Add a sub hypercall to __HYPERVISOR_memory_op to allow to read/write
>>> memory from/to a foreign domain.
>>>
>>> Extending MMUEXT_COPY_PAGE seems better on first sight but considering
>>> that MMUEXT is meant for PV only and trying to change that sub-op this
>>> solution is better.
>>>
>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
>>
>> First: Can you please update your recipient list before sending a new version?
>> Roger's move pre-dates this submission by quite a few days.
>>
> 
> Yes, updated, I realized it after sending it.
> 
>> Then: The asymmetry of the new sub-op also continues to have no justification
>> at all. If you insist on not using two (domid,list-of-gfns) tuples to describe
>> the buffers, despite multiple maintainers having asked you to do so, please
>> put down a word explaining that decision.
> 
> All other maintainers, after replying to their comments didn't
> disagree with me, and this was different versions before, so stop
> counting them, it's only you that don't like this at the moment.

None of this happened in public, though? In which case, how would I know?

>>> ---
>>>  xen/common/memory.c         | 149 ++++++++++++++++++++++++++++++++++++
>>>  xen/include/public/memory.h |  45 ++++++++++-
>>>  xen/include/xsm/dummy.h     |  14 ++++
>>>  xen/include/xsm/hooks.h     |   2 +
>>>  xen/xsm/flask/hooks.c       |  10 +++
>>>  5 files changed, 219 insertions(+), 1 deletion(-)
>>
>> As before: If you insist on not implementing the compat case, that decision
>> wants justifying in the description. Without that it'll look like an
>> oversight.
>>
> 
> Yes, I was just going to reply.
> I spent multiple days trying to implement the compat case or simply
> HVM support with an issue after the other:
> - multiple distributions removed the 32 bit support so it was hard to
> have a setup;
> - the original hypercall this PR is trying to optimise is supported
> only in PV (so no HVM or compat guests);
> - migration and other operations can work only on PV (like dm_op
> operation) due to the usage of userspace handles used.

I don't understand how use of guest (not userspace) handles would get in
the way of anything.

> I tried to bypass the above limitations to have the new hypercall
> tested and I manage to have 64 bit HVM working but the result is a
> collection of nasty hacks and supporting them properly is a different
> bigger task.
> Surely a comment in the commit message on this is worth it.

Thanks.

>>> --- a/xen/common/memory.c
>>> +++ b/xen/common/memory.c
>>> @@ -1548,6 +1548,141 @@ static int acquire_resource(
>>>      return rc;
>>>  }
>>>
>>> +/*
>>> + * The "noinline" qualifier avoids the compiler to create a large function
>>> + * consuming quite a lot of stack.
>>> + */
>>> +static int noinline mem_foreigncopy(
>>
>> I'm wondering: Is the "mem" prefix really meaningful for a static function in
>> a file named memory.c?
>>
> 
> Changed
> 
>>> +    XEN_GUEST_HANDLE_PARAM(xen_foreigncopy_t) arg)
>>> +{
>>> +    struct domain *d, *const currd = current->domain;
>>
>> With the comment on the new XSM hooks (below) in mind: currd wants to be
>> pointer-to-const.
>>
> 
> Just rebased on master, all XSM hooks accept no-const pointers to domains.
> So the suggested change would create warnings.

Well, as per below, I pointed you at a particular pending patch, a single
hunk of which could be broken out.

>>> +    xen_foreigncopy_t copy;
>>> +    int rc, direction;
>>
>> Plain int for rc is fine of course, but direction can't go negative, can it?
> 
> No, but the default type for constants is int and "flags" is promoted to int.

Doesn't really matter. Unsigned types want using for values which can only
be non-negative. IF nothing else, then for consistency and doc purposes.

>>> +            foreign = map_domain_page(foreign_mfn);
>>> +            if ( direction == XENMEM_foreigncopy_from )
>>> +                rc = copy_to_guest(copy.buffer, foreign, PAGE_SIZE);
>>> +            else
>>> +                rc = copy_from_guest(foreign, copy.buffer, PAGE_SIZE);
>>
>> What I continue to be missing prior to this is the obtaining of a writable
>> page ref. That's, as previously said, imperative for PV guests and at the
>> very least advisable for HVM ones. (I really wonder how many more times I
>> need to comment on this.)
> 
> Unfortunately that does not work.
> The code is coherent with MMU_UPDATE.

How's that relevant? That's operating on page tables, when here we want to
_prevent_ to copy into page tables (or descriptor ones, for that matter).

>>> --- a/xen/include/public/memory.h
>>> +++ b/xen/include/public/memory.h
>>> @@ -740,7 +740,50 @@ struct xen_vnuma_topology_info {
>>>  typedef struct xen_vnuma_topology_info xen_vnuma_topology_info_t;
>>>  DEFINE_XEN_GUEST_HANDLE(xen_vnuma_topology_info_t);
>>>
>>> -/* Next available subop number is 29 */
>>> +/*
>>> + * Copy memory from/to a given domain.
>>> + * This calls is meant to replace expensive operations during migration which
>>
>> Nit: "This call is ..." However, is ...
>>
>>> + * are only supported for PV guests.
>>
>> ... this entire sentence really worth to have here (it looks more like
>> something to have in the description)? For it to be possible to find if
>> someone considered using those "expensive operations", I think it would need
>> to be less vague and name those operations. Furthermore, if those other
>> operations were supported only for PV guests, how would migration work for
>> non-PV ones?
>>
> 
> Maybe:
>     This call is meant to replace expensive operations (mmap/copy/munmap) during
>     migration which can only be issued from PV guests.
> 
> You can migrate any domain. Just from a PV guest (this is not a regression).

Both Andrew and Roger confirm that this is supposed to work also from PVH
Dom0 (not sure why you keep saying "guest"), and also used to work. If it
doesn't, it would be a regression, and it would help if you supplied more
detail on the observed failure.

>>> + */
>>> +#define XENMEM_foreigncopy 29
>>> +struct xen_foreigncopy {
>>> +    /* IN - The domain whose memory is to be copied. */
>>> +    domid_t domid;
>>> +
>>> +    /* IN - Flags. */
>>> +#define XENMEM_foreigncopy_from 0
>>> +#define XENMEM_foreigncopy_to 1
>>> +#define XENMEM_foreigncopy_direction 1
>>> +    uint16_t flags;
>>> +
>>> +    /*
>>> +     * IN/OUT
>>> +     *
>>> +     * As an IN parameter number of frames of the domain to be copied.
>>
>> I think there's a comma wanted after "parameter".
>>
>>> +     * On output updated number of frames left (0 if success).
>>
>> I further think that adding "to" after "updated" would help here.
>>
> 
> Updated to
> 
>     /*
>      * IN/OUT
>      *
>      * As an IN parameter, number of frames of the domain to be copied.
>      * On output updated to the number of frames left (0 if successful).
>      */
>     uint32_t nr_frames;
> 
>     /*
>      * IN/OUT
>      *
>      * Frames to be copied.
>      * On output updated to the point to the first frame unhandled, if any.

Nit: There's now a stray "the".

>>> --- a/xen/include/xsm/dummy.h
>>> +++ b/xen/include/xsm/dummy.h
>>> @@ -569,6 +569,20 @@ static XSM_INLINE int cf_check xsm_map_gmfn_foreign(
>>>      return xsm_default_action(action, d, t);
>>>  }
>>>
>>> +static XSM_INLINE int cf_check xsm_foreigncopy_from(
>>> +    XSM_DEFAULT_ARG struct domain *d, struct domain *t)
>>
>> I think these and ...
>>
>>> +{
>>> +    XSM_ASSERT_ACTION(XSM_TARGET);
>>> +    return xsm_default_action(action, d, t);
>>> +}
>>> +
>>> +static XSM_INLINE int cf_check xsm_foreigncopy_to(
>>> +    XSM_DEFAULT_ARG struct domain *d, struct domain *t)
>>
>> ... want to be pointer-to-const right away, requiring to re-base over "XSM:
>> make Argo hooks well-formed ones" (or alternatively requiring to split out
>> the change there to xsm_default_action()). We really should avoid gaining
>> ...
>>
>>> --- a/xen/include/xsm/hooks.h
>>> +++ b/xen/include/xsm/hooks.h
>>> @@ -58,6 +58,8 @@ XSM_HOOK(int, add_to_physmap, struct domain *, struct domain *)
>>>  XSM_HOOK(int, remove_from_physmap, struct domain *, struct domain *)
>>>  XSM_HOOK(int, map_gmfn_foreign, struct domain *, struct domain *)
>>>  XSM_HOOK(int, claim_pages, struct domain *)
>>> +XSM_HOOK(int, foreigncopy_from, struct domain *, struct domain *);
>>> +XSM_HOOK(int, foreigncopy_to, struct domain *, struct domain *);
>>
>> ... new hooks with non-const-correct parameters.
> 
> It would honestly make sense if they were all const.
> However at the moment this would not be coherent with the current code.
> For instance these functions call "xsm_default_action" which does not
> accept constant domains (xen/include/xsm/dummy.h).
> I think the most clean thing would be first to change xsm arguments to
> const first.
> But it looks a bit out of scope with this PR.

I'm not asking that you tidy up other hooks. What I'm asking is that new
hooks please be const-correct. Yet of course I'm not a maintainer of XSM,
so Daniel may tell you otherwise.

>> Further: Why two new hooks? See e.g. "XSM: fold xsm_{,un}map_domain_pirq()
>> hooks", "XSM: fold xsm_{,un}map_domain_irq() hooks", or "XSM: fold
>> xsm_{,un}bind_pt_irq() hooks": We'd like to reduce the number of hooks, to
>> reduce (when non-dummy XSM is in use) the number of cf_check entry points.
> 
> It was a comment from Daniel.

Daniel, can you clarify this please?

Jan

