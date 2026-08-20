Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E5EC5DF82
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 09:00:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396152.1634187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwydG-0004pr-V0; Thu, 20 Aug 2026 09:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396152.1634187; Thu, 20 Aug 2026 09:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwydG-0004pk-Rx; Thu, 20 Aug 2026 09:00:18 +0000
Received: by outflank-mailman (input) for mailman id 1396152;
 Thu, 20 Aug 2026 09:00:17 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwydF-0004pe-KB
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 09:00:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwydF-001Qtc-0K
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 11:00:17 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a86c21f-bab6-0a2a0a5309dd-0a2a4506df6e-22
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 11:00:16 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a86c220-195a-0a2a45060019-d1558033e82f-3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 11:00:16 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4954f5e8020so11234115e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 02:00:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b1441748sm12110014f8f.8.2026.08.20.02.00.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 02:00:15 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787216416; x=1787821216; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Kbk0p0sFdTOXpyHNgmO43sz9czAYt6f+PyD+UeTBAtc=;
        b=PhuKFt5C8g1ytrjAcOvSHpcgdLeOtKW9lBwVqzLUfgNMPW4UvxK/4oYNo+0nq9zeHU
         Kn4QxxIpShloOmRGym7KVU/f44jHdWo8BSeW6qUP5mq0qKsjZjWfU8e6uYMmQmUGEcT3
         VrnaPGzmjghUbXIf97yW/aLt8iNCKKv7IKGkaBK8AcV0MfxjnFkK80XU0TcE9wmvk5di
         cpXDvT76prEyXzs8pYu0//M2BzeCJv0pl3wAD/0Gj1PZfj/a8O3SuIq9BXvKmbrsu/jA
         WX1nRhCpDS1DNCkEBi6LB9zSpznu3zftB+ZrSHKZYDw5TgDJ+zKmsWvBWZbG4YQfW3JJ
         sO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787216416; x=1787821216;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kbk0p0sFdTOXpyHNgmO43sz9czAYt6f+PyD+UeTBAtc=;
        b=oCJ45odST1EP31+5fnWxnSeTboQCo+d6hsrD6CWxPHehHzX4/PzQI35y5C1ZJpu7j4
         lZai8BS7YYJMDW9IcPOxUEcjIC/Wwbw1210ORn1B5Dn9bDt1ALVGP+KDOhXg3wty5kWR
         Gya7SqW88bDptq6rR9CYROV8ppnPTh7/liszZ3GPZuf08ykV1DB9ah3p8+WvpGQrqj5d
         vUyI6/cKD/i1fuemxD3sM1hjrz8GXqQLOHoK1IM6EOVAmes71mHc/IM6vsoXxeCP+YQz
         MURnWLS1mY2SOjzlfX18+aQRy2wU27fc5dtKiZKlR0TM0ZJp03G4QQGU3WrrsdRIXwiD
         TXLw==
X-Gm-Message-State: AOJu0YzJnitCLjn6ckIYzUV1AWGnOsk9WmRmoeQwY9dteQurh0Ptr2Cl
	E66hEWb8EVb4bd9poyOkB4qzVZQPMJn109j7cxdagCVMFSCJ592UK+7/NEiYLQT92A==
X-Gm-Gg: AR+sD132zL84jRG5GZTw8cnKMl9lZB/MV1ZT+yeiPVOKQDuIrTXS8T62LXdYqmuyhQf
	MWhXNKE7FRnGWW4jHGua2Q36coAAgFRZLExSpS8MBC3TafRLlIWEIc87vKXgRi2pB81p7B82Yje
	/xluQhzFJSLCPBqDIbMH8SARU91E8kjk33OCJrzLwlgbVQG0eGWV4choe69mqenSboYNYnho0eQ
	ArA37gFSFWjpG/iQDuOS8moEbct2hBGod1TARYiYSWaIaP8F0P5ZO5ebhVsiy8lejkbzJVjs2xI
	aAvamPRBOVKeGPmjrP74t9RwuFWClQmRTupEE51AQIsmJMtfQ8SjO8R/Z/LbimDZiMfGNgphd6W
	9qDzAl9v/1gPvgfDrlZW6MN0gRCLJKNrdrQXzQNBJOGN/VhuCZi/7x20GTWz9FmILIuKnYBVebl
	QaiuXkGaSOsWEPprAC5UoZgodrFSbyHW55E9DThIgMyfx+bMS2tvAOvBnfttrCy/7En6FxExNe0
	L2GOHO0T7EQe10C51rR0Rp7u4sx+WLNRh4Ykoc3XFvTazZTDyjhDI7LK+2zxa0=
X-Received: by 2002:a05:600c:468a:b0:496:c9cd:e7ab with SMTP id 5b1f17b1804b1-499aa172377mr151370065e9.5.1787216415813;
        Thu, 20 Aug 2026 02:00:15 -0700 (PDT)
Message-ID: <149d9810-7f8c-487b-aa5e-208de2f4c2ec@suse.com>
Date: Thu, 20 Aug 2026 11:00:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Ping: [PATCH] Xen/gnttab: improve error handling in
 gnttab_dma_{alloc,free}_pages()
From: Jan Beulich <jbeulich@suse.com>
To: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <00493037-e77e-4631-8594-64ad4e46fa40@suse.com>
Content-Language: en-US
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
In-Reply-To: <00493037-e77e-4631-8594-64ad4e46fa40@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1787216416-F7ACA77B-A8DAF98E/0/0
X-purgate-type: clean
X-purgate-size: 3671

On 16.02.2026 09:55, Jan Beulich wrote:
> Both decrease-reservation and populate-physmap can succeed partially. For
> the former this may be pretty unlikely, but clearly the latter can hit
> both out-of-memory conditions in the hypervisor or denial because of the
> allocation exceeding the domain's allowance (there's no interaction with
> the balloon driver here either).
> 
> In gnttab_dma_free_pages() we simply can't give back to the system what
> hasn't been re-filled with backing memory. For gnttab_dma_alloc_pages()
> both parts of the overall region need dealing with differently.
> 
> While no present caller of gnttab_dma_free_pages() checks its return
> value, also don't use -EFAULT there: It really is an out-of-memory
> condition. (In gnttab_dma_alloc_pages() -EFAULT doesn't look quite right
> either, but I couldn't think of a clearly better error code there.)
> 
> Fixes: 9bdc7304f536 ("xen/grant-table: Allow allocating buffers suitable for DMA")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I'm likely screwing things up, as I can't understand how this is intended
> to work: args->dev_bus_addr shouldn't really be in pseudo-physical address
> space, or else the address isn't suitable for handing to a device in order
> to DMA to/from it. Hence using __phys_to_pfn() on it to then hand the
> result to pfn_to_page() feels bogus. Was all of this perhaps only ever
> intended for (tested with) translated domains? With the uses of
> xenmem_reservation_va_mapping_*() only being masquerade?
> 
> Furthermore the allocated buffer ought to have been contiguous in
> machine / DMA space. Yet the way it's re-populated upon freeing of the
> area doesn't guarantee that at all.
> 
> All of what is done assumes dma_free_{coherent,wc,attr}() is capable of
> freeing piecemeal. I only checked dma_release_from_dev_coherent() to
> fulfill this requirement. If this can't be relied upon, please consider
> this submission as merely a bug report (for someone else to fix).

Even in case this patch is complete rubbish, something wants doing here. May
I therefore ask for feedback (perhaps in the form of a completely different
patch)?

Jan

> --- a/drivers/xen/grant-table.c
> +++ b/drivers/xen/grant-table.c
> @@ -1095,6 +1095,28 @@ int gnttab_dma_alloc_pages(struct gnttab
>  	ret = xenmem_reservation_decrease(args->nr_pages, args->frames);
>  	if (ret != args->nr_pages) {
>  		pr_debug("Failed to decrease reservation for DMA buffer\n");
> +		if (ret >= 0) {
> +			/* Free the part where decrease didn't work. */
> +			size_t done = ret << PAGE_SHIFT;
> +
> +			xenmem_reservation_va_mapping_update(args->nr_pages - ret,
> +							     &args->pages[ret],
> +							     &args->frames[ret]);
> +
> +			if (args->coherent)
> +				dma_free_coherent(args->dev, size - done,
> +						  args->vaddr + done,
> +						  args->dev_bus_addr + done);
> +			else
> +				dma_free_wc(args->dev, size - done,
> +					    args->vaddr + done,
> +					    args->dev_bus_addr + done);
> +
> +			if (!ret) /* Nothing else to do? */
> +				return -EFAULT;
> +
> +			args->nr_pages = ret;
> +		}
>  		ret = -EFAULT;
>  		goto fail;
>  	}
> @@ -1128,7 +1150,12 @@ int gnttab_dma_free_pages(struct gnttab_
>  	ret = xenmem_reservation_increase(args->nr_pages, args->frames);
>  	if (ret != args->nr_pages) {
>  		pr_debug("Failed to increase reservation for DMA buffer\n");
> -		ret = -EFAULT;
> +		/* Can only free what has been re-filled. */
> +		if (!ret)
> +			return -ENOMEM;
> +		if (ret > 0)
> +			args->nr_pages = ret;
> +		ret = -ENOMEM;
>  	} else {
>  		ret = 0;
>  	}


