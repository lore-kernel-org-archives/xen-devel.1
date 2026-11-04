Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FC0606A33A
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 14:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=g24MCQv3
Received: from list by lists.xenproject.org with outflank-mailman.1472040.1680101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOcJF-00059v-SI; Wed, 04 Nov 2026 14:49:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472040.1680101; Wed, 04 Nov 2026 14:49:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOcJF-00059n-Os; Wed, 04 Nov 2026 14:49:53 +0000
Received: by outflank-mailman (input) for mailman id 1472040;
 Wed, 04 Nov 2026 14:49:52 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOcJE-00059h-Ba
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 14:49:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOcJD-00B7bQ-OH
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 15:49:51 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aeb460f-2eae-0a2a0a5409dd-0a2a4507c5de-2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 15:49:51 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aeb460f-b4ea-0a2a45070019-d155dd31d4cf-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 15:49:51 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-48e00eee27dso453556f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 06:49:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b43cff3b14sm57617735e9.10.2026.11.04.06.49.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 06:49:50 -0800 (PST)
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
        d=suse.com; s=google; t=1793803791; x=1794408591; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4YSul6A+Yvf0xViQCRiwP4iZhdP7bYxM5Sccp0+2ABg=;
        b=g24MCQv3fxFvnPgdXKobFVadQXkPJ2cvt2atnx8uyYDnOoqaSeJcbH9GWqDWb9s1Uo
         lRw0KESw+4VOQomufLaBdpl05uS9Yli99xXa/yCUzkdd6oMjzaXqayRtmCRGqTxmvsdM
         vOfdsj+mkdgap7S1vdslwMgfkdcfrGtgex2qNJv8PNLUAeW0KBtCvvlZ1FoRnw1rTZBw
         V3ZxsUlwM6Z27y4i+ImFBmaI2iMQ/6MrAwD8/Kr/LiQxF7iEn9pfWdamG8W9JB0aYLF5
         MieKmfQrkyCKZbp1p1ozWbn0TOUtlS17JOpU7J/6vtY+gDsmudxbdvaGpa1fMHPXbt1w
         E5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793803791; x=1794408591;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4YSul6A+Yvf0xViQCRiwP4iZhdP7bYxM5Sccp0+2ABg=;
        b=x5B5SD1zcJiblroPKrJhZPt823bVHLm+l3es4UmOJPR8RMJhPfvul+qxGDFUQOL+mR
         LeytlC3lVTzfbbM7BEbWv4g7cmhg/4P2u0VvZVWVtBK3PRmT1fXISq2hiWqitIjPB0+N
         /io+aGxNUC6JIwmyUo4u6V4EREBikoZaMy/0q6Bdx6KBrAOcPiXE5SMBEu3qgUQxTXyO
         ZPvh0uzfmTfrDMvmgbFKo0QFlvuON5oQG3ukKAFxy/m3TOhTWS4qZrwCAWoBxGoiO1nt
         xPFjgg34tP0Yuz6YxBQKaV4iFxKgy5M8f4HwprsqfSFAyljIPK8C579ElkPUo3CSPCw8
         Nwnw==
X-Forwarded-Encrypted: i=1; AKwUvBwV6CzUEne5kdDqA9O0KBhWPFD5QT3okfLhudZJT2etscM2vMkEIaRR/xnK2jJ9t0eyraJA+pbI33g=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9Ayiti43KXcpNmEv/cqUeQZCO5DrALRZung9CfIGktOi9CNtmJ
	QhjcK6DOj+AOrWZVd/6JMTOiVSVdTkmFYbHClvB6DEP5CZJBiFfTmfds5OF6UvS3WQ==
X-Gm-Gg: AYBFou2c3B4qjPRMnb0RMZvNunsUGn2mPJzCn6aCG1Tb04w6jHvIbNB2MVRyTujGJT5
	TacoEZBvpw3Kwc/v+hh1kUg2qhZHM5hy6SBA+jas9VMN4C8d8EwMZL9RWnCL5zCCPAU/EhgQsx8
	/MpiW46mRkro7o3fflp4HjWWx2QUUaFtIP8PJMWS8hwP24NhfIoVxmdwWKBmLWT4JzgyENfE8B+
	0YlI8qJNg2LrrifxxZ4meK/6YdV6m8FnNIZ9LbJGficC3r0OdLYpI/ww8aVLfhmO5w4dshNXPJ+
	WAaphsKuxq3rOmLvH5j1g9A37iskxvWtcBQnHo3kT4o7L02hI/DXkcJRw/KyZP8uo/CC4TOi6sF
	rsgNj/2P+A/DSmoWTL2psk/UdMsRqkWmf4dfeDmvZufKJcv84r1BMhtGXbM34mbLL9+iR127UIF
	ZsOE8Vjd2NJqvlD+C5lbQkykhm6NwWhH7nNftaqbCTq5cRlC6fZJ3Ob5/FQMMkZOL95HaxCAtLS
	ZrRB82Dwel0Vzg4BXFC93YTc56jSvEyt+T0OWdJQFwMtNHYdRe9BuWerS1EzHjJCBv/tQh7y7w4
	f/FtcaTF3mSpyUQ5CpSJ+ojYc8y0LbOR4WRhyHKdvWBMe8/A4NLYSzea1IohnWwip52ltCv6yw2
	7nx7eW6rNN2Rti/I=
X-Received: by 2002:a05:600c:4714:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4ac180f1c7amr369418085e9.12.1793803790980;
        Wed, 04 Nov 2026 06:49:50 -0800 (PST)
Message-ID: <9f55c251-af36-41e0-8afe-cb218d41f6cc@suse.com>
Date: Wed, 4 Nov 2026 15:49:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/build-id: Introduce is_gnu_build_id()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261104135133.2209628-1-andrew.cooper3@citrix.com>
 <20261104135133.2209628-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20261104135133.2209628-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1793803791-35CC7AE4-89336EF3/10/78276251493
X-purgate-type: spam
X-purgate-size: 2138
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 04.11.2026 14:51, Andrew Cooper wrote:
> Broken out of the subsequent change for legibility reasons.  It will be used
> to replace xen_build_id_check().
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Ross Lagerwall <ross.lagerwall@citrix.com>
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger@xenproject.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> ---
>  xen/common/version.c         | 33 +++++++++++++++++++++++++++++++++
>  xen/include/xen/elfstructs.h |  2 ++
>  xen/include/xen/version.h    |  2 ++
>  3 files changed, 37 insertions(+)
> 
> diff --git a/xen/common/version.c b/xen/common/version.c
> index 80e7a9b981cf..7eb8a0221d82 100644
> --- a/xen/common/version.c
> +++ b/xen/common/version.c
> @@ -114,6 +114,37 @@ void print_version(void)
>  /* Defined in linker script. */
>  extern const Elf_Note __note_gnu_build_id_start[], __note_gnu_build_id_end[];
>  
> +/*
> + * Check whether @n is a GNU Build ID note.
> + *
> + * We check that:
> + *  - type is NT_GNU_BUILD_ID
> + *  - name is GNU\0
> + *  - desc is non-empty and exactly covering the rest of the buffer
> + *
> + * If this returns true, the contents starts at n + NT_GNU_HDR_SIZE.
> + */
> +bool is_gnu_build_id(const Elf_Note *n, unsigned int len)
> +{
> +    const char *name;
> +
> +    if ( len <= NT_GNU_HDR_SIZE )
> +        return false;
> +
> +    if ( n->type != NT_GNU_BUILD_ID ||
> +         n->namesz != 4 )
> +        return false;
> +
> +    name = ELFNOTE_NAME(n);
> +    if ( strncmp(name, "GNU", 4) != 0 )
> +        return false;
> +
> +    if ( len != n->descsz + NT_GNU_HDR_SIZE )
> +        return false;

Isn't this too strict a check? Build-IDs can, iirc, take different formats
(yes, this is under our control, but still), and I don't think there's a
guarantee that all current and future ones are coming without any padding.
IOW I think len wants comparing against the rounded up sum.

Jan

