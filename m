Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C05606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 07:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=No1NM6h5
Received: from list by lists.xenproject.org with outflank-mailman.1462905.1673896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLyIl-0003kD-SP; Wed, 28 Oct 2026 07:42:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462905.1673896; Wed, 28 Oct 2026 07:42:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLyIl-0003k6-Pm; Wed, 28 Oct 2026 07:42:27 +0000
Received: by outflank-mailman (input) for mailman id 1462905;
 Wed, 28 Oct 2026 07:42:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLyIk-0003k0-BG
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 07:42:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLyIj-00BTTw-9H
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 08:42:25 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae1a75a-8faa-0a2a0a5109dd-0a2a450a98d2-20
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 08:42:25 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae1a760-f2d2-0a2a450a0019-d1558031f088-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 08:42:25 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a35d5d4a20so6599965e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 00:42:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a94f05f168sm19545015e9.4.2026.10.28.00.42.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 00:42:24 -0700 (PDT)
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
        d=suse.com; s=google; t=1793173344; x=1793778144; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=huVGI+W8+BLSycLdp3E+/uCIzL8hvWrKPFeZuCWM91M=;
        b=No1NM6h5Dq3azIp1eVrgW/KzEN/p53T8LV4MORg14sgOErnNAJO15Oz2UvyfUx1fLv
         j10sddJHp5ljurHAm5slEh99m0mM/SqDMXgTg+YvGZQAVSrPsIPhOMLdUlyqsRtokAT3
         rQMl8LFcU4AzOGZ9sbG2AW7Qs2Kc4ZyeLGeeawiWg8Dfr9Xp01/H3us05Y5yFuKBpVxk
         CfW4D/qnUlkZcUz4U6KO6EINxrAUS6Lzjf9Gflh162FsAC3BpORXsjmn7HLAshcJPFv+
         ADhEFseH+Z9rWWWgMtxcgKZFwEzNYpnvcO7RnTqfwex1T7plCdwMQzJIH8pBWjupUxeU
         +6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793173344; x=1793778144;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=huVGI+W8+BLSycLdp3E+/uCIzL8hvWrKPFeZuCWM91M=;
        b=hD1lEOAXjpG85a90P6mWB7DpzaAs76NccoT+RxEZkwDZbFlKGYLZ3gHHLRmw0KFKfe
         n8BL5M3i5Zo1cNbl+Jx1Mp7eGWjtywOv3JApqrNwlqbKYoM/NF7ynO+bDd9/BmjjrfmA
         Qmgf5trwdg7C3OiSMxpXoTTxEYh19DadeYtlG6bN/NAqNwj1arBuTYXWv7WbtHs6yUSI
         B/WLDlAA+JHI7B6aPCEFN2+julo52UCBtsIhEf6EgFmwYQExz5HQEqUGcBYdCB80nTjM
         p+yfDxU3avJ36cOTIyQlXni1Glo/n5jr0YMoX/+Txop8fmF+uiV6rBazLI09bpK5+NYM
         zPCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmp/trbAcRYi5k88aT+HbJLc013gWySCRxjJtw42uc2maf/t/YTh/lRqC39aMLX7E33YPBsCjE8YI=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLtfQ5JjPPqdWanyqZBJfGXaz7aBPtwHqxYRGbojX4pOLKn0iW9
	pX91CT8tROwrnrzj6VzuCyhMp8TXh5QIN4+ske7sKw0PPyY9p6D5ms+Qs+dW2jqI6w==
X-Gm-Gg: AYBFou2ntwBVu5ChpYtEHaXbwWLYYvnC8dyhhMqXnkoXiPGjikZNbYV0aWEgcOwxUX2
	6YuEArefNmwl6u3SIcB5US4NNXl3VBCEewbPbw/2niInE1yEvffri8OcWn9iqj/9UGbp6ctxx5L
	q+/uEaijtaxaTOXKWEAQyXGzZjNYCvXB7cVhHa6F5IuRsVL7SQ/2LkOfxUsdcAdNs6DxTC5HRVm
	i9YQmp6bk5jL5g3qUyiKKQmlUuKblz0zPHt7iaZCYu1VG5Oq5iRSuSAAed+tGV7OBiuNhVwCtfX
	6rMQbr6Wk+UIttlDg0M07nm/tIcKQa8ASjp4evdzHq/JOQ1vazbFcULQl3xWuNAR/GhI1Gf+d4z
	Sd6r2zf13PVA34ar+uc282mMgYXYYFsS7qF2IcvDgZDJgg1oOVTTkgkj77O55HvVX7Qr7DAouv/
	MwptBmOgR1n+2yiPIvQQZuTt0YTzsCm9E03zThR4e3RgwWTJII0ql9IH7xqi0Bq+P19IlAybDzM
	dN/cTn1Q5P549eHgaXH9H3TY5cZ2GK4bla6vAFlIG5WtEx5mdY01vN9tmruC3lzrqzZcvpGdVK7
	X+b5TPbAe6GEd/gk84Z5nHtkj3n+i/0IMBg8UYo9klMf81V/9M+iU7STwBug1DATuRLwfa1HVBu
	+a5oQN5DeGOkzMU3TOg==
X-Received: by 2002:a05:600c:6089:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4a967ca24ecmr27060255e9.32.1793173344477;
        Wed, 28 Oct 2026 00:42:24 -0700 (PDT)
Message-ID: <0af0a00b-4f9a-4584-ac5b-554ae00e692e@suse.com>
Date: Wed, 28 Oct 2026 08:42:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/typesafe: don't brace-initialize a scalar
 TYPE_SAFE value
To: Shuaidong Chen <shuaidong.chen@amd.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 Penny Zheng <penny.zheng@amd.com>, Ray Huang <Ray.Huang@amd.com>,
 xen-devel@lists.xenproject.org
References: <20261028050336.2549325-1-shuaidong.chen@amd.com>
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
In-Reply-To: <20261028050336.2549325-1-shuaidong.chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1793173345-4B8D5CFC-CD2DBD63/10/78276251493
X-purgate-type: spam
X-purgate-size: 2328
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 28.10.2026 06:03, Shuaidong Chen wrote:
> TYPE_SAFE() degrades to a plain typedef in non-debug builds (NDEBUG), so
> mfn_t is then `unsigned long' rather than a one-member struct.
> INVALID_MFN_INITIALIZER and INVALID_GFN_INITIALIZER, however, always
> expand to `{ ... }', which leaves
> 
>     mfn_t first_valid_mfn = { ~0UL };
> 
> initializing a scalar from a braced list.  That is valid C, but MISRA
> C:2012 Rule 9.2 (required) - "The initializer for an aggregate or union
> shall be enclosed in braces" - is reported against it, twice in the
> x86_64 build: common/page_alloc.c and arch/x86/efi/runtime.h.
Wait - the rule says the opposite; it says nothing about initializers of
scalars. The rule is clean in all analysis jobs we do. On staging we only
ever have debug builds analyzed, but on release branches *-allcode have
DEBUG=n. No 9.2 violation shows up there. You also don't point at Eclair
output supporting your claim, so I wonder what is going on here.

Further, "That is valid C" contradicts ...

> --- a/xen/include/xen/typesafe.h
> +++ b/xen/include/xen/typesafe.h
> @@ -9,12 +9,17 @@
>   *  * _$FOO()  which boxes a $TYPE as a $FOO_t
>   *  * $FOO_x() which unboxes a $FOO_t to $TYPE
>   *
> + * TYPE_SAFE_INIT($VAL) spells a constant initializer for a $FOO_t, for use
> + * where _$FOO() cannot be (an object of static storage duration).
> + *
>   * This makes a $FOO_t and a $BAR_t incompatible even when the box the same
>   * $TYPE.
>   *
>   * It does have some performance cost because the types now have a different
>   * storage attribute, so type safety is only enforced in a debug build.
> - * Non-debug builds degrade to a simple typedef and noops for the functions.
> + * Non-debug builds degrade to a simple typedef and noops for the functions,
> + * and with it TYPE_SAFE_INIT() loses its braces: a scalar must not be
> + * brace-initialized.
>   */

... the new wording used here.

Also, in the earlier insertion above, isn't there "used" missing? Possibly, to
avoid the double use of "use", with the earlier "use" replaced by "cases"? Yet
maybe this is legal grammar anyway, and it merely feels odd to me as a non-
native speaker. A native speaker may want consulting.

I also wonder why you CC-ed Roger with his old Citrix address.

Jan

