Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F438C5CFC1
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2026 14:13:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1391197.1631147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wusej-0005xv-Kf; Fri, 14 Aug 2026 14:13:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1391197.1631147; Fri, 14 Aug 2026 14:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wusej-0005xn-HD; Fri, 14 Aug 2026 14:13:09 +0000
Received: by outflank-mailman (input) for mailman id 1391197;
 Fri, 14 Aug 2026 14:13:08 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wusei-0005xh-7p
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 14:13:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuseh-001RlB-0X
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 16:13:07 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7f2269-bab6-0a2a0a5309dd-0a2a4507c9ae-32
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 16:13:06 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7f2272-b4ea-0a2a45070019-d155dd32a4f3-3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 16:13:06 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-47fde295992so799676f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 07:13:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2c0a75sm9086953f8f.25.2026.08.14.07.13.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 07:13:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1786716786; x=1787321586; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HIDgOlv81eXCnx4SEzDwYbaT0RePCbYVs8ke2n1X8Gc=;
        b=Vd6WtSS7n/zdJklaYORJuf9fwJ9Han7PumiXqpzj0gzts/B5/QSTI6BzIDuEbqGQBO
         w9bFwV7RSzmMBWkefCt3GG5sM3LvLEtViQjjGwQVf5KrbwQOG/z1suMszCTsDBqTCDIy
         u3oEKjCucmGl0FoKd4QyF/vS4Q4UGhqqCYRmWxNZCAvqoGOkcK402Yo22zTl7fLW1zx3
         1+JeQzXkdA6BgOsH5GcOm6YU59TQ9VfMrXRNVgtFU5UTlUCy8onmPLT33jTKCDyTN2Yr
         8bd1D/Qiaev4FNXGDHaSOzWhxZkk/hsVV1z5c+ump+nv8tFX5Owj3crzrd1qBwFYsXvx
         9JxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786716786; x=1787321586;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HIDgOlv81eXCnx4SEzDwYbaT0RePCbYVs8ke2n1X8Gc=;
        b=BQPtnRibPAIBPVgoi6ZNWBVckmQbfTvihgQh0I97OZbiwp2P8m7MFWqE7yntsJcfDK
         7Pd5wzVQbpbjDcrZDNpf6XZOIetoY428CCAatue9vhI7Pe0bR6Q7BotHjqVa5eGbVCFg
         pAFwLghnN815Tzwo8jC/Y1k46gey2DegkzbGCvUxii+M1uAU9C6+MxgPd5vgh+7aOpgZ
         Cx8n7uxSOMNRjEBwXvfbdSwG87mEScO8hEraLTaKGFMyRWQNlGe+Z+LRSlcxHxZuAgIY
         Uq1N3931+k9aV0CBrfLZc7miA5m186MF6/gvAjzlIBWDLBolVkssHdiCcYrk2E60SGCk
         fDug==
X-Forwarded-Encrypted: i=1; AHgh+RpIkN69KzD19NTd2PHhDZsIzY5jwdnEAXC3qbuY7/7/JsIPG4NyKeYLxQ8OjiwIe/jDejrmYt855YU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySCr4AiV2YPi/od9y822RsdR8RE8x9pJJJEuybJcbS2pIXWSKj
	RCY5q9BTTodYOyjIcbX2VLL0HmZMnSQ3i6hkv8g8e+UqdW+5XAVkoYcyd40GLGJ+ng==
X-Gm-Gg: AR+sD138dpkV1MK6dCtzkbwSM7NAtlAz7y+dh7pgpz1Tgeu4anoOePUgEeMYlYuXwtV
	DgqbXKBh2wYQ+B/A2Y3PEAnBUNQISbrQHWbkfouapLyoTrZFyoKRBB77I34skJubDlUcXDNqZA1
	8pArV60ThQM7CSIH9vHj+MmmfPLKNUXCIsWignnlk4utWJ2CXLH/MmNaT5gNTixY4viBJB7to0S
	0Oxbn3LkFIOvzWZhds8Jzt5lO5KFl+gmwh9elM/TWb+V2wvqub+m73nsf4ii0p/9A3fr8iQlzBo
	AUWXvgx6xIkQQwO9CBdzJQweS9K642p0Xoa/kz7cBiOGIdGjsGMtD+to2i63sjtmynC9wgJINWO
	rtDXPM89Qds/8Vs/pErD0rH3MOYof3L7v0fTvpSzsV51mf1B8XOshicd5q0Q+BJkyOY111mH0gc
	irDcdUrWzoAg8BrbE2Q11JOk8Qg8NeBaNHHiYhQlwcLL3kho618EryPEBQ5d3ivm4vouNQZkwfe
	tUMlLU0oBXNI3VWuTi/y4xsSp5opolH8hc2S+V1r5P+V60vTIWS
X-Received: by 2002:adf:e189:0:b0:47f:ec53:1d2d with SMTP id ffacd0b85a97d-4815a4f981fmr21197989f8f.7.1786716786240;
        Fri, 14 Aug 2026 07:13:06 -0700 (PDT)
Message-ID: <e3d4f0a8-e95a-4dc3-8ca0-df857725d60d@suse.com>
Date: Fri, 14 Aug 2026 16:13:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 7/10] xen: implement new foreign copy hypercall
To: Frediano Ziglio <freddy77@gmail.com>
Cc: "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20260810103018.54564-1-frediano.ziglio@citrix.com>
 <20260810103018.54564-8-frediano.ziglio@citrix.com>
 <43d1ce4a-3a49-42c9-b277-47a89698513f@suse.com>
 <CAHt6W4enamC9rVMK98+q=pWCuXQL1DPgNTCGWMVR-Q2NvX8uTw@mail.gmail.com>
 <b10dbef6-a467-49d0-858e-d88f268e2dfd@suse.com>
 <CAHt6W4dWQvSg1_XtkKowTcznUWs=-ApbvatV4YrQSKR8zJTA0A@mail.gmail.com>
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
In-Reply-To: <CAHt6W4dWQvSg1_XtkKowTcznUWs=-ApbvatV4YrQSKR8zJTA0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1786716786-A5EC6AE4-B1D0E8A0/0/0
X-purgate-type: clean
X-purgate-size: 6688

On 14.08.2026 15:47, Frediano Ziglio wrote:
> On Thu, 13 Aug 2026 at 15:22, Jan Beulich <jbeulich@suse.com> wrote:
>> On 13.08.2026 16:03, Frediano Ziglio wrote:
>>> On Thu, 13 Aug 2026 at 10:41, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 10.08.2026 12:30, Frediano Ziglio wrote:
>>>>> ---
>>>>>  xen/common/memory.c         | 149 ++++++++++++++++++++++++++++++++++++
>>>>>  xen/include/public/memory.h |  45 ++++++++++-
>>>>>  xen/include/xsm/dummy.h     |  14 ++++
>>>>>  xen/include/xsm/hooks.h     |   2 +
>>>>>  xen/xsm/flask/hooks.c       |  10 +++
>>>>>  5 files changed, 219 insertions(+), 1 deletion(-)
>>>>
>>>> As before: If you insist on not implementing the compat case, that decision
>>>> wants justifying in the description. Without that it'll look like an
>>>> oversight.
>>>>
>>>
>>> Yes, I was just going to reply.
>>> I spent multiple days trying to implement the compat case or simply
>>> HVM support with an issue after the other:
>>> - multiple distributions removed the 32 bit support so it was hard to
>>> have a setup;
>>> - the original hypercall this PR is trying to optimise is supported
>>> only in PV (so no HVM or compat guests);
>>> - migration and other operations can work only on PV (like dm_op
>>> operation) due to the usage of userspace handles used.
>>
>> I don't understand how use of guest (not userspace) handles would get in
>> the way of anything.
> 
> In this case userspace is not a typo. For HVM
> copy_from_user_hvm/copy_to_user_hvm are used and these functions
> accept only kernel space pointers.

I fear you've now completely lost me.

>>>>> --- a/xen/common/memory.c
>>>>> +++ b/xen/common/memory.c
>>>>> @@ -1548,6 +1548,141 @@ static int acquire_resource(
>>>>>      return rc;
>>>>>  }
>>>>>
>>>>> +/*
>>>>> + * The "noinline" qualifier avoids the compiler to create a large function
>>>>> + * consuming quite a lot of stack.
>>>>> + */
>>>>> +static int noinline mem_foreigncopy(
>>>>
>>>> I'm wondering: Is the "mem" prefix really meaningful for a static function in
>>>> a file named memory.c?
>>>>
>>>
>>> Changed
>>>
>>>>> +    XEN_GUEST_HANDLE_PARAM(xen_foreigncopy_t) arg)
>>>>> +{
>>>>> +    struct domain *d, *const currd = current->domain;
>>>>
>>>> With the comment on the new XSM hooks (below) in mind: currd wants to be
>>>> pointer-to-const.
>>>>
>>>
>>> Just rebased on master, all XSM hooks accept no-const pointers to domains.
>>> So the suggested change would create warnings.
>>
>> Well, as per below, I pointed you at a particular pending patch, a single
>> hunk of which could be broken out.
> 
> Yes, but my changes would have to have casts from const pointers to
> no-const pointers to avoid warnings and the patch you are pointing to
> would have to remove these casts. I find this less clean than having
> one patch using the current code style (that is no-const pointers) and
> another that changes the style entirely.
> But obviously this is just my opinion.

Such casts would be unacceptable. What instead I have been trying to convey:
Your patch wants to gain a dependency on my patch. And if my patch would
take too long to make it in, that one hunk could be broken out into a
separate, easy to get in patch.

>>>>> +            foreign = map_domain_page(foreign_mfn);
>>>>> +            if ( direction == XENMEM_foreigncopy_from )
>>>>> +                rc = copy_to_guest(copy.buffer, foreign, PAGE_SIZE);
>>>>> +            else
>>>>> +                rc = copy_from_guest(foreign, copy.buffer, PAGE_SIZE);
>>>>
>>>> What I continue to be missing prior to this is the obtaining of a writable
>>>> page ref. That's, as previously said, imperative for PV guests and at the
>>>> very least advisable for HVM ones. (I really wonder how many more times I
>>>> need to comment on this.)
>>>
>>> Unfortunately that does not work.
>>> The code is coherent with MMU_UPDATE.
>>
>> How's that relevant? That's operating on page tables, when here we want to
>> _prevent_ to copy into page tables (or descriptor ones, for that matter).
> 
> This new ABI is to better support migration.
> We are migrating all the VM status including page tables... how can we
> not be able to write them but migrate them from one  host to another ?
> You are basically explaining why changing the check the migration fails.

No, what I'm trying to explain is that without such a check, you introduce
a security issue (of privilege escalation kind). I hope you agree that we
cannot knowingly allow such code to be committed.

To migrate-in page tables, you'd need to copy their contents before they
obtain their PGT_l<N>_page_table type, so that upon being converted to page
tables, they can be properly audited by the mm.c functions we have for that
exact purpose.

>>>>> --- a/xen/include/public/memory.h
>>>>> +++ b/xen/include/public/memory.h
>>>>> @@ -740,7 +740,50 @@ struct xen_vnuma_topology_info {
>>>>>  typedef struct xen_vnuma_topology_info xen_vnuma_topology_info_t;
>>>>>  DEFINE_XEN_GUEST_HANDLE(xen_vnuma_topology_info_t);
>>>>>
>>>>> -/* Next available subop number is 29 */
>>>>> +/*
>>>>> + * Copy memory from/to a given domain.
>>>>> + * This calls is meant to replace expensive operations during migration which
>>>>
>>>> Nit: "This call is ..." However, is ...
>>>>
>>>>> + * are only supported for PV guests.
>>>>
>>>> ... this entire sentence really worth to have here (it looks more like
>>>> something to have in the description)? For it to be possible to find if
>>>> someone considered using those "expensive operations", I think it would need
>>>> to be less vague and name those operations. Furthermore, if those other
>>>> operations were supported only for PV guests, how would migration work for
>>>> non-PV ones?
>>>>
>>>
>>> Maybe:
>>>     This call is meant to replace expensive operations (mmap/copy/munmap) during
>>>     migration which can only be issued from PV guests.
>>>
>>> You can migrate any domain. Just from a PV guest (this is not a regression).
>>
>> Both Andrew and Roger confirm that this is supposed to work also from PVH
>> Dom0 (not sure why you keep saying "guest"), and also used to work. If it
>> doesn't, it would be a regression, and it would help if you supplied more
>> detail on the observed failure.
> 
> Indeed I tested the migration of various domains (PV, HVM, PV-in-PVH),
> but only access to added hypercall from PV and HVM. I should add a
> test from a PVH guest.
> I say guest because to test HVM I used a hack to allow all guests (not
> only dom0).

And why would testing from PVH Dom0 not do?

Jan

