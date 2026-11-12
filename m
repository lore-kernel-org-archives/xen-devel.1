Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E442606A321
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 06:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Fe16ZIAy
Received: from list by lists.xenproject.org with outflank-mailman.1485153.1688441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xROOf-0004HW-JI; Thu, 12 Nov 2026 06:34:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485153.1688441; Thu, 12 Nov 2026 06:34:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xROOf-0004HP-FY; Thu, 12 Nov 2026 06:34:57 +0000
Received: by outflank-mailman (input) for mailman id 1485153;
 Thu, 12 Nov 2026 06:34:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xROOe-0004HJ-Dy
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 06:34:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xROOd-00CoB0-Fm
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 07:34:55 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af55df8-e002-0a2a0a5209dd-0a2a450ae51e-36
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 07:34:55 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af55e0f-f2d2-0a2a450a0019-d1558036b063-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 07:34:55 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a35ac4475dso26869645e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 22:34:55 -0800 (PST)
Received: from ?IPV6:2003:ca:b726:28fe:61da:a0a6:3f98:b9fb?
 (p200300cab72628fe61daa0a63f98b9fb.dip0.t-ipconnect.de.
 [2003:ca:b726:28fe:61da:a0a6:3f98:b9fb])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4e271378sm52598445e9.13.2026.11.11.22.34.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 22:34:54 -0800 (PST)
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
        d=suse.com; s=google; t=1794465295; x=1795070095; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XzN+ftZH8nOljyMprPWsB+uz3H4ojG5d3KlA9M9z9jE=;
        b=Fe16ZIAyfH1VUcJo8Msp549aS/nWIJelQVK0C0PDbiXVcKhCeR+W7n9Vhgch1n0h2S
         uM2mFQu/Cpe5bRVPB4PKEP0IBhJbDkcZCfGhVgYVkQg3/wqHEbpkGqXi/zZEWqQjdKx6
         O9YuSzd8ehopfn7iVKGh0Qa6ujtcwxmvXfufHOkZY48CyjnCeINymr2P0c1BU4cLkwij
         2BF2g0WHPwYCBPhJ4x/IPaSfOhvSWQJLMwidzh8PnJF/1pOZL61b+pOkg+wfmi3I0Hor
         ucLwtwKSJqHPj/VKEFPMrw6wbL9Ml9IQwDguVeIqVDFOKoEYUJ3Ff3vPe0FR9THwVMqO
         iytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465295; x=1795070095;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XzN+ftZH8nOljyMprPWsB+uz3H4ojG5d3KlA9M9z9jE=;
        b=UtjDAsf5H0bBRBnfR9TD179P5IFm/w6atgx2iuvlKzgtgIWydKHVIURtIr7lMZaNVr
         3BVmnbZffn0cU/k5egEg4MJPUviOcBoUxTkgpdLtuMMbs6wcILWgRRX/+mamSom5s4X3
         7SoiUXpFDFNxghg8De3OXIsntZdYq9YtnPq7KUw5ks+r3sDsY1fSIrnS2r2z29LjgvmN
         1wsKkFcqi9SOp0NOryzuxX3suL0UsTa3gWoaqo5Bs5ywybBfh+X7r7eXGEzrooiQFfHr
         b1TeQHneGHutvarHbCU0MMYS+xBd+qCg5MBhQd5Gat116P19uxs8iYo/bByeVgzP7P3k
         8shQ==
X-Forwarded-Encrypted: i=1; AL+hErF6CR0E9XmxZEOmmeakiwnIHhLRziiNhNeQra7YFdhAKRFsoE2tWf3O36g/UnCFkucept3wVCECC8M=@lists.xenproject.org
X-Gm-Message-State: APuU4Z97EHXPwUNnusvVRsAvUb0EI6Rvp7oM6Gd9gdgEnEoOXvGPDPwi
	uwlCNS3bQQosAvT+ozS4qBBHuZTiqkPIQ1oUK7Gk9xNhEv+OYttnrmLscRVeNKUQ5Q==
X-Gm-Gg: AYBFou0HrpFCoRr7D+8GqufMnMwmf9p7tBSNp5dSZA6jI/4Yz31vnmpxGAYGnHXMQk+
	MudGbFzoagiMKEGYtqxzV18wF91cezz4fK9NxkqwS1J9I04iLgW0M9QQCTmTmZ21L+NekA4hPhl
	+1cc+5uhwKz8dx8khGCF9x41y3TmSmu3qL7dgqi0y7SE3210lZxHJhJdjBO1lLxGOfBMxBp/Mv/
	F1f8xkofMehyXMrLqyGLfFX/7Ungk90PxY8D6SnvnIY5371J58bJVuBhiWbuVuMhOsT7NOsQFdI
	M5t3h7Op1XuOVVBQsrrs1sEB+QOcBIKvBSwwa3sYIXH3KMn5+gwPMuBWpH7sPkEdPcos9k4qZru
	gA0udmBEZJ3b8WOEuBopVs+XWjlaIkKbgeCVdgSrafzmAbeKtz+oJSmgMIgmtIckyxMWoC9SDYu
	q6UpaInkq/dMxCGZARlGUI3ToU9SH72YxvMXhZmRdKHm50HLZwYkMD+TxIn3++SsAuZelzdzJQg
	m+BBlylF5jHwGY0JaTfxsZ38HQtYwtlFqwOJnbzZ2XO+rhEEqHc/MvBkyGZ1UKdxQ/a2MUnPLy/
	yWljq3tv0k2UHXN9ppYcr/LPoCql9jwvChx0BlZ+M/RYUfb8NOpApRPBOr5W1vXkjwFaotf9My+
	HWqCVpGrQr8JHfau26DMhOExWO4o7Zt5IT+2Loq0N5HzARf1U8eJV/RxG1KAyyBrhzWttG34IKU
	5OMj87teU=
X-Received: by 2002:a05:600c:3151:b0:4a5:cfc:1e95 with SMTP id 5b1f17b1804b1-4ba093ac1f6mr79613765e9.33.1794465294776;
        Wed, 11 Nov 2026 22:34:54 -0800 (PST)
Message-ID: <7af69a18-fcd7-48f9-a9e4-c2ddc060755e@suse.com>
Date: Thu, 12 Nov 2026 07:34:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] xen-blkback: do some I/O statistics rework
To: Juergen Gross <jgross@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
References: <20261111162058.804033-1-jgross@suse.com>
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
In-Reply-To: <20261111162058.804033-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1794465295-510C9CFC-B7C0D501/10/78276251493
X-purgate-type: spam
X-purgate-size: 547
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11.11.2026 17:20, Juergen Gross wrote:
> Some rework of the blkback statics data handling.
> 
> Juergen Gross (3):
>   xen-blkback: Remove statistics logging on console
>   xen-blkback: move statistics data into sub-structure
>   xen-blkback: make statistics data persistent across disconnect/connect
Reviewed-by: Jan Beulich <jbeulich@suse.com>

In the last patch a brief comment on the global stats instance may be
worth, to indicate it's guarded by the rings lock.

Also, do I maybe get a Reported-by: on the last patch?

Jan

