Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3D2C54F4D
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 15:40:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374870.1622157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wojuz-00063e-0W; Tue, 28 Jul 2026 15:40:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374870.1622157; Tue, 28 Jul 2026 15:40:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wojuy-00063X-Tl; Tue, 28 Jul 2026 15:40:32 +0000
Received: by outflank-mailman (input) for mailman id 1374870;
 Tue, 28 Jul 2026 15:40:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wojuy-00063D-6K
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:40:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wojux-00EpAB-Bw
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 17:40:31 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68cd5f-2eae-0a2a0a5409dd-0a2a45039890-28
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 17:40:31 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68cd6f-fae8-0a2a45030019-d155dd2cc01e-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 17:40:31 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-47f64ca1c2dso1209040f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 08:40:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fb6aa3a32sm105576f8f.2.2026.07.28.08.40.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 08:40:30 -0700 (PDT)
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
        d=suse.com; s=google; t=1785253231; x=1785858031; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hFZwZn3DnJBY7rChZGEND6UQLFucbMlM7emvpdkl73c=;
        b=ORcELPFPipDvl3VaAtdI3o7txr35JAA9gihbXbtcROu7yqptSz35S6DMpQoTI2YdgW
         wF2nOGaZ7tSZ5CgwDQ5032HrUHglAHSiNKuNMmaJ7mjziTbrMq6ixpG1py6nkG328UYS
         37fYSxyBSFs677DOkLwdKlEHd4b0+SVLBRxsUla8a5otglJwnWmbcJY9gk5x9WN9sccN
         LMvTSKNgmFR3eGbMe/9YcPddLaXIS1uaGBMhREkY/9oAhrmOQh6da5K6pwys5FTCxYFb
         X22IhxZ9l/nZ7FHQYjIsq4xiAP3fVaxa4rn2bC5eTmqaa1bxWMSZnlL/9/yXfAnEzeF2
         ex1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253231; x=1785858031;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hFZwZn3DnJBY7rChZGEND6UQLFucbMlM7emvpdkl73c=;
        b=TO0qFvwoKcspS8Km6xH6/1Hv01BByxOzJwoqbXQAMGwHocxfmdKc6+eoubG3+86f3Q
         D/fx3aVsx1F47QgHmZrB+fEVoLvz5KWhKBjLqiQHPKYjAB1ns1bcmT/PmxYgt/NVM75m
         RX5T1c7COf0nKys5FxqaTxO57qLKwOW4Jrx4RVT3CwuQfaY7SQDA7ZgmlZ9Zy9puQ3Rl
         wKQeY7ASlpSFA2wYkoDNfoGQqBDLwsvSd14Eb1smYQFpNThsouXaDojGZOYRP5SqFSYX
         BWCOxG0FCAS7kX/d2GF+KPjQtkH6QF1ZntCyNYCHlJ519wZDTRC9EaTlsIvZJmD54Ypc
         n1NA==
X-Forwarded-Encrypted: i=1; AHgh+RomQQc3RANnJUPT9plzUou1r43GfWnM6sIy9frjkrAPsHcfwmMagKalM6U9n4lYyNtqKui5ONIx5Qs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxdp3N0nd8oAA+702Ua1wS2rRROV8CbADbfTH0dS929jtp6m2Pu
	V7CYtq+B6IrhFkyBBG6zeWkScQuGXwL/wbLgPn018ZJUawMxAn3W2msz7NeNipwhvw==
X-Gm-Gg: AR+sD10M9730dj3MAbYyZYnlkogEoF8AZc6AeaSq3mzS5m0U+Ohz5Rzb1gEvM69acgz
	HZystt61PZrJADpFyuZ5zOtqo7IPsZWDEL9MsW9mmWUf/m3gkJ9gOVnhXoX59WvHZIYbCsEmDnx
	+/j8qXLRhpO1iwZox4rKedn1rQAn7usk57j30MJTYFwNjcxZbtux+zbFMEUG6hZagHQ48u/RbnY
	s8eu7mnSeCu/40jQI1pYlZDg2Bd6q7qve4/EGIb77hUxnwtAxHLeDlDNVDJsrjQMzJqoFRr9ZZ+
	klsXnMemZNP8GQdSOec1Sk3QKGDTbRYcaEdr+KuvrweTcmvZ1LVtF6cV23McrrFVUuK+18cayzM
	4MTh9b3nkTCQepKBrLS0BmzUVNHASt+WB2pNnAeRUiJY39NT2EFyIANoOakYaPrFSqDWPSGWxOf
	9S43ghLZdxCjh/5MaEs8yCGFhI+IVDPTv0Qz+No4r7H8op7TN5GshtZfpdEOeHfGT9bQ==
X-Received: by 2002:a5d:5d0b:0:b0:47f:80c3:92a0 with SMTP id ffacd0b85a97d-47fb1f13dffmr3320447f8f.29.1785253230758;
        Tue, 28 Jul 2026 08:40:30 -0700 (PDT)
Message-ID: <0183df56-8f9d-4c1d-aa8b-43bc315696be@suse.com>
Date: Tue, 28 Jul 2026 17:40:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/23] xen: introduce CONFIG_HAS_SHARED_INFO for archs
 without a shared page
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
 <01df5be27b502a19dd51ded7577af68cee234c58.1784559209.git.oleksii.kurochko@gmail.com>
 <e8b6669c-a938-43b4-bb9e-d9c26b83fc57@suse.com>
 <c4fa7f44-a11b-43ef-9f7f-e202b26957d0@gmail.com>
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
In-Reply-To: <c4fa7f44-a11b-43ef-9f7f-e202b26957d0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1785253231-778F24E9-81E5A9C5/0/0
X-purgate-type: clean
X-purgate-size: 3032

On 28.07.2026 17:29, Oleksii Kurochko wrote:
> On 7/21/26 4:50 PM, Jan Beulich wrote:
>> On 20.07.2026 17:59, Oleksii Kurochko wrote:
>>> --- a/xen/common/domctl.c
>>> +++ b/xen/common/domctl.c
>>> @@ -102,9 +102,14 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
>>>   #ifdef CONFIG_MEM_PAGING
>>>       info->paged_pages       = atomic_read(&d->paged_pages);
>>>   #endif
>>> -    info->shared_info_frame =
>>> -        gfn_x(mfn_to_gfn(d, _mfn(virt_to_mfn(d->shared_info))));
>>> -    BUG_ON(SHARED_M2P(info->shared_info_frame));
>>> +    if ( IS_ENABLED(CONFIG_HAS_SHARED_INFO) )
>>> +    {
>>> +        info->shared_info_frame =
>>> +            gfn_x(mfn_to_gfn(d, _mfn(virt_to_mfn(d->shared_info))));
>>> +        BUG_ON(SHARED_M2P(info->shared_info_frame));
>>> +    }
>>> +    else
>>> +        info->shared_info_frame = gfn_x(INVALID_GFN);
>>
>> There's one issue left here: INVALID_GFN is a Xen internal concept. It could
>> change value if we saw a need. Therefore you cannot use that value here, to
>> supply it as hypercall output. It needs to be ~0, and imo the public header
>> also wants amending to indicate the special meaning of this value.
> 
> I think I get your point. I will use ~0 here.
> 
> I don't see INVALID_GFN in public headers. If it exists then it isn't 
> clear why it shouldn't be used here.
> 
> Don't we want to add something like:
> 
> /* Domain has no shared_info page? */
> #define XEN_INVALID_SHARED_INFO_FRAME (~0ULL)
>      uint64_aligned_t shared_info_frame; /* GMFN of shared_info struct */
> 
> in public/domctl.h.

In principle we could consider doing such, but if we did it needs to be
technically accurate. It may not, as your code fragment does, assume
that unsigned long long and uint64_aligned_t (and for just the purpose
here also uint64_t) are the same thing. Yet at the same time I think we
have successfully avoided use of the fixed-width integer constants
macros in the public headers, first and foremost because plain C89
doesn't offer them.

Hence overall I think introducing such a constant is going too far;
merely stating verbally that the field being set to all-ones has this
particular meaning should be enough.

>> And there's one further aspect to consider: Do we really want to retain the
>> shared_info struct domain field when !HAS_SHARED_INFO? 
> 
> I think we could consider that.
> 
>> Making it conditional
>> would require some adjustment here, but might be tidier overall. In
>> particular doing so would eliminate the risk of new uses of the field
>> appearing, with people not noticing that they'd break RISC-V.
> 
> Would you be okay with the following change:
> 
> +#ifdef CONFIG_HAS_SHARED_INFO
> +    info->shared_info_frame =
> +        gfn_x(mfn_to_gfn(d, _mfn(virt_to_mfn(d->shared_info))));
> +    BUG_ON(SHARED_M2P(info->shared_info_frame));
> +#else
> +    info->shared_info_frame = ~0;
> +#endif

It's not pretty, but acceptable imo.

Jan

