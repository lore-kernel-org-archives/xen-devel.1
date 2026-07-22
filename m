Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A3BC4451C
	for <xen-devel@archiver.kernel.org>; Wed, 22 Jul 2026 07:15:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1368147.1617631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmRA1-0004fn-8U; Wed, 22 Jul 2026 07:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1368147.1617631; Wed, 22 Jul 2026 07:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmRA1-0004fg-5c; Wed, 22 Jul 2026 07:14:33 +0000
Received: by outflank-mailman (input) for mailman id 1368147;
 Wed, 22 Jul 2026 07:14:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wmRA0-0004fZ-9n
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 07:14:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmR9z-00FIdP-Mm
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 09:14:31 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a606dca-5cb7-0a2a0a5109dd-0a2a4505ea34-34
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 09:14:31 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a606dd7-4cb1-0a2a45050019-d155dd2be17a-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 09:14:31 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-47de0093c42so7074636f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 00:14:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85b9a596sm3823024f8f.4.2026.07.22.00.14.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2026 00:14:30 -0700 (PDT)
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
        d=suse.com; s=google; t=1784704471; x=1785309271; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PVIpRaAAodoT/XR50XGa8tPCIZvYb+hSlXhKadGyyeE=;
        b=Usp4YjeJ+iABgEiCliKzO583+CJtCXan8dLNfH+guOxJ+bns77Z9izgGSSwm+EUsNE
         o7kVLI+BNd5T54eR1M2KKsOYDeEQx+MDDe3A7o4VI0OHVpenvXA3eM1bNLVAbWBg1Cz5
         E61cWn/Iakro1VDZy8pl6mGloCAu6YuOUmoW2acYz97kRVbaw4l3vVAygGEScEcr6R0o
         h+hgVCbecjDPmCnNFrASwJF0nXU4UKY3oBS37+6fkBxN8laGWecickt2EPqNvvauYbh4
         OLr9UB4QV4MEYnhZ4ef5osa1STqFClxDfh825kiQ8tuXtVxsgMykDRxOVGx5a82a8UTJ
         7nfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784704471; x=1785309271;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PVIpRaAAodoT/XR50XGa8tPCIZvYb+hSlXhKadGyyeE=;
        b=IdLicgrXR76XHhNJwWJyzVoMUIGBEb2C2Zl0Mu+G4pTT/IDuuflq9iBIbSxmEWM9Qe
         KIRTWD14tBs9fKdqeOkqd4rekeJAOqwAR2dN8lrDmuv2A6zCxh4EHeCJi/BAdnmJbnr3
         QjFDuGdOvVQ0rbWgAVnZkaz7IcafBid/6HpymKgLdHuOJIxRuTub9SP6uFOcf0jFTmNS
         nL0hN1Yt0lgyjVuzZc6FyjFmYO8mO7EdxaVUwC5bCH0oPBfC8i9tmLT6YvwMfKUpjJip
         sqFmK5fnfoXdQBt4N0e7vYzLHXCIGacqhLnYoMVmmdF4rSYhdXP7W5q/Pmr91QaXAOqA
         RcGQ==
X-Forwarded-Encrypted: i=1; AHgh+RpgbnM3lUhgmfVUYQ9dECrr0ev+gfTUKoFqQOITK9oNaa8rqNq/HSR3WjVmKvHq72Ggz/7T7IDCCyk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVRoTrTfrYqi11GDxX6Yvtt+ep23ZnBdh1+McHRoUE7Cz779vo
	U1WfF/PmK4qyLTkWSiRsYjlzrPUhNmn7rYtXxt+MFnB0kl4FhumCxZCwIVLAf40NYqvkCawi0rx
	cDCoEAQ==
X-Gm-Gg: AR+sD10DmGpwh+Tpw8H+NcXdRkZ1Mr47QsZzITkp+PrKUtlRN39nuLREvLv8vp13Zqx
	cutkPt2txBWXL5Y+VF7Ma/3ZlRjw+U2fg4S03p+bHh4HJ/lYKB95/R9Q61CiuJCGrKDWAtps1TM
	T+ik6cq8fcaNIJXJS1ro4W4Nw7SsI79gpwsiOAskVSf8t2k3iAA3Bta5i9jf1xvtFAYEv3C4rkQ
	q0F6sRlnPTi5Xo2c11dD9R2rK48IqbECS4fFd0NVqRWJEN2U47zOpP6Yeez6SmA7OZeAQJpTipp
	D9QKTyCyWW5gudna7Pv/GZqB4Uk6c+N7ktkt5g512qbZznJYgnc1QRyzEZ7llCIugSrM3QfMlej
	cDok79eyEV6/QHZ1OxCC054GQDmwNop+73TxvbuOIWu7jOG8r1GaqP8QGZxUGRfLi/NAmuHABKt
	sZ2cTWIov07p+1z0KLgdqGtLcd2IjajxAO8FT3EBdKi6Q1cbPGPcuqVu8WYQimBVENAQ==
X-Received: by 2002:a05:6000:3113:b0:474:cd60:1160 with SMTP id ffacd0b85a97d-47f623283e4mr25216776f8f.46.1784704471014;
        Wed, 22 Jul 2026 00:14:31 -0700 (PDT)
Message-ID: <681d6703-6310-4ad0-a270-b5e677ee5811@suse.com>
Date: Wed, 22 Jul 2026 09:14:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xenstore-paths: Allow subnet prefix in IP address
To: Tu Dinh <ngoc-tu.dinh@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>
References: <1780912172.8631fc262581453bbf619ec5b2062170.19ea6a32f2f000701b@vates.tech>
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
In-Reply-To: <1780912172.8631fc262581453bbf619ec5b2062170.19ea6a32f2f000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1784704471-F4AA72A1-D3729871/0/0
X-purgate-type: clean
X-purgate-size: 1837

On 08.06.2026 11:49, Tu Dinh wrote:
> In the guest-reported IP address in xenstore, it's useful to know which
> subnet it belongs to.
> 
> Add a specification for the IPv6 host address/prefix format specified by
> RFC 4291.
> 
> For the IPv4 address/prefix notation, as there seems to be no equivalent
> RFC specifying the host address/prefix format, specify it ourselves.
> 
> Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>

Btw, even if get_maintainer.pl doesn't say so, it would help to Cc the
maintainer of the component the doc for which is being modified.

Jan

> --- a/docs/misc/xenstore-paths.pandoc
> +++ b/docs/misc/xenstore-paths.pandoc
> @@ -78,12 +78,12 @@ VALUES are strings and can take the following forms:
>  
>  * MAC_ADDRESS -- 6 integers, in hexadecimal form, separated by ':',
>                   specifying an IEEE 802.3 ethernet MAC address.
> -* IPV4_ADDRESS -- 4 integers, in decimal form, separated by '.',
> -                  specifying an IP version 4 address as described
> -                  IETF RFC 791.
> -* IPV6_ADDRESS -- Up to 8 integers, in hexadecimal form, separated
> -                  by ':', specifying an IP version 6 address as
> -                  described in IETF RFC 4291.
> +* IPV4_ADDRESS -- An IP version 4 address as specified by IETF RFC 791,
> +                  optionally appended with a "/prefix" value representing the
> +                  prefix length of the host address's subnet, with "prefix"
> +                  being a decimal integer in the range of 0 to 32.
> +* IPV6_ADDRESS -- An IP version 6 address or abbreviated "address/prefix"
> +                  combination as specified by IETF RFC 4291 and RFC 5952.
>  
>  Additional TAGS may follow as a comma separated set of the following
>  tags enclosed in square brackets.


