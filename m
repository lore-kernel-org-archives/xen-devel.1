Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE402C55182
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 15:29:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381617.1625150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqub3-0001z9-C3; Mon, 03 Aug 2026 15:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381617.1625150; Mon, 03 Aug 2026 15:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqub3-0001z2-87; Mon, 03 Aug 2026 15:28:57 +0000
Received: by outflank-mailman (input) for mailman id 1381617;
 Mon, 03 Aug 2026 15:28:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wqub2-0001yw-2x
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 15:28:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqub1-005nvY-FN
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 17:28:55 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a70b3ad-bab6-0a2a0a5309dd-0a2a4503dc86-10
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 17:28:55 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a70b3b7-fae8-0a2a45030019-d155dd2bad51-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 17:28:55 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-47fe377a217so625398f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 08:28:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd458bf7csm35270409f8f.32.2026.08.03.08.28.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2026 08:28:54 -0700 (PDT)
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
        d=suse.com; s=google; t=1785770935; x=1786375735; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9hbDzSn/VBQV83BOzqY8ZJiuJKORLuI5AlvgJfHJbW8=;
        b=bOc5b96NREoydI5ejd95ickBbT6J8mxyULCOOu0kN9YLYSh0v/pljueNfQEjGYhzL+
         EyY3ck2qvCcRcBCA9+UegMh8NyyAJYd72WeNDntTruhwZMMFI0vHvw/xZAgJcU3fjphu
         vfa8c9K41nst/wTPbglZj6mh8YLpH2bcsDV2ojBe3MkOfuRNuHOM7WyS1ami8fPA+C1c
         sQacar4ppodbo5YuUCBgY19lojaO/5v2UjL5VlWqaRE8SHx+dnasBEzPk/14PrW01v4I
         m+EW0X3QkEZWNT54nkDUzuFaGJKB2PFSCHSSBdgyUe0jDcMe0rsjNULhJ5TviPGm5FG6
         y6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785770935; x=1786375735;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9hbDzSn/VBQV83BOzqY8ZJiuJKORLuI5AlvgJfHJbW8=;
        b=r0k0DGOwTSaPtDfj5EQKcHf4p7TtaWS120Q3YmqTzv1BIPAMRHLk5e8dDvnuXoa+jN
         ExSnnX7rqqJbUh9aaNSOXksX4FQ7FftWmYYr+jLUh5ZLJk2TZyh0KZHG0IP6HyF7tImM
         GvEsGnAfvaDKxyhxunO5YzNLN34BHa4bZxCwGsU5rzRZ+da0oJ5zVSlGEz5wvmubu9/2
         h3YFvx1Wu1knPN8KPU2fnMda2TClMihv5rA3oRHhmu5TkaEur/SrlLIVlsY2rmLBCRvJ
         9g3hpCPhgoSe+5iMAXMKYiDx9+DIzkm61FxLw5Jm4v45VjhFIINpblwkKyaNx36LRdem
         CyWA==
X-Forwarded-Encrypted: i=1; AHgh+RrUKxQO5PZ9cWRWLyde+0HHxCWm9H3HPd81CkVAsL1t3WcapJLh8LluhcatIjnwsi3sQwwgEduXvAU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6wHWC3BjU5LsJwFBO59fuXmJe9W3hHAG1LjNpslHUySBQZiVP
	A4TFfNlc9vIfSen93TfeFynw8eH2VGEf6ugMIMsX28gzbqAOyuLLsR/J9ziyz0cREg==
X-Gm-Gg: AR+sD11UMmErqHIppuLVpzfoF22NGNPmsWS4pb767guyHwO4h9PkVgUUFE2jW7DLcpc
	IBBtFYg5oQ45pZdSIYUi/AKO4T6KuPkfXWc2/IZIl28a92sBTCb9p9WdVY56e0bkavV1fNvPBT0
	De3Eilsgj/sbbsLA3vxJfPBQ2udv02zpLI+7W1QeZ+Au38lyL0m+loGrBDp0id4hsz6Z9H5ac7x
	iKsN4Qfj/M+oPZtUFHL9xPNLlPylwqBQF01ISIJO/rcEuQG1+VJzhq15Y/5iMWzxncr1J/7VFwu
	fMkvrr4AcTqRU5zRL7KXiEB44c5NZeeVEtIULJ7quGIgOYT27GAy0QSGiONqBXvQpHZxJ41KAwe
	Vs35yiCtvEbgzzn+WOKVBeXSTKVjh5w0+rhad8OkZgIr2vkc1rJ2Ca9Os8uure0baNl5PLlggST
	+BCSBtQLjii1na3fXYmRDAntW59f9XxT1ETx6lFLCTeHjcO73/y7HLuOvVPhaiJzvqLC1vR2wll
	JqZNCnA/9BkMKonsoTFEW3eXOhBqb35eiAn8pup5u/U6Mg7jpjyE55MwPN4bBw=
X-Received: by 2002:a05:6000:1864:b0:477:47c6:36e5 with SMTP id ffacd0b85a97d-47fd72d2db0mr30889443f8f.25.1785770934785;
        Mon, 03 Aug 2026 08:28:54 -0700 (PDT)
Message-ID: <edb2ef15-a9c1-4dea-ad34-8eb96c2af4d3@suse.com>
Date: Mon, 3 Aug 2026 17:28:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/livepatch: Move init_or_livepatch_* into xen/init.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260803150925.408857-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260803150925.408857-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1785770935-6CCDB4E9-EBE93D33/0/0
X-purgate-type: clean
X-purgate-size: 760

On 03.08.2026 17:09, Andrew Cooper wrote:
> xen/livepatch.h is a fairly heavyweight header pulling in public/sysctl.h, and
> a reasonable number of users care only for the init_or_livepatch_* tags only.
> 
> They're arguably more init than livepatch anyway, and by moving them to
> init.h, we can remove a number of includes.
> 
> The include in vsprintf was leftover from early versions of the work.  In the
> version committed, d5ccf4482e4f ("x86, xsplice: Print payload's symbol name
> and payload name in backtraces"), symbol_lookup() had been adjusted to handle
> the livepatch symbol names properly.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


