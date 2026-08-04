Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3420BC55822
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 15:58:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382427.1625796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHXM-0001of-GP; Tue, 04 Aug 2026 15:58:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382427.1625796; Tue, 04 Aug 2026 15:58:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHXM-0001oY-Dg; Tue, 04 Aug 2026 15:58:40 +0000
Received: by outflank-mailman (input) for mailman id 1382427;
 Tue, 04 Aug 2026 15:58:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrHXK-0001oQ-RJ
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 15:58:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrHXK-00Fm1T-7v
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 17:58:38 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a720c02-5cb7-0a2a0a5109dd-0a2a4501dff6-46
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:58:38 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a720c2d-5984-0a2a45010019-d155802bc07b-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:58:38 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-49555a0e68bso17102085e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 08:58:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b8d04fsm477454045e9.3.2026.08.04.08.58.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2026 08:58:37 -0700 (PDT)
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
        d=suse.com; s=google; t=1785859117; x=1786463917; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uTztnL3YIRuGnJqt6+Zduc6sY+i67CEbHhQ5R6Sx/LA=;
        b=HTtcWdIJyRO8GV8Zf6bncXTfFK6DNLPSkYE53keYPF/9c7tAwHYQkGAHTM9Iktts9s
         RjgRAzdP6+G41Re/nSMXudt81MX0lo+TI4hbifsofAouze6X011y0YzXImbUVqwYNS18
         A1uSOz7yOy621A83nUwBFGmdbBsX0rMgNRmTLH50VTD5lGfaT9Q80ojC4UM4qXZad3Cg
         1kn1hKKzbRGwe+wLXlVk/JUDyr7yk2kXzSVYz5KvA/cJ2Uj3wdskxK/LNoTBzvQ9sVjx
         TC0CSrZ4L8N5o1gabupPdKuL5Pa5fUgjpmurWL2XOePWx7cBGICPfAUT/v6FwqV/JZXX
         AVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785859117; x=1786463917;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uTztnL3YIRuGnJqt6+Zduc6sY+i67CEbHhQ5R6Sx/LA=;
        b=MfH/x0NG3T9jkZtUL5VALG43S29Fkjg+XiGX/BrrnCsUdUzPN5Xd9UpjGENBxduSRq
         NmAhJNhPxpZUzdbqq8oxoY5rgsBYqwvU7kw9T/AsXbagJI7HFHRWupzw9n1hX07xbT8f
         jXgVC7mveAPkE4t+cgagsFWV6JIf5413TNvg4vUWEP8Bh2kQlbJ57GSboQ4X80R3+tyh
         IQgZLiVruFJZRJ5kAQcWJFVbSHCH4hD/Qwrvq7DvzBZJn+PC4F6wCjDHDxLPMFQSj2MG
         ljIIIy27X9o2RFWThhAU7LNur8gDfz/HhxipUZT2fO3LAQRcM6sIRqOlZL7jFsQ2jb32
         DnBA==
X-Forwarded-Encrypted: i=1; AHgh+RooVTFQO0UMBwDI6lgHfMWLnIn0u4pteBQbVNJQLFtoWd0wqgRffHUFNT1V0tlCwqQ1gg4OpXO9cAs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztEd1b0P1YokoTUFPlQj6c22254h7MYGrZcFHwYK2p/6M4axkH
	fSZjqon0e0wJ6Zfmxa/keb8y+8dvH9ol2i4mvuJ2sWHT0OTzkIAItMieXHrFPojDdg==
X-Gm-Gg: AR+sD12gqdlgwJMTUI4r+VLgIkYXmA7X7zDrF9/04ie2gtqCQjAMq2G1U8H2MnWFMRC
	jL9hU9nDDbL69Kmqt/538K83GE6sRWy4pRWSFheONm2L0QLeHYx79xmc3/w/MyEW4uEwRi0viOU
	ISju0tnxvzxL2VCf3FLmOYVOA1c1CsBIx0tf28Tuj9oAdEPQAn3zY+tdoYDeBeKjZoVBc7DtMN5
	P9RQHq66pv5EvgaYUCfL/qiZTU+fVXX/bLjq8y4wfNoNJeqjV0xi02yM6byHRQaRHK0kJV4vE7L
	zu4plp+QpqRXLZut0E4g/5QTp8UbJYRNQCkqTNcaKFiDaGiPbYE+JcX67sMymtHfPvE43a2UPkW
	YMof2SGrIzXbu8k9tfFA4IBfI82Lr2fCBGyeF6KsytRB2/lRwnQmMVrdNM89MlPuSe3z6Z4KESE
	Op6NDjD/nPXAHroj/o6/7eOb48RJnlYtQLRsK0euGWFXTWt3gv4g7IJPQ8q7TZqNa+wFX1nSf8q
	Zg/AfJOxYz/hWNxw+ssn3bwqO0yFcUGY2QD/djdhYYA1rwJVVbm
X-Received: by 2002:a05:600c:3b23:b0:493:cc25:9c0e with SMTP id 5b1f17b1804b1-4980c679e43mr371092945e9.14.1785859117612;
        Tue, 04 Aug 2026 08:58:37 -0700 (PDT)
Message-ID: <a10f82fb-c4fa-493a-88cc-0b5d4c8db3ff@suse.com>
Date: Tue, 4 Aug 2026 17:58:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 1/5] vtd: Ensure root entry is updated consistently
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <1785319236.8631fc262581453bbf619ec5b2062170.19fad51a4be000e099@vates.tech>
 <1785319678.8631fc262581453bbf619ec5b2062170.19fad586037000e099@vates.tech>
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
In-Reply-To: <1785319678.8631fc262581453bbf619ec5b2062170.19fad586037000e099@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1785859118-1FA6E757-878CAEE4/0/0
X-purgate-type: clean
X-purgate-size: 1791

On 29.07.2026 12:05, Teddy Astie wrote:
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -281,13 +281,13 @@ void free_pgtable_maddr(u64 maddr)
>  /* context entry handling */
>  static u64 bus_to_context_maddr(struct vtd_iommu *iommu, u8 bus)
>  {
> -    struct root_entry *root, *root_entries;
> +    struct root_entry root, *root_entries;
>      u64 maddr;
>  
>      ASSERT(spin_is_locked(&iommu->lock));
>      root_entries = (struct root_entry *)map_vtd_domain_page(iommu->root_maddr);
> -    root = &root_entries[bus];
> -    if ( !root_present(*root) )
> +    root.val = ACCESS_ONCE(root_entries[bus].val);

I'm pretty concerned about this: You're reading only half of the entry here,
and you're writing only half of it further down. The other half is reserved
right now, but there's not even a comment being added to this effect. (Yet
even with a comment, I'd still be concerned, just not as much.)

> @@ -295,11 +295,12 @@ static u64 bus_to_context_maddr(struct vtd_iommu *iommu, u8 bus)
>              unmap_vtd_domain_page(root_entries);
>              return 0;
>          }
> -        set_root_value(*root, maddr);
> -        set_root_present(*root);
> -        iommu_sync_cache(root, sizeof(struct root_entry));
> +        set_root_value(root, maddr);
> +        set_root_present(root);
> +        ACCESS_ONCE(root_entries[bus].val) = root.val;
> +        iommu_sync_cache(&root_entries[bus], sizeof(struct root_entry));

sizeof(<expression>) please in favor of sizeof(<type>), whenever possible.

>      }
> -    maddr = (u64) get_context_addr(*root);
> +    maddr = (u64) get_context_addr(root);

While there, drop the pointless casts, thus getting rid of two style issues
as well?

Jan

