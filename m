Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D42B606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 14:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Msgd/lja
Received: from list by lists.xenproject.org with outflank-mailman.1461405.1672411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLLK2-0005i3-7n; Mon, 26 Oct 2026 14:05:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461405.1672411; Mon, 26 Oct 2026 14:05:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLLK2-0005hv-2i; Mon, 26 Oct 2026 14:05:10 +0000
Received: by outflank-mailman (input) for mailman id 1461405;
 Mon, 26 Oct 2026 14:05:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLLK0-0005fW-P6
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 14:05:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLLK0-005wRu-62
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 15:05:08 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf5e0c-8faa-0a2a0a5109dd-0a2a450484c8-18
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 15:05:08 +0100
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf5e13-b57f-0a2a45040019-d1558029b4d4-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 15:05:08 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a4dc547987so6009905e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 07:05:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a0a476bsm136413335e9.3.2026.10.26.07.05.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 07:05:07 -0700 (PDT)
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
        d=suse.com; s=google; t=1793023507; x=1793628307; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/QgXP0DzeKLRuvqaHQS5LxEJxYqR60Yay7rdZ3OGD0=;
        b=Msgd/ljaNTiGIqOU1M60sZ27ayR8m17H7JnHj1q6n7Qqa78KSQSbKGUelkgMSUs/xs
         i47tdZdhZz2S2M4da7PRiRf4GF5Q+edpb5cBQzWcDNJU70I1KswODRdLjGlTrQiPkGOa
         6B9JRW8V1VBMFbwQ0Z22OnOzIQwhlgkd8y3G7LAMADMn8iHAsFouMET4ENFlU41p9ocT
         Nur4VepSgeU0L1lkFOlcT4Ga2Yb8eKs+71TjndJ7OwG70ShBO3qVKZLT4mXleY6oimP9
         xgTyrdrXXNzousdRtGeZ3Gp0jT+4cI1ZGkzFodb5DlTzEC4VANAPnXpUbrVul8uc5ivs
         Zi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793023507; x=1793628307;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/QgXP0DzeKLRuvqaHQS5LxEJxYqR60Yay7rdZ3OGD0=;
        b=BsY/F57BplQwH9HVekEQEhRuh17aTxhogzMKSQC9spzsDOcD1lUSkV1e8Y9AOmm68a
         gQgC1By6ok1L7GInUsm4lTFv6I9g8eIHEcspTpyjBQVPmeBTZnXroPlWhr13vxeST91h
         DVfC3W2aiBQ3oiJ9xlyQaVDWW7J446KumKwtEzKcDbb65fuO4peFXSbDbVl8pqVuEFYQ
         wtmhcKW+5rNw+QM8e+1XCX44gD9dd04jJYkD+bcp2UIcdYw1xxn5SyJ08/sP2LmCiLHj
         rbrPCVdRgJU863i3VbN/1KwCBUAETNt6cC1xXPlNf7nnid9p6cCBnx365FMrkR5gUlqi
         zHUw==
X-Forwarded-Encrypted: i=1; AKwUvBzIcxuYIO/tUGskpSIdJ+dnq+5U9+fL3yL4uZuQmvDJRuFuC7EejFpyip3GB36DetpJ18w8WRVUMm0=@lists.xenproject.org
X-Gm-Message-State: AFq9FYItw/BOiHi0jufHK0n1IYU0HPv7699tDyrEGy6fkWSeok6OR38J
	m/R+xnGovEDNazBbT35VXb862suHvkfcNErhGCYNexsMywcuVD2Z6puIjHSGaGTZCA==
X-Gm-Gg: AYBFou1FbRZtoz+WRv/ZZMlaprW0MujJVcRsPFlC+DtwQa3IxvrWB5kQw8EI0OvYQsL
	eqa7t+EGPghKLLCJrC6KtkRCaHIwYpuW6/TVbkJFMQsrVjd2z9hhQliEfdlYutMZiVu/Xe62EkW
	kLQuerAMJFhp4OKI6lSq+GwvzaIPf2E5jGO9KTksmw1V7pJFoRl4YTc7fB4qQz581qTjitGDziz
	Yzo5k3DT1BE/vLjSQ7JcbPyqNzCEgs9r4hv4XgQsLNnPaFRERIgQS0cgIDIpIHxuD4BT5LXM14w
	XTwGfqO6wUGbgEhmbusfKvg7wCreXrvOqWrc7bN7v0KcGCxLJIlyprbdu8V16s5HA7hJddKrdpU
	KfE2j2gpK7vNQt0eA4Ha5Pp3ba9XDCtUeWK6Y80QtHseCcCuhY9Wm05fIVkAU4gfEcFjnRCeyYs
	Xu0llV824b0+e7VTjE6GceNBu2fGgwigY1NF4cvAyoP0mxsHav3saoQ+EA+WULoJKcBJVw0knP/
	gNum8+karPRvhnf77Qqm7zM37hIsv3RrvN1xziWdEu6NSoZZSOHIIvCqx/OyFR3UEiwk48sbyFd
	p4F+ooyvaBECFEwL/HBrlkvFoQijT3omfZ+LhqOVRHA=
X-Received: by 2002:a05:600c:c056:b0:4a4:4d57:8462 with SMTP id 5b1f17b1804b1-4a44d578602mr82347305e9.24.1793023507391;
        Mon, 26 Oct 2026 07:05:07 -0700 (PDT)
Message-ID: <535e56a1-c9ad-4866-ac11-ebf9fe0115bc@suse.com>
Date: Mon, 26 Oct 2026 15:05:05 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/vcpu: ensure no write when runstate handler is
 NULL
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20261023161742.67329-1-roger@xenproject.org>
 <47d6f426-6751-4a32-a187-2fb8a5347091@suse.com> <at9cgI2cIaS6nMAp@Mac.lan>
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
In-Reply-To: <at9cgI2cIaS6nMAp@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1793023508-524CBB50-8EEB535D/10/78276251493
X-purgate-type: spam
X-purgate-size: 2725
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26.10.2026 14:58, Roger Pau Monné wrote:
> On Mon, Oct 26, 2026 at 02:06:48PM +0100, Jan Beulich wrote:
>> On 23.10.2026 18:17, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/x86_64/domain.c
>>> +++ b/xen/arch/x86/x86_64/domain.c
>>> @@ -58,6 +58,11 @@ compat_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>          rc = 0;
>>>          guest_from_compat_handle(v->runstate_guest.compat, area.addr.h);
>>>  
>>> +        /* NULL handle is deregistering the address. */
>>> +        if ( compat_handle_is_null(area.addr.h) )
>>> +            break;
>>> +
>>> +        /* Update the newly-registered runstate area, best-effort. */
>>>          if ( v == current )
>>>          {
>>>              XLAT_vcpu_runstate_info(&info, &v->runstate);
>>
>> While likely unnecessary in this x86-only handling, ...
>>
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -2330,6 +2330,11 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>          rc = 0;
>>>          runstate_guest(v) = area.addr.h;
>>>  
>>> +        /* NULL handle is deregistering the address. */
>>> +        if ( guest_handle_is_null(area.addr.h) )
>>> +            break;
>>> +
>>> +        /* Update the newly-registered runstate area, best-effort. */
>>>          if ( v == current )
>>>          {
>>>              __copy_to_guest(runstate_guest(v), &v->runstate, 1);
>>
>> ... if we make null an official "de-register", then imo the earlier
>> guest_handle_okay() also wants bypassing in the null case. An arch
>> could - in principle - reject a null handle.
> 
> Yes, it could en theory be possible, albeit I think it's very unlikely
> we gain anything similar to x86 PV elsewhere.  Would you be OK with:

Yes, this is fine with me:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -2324,12 +2324,21 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
>          if ( copy_from_guest(&area, arg, 1) )
>              break;
> 
> +        /* NULL handle is deregistering the address. */
> +        if ( guest_handle_is_null(area.addr.h) )
> +        {
> +            runstate_guest(v) = area.addr.h;
> +            rc = 0;
> +            break;
> +        }
> +
>          if ( !guest_handle_okay(area.addr.h, 1) )
>              break;
> 
>          rc = 0;
>          runstate_guest(v) = area.addr.h;
> 
> +        /* Update the newly-registered runstate area, best-effort. */
>          if ( v == current )
>          {
>              __copy_to_guest(runstate_guest(v), &v->runstate, 1);
> 
> Thanks, Roger.


