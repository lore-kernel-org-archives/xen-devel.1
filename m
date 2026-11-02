Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68BD606A909
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 17:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZIAnxzTr
Received: from list by lists.xenproject.org with outflank-mailman.1468500.1677583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNvS1-00046c-IV; Mon, 02 Nov 2026 17:04:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468500.1677583; Mon, 02 Nov 2026 17:04:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNvS1-00046V-Fe; Mon, 02 Nov 2026 17:04:05 +0000
Received: by outflank-mailman (input) for mailman id 1468500;
 Mon, 02 Nov 2026 17:04:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xNvS0-00046P-3N
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 17:04:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNvRz-00037d-G7
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 18:04:03 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae8c27f-8faa-0a2a0a5109dd-0a2a45018ea2-4
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 18:04:03 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae8c283-5984-0a2a45010019-d1558036e0da-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 18:04:03 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a3517554f7so25003185e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 09:04:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abea533a1esm195190535e9.1.2026.11.02.09.04.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2026 09:04:02 -0800 (PST)
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
        d=suse.com; s=google; t=1793639043; x=1794243843; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s5vaeXAjm9QRozeZdiaCuCeNd94BbGQ1wb4jlt/vrvk=;
        b=ZIAnxzTrah63V98ivel/IW3PC17q4oVKOYCPFsM4m5ussea8jOuUlw3OhjiEXnq8TW
         9BAaYxXHQuKRpWJ82QlYS3MotJSRAjgqM7oPiCQ9kYYCqug5sCLTSitQtMGukTIYuh89
         AmOu/u8vnQv0HOJN+LfVBJ1jyPJo8al1yFQ1B0AwNKEF8+WB4Wr9GCpn4tFMNkcicMXi
         G1hX2tY4BBG9FsBDcNrOHYwvw4gT9D1enOxUbbsoi3DiYtqNU6Tr7zaLw7gyKevPHJlk
         OAb5NNAFDAMYUSUNHscfAxypVqWWzGt/j25vEQurlq2gOu1IY276U5zhPBKsbrec6As9
         Yadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639043; x=1794243843;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s5vaeXAjm9QRozeZdiaCuCeNd94BbGQ1wb4jlt/vrvk=;
        b=qycQY0ADbefe8I9kRIMW/IKGKSWUl+s+6H8JTk2MzP6t9d7NhIgmQJF4ToBjjo0rOg
         ojGbtFgVsK6qxoVhlVkz/hAETV51QW3RBEgOBNFplz27GHSSbEF/7H//IGGBu2gPQ7l1
         /KOqR5DZKMOekKSmlqC6ie9rbA3z4Hx9yApjVr+AhvZIhXNLvR+yNwXZ7hAZouEYQrcY
         jn05lX/7cQTPOEfqVhFL+OWJwCk8orTYm1HPAeOboP36kmeulPWbcNisniCY7jjrYMvB
         3fKDwNk61Nzcuqi+5tFSHLzWt8FMyxoJlErBiTJ7VARN64Fu+8vHlgFgJ97KlIRGdDS1
         ufKA==
X-Forwarded-Encrypted: i=1; AKwUvBwb58+DOWF2gi+9mZJHqKCumAFlvtppXQP02IQEx/9i7HTb8r+NEDRu7f3BtF2OMW4aRhe/1x35IEo=@lists.xenproject.org
X-Gm-Message-State: AFq9FYK7iKjYLrv+cnsEY3YZ7sO6IMyJYW3es/F1+ijo7gDn28xQ2Z4F
	yhRLGyrcR93z4wsg8TxOoWc5wz8D60EqP088u7KClgJjfGh552maGy6miSk8nUGuBw==
X-Gm-Gg: AYBFou0ggLicL5y2AdQ+IW7PtkoJ5crWS9I6/WsHIwi2aN3Jde1GHiAbP5m06eipwpU
	Wcbyk8eXOxk34sOrugZECDRP7boFqHXaIMVmletcRj++xH15I44OpwreGf3zBuQHcUxnTtG0Lp7
	dPL/A0pQK0tQnB78Man1K+QYH3G0s7WDF4nWU0iaZTM7MGWOfdKvE0fsMkesRMNn7aMRE7ghs4V
	QpnvDh2abQOQPx6gmKcEyEaru/hkf0MF8pR5l/SvtmdEO1aXHxRYY8yJ4iHCm98HU+5PgxKw/Gl
	N7IFEsiGWCRFtEdhAjlVMyY+VwSQyV2Z5UXwKdgg7W/SCxc/4OFnZfZN4QLeZ1/xW3BagWFQ5vR
	oQHSLHOswDMFLp7XYW6UFjKPBGVu06JHdr/wvwQ92+yj8ugWQ68NqYDClNQQw6AvyCKX5tqb8G5
	KpRAMuK6rfIMdKyTqtOmgsK6Yr04QY+NHjSlUzr9cvNRaSWC/DbPC7MttXfB/BEjL8O7dAKf32a
	ZxuC/XYd94uy2pBgcNJzUCTu2YEKrpbPGfadeWIp+JnFaMDcNjuC6sQVjLa3b3v/1/AukyA6Pwe
	Az71lwZ45pSFXoHeQx3BEbYM4NXRUT5qnq64LQSaPji5SBljJ6g7OxSdjdLM4p3JSlmtMyWA3eo
	gL2AiPIMlAq8hdhygTiI8sk9VnTyZxyZ8tBKGaw==
X-Received: by 2002:a05:600c:4e50:b0:4a9:2a92:231f with SMTP id 5b1f17b1804b1-4ac16bc461emr245198365e9.7.1793639042879;
        Mon, 02 Nov 2026 09:04:02 -0800 (PST)
Message-ID: <f8eb5729-4a6d-4ce6-ba39-e118b0b5b677@suse.com>
Date: Mon, 2 Nov 2026 18:04:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] IOMMU: record the flushes skipped under
 iommu_dont_flush_iotlb
To: Luca Di Maio <luca@edera.dev>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20261030165031.2560020-1-luca@edera.dev>
 <20261030165031.2560020-2-luca@edera.dev>
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
In-Reply-To: <20261030165031.2560020-2-luca@edera.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1793639043-BFE68757-A9FAF9B5/10/78276251493
X-purgate-type: spam
X-purgate-size: 787
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 30.10.2026 17:50, Luca Di Maio wrote:
> @@ -458,7 +463,12 @@ int iommu_legacy_unmap(struct domain *d, dfn_t dfn, unsigned long page_count)
>      unsigned int flush_flags = 0;
>      int rc = iommu_unmap(d, dfn, page_count, 0, &flush_flags);
>  
> -    if ( !this_cpu(iommu_dont_flush_iotlb) && !rc )
> +    if ( this_cpu(iommu_dont_flush_iotlb) )
> +    {
> +        BUILD_BUG_ON(IOMMU_FLUSHF_all > UINT8_MAX);

This doesn't go quite far enough to protect against common ways of ...

> +        this_cpu(iommu_skipped_flush_flags) |= flush_flags;

... this losing information: There's no connection between the UINT8_MAX
and the per-CPU data field's size. There's nothing preventing another
IOMMU_FLUSHF_* appearing with a value larger than IOMMU_FLUSHF_all.

Jan

