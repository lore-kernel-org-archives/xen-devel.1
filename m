Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B4360A2628
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 08:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bOTgSfgI
Received: from list by lists.xenproject.org with outflank-mailman.1467829.1676862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNnko-0007MJ-JX; Mon, 02 Nov 2026 08:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1467829.1676862; Mon, 02 Nov 2026 08:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNnko-0007MC-GG; Mon, 02 Nov 2026 08:50:58 +0000
Received: by outflank-mailman (input) for mailman id 1467829;
 Mon, 02 Nov 2026 08:50:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xNnkn-0007M5-0b
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 08:50:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNnkl-002T9P-V2
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 09:50:55 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae84eed-8faa-0a2a0a5109dd-0a2a450ae0e4-14
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 09:50:55 +0100
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae84eef-f2d2-0a2a450a0019-d155dd29ed03-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 09:50:55 +0100
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48afcfc4bf5so2704978f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 00:50:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71bae0f4sm16679623f8f.58.2026.11.02.00.50.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2026 00:50:54 -0800 (PST)
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
        d=suse.com; s=google; t=1793609455; x=1794214255; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FVtmsD2A3Skx7Z9VQGNohnm35n6v3YCVrjge9Lv/5Tw=;
        b=bOTgSfgICcFjgYdWLhgX6v9meQS7nYZqvdzblJDqxhnwHB71cEise4snTHwa+pik03
         JGJ7vy0PD1eXZCREwBfNcmWfvqGIW7QVF8s3RgLfflaK2zWHdIi/gdTibfmyWWDor9XL
         gSImljT95KaaHpFUhbAQW1oRVC9VYrOTQyDXx/KoEo5aSgZfndL1Sa10pPFYujj9FjeX
         lc/i6BryTSVVImcAELkhjowBL/EOnyyx67Hhzk9JdM7zW92Fx5DNXJtICb56tF8NPxH7
         mjKZOrwJPgEhkyJi7HRiNBODabgR6+AuOdvSHkv9ibLFzhtNy6o4rW3rtZec1+bimKhb
         Ez8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793609455; x=1794214255;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FVtmsD2A3Skx7Z9VQGNohnm35n6v3YCVrjge9Lv/5Tw=;
        b=s01hVFd0h9rsdIpKOMEnb8sg7xHNPz+6ayDRSl3Pc6A/PZ9JUAKR8Xterc4EWm/+mz
         nScPZ2dTHFg2lDA8POkEsaccGlU7MtJtj/edcqahukgk4qx5l5MljsZDWT2fF0+LKzz0
         WlUjg+ettj3unLhVkVtHQibhuszFyfkOb4Sx093FsZvFsq72csj4tjIDzEbfevDONiZm
         EcMJjwM3U7YSuVu1DfT1Lwo3vAgP9YobQA+SuZjRp/AxRv8tSi1TOvvdTlcMLwZFUMxK
         bZ3t8vZO1DSEPKswhviyaWHjNuXYqRUlVSx+FLpV74aPNAz27wyFrNz2Stf9YaHdlvMe
         L2bQ==
X-Forwarded-Encrypted: i=1; AKwUvBwg6h16X5CW1HuNTev8Tu5zWoEomOYMr/NodacnXb0+IeCdGX+5a3vPdiLwSysXRgxezBU3HJtcCQ0=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9yAVBXds0sfVeCpaCXjpoCH215nvqRRvcJXIUJfWbHVZO91r0r
	78pkPbgm/zOr0bD5haBCoGCMZteVznq0seYgouXh8yhXBfzTQbaLFYY1hxwyCdYHOQ==
X-Gm-Gg: AYBFou09pCrqlH4CGby9fkEG7LFLmklcMnns+WKj29K86dY6wJQrVfv8kaMlYpNR89o
	t+7fibQ8Z9V74Y9EOHUVyuL3uoCipovLf+wZDM8BpWqOcPgVHrXqBwZANtTlya/8Jt72iwqX+Cs
	QFPL2Ow3WMjUz+W4Jl9NU93+ZGBZMuqUhfNAVQlGEljXVuAqjlPqCXI3oGaYwhZe/ncG67/GQRd
	JA+jLMtTWPsOE7BuEIF4sOVosOs5dJIsJaG9xVqzINM8fSCZTU0PBnES0T0VYoTcTvbwe3oEetM
	QD4Saco4hyGiiZ5UIEswpRWlf/xYeuWw2vECL2PxpECR6zUUqyGwYd5NPCL5ZuIDV0d05oyFdUW
	lhqwxYgLwojlXmder6MXXKjIX6u02jIBZDG02YXqXDWEdesroIjc1zBl/9D5w7Oh0CzxAAtkGm+
	7Pk9lQb0LWGXpIvsHc2KImDuvsfX+nZTNPMOcjfU8Ajs/X+TP5ZoM4oKRG9YZa8aGNpXU4HLyM9
	DCjXLBtZCDxyBlurhe7QpD+imaEwM0m5C3aNJ4eiSY3rySWnX8IlrFGeCTzQfnnzg7NkozTGe+Y
	zH+qi/oxiYzqtVzLkxfzsVzbId2V74XXVJoBDmhqNQIF81nLvI3RF+8tsI3h29brzXW4YOKCcq+
	zstm1iUDBE4QL/XefVA==
X-Received: by 2002:a05:6000:2313:b0:488:7d08:edbc with SMTP id ffacd0b85a97d-48e6e30ba6fmr22119381f8f.24.1793609455017;
        Mon, 02 Nov 2026 00:50:55 -0800 (PST)
Message-ID: <c0415de7-0326-4184-8bf8-d5516f27c90a@suse.com>
Date: Mon, 2 Nov 2026 09:50:53 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/gunzip: free the code-length table on an overlong
 length run
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Roger Pau Monne <roger@xenproject.org>, xen-devel@lists.xenproject.org
References: <20261030194428.1320905-1-stefano.stabellini@amd.com>
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
In-Reply-To: <20261030194428.1320905-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1793609455-4BED2CFC-3260EC79/10/78276251493
X-purgate-type: spam
X-purgate-size: 1024
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 30.10.2026 20:44, Stefano Stabellini wrote:
> inflate_dynamic() builds a decoding table from the code-length code
> lengths of a dynamic block and reads the literal/length and distance
> code lengths through it. A run of repeated or zero lengths that would
> go past the number of codes the block declares makes it refuse the
> block with 1, but that path only frees the list of code lengths: the
> table is left allocated, and nothing else frees it.
> 
> Free the table before returning on each of the three kinds of run. The
> other exits of inflate_dynamic() already free what they built, or are
> taken only after error() has stopped Xen.
> 
> Fixes: e2b1ebf4de50 ("x86: Support booting a bzImage format domain 0 kernel.")
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Fiddling with code inherited from Linux isn't nice, but Linux long moved
to a newer zlib baseline. Perhaps we should follow that, by doing a fresh
import.

Jan

