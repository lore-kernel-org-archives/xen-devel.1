Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7791FCA5FFF
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 07:47:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442000.1659521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEMN8-0000tk-2X; Wed, 07 Oct 2026 07:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442000.1659521; Wed, 07 Oct 2026 07:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEMN7-0000td-VX; Wed, 07 Oct 2026 07:47:29 +0000
Received: by outflank-mailman (input) for mailman id 1442000;
 Wed, 07 Oct 2026 07:47:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEMN6-0000tX-RC
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 07:47:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEMN5-008CkA-FK
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 09:47:27 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac5f90a-8faa-0a2a0a5109dd-0a2a45049c10-14
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 09:47:27 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac5f90e-b57f-0a2a45040019-d155dd2de960-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 09:47:27 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-48bbb06e746so1952346f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 00:47:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1808d7b52sm17254795e9.2.2026.10.07.00.47.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 00:47:25 -0700 (PDT)
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
        d=suse.com; s=google; t=1791359246; x=1791964046; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g7ljQ8QJLZNNdO100l4fN08FN/ZzE/N+9TqclgR6ffQ=;
        b=ADrB1f/TUvSGXi/fV9VPc6sSvPU+MR1+7eD23kMnylKHzqU2HRggXAwWIsLul3KLH/
         3TQ2MyssZTVYEfU+++YDwZhb9Q6g8YBq7F9xNd3TkyIvLxB8A5IWIrsQY6NbheSpQkHb
         ECZ6UHpz6T+obyKuMicwtN94l2qj08qgk3RihBwH+XHbiWQAmKYM3rs9NawSjH2HfL5H
         6cOBQje4mFCjwyr8HFJemP9zokOTWSxx8rRhwCr4k/VpmgHfnl5dAiePxhSoOkFKXU06
         KaKI+bSVYxWebB5asT9da4cV/JMia2jRfZqPwWLkWhERYC+T6ozfB7fjePMvKFm8bp8Q
         HmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791359246; x=1791964046;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g7ljQ8QJLZNNdO100l4fN08FN/ZzE/N+9TqclgR6ffQ=;
        b=rYwKmNu8H7/lF2CXC+ROteQjWnx3grZVW/CZhqKWSl/Cjwcufgd3Y26dI0DCFLjPY/
         YCqO+cnPCdU93uqsO1MojB/uBADz/wlsxiyeZ/MHi0U7Z9s3X7pjnPirZe84NyYIsetA
         w40c8BzZIv58xQin0LRDm2K6giqA0k7PZSzJ/4+ef8azdrwvh4mlBFA7Dtx+n0j3Ygeh
         m6HoLeKJLsgC4HcMlaJspC7O9SzQ6ft1ImvmaVuOAyxlWZLagZD2fOvXR8r7eiiqI2O0
         AKYRNVMmGCmTqxkbhLfHr3AvOVz4k9n8oj6YbWxnLC21oIcPxJ1bHfbHDINzlkfkLR+x
         YcmQ==
X-Forwarded-Encrypted: i=1; AKwUvByjZws6r4B4w4G6kLQ+0/EcASuF0t+Bdh2VXt0YWEz7YEaYySHjzsl7Cghslo8aB4fJrl6/CKza7Y0=@lists.xenproject.org
X-Gm-Message-State: AFuF++kebg31aAZQyNcvEvWdp94TrI1FDsPzONW3mLvowSTSICluVBqL
	743X4LZMp3W247Y7qia0UnzWE5syX8uNx8wWdNbwFM+CiTU6P8sJYZNETyYwA+GS0Yg6VhEkhpO
	5ZPx3yQ==
X-Gm-Gg: AYBFou2JqnpfC4wGkIvDxoAXoweHPNlTCvncu89CtDcJ/haF9pVWL/xJJWUOWwh5DU5
	ExfbhDnhA9f1gDnH41cIf6H+6VtyDd2MHsV8dKT9QUCcJBfI/GSQ//xzWUCV7AmenVS4t5ugaVG
	8TsMtE4heDBN2tnBW8/8YzHXKXyEGLCvsfch0jJ0EQI/LKXLF8tsqJ+dGWEVq11n5z2BaDxCDjR
	EO4zZFdXygQ6EVGNc1rHKmeOQpOLoHPi9NabDVf65hNY4aLzuLacRp8+LDZdK/7nwh2mbEZKGeL
	a9t+GBLjxchTq/xF41DtifI8GRMBrEsFWU6oKPnFq0Vel3nQeJDA7JHzlMHMLPslsXKEQBZSRaS
	1rRE9HXeI7MyWyHtKFbhyJRnkzHuBdiRnJyvtC5KXL2zpeDJTsAVfN2pmpohOe3wcBZgW3GIPr9
	QirwxAa5CldwZDaDTMj8iKR3yn3EJYz30sLlVpr4pInylwyhvDOYRMo9F9kLGfDdex2smy2/VYq
	1JJBGteIqhc3sDZEOp/92uzgYtvyoBqAZeSxEcQQ5PXo+X1PZi6AGDXH0QcVQ==
X-Received: by 2002:a05:600c:64c6:b0:49f:cbf1:e765 with SMTP id 5b1f17b1804b1-4a18008688cmr17973355e9.0.1791359246584;
        Wed, 07 Oct 2026 00:47:26 -0700 (PDT)
Message-ID: <5f5dca6c-92ff-43d8-8dc3-2ee171bd1ca3@suse.com>
Date: Wed, 7 Oct 2026 09:47:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/kexec: Annotate more noreturns
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261006105445.511099-1-andrew.cooper3@citrix.com>
 <3bade5ec-e91d-4181-89d9-de35bd42ce62@suse.com>
 <288b7c58-8375-41a8-9923-a4884830cc40@citrix.com>
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
In-Reply-To: <288b7c58-8375-41a8-9923-a4884830cc40@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1791359247-510DDB50-904E4A63/10/78276251493
X-purgate-type: spam
X-purgate-size: 2884

On 06.10.2026 21:01, Andrew Cooper wrote:
> On 06/10/2026 12:26 pm, Jan Beulich wrote:
>> On 06.10.2026 12:54, Andrew Cooper wrote:
>>> kexec_reloc() does not return.  Plumbing this property upwards lets us mark
>>> machine_kexec() and machine_reboot_kexec() noreturn too.
>> The latter already is annotated such (see also next remark) as of 4d2ed2f88a0c.
> 
> You missed half of it.  I'm surprised that it didn't create a MISRA
> violation.

Please clarify what it is that I missed.

>>> --- a/xen/arch/x86/machine_kexec.c
>>> +++ b/xen/arch/x86/machine_kexec.c
>>> @@ -142,15 +142,14 @@ void machine_kexec_unload(struct kexec_image *image)
>>>      /* no-op. kimage_free() frees all control pages. */
>>>  }
>>>  
>>> -void machine_reboot_kexec(struct kexec_image *image)
>>> +void noreturn machine_reboot_kexec(struct kexec_image *image)
>>>  {
>>>      BUG_ON(smp_processor_id() != 0);
>>>      smp_send_stop();
>>>      machine_kexec(image);
>>> -    BUG();
>>>  }
>>>  
>>> -void machine_kexec(struct kexec_image *image)
>>> +void noreturn machine_kexec(struct kexec_image *image)
>>>  {
>>>      int i;
>>>      unsigned long reloc_flags = 0;
>> The annotations here aren't needed, are they? I.e. this hunk can shrink
>> to just the removal of the BUG() invocation.
> 
> Readers of this code are not psychic.  They shouldn't need to be in
> order to follow what's going on.

"Psychic"? What are you trying to tell me? There's nothing wrong with
repeating this kind of annotation on the definition, but there also is
no need for doing so. Hence as far as I can judge, the change I made
was self-consistent. If you feel like repeating the annotation is
wanted, then that's different from you (half implicitly, half
explicitly) claiming it's _needed_.

>>> --- a/xen/include/xen/kexec.h
>>> +++ b/xen/include/xen/kexec.h
>>> @@ -49,7 +49,7 @@ int machine_kexec_load(struct kexec_image *image);
>>>  void machine_kexec_unload(struct kexec_image *image);
>>>  void machine_kexec_reserved(xen_kexec_reserve_t *reservation);
>>>  void noreturn machine_reboot_kexec(struct kexec_image *image);
>>> -void machine_kexec(struct kexec_image *image);
>>> +void noreturn machine_kexec(struct kexec_image *image);
>> The annotations on the declarations are sufficient, with another Misra
>> rule making sure we don't omit the inclusion of the header in the CU
>> having the definitions.
>>
>> Preferably with the redundant annotations omitted, and with the description
>> slightly adjusted:
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> I am not inclined to make changes.

Well, so be it then. Yet it again indicates that in certain situations
you're simply not willing to accept that there may be (valid)
viewpoints other than yours. Or, if you think those aren't valid, make
clear what's objectively wrong.

Jan

