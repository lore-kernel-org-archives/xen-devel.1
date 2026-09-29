Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F06DC9832A
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 13:40:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436450.1655103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBY4O-0003Nn-4r; Tue, 29 Sep 2026 13:40:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436450.1655103; Tue, 29 Sep 2026 13:40:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBY4O-0003Ng-20; Tue, 29 Sep 2026 13:40:32 +0000
Received: by outflank-mailman (input) for mailman id 1436450;
 Tue, 29 Sep 2026 13:40:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBY4M-0003Na-BG
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 13:40:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBY4L-007vf8-Kp
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 15:40:29 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abbbfc1-8faa-0a2a0a5109dd-0a2a4507aad4-38
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 15:40:29 +0200
Received: from [74.125.225.99] (helo=mail-wr2-f35.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abbbfcd-b4ea-0a2a45070019-4a7de163b28b-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 15:40:29 +0200
Received: by mail-wr2-f35.google.com with SMTP id
 ffacd0b85a97d-488811c9ebaso2040410f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 06:40:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48af50abad2sm3742651f8f.37.2026.09.29.06.40.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 06:40:28 -0700 (PDT)
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
        d=suse.com; s=google; t=1790689229; x=1791294029; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mo9mO38/6w63fnixQTxbfmLojvcoH6b3uOhbEQOCkag=;
        b=IPGy5H1Cm4fZYd/NYYgdE2j/wmIMqiuHbhxIb5Z8TX8UC8Jy/Zl5Zj9wmQvMVaeYCA
         RYv/8xJCfrh2nKRa8bbtL2xWzZGPsmCevpWQHgZ66EDfvXBrZHXIMOrySdoNLWD6ET/T
         UE69xXiA9KdUfJ8Ac3mFrbikKCTPOmO4JZFZly1fLNOLX3ovlqsQCSDZDtG7gMr0glr8
         RAot72bxAuKaD6VffFTCaGcCYaK3FGG5d2fY9d9G3i9KEXfl5ecjGo4Ft+BsCeFxt/HG
         DaYwlO6l0TWQpN9iWFPCBKeI9WAyJ+Fn3lVu4Dxm43At6MEoYgsdbufAb/U0OLe4ImBy
         09Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790689229; x=1791294029;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mo9mO38/6w63fnixQTxbfmLojvcoH6b3uOhbEQOCkag=;
        b=YFYo/Za7vfViC4pSGK+7dFlbNEk5ttcKK9WeDH8wIK8PoHXnHQfN6ed8Vg9YLpPVO7
         XOHQbN77gid0ed0JZRpGh3mK9kQrW4XyKpVy0urpIjZS/ixcKUTNY7DSSbPqDJPzDxa7
         XxBTiLB8NSgaFutPF6t8t6Ofbb8tcTSlMnLHdFu7fiKobXfW9k2H55wjmqktC2QRPpW0
         Gl64axR9ERiAkWn0KfZFDbLHJQfy5kUPQb9xph24ykAdABcJctBKWIerBZmvNPlnvwe5
         XSD1emvM4qn7rxPVhWdJllJikp4kAPZII4DaK716kJfxZOYbNnFlCpmX5mMGp4yu/A4q
         Bg4A==
X-Forwarded-Encrypted: i=1; AKwUvByEUYIfffi8yhtJVsT/+iqMYzwAVRYCtUd77zgE0zLCRNogVnG4JZKOURiV+N/hkMnSrkjSjcP5WXM=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJ3tG5xsLbxDHySWEV0nE+lUjpmw97a1Vw8sugsD1KmUSPOpyP9
	Oc/EQAnPNKILDqtB8aHnfU31+rHyrc4S4p42O1fr1NJYSrA+07n6blzOXSBoCDEM8Q==
X-Gm-Gg: AYBFou3t+xgQx2+K/LppKdQSez1Hc19Jso2hrNx1B83UQ5nt4GuxxZyz5wdH7eInOly
	bNNqUOPDLhzRwxoM7ayvCGT1CWcvzRx8oZoOsPR7FiAnKctbq7KINMWIo6R1BVaTx9YynIczens
	hn8wda+Xllh/+Y37ls9RTfhdt4dkkOU6OPbSNSdH096+UrMPLcLwaeKXnoXopoyvBiOsHGlDs0U
	FFVcAnb9nyd+BKWRwDEU10c6Vy/SUe9UNxI6fq+wLBhn+Fo3dRlPSCp1mA2CpvKtNU9yATpC4iR
	8pUYlRGNlV/CitWCRcwpJRUsBZeMNFDvpE8As2Cblqn8dai92Z8TCgMlKDz79KTPvLc9GEHnFok
	rd8ruh+6RS3KEp9SvOU8X1fjEO5nffVf2DMUMAGOtkVkDsfVssfKjPQsIUWDTr8rW95nKDzRqwz
	7FHORiStvo+roJi8iDPEcocfyfrQlSUyq4cWMWUTl78W8jBNREws7RLv0OhRN8OPWOw6ON3+ExI
	E+WVdcDfxjZjxF/FrWuyy1yZVjBjCxii6WV+XKz4WAZG2hT51EUKhIscnCUZA==
X-Received: by 2002:a05:6000:1861:b0:488:7dc8:9a7f with SMTP id ffacd0b85a97d-4887dc89c2fmr26546667f8f.56.1790689228673;
        Tue, 29 Sep 2026 06:40:28 -0700 (PDT)
Message-ID: <0a286fe9-2133-4f28-8fab-59f4e51d1484@suse.com>
Date: Tue, 29 Sep 2026 15:40:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: deviate C library-style functions from Misra
 C:2012 rule 11.8
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4abcb11ef287170ced74935cbee60c90058c1307.1790671787.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <4abcb11ef287170ced74935cbee60c90058c1307.1790671787.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1790689229-A4AC8AE4-CE217DE1/10/78276251493
X-purgate-type: spam
X-purgate-size: 1536

On 29.09.2026 11:03, Dmytro Prokopchuk1 wrote:
> bsearch(), memchr(), memchr_inv(), strchr(), strpbrk(), strrchr() and
> strstr() all accept a const pointer/object but return a non-const pointer
> to the matched element or byte, matching their standard C library
> interfaces. The const qualifier is deliberately stripped so that callers
> searching a non-const object get back a mutable pointer to it. Fixing
> this would require changing the public API, so document these uses as
> deviations instead.
> 
> Update docs/misra/rules.rst to note that this class of double-use
> library functions is deviated on a per-function basis.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

When I prepared my 11.8 series [1], I was wondering whether we need to go
as far as deviating these. Since we now uniformly take gcc5 as minimum
baseline, there is (at least in theory) the option of using _Generic to
cover the dual-use. One question there is whether Eclair would recognize
such - Nicola? After all, looking at e.g. glibc's implementation, the
functions themselves remain "unsafe" there; it's a macro wrapping them
which puts the lost qualifier back.

Another question is about memchr_inv(): That's not a standard function,
and hence it also doesn't need to strictly follow the pattern of those
other functions. In no case should it, imo, be mixed with the standard
functions without mentioning the difference.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2026-09/msg00036.html

