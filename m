Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED126C79F99
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 14:57:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410923.1641727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3amb-00027A-UR; Mon, 07 Sep 2026 14:57:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410923.1641727; Mon, 07 Sep 2026 14:57:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3amb-000273-Rq; Mon, 07 Sep 2026 14:57:17 +0000
Received: by outflank-mailman (input) for mailman id 1410923;
 Mon, 07 Sep 2026 14:57:16 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3ama-00025s-9r
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 14:57:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3amY-00G3d8-Te
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 16:57:14 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9ed0b4-e002-0a2a0a5209dd-0a2a4505abe4-30
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 16:57:14 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9ed0ca-4cb1-0a2a45050019-d155dd2aec16-3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 16:57:14 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-4858be8b509so1570051f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 07:57:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485885be1c1sm28553566f8f.32.2026.09.07.07.57.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2026 07:57:13 -0700 (PDT)
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
        d=suse.com; s=google; t=1788793034; x=1789397834; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KyaRUQmJ8nPY1L6eHcD2/c7rGWnpm8vJp4444N2bS8g=;
        b=JlTOlDNfs8w+gmphMqarsN7KDe4CQrkYe7tkVAxoUgtZXeb+UG5YY0HOvgMjM9/pU5
         OzowYHJInD20WJth2/pZBEzwsNeTzss97sSPM2RGpbk6GNU1b3vkuYJBUFy+r08HW/kS
         BJGK9o0ovd/dFt1RtM/Q5xUqO625hT8qKBvksqR1PUFUgeSPtjL4xyyq3kKM3fnqFXr1
         QCmGBmJQbbYlK1uq2ygzADsLkL7nK+S11K4vRpYd8nVC1RIBo7+j1UAozme38BIgry/X
         LUeekEwjfMAvrStmwUNVTPdgLbjRQLj2lpaeQZIUIiwcAIqwPHjE0w/z/sZ6Qxln38qL
         12SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788793034; x=1789397834;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KyaRUQmJ8nPY1L6eHcD2/c7rGWnpm8vJp4444N2bS8g=;
        b=XO/sQlW0mHeIJZRhNQXCJ7Dl8pteJJUyHsuVdcuk1MEx0YlaClSortubj9CsmvjJNM
         NR6I5wqe8X3k/WC7vzLW55qMe+d8yv8xwKwVX1zoPhXew0MHlKn6qo3HvjaKh8mD4jlm
         tjIQWeXs7Sq8Y2+AaZ8Wq2Iyvd4bWLai0DQtXRQVfvh8ig2RK6MnPJ33j3KOX6sr/CcH
         W7U7V6juJqW/aHV3PdJpR3qIVOCpAIbN9fhxjOBHBQHLRHXV5LHHsOnhe5gSMTACe0Gt
         js8nd6kEHBBvjjrRU6cHLz0JPQs/gXdRjx7Pi+9waiiUMIQ4+9TgSoG2YO48clNStcAV
         8Jtg==
X-Forwarded-Encrypted: i=1; AKwUvByVUscV9+lNrZSPxHAPsSeVU4o8Nx7LcpphGfspA0B8J5QTlgPWGoeM0IHH9eGOE4xtXkE50Qez/f0=@lists.xenproject.org
X-Gm-Message-State: AFuF++kc2g+imJqYauZL0Y9dvsqC1ACafmguDCQs/GDxmTeLA5i1XrCK
	D/cGyto/xF/MKy5NqlNXWfjDELgd3k5FUkmEe29wFfIbCAPl4H+BHejC3nPeJ+/qEA==
X-Gm-Gg: AYBFou1bZO9pvS4ilXy1bpG3IxgBKdgohsc7eVT5qV/JRETOlSWKu0W5oRAHZ7S8mBn
	5uPPdtew2pQLTNr+nWgpu/YqIjkpgnfFuVfezjV1Jo0w2DDH29Iu+prG4Z9ZrTCKCZgS8FCNauf
	lApRSfJCfzpYY/ivFXlruXVEQt/1vxhkhfuDN5gaGHNxX14SI5KFK5rBNsTiziBupMwVuSGlqc3
	pvaGmErYcJJESSRWHpOtBRAiqmVTMELGCieeVmvjCAkMlKQOSYXMFFVN007iHsDkku51ZIjmRMa
	3F0HNInosFNI/0NbZ6bYzhENN7IQxJLfzcDqoD29iRvjnB4heo4xa5fveHLzS97Y2JKR0HTyVf7
	TAvMKcnWDLtDUUzxHoRb70UzM3felqdA4WQuShZDgqaBxV1KZvOSJee/yucWC4BsF2E0UkK2VRZ
	Mvbz4VGhd9xBFf7wQ9GbB5xdYBlgk+x24bIzNfAoS2G3IfRPtqhjRjazTTOu/3DmIJ9Cj3wGOeo
	6vsbOdlXOpEZ13KHBMqHcES5Drpi+int9LAAVjCgo5Yaan+ndHZ
X-Received: by 2002:a05:6000:4029:b0:485:8bad:fb4a with SMTP id ffacd0b85a97d-4858badfe5bmr24135966f8f.7.1788793034322;
        Mon, 07 Sep 2026 07:57:14 -0700 (PDT)
Message-ID: <3f23bfd1-8f55-43ac-a49a-825ad483f083@suse.com>
Date: Mon, 7 Sep 2026 16:57:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/14] x86/pv: set/clear guest GDT mappings using
 populate_perdomain_mapping()
To: George Dunlap <dunlapg@umich.edu>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Alejandro Vallejo <agarciav@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
 <20260901-asi-part2-4-ecc269f268b7@xenproject.org>
 <39118b9f-2c63-4523-a7c6-76cc25d43163@suse.com>
 <CAFLBxZbp8V0qCLgfTRArVBcYnGcJJzyW++TvKHtuRdTuYUKzGg@mail.gmail.com>
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
In-Reply-To: <CAFLBxZbp8V0qCLgfTRArVBcYnGcJJzyW++TvKHtuRdTuYUKzGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1788793034-F5EA92A1-EC747458/0/0
X-purgate-type: clean
X-purgate-size: 2900

On 07.09.2026 15:51, George Dunlap wrote:
> On Mon, Sep 7, 2026 at 1:51 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 02.09.2026 11:43, George Dunlap wrote:
>>> From: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> Until the previous patch, update_xen_slot_in_full_gdt() used the
>>
>> Please can we avoid "previous patch" (also again below) and alike in
>> commit messages?
> 
> Something like this then?
> 
> 8<---
> update_xen_slot_in_full_gdt() used to update the incoming vCPU's page
> tables with Xen's GDT through the stashed pointer in
> d->arch.pv.gdt_ldt_l1tab, because map_domain_page() couldn't be called
> in a context switch. Having a handy pointer to an always-mapped
> version of the GDT/LDT L1 table, other sites which modify the table
> started using it for convenience, even though they aren't called from
> within a context switch. One example is pv{set,destroy}gdt().
> 
> With update_xen_slot_in_full_gdt() now using
> populate_perdomain_mapping() (see "x86/pv: use
> populate_perdomain_mapping() to map the Xen GDT"), the stashed
> reference has lost the user that justified it. Switch
> pv{set,destroy}gdt() to populate_perdomain_mapping() as well; the LDT
> paths are the remaining users, after which the stash can go.
> --->8

Sgtm, thanks.

>>> --- a/xen/arch/x86/pv/descriptor-tables.c
>>> +++ b/xen/arch/x86/pv/descriptor-tables.c
>>> @@ -49,33 +49,42 @@ bool pv_destroy_ldt(struct vcpu *v)
>>>
>>>  void pv_destroy_gdt(struct vcpu *v)
>>>  {
>>> -    l1_pgentry_t *pl1e = pv_gdt_ptes(v);
>>> -    mfn_t zero_mfn = _mfn(virt_to_mfn(zero_page));
>>> -    l1_pgentry_t zero_l1e = l1e_from_mfn(zero_mfn, __PAGE_HYPERVISOR_RO);
>>> +    const mfn_t zero_mfn = _mfn(virt_to_mfn(zero_page));
>>> +    mfn_t zero_mfns[ARRAY_SIZE(v->arch.pv.gdt_frames)];
>>
>> I wonder if having an initializer here might not result in better code. The
>> array could likely be filled with REP STOSQ here, and ...
>>
>>>      unsigned int i;
>>>
>>>      ASSERT(v == current || !vcpu_cpu_dirty(v));
>>>
>>>      v->arch.pv.gdt_ents = 0;
>>> -    for ( i = 0; i < FIRST_RESERVED_GDT_PAGE; i++ )
>>> +
>>> +    for ( i = 0; i < ARRAY_SIZE(zero_mfns); i++ )
>>>      {
>>> -        mfn_t mfn = l1e_get_mfn(pl1e[i]);
>>> +        zero_mfns[i] = zero_mfn;
>>
>> ... the live range of zero_mfn would reduce to about nothing.
> 
> Tried it: GCC didn't use REP STOSQ [1], but seems worth it for clarity
> and register efficiency anyway.

Interesting - room for improvement there then.

Jan

> [1] Fable experimented with a few different compiler flags, but
> couldn't get a REP operation;  it said "The reason is structural:
> GCC's string-op machinery handles block clears and byte-splat fills
> (memset means a repeated byte); a fill with a non-constant 8-byte
> value is not a memset and never reaches that expander".


