Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C2FCA5FC4
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 08:56:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438937.1657465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCZ3Q-000604-4Z; Fri, 02 Oct 2026 08:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438937.1657465; Fri, 02 Oct 2026 08:55:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCZ3Q-0005zx-0K; Fri, 02 Oct 2026 08:55:44 +0000
Received: by outflank-mailman (input) for mailman id 1438937;
 Fri, 02 Oct 2026 08:55:42 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xCZ3O-0005zr-Rv
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 08:55:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCZ3N-00Bkmo-OS
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 10:55:41 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abf7176-bab6-0a2a0a5309dd-0a2a4508c91e-44
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 10:55:41 +0200
Received: from [74.125.225.98] (helo=mail-wr2-f34.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abf718d-f659-0a2a45080019-4a7de162a239-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 10:55:41 +0200
Received: by mail-wr2-f34.google.com with SMTP id
 ffacd0b85a97d-48afe3b2383so2190357f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 01:55:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b38103856sm4553380f8f.25.2026.10.02.01.55.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2026 01:55:40 -0700 (PDT)
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
        d=suse.com; s=google; t=1790931341; x=1791536141; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NaMS63VrhleTkQdWL+Yfq1D3V3AkSLt4qhvz1jh+oFA=;
        b=g3tCkSIpr8buvXE2Msj/25+7rfIllUht5Ynrov9sGueTpaw+IF2B67rLPyrYmP7Bei
         OmXyoJvdE+7S73V6OEMfgSmJ9KD+DN7hgwSvz1s5hEyIcm76aAMBW8PejfdFcjerHRX3
         1uoCzBQEf/HW4XbvLESClPuK33jLBoewwzyymfeDXJ5F5s2curLvnXcfCmHfoS/eZPpE
         Tyjxc1eF62YDsWvKu2R/NZ9PTcoDtjZHUmf9ges7hIoyv9jQoQw7IjtWBI3Owi4/+v7S
         Yk8pv1ErC9xEXQ21mtFBx321Gbldt2fXWUMhhTbf1w2OSeLWmDQ2SzhLwzYvBJ64Bxgg
         94cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790931341; x=1791536141;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NaMS63VrhleTkQdWL+Yfq1D3V3AkSLt4qhvz1jh+oFA=;
        b=swIQL7kUQPkwnudViMy4xYGztRP6juSLHrQy/i5HAhNJz3XuYK5j47Wj6BoTXz9VPK
         XHTWp0niHASDNCLs81tf0Ml+bbsiEsSoM46qLf7iPxCG1OG0ebjS8abf73sjFDGI9Efx
         6bBqFW4VutuKOC82VCIzGYptxdxi/AleW2xqnjzr4Xu8/feI6EHYcABeQHt6yu6xf0+2
         zE1Regpgl31ZzRD0n7HWnNj7ERLtOXtTpo/wnHiKA9qX6k5KeazzPpC7oYhsOO83OHRw
         VyE0tWh5/KEtiEqIYY+vaoeeeG2qJONMV4c1tV6pj8laD0jI6M4bmkcsGKXwkghl4SbW
         O6hg==
X-Forwarded-Encrypted: i=1; AKwUvBwjTcKkox918C+jpFIbu8qBj874/B9mBgf+EhvncbuyhvVlr298Ck/j7W6A4h0BOw8TYeEUWuIKWGQ=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLJ1M5Ei3MXuOgFfBJAUY/TxAFu2sM772hYeInGEP6vbyY7UtVh
	+PNyfySWOB1P2ug16w90bkO75OXlbkqJ7A2l6rbVf+pG1xrWDpRNLRwgPGBdf9/vqQ==
X-Gm-Gg: AYBFou1k8zSG6E6UZEZs13g9IejpVHkzAOzrMigfeoLpg+ax7mnLwFaQrgyxJYt0Z17
	Les/4dVA22mXnF7OG9E7NTYjOAzBYnYCxpaNVkteepyAvuATtAJDH8Li8f7HfmhAGF5rm4FRwJT
	l3REHk7CQMHEEBiZZsPkZzZlLXxgDR0uf7VbHxezb7zy3y6SQuej68RBqiZLkJ7c189TJGpEN+H
	fL+AlE15/CaUUOILQOYZpAxH2VJnZAGNBz9ZKKQeEVJ69jq07BFHoiJDZrVHgN3mcobgUUg82qV
	18/FEme0k+j0y+quzDb0qdWLGZWu0bKVRVK+rYwBWraqMy8izqIee5pDtxdEcC/7OQ2u4L2+MFA
	+E/xDf9+8eGtPD6sC4TIBoYlsUBXxUMe+3Lb1GvtS0uHJXDvrt4l4UcR3wbRWZtxvqP1i0HB3a+
	gB7NYt/SoNSaq6v0hAAExZGQQdxdPo5PmOHqXvsnszMcpRLgPgTzVzXfi5AmH4Gn9frkb8jqzSV
	Rn3q1+EKPyd1ywZkd1VIV/pU7GgR943amVdp69uCuk2vcU+mIg2I8uRWrqV8Iw=
X-Received: by 2002:a05:6000:605:b0:48b:910:35c3 with SMTP id ffacd0b85a97d-48b1274c85emr3901407f8f.35.1790931341004;
        Fri, 02 Oct 2026 01:55:41 -0700 (PDT)
Message-ID: <2db46bf6-87e7-4f1f-b440-b73be1f86b55@suse.com>
Date: Fri, 2 Oct 2026 10:55:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] x86: Remove return value from UPDATE_ENTRY
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "teddy.astie@vates.tech" <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20261001174749.2275245-1-kevin.lampis@citrix.com>
 <20261001174749.2275245-2-kevin.lampis@citrix.com>
 <a91fef08-3a0a-4a71-9618-9d6d3e74112d@suse.com>
 <BY1PR03MB799623147B668DE6406228E4F3892@BY1PR03MB7996.namprd03.prod.outlook.com>
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
In-Reply-To: <BY1PR03MB799623147B668DE6406228E4F3892@BY1PR03MB7996.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1790931341-CF55C87B-47AC66AF/10/78276251493
X-purgate-type: spam
X-purgate-size: 518

On 02.10.2026 10:34, Kevin Lampis wrote:
>> This was already committed, wasn't it?
> 
> I'm aware of only one patch that was committed since last time
> `[PATCH v2 1/7] x86: make UPDATE_ENTRY() allow for multiple operation flags`

https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=5ec86c22b4b3f26eab0fe9af4cbd0f90d315d820

I really failed to include it in the batch I did (as I had somehow lost
Andrew's R-b, hence it didn't look ready to commit), but Andrew then
kindly covered for my oversight.

Jan

