Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E82CC5AC7C
	for <xen-devel@archiver.kernel.org>; Fri,  7 Aug 2026 06:40:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385772.1628170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wsEFS-0001uN-J8; Fri, 07 Aug 2026 06:40:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385772.1628170; Fri, 07 Aug 2026 06:40:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wsEFS-0001uF-EY; Fri, 07 Aug 2026 06:40:06 +0000
Received: by outflank-mailman (input) for mailman id 1385772;
 Fri, 07 Aug 2026 06:40:05 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wsEFR-0001g4-5m
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 06:40:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wsEFQ-002pOb-HF
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 08:40:04 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a757dbc-bab6-0a2a0a5309dd-0a2a4508c8e0-8
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 08:40:00 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a757dc0-f659-0a2a45080019-d1558032b01a-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 08:40:00 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4954d29264cso15562365e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 23:40:00 -0700 (PDT)
Received: from ?IPV6:2003:ca:b70d:300d:c60:b520:be19:f863?
 (p200300cab70d300d0c60b520be19f863.dip0.t-ipconnect.de.
 [2003:ca:b70d:300d:c60:b520:be19:f863])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48002206effsm2648301f8f.32.2026.08.06.23.39.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2026 23:39:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1786084800; x=1786689600; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zpl041G9bgvH6HkJ+ZJLgBdw/y0qwr5ssc4m7Dc70ag=;
        b=JSXapQwAvzEr+zCvkg+nhPdobWfH2z8yDn26/yF1oucTxa4JJB4FST943JdTvkkxqf
         cOVHJAlu+BaYoDwZYeOPIskwWHfwvob6+QGWZg2cn/75z7NAKtUI8KQqZ69sP9iOXEZr
         WjAWuZEw47Bip+yNzUSokwJXyKu/c/S+/4av4l2XKjwVfjyOYMlwTUCUo6zViTI/2FOP
         KJwMCXm+NMgLmI5Tdv+lzccZmLMrW0TWr5GbWuXWxoHFLzOg5jAH/yd6vtNJhJZ1TokX
         1c9LPipJN7N1gjHQsGnzoyQws18kuDryRWIJElp5A8H4Qf33rAdrgTKTgCT4H2Oz0DUf
         GUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786084800; x=1786689600;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zpl041G9bgvH6HkJ+ZJLgBdw/y0qwr5ssc4m7Dc70ag=;
        b=OODCyslZq/pNhEptAOxmSx2Nk/UXSp/IZQnlm877sMqZOhsDSejgwTYHnNiLIOEnzs
         yQEqk2Z6F6wXmDtaEXu/B1AH2zlt7p1ieLm8TBa/IAKGVORA00LxHNqTIn5OVr14PzW6
         8stV1eVf+ypHPRY6P73pWP5QEf7h62Ilo6HKTaZOLRFbxKEmpCCt/rDwq+UdD6eX6w5z
         SpxdC2Bgrs3PBEcBPWEsAGw+3UgjVbJRmhXNh/5HllTOd2Om16RTfpwk3qY7StaWBFyt
         8zzYplzdI7RzwXxWpfG0KNh8pKWOojKaNUkTU5WYZIv3+dXtlQn6vvUai5618PWu2vPR
         w6AQ==
X-Forwarded-Encrypted: i=1; AHgh+RqKVCoOw5v/sp+t6oD1bEAHyncz7n8E0WH4gAUKAEynaikXjols3+nO8VGfsFbmPtsc7GdJACgUrtE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyy874pry3Ga4Ci7lVw6fSxWEinokM7QINzuyJgV/Qy8QCXM1j+
	Ld7qvSI8p34BgRh3jx1fTkMtXxUTCo8Z7/mQ5IsS45RYF04Ypva470fC5CGYxcv43w==
X-Gm-Gg: AR+sD10ixeQLUe1SsAgT7LR5ICDMAuTSolgvJbVM7JNkXv1lat4B7xV328xfPsKcoe1
	VEr+y0Sj6Su5tYxjlSQRGFWcJ9NBf/n+s7SJQXszXgfeWgqXlKasHBtFb2kLjT9tq1UaBFL92vU
	1KhNFoqOu8rHJHfAYapOagM8gd0BSK93Tue8IseaX9GSv6fpw++2hxgVmblyQ8wpUx9r1RSNUnG
	euU0sAgNd71fThCx1jBy8IZrIyZUL1RBQeDdlKAm0Y96AjrHLeBWxd71T8mGVVnAdbJK/bIYViQ
	Q0/pv6cen1V9xVBvW1kQuLffjMQDa8YqGhLcxFU9hohd6Yj4CrJLpRtUAnP55vkAVe0w7nzdVrc
	zOAsXZKZyneiJiqbMtUdaI9T2qb+AK6JSBacLbmd+2kED8f04XULuPluLvP7hcoskoWC1P/SIv8
	t6Ze37J9cCMS+KU41lRvH9SlUvjWj4gvvHGBRu0jDmGbBn4nfKy5Ri4X+Ew1rLFYtWMoKCpEc5I
	qyJvgGPY0kKRj3DT0/buG0g8yDnFog2SixsfQrGLkPpBX/pRCR+SfYLgS/3fsVs3rMi3OnLzynL
	E+gynpTah4IaM8egViw=
X-Received: by 2002:a05:600c:5246:b0:495:52dc:73a9 with SMTP id 5b1f17b1804b1-4994e7ba79dmr240349585e9.11.1786084799851;
        Thu, 06 Aug 2026 23:39:59 -0700 (PDT)
Message-ID: <62a2d0ec-648c-4b2b-b456-077d3967771f@suse.com>
Date: Fri, 7 Aug 2026 08:39:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/vpci: allow unaligned accesses by the hardware
 domain
To: Roger Pau Monne <roger@xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260806152619.23881-1-roger@xenproject.org>
 <20260806152619.23881-3-roger@xenproject.org>
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
In-Reply-To: <20260806152619.23881-3-roger@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1786084800-CE34587B-00B02BB7/0/0
X-purgate-type: clean
X-purgate-size: 1115

On 06.08.2026 17:26, Roger Pau Monne wrote:
> It's possible for domains to generate unaligned PCI config space accesses
> when using ECAM, and hence vPCI should support those at least for the
> hardware domain.  Such unaligned accesses to the PCI config space have been
> reported to come from ACPI logic.
> 
> Relax the checking in vpci_access_allowed() to allow such accesses for the
> hardware domain, and fix the handling in pci_conf_{read,write}{16,32}() to
> fulfill them using MMCFG.
> 
> MMCFG regions are identity exposed to the hardware domain, and hence such
> unaligned accesses can only come as a result of the host having MMCFG in the
> first place, as otherwise MMCFG won't be exposed to the hardware domain
> either.
> 
> Note that vpci_ecam_{read,write}() already refuse accesses that cross a
> device boundary unconditionally.
> 
> Reported-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Roger Pau Monné <roger@xenproject.org>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Albeit without the intent to override possible remaining objections by Andrew.

Jan

