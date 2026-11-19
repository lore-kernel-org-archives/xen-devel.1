Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B174606A338
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 12:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Z//82FaT
Received: from list by lists.xenproject.org with outflank-mailman.1496341.1694936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU1gA-0003Ur-P9; Thu, 19 Nov 2026 12:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496341.1694936; Thu, 19 Nov 2026 12:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU1gA-0003Uk-LR; Thu, 19 Nov 2026 12:55:54 +0000
Received: by outflank-mailman (input) for mailman id 1496341;
 Thu, 19 Nov 2026 12:55:53 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xU1g9-0003Ue-M9
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 12:55:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU1g8-005rQs-Uc
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 13:55:52 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afef1ce-e002-0a2a0a5209dd-0a2a4501c704-24
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 13:55:52 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afef1d8-5bcc-0a2a45010019-d1558030c561-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 13:55:52 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4bb5b8ef642so19981395e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 04:55:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8538b09bsm59065655e9.4.2026.11.19.04.55.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2026 04:55:51 -0800 (PST)
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
        d=suse.com; s=google; t=1795092952; x=1795697752; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QDHjGhCtNTW1/cfYmLNGkyNzFC3dy8hwUaAkHlA8mpE=;
        b=Z//82FaTYDirEz57DPp8KOerx2p64YTnxcwtD6pa2qMI3Cv+HBuESwP7xbp68SUvfN
         cmCUf/XPFul/VJwmPAceGqywwBPpS7r37wp5ZriT3HJUIbz+fyqZae7Ca7m3LpQxMWzD
         SFHqKjvFW3kpAimwMCmTIK1xMhAtOeqAW+3dA++ouhrmH5VHydd7cVeHOThxtnkglZt4
         vDUUpcuMecpheUrIuRsPfXDRGSB9/nCFe6uBmkrXiQTQ7zrOY8CYU7K3upWrfWlylL9Y
         cX1eZFXeeqZusosO6QFa9Ko35x1IlXVOqlyXHrnQq280cQpidc6EJ4P2iRq2Wsbaveu7
         dUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092952; x=1795697752;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QDHjGhCtNTW1/cfYmLNGkyNzFC3dy8hwUaAkHlA8mpE=;
        b=t5wdTk6DvFPMrxunqJqrZ+j2IaKsOxTcSwmhkCcFmeenYR7r70a9scTtnjkNfvwy0V
         aaoeks5q+KI2olAUX53LENW7YnZ3UiM3GtSEgI3fZicUh5FvTmb2BkxL+YrT+LC0eBXy
         4givpm9b8ASTVOp2UNGzHeM3lhCkVgbxgluHgq1Wd2j/8dkEkyke8WEYxGLaNKZq9Pod
         uxP25hcHjPvLz1ot2mnDBkCtyLRrRZXtsUtrBa16LVdhbeX24rgnDed58FIg/UHOM3m0
         L/XV9HMEC92c+oGxIxtyqERWNNRg0j42rGDHx20lWhq6KYbiGffmg95DjN3wv2XDRZXo
         gMCw==
X-Forwarded-Encrypted: i=1; AL+hErHW+GioAak9uvKEpDL666yEwOhJEfJqOJFk8Jqc5/7wzGCVtpiqSh5VQIX2/+yBpk2RKUeK0l3G6X8=@lists.xenproject.org
X-Gm-Message-State: APuU4Z85PiaBRmPm8C+eGrlML60mGd9RsbYX9GiolLqlDnlrBFBlSNhY
	oPYi5nAZFMrWoz9/DdKt9/vklmo1mGJgY5A3aTfKiFIQr52YRa6JG9tvo47Vtw10bA==
X-Gm-Gg: AYBFou0Ep1E9YDXiGNNcJj/9fETmvVUVfMtt7xpvOuYnc7Xjq3sarqHIfDn928rW8vO
	iK9nb5Ih1yk/hJq5KB867b/UqavPPZzVgi26h/S6H7w4Ez5Wd0IHbg1+uGyYkr9H5VwucTqglIA
	k9W16mWr418SlswAulDt01Y5qKjvPtldSSi5DQKoXYpOp2MQEZ14NCi5xRBxSYQg7lB/NFpLXoB
	0VRyZVp+D7sq8F2G8HfsqDTTP4+Si+KCU0JtGb8wCfbIu1P1mLXiH+1kUn0ZxgPUw7vZLHB3Tp7
	NbjZIhEeIjsXSjGvjHGQcLLLs5UGMFTZ18liwwGGvDUzW9NmORYRw3NhgwwIVlHFCTMtv8o2/Zn
	38F83Mqxc9FEHPOPc0c7D5B7Mt3tWWmIK+7MhTda+uKgIOzUvGlKfHAFolOcB8vCDx4NZPKbdVw
	GNUCka+P9yJ8A4KT67TLC6tKWAk7Hg5KXWlg2rABr/Rdj48IPubnS2T505U4C3J/YX2+KvyiLdd
	eRRnOBxE+mjSlsbFUwq7LDkJMmiFUhcKfwuRuXOa/stqymg6XWw7pjaBCKHe9R5Mmfu1/OhVKfy
	o435aeoOUuvAz+/7Jc7aSNqzcnJmjCbf/c1fr+D9UGYJgYA+4vl+l3JGKt+AKq928gB7zOGyXpX
	beB1rlrdKRRLWKaz0Gw==
X-Received: by 2002:a05:600c:3b94:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4bb7da440e4mr132893265e9.35.1795092952123;
        Thu, 19 Nov 2026 04:55:52 -0800 (PST)
Message-ID: <65d46bdc-8383-4dea-92ef-baffc83be6b7@suse.com>
Date: Thu, 19 Nov 2026 13:55:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/p2m: prevent replacing special p2m entries
To: Roger Pau Monne <roger@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261118172032.78501-1-roger@xenproject.org>
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
In-Reply-To: <20261118172032.78501-1-roger@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1795092952-4C36A5FD-B514144C/10/78276251493
X-purgate-type: spam
X-purgate-size: 2484
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18.11.2026 18:20, Roger Pau Monne wrote:
> The current logic in both p2m_add_foreign() and xenmem_add_to_physmap_one()
> allows replacing special p2m types, that should otherwise only be
> established/cleaned up via special accessors.
> 
> When the backing page for a foreign p2m-type mapping only has one reference
> left, the put_page() in p2m_entry_modify() will free the page ahead of it
> being flushed from the p2m and the IOMMU TLBs.  This can be triggered with
> IOREQ servers, and requires a domain that has privileges over another one
> (ie: a stubdom).  Such a domain would create an IOREQ server, map it using
> XENMEM_acquire_resource (which creates a p2m_map_foreign p2m entry),
> destroy the IOREQ server, and afterwards map something over the IOREQ
> entries using XENMEM_add_to_physmap{,_batch}.  At this point the removal
> from the p2m will trigger an assert in p2m_entry_modify() on debug builds,
> or in releases < 4.22 free the page before the TLBs are flushed.
> 
> Something similar can also happen with grant mppaings: entries being

Nit: mappings

> replaced using p2m_add_foreign() or xenmem_add_to_physmap_one() will then
> fail when attempting to be cleaned up by replace_grant_host_mapping().
> However that only affects the domain itself, and is no worse than what a
> grant-mapping domain can already do to the grant source.
> 
> Note that p2m_add_page() already refuses to replace p2m entries of special
> types.
> 
> Fixes: b37d30c8fc52 ("Mapping grant references into HVM guests, take 2")
> Fixes: 0537d246f8db ("mm: add 'is_special_page' inline function")
> Signed-off-by: Roger Pau Monné <roger@xenproject.org>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

However, I thought we had agreed that ...

> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -1953,6 +1953,13 @@ static int p2m_add_foreign(struct domain *tdom, unsigned long fgfn,
>  
>      /* Remove previously mapped page if it is present. */
>      prev_mfn = get_gfn(tdom, gpfn, &p2mt_prev);
> +    /* Special p2m slots must be cleaned up via special accessors. */
> +    if ( p2m_is_special(p2mt_prev) )
> +    {
> +        rc = -EPERM;
> +        goto put_both;
> +    }

... in particular this change comes with a (hopefully small) risk of breaking
existing code which maps one foreign page over a prior such mapping (never
torn down properly). And that you'd mention this aspect in the commit message.

Jan

