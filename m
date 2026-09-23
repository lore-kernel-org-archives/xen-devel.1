Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B20C982EA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 08:06:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429823.1652466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9I00-0008At-8O; Wed, 23 Sep 2026 08:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429823.1652466; Wed, 23 Sep 2026 08:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9I00-0008Am-5S; Wed, 23 Sep 2026 08:06:40 +0000
Received: by outflank-mailman (input) for mailman id 1429823;
 Wed, 23 Sep 2026 08:06:39 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x9Hzy-0008Ag-Ux
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 08:06:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9Hzy-00AODV-8M
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 10:06:38 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab3888c-2eae-0a2a0a5409dd-0a2a4505d1aa-2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 10:06:38 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab3888e-4cb1-0a2a45050019-4a7de18cc2d6-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 10:06:38 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49d1fb0cf5eso4025125e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 01:06:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fde1d978fsm52219145e9.9.2026.09.23.01.06.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 01:06:37 -0700 (PDT)
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
        d=suse.com; s=google; t=1790150797; x=1790755597; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CrJEYYJqlVu0pUh1RC8wmI4eHQPgvuN+x450Z//bKIQ=;
        b=gCQEdHJbnYMM+M9KKUfh29wOfAIpasm5wrAcHPplkHMre4Vzh+1FLUALGsKl/TR2Ng
         Muz/perpZYW8YPs4yF+QoTRQv+6oMJ5/YY0Hu2LhyVxTJ/dfffZXcmjuIf7eyXlFyIDW
         +4WZFVdM4zBNvQd8auQgFafcoNpdbVNqFgjVyCMmphX0Hi2KvuSBzpVw79dPwIjx+Zwn
         hRVYxAQQA8cQsQZAd7j47Jylx+CsKFoF1pZEMziU7BDSAJaL4YpKpCESynO/wi7XIPQk
         /9S+REfeDUQRP0x1aeZRQFefqPYO34MeKyQZkK2AfMQVpoEzgynLNesQvPcJoqzMtD6/
         cjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790150797; x=1790755597;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CrJEYYJqlVu0pUh1RC8wmI4eHQPgvuN+x450Z//bKIQ=;
        b=GyzhAfEuvNy4Ij5uOTEurALVt5cvO+N3jw6hNV7y9BifIJC8Wq+Z2KNYW9ffxG2f3p
         8MKuH1Hn7f72If3gdTjszPn6VjBEx58OThydM/n0BiI+IHKk1RcjDweY7e/JFPKcna7N
         Nlqfg33bdmyPDensMaQ28zJaXgSf9XaWyYIbv8gKQNHv+NAkXGYFuajn3lRYG9p/FRxD
         3asp4GWLHF6KfpjHYbMvS6TFVSrYxNth6kJI3PpN7q9/OGGWDMNVImStz9vwNDPfs03r
         k9Fa05lYKvhIQAPBzsiwG6L5yIZm31pAbfQyDOUe8Apiz+tixBj/f2Paah/4rcYnFCEL
         QAsQ==
X-Gm-Message-State: AFuF++nSXKnJotBE8oONP3ZhO1jtN0TfkTG3NV0u9cS067pAHUR3/H2r
	WaiKiyASV4J+Yz4FQJ4xlIMAsCLTlPY7IMKv/cRbiyGSf4UxSvpQiZjrUSMOqks/eHD9BMvXzfI
	yTUiWEg==
X-Gm-Gg: AYBFou3tOjREICXb2V+bs4ylFnq+ldDauMhcNyF4g9mk2KoMdKCQORA8XHEVBU/nCZS
	L2aXQlzfY4asB+XyQPd3Uy9dKVhgJiIAmgYDXA8ZEAkkCV4ymIMXTXJYeGhzhcVs3vxNa1Zm3wK
	+fQoVRCDNUdDxAE6ee9DV3mGvx5Bmr4lMkIZK6khNmXIiYV82eYr8glxHOF3zzUYdsAUFdoZMvI
	6gHdV3yC3S4DB3ECtphxrfy5zrzdwc5lLZY9qnz7xiCMdrouT0dbLViC4pC7IV20M7lIzgPeBKT
	KyDnpcg6UfFU2xu/PTTnCUQyoJbOVAaMMVXMg+LYb/xQw7jZUEHPs62f3Uf4Is3uy8eqrn6raD7
	PO00ZMqLNDIw4Q0D8xu4m5mqdqOXSBmzq6vVyrqtCqU+zp8xI9WWEFbLdkHYhmyB36G52FhjBtt
	tVr7lhNNr9OnrxfVYV8bA6O7v9uezIO8WNQT2d+W9Qe3za1PYJI2q39b+3fISMpq/JgjM9F0uXa
	4/wM9tAiOJ6srjuRJmNOXz34uTzjsGz6K3Cb8HqVeC6FDeoYED88MX+EuDuOQ==
X-Received: by 2002:a05:600c:4fc2:b0:49f:bd3c:bc23 with SMTP id 5b1f17b1804b1-49fdf25367dmr20775055e9.30.1790150797498;
        Wed, 23 Sep 2026 01:06:37 -0700 (PDT)
Message-ID: <9a4c03fc-3312-4e0c-94ba-28c67f4f2e64@suse.com>
Date: Wed, 23 Sep 2026 10:06:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/14] x86/mm: get_page_from_l1e() is PV-or-shadow-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <ef09b072-c935-459e-bf8b-81c96ff9cc46@suse.com>
 <4f7a34b6-b522-4d8f-a678-304ef4c0f916@suse.com>
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
In-Reply-To: <4f7a34b6-b522-4d8f-a678-304ef4c0f916@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1790150798-F74BC2A1-1637B535/0/0
X-purgate-type: clean
X-purgate-size: 536

On 17.08.2026 10:52, Jan Beulich wrote:
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -836,6 +836,8 @@ static int cf_check print_mmio_emul_rang
>  }
>  #endif
>  
> +#if defined(CONFIG_PV) || defined(CONFIG_SHADOW_PAGING)
> +
>  /*
>   * get_page_from_l1e returns:
>   *   0  => success (page not present also counts as such)

As (only) eclair-x86_64-amd points out, this #if needs to move up ahead
of print_mmio_emul_range(). (Of course sooner or later a randconfig job
would also have spotted this.)

Jan

