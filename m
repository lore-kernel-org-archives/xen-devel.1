Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDE2606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 13:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eJ9LL4lI
Received: from list by lists.xenproject.org with outflank-mailman.1461336.1672328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLKWr-0001aH-RJ; Mon, 26 Oct 2026 13:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461336.1672328; Mon, 26 Oct 2026 13:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLKWr-0001aA-Og; Mon, 26 Oct 2026 13:14:21 +0000
Received: by outflank-mailman (input) for mailman id 1461336;
 Mon, 26 Oct 2026 13:14:21 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLKWr-0001Zr-3m
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 13:14:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLKWq-000nYu-9S
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 14:14:20 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf521e-bab6-0a2a0a5309dd-0a2a45088566-38
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 14:14:20 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf522c-f659-0a2a45080019-d1558033c8db-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 14:14:20 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4956869750eso19732015e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 06:14:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a04ad39sm515439785e9.1.2026.10.26.06.14.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 06:14:19 -0700 (PDT)
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
        d=suse.com; s=google; t=1793020460; x=1793625260; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/nk6Dsi0r/4StCZS3toktvBtDFUiooqfEfEnNAIbM2s=;
        b=eJ9LL4lIWMac94G8dnwJxvQ6aRCGz+j5cJ/hNZuxG6Do9PyMKYJiDh+4gcxu6QF2hy
         xGT6Vaq0XBC5mU+bG7j6BYKGPu17LrE4j0D108d9pKyemejElwXMZGwvYtu4zs0JvVoX
         USfHe6I2tkYJ/poBYJQw7fcjQpy/xN46a7x2GpZsK2AmDBD+9NWjBdpyiuHf4X4oBf/U
         Klj5iSIt6m2EgsyqJeWz6LOsSk1dgjNhH23EStP3eifEdASRGe7zxG5L8bG1EvD6iHAw
         1rahWHJ164fUgDlUPzwmYVVPQjElZBrRWnzPrUjgsxUHt+QqVnxEGjYQnr/OiMTMVMUV
         PXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020460; x=1793625260;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/nk6Dsi0r/4StCZS3toktvBtDFUiooqfEfEnNAIbM2s=;
        b=YFtzeMPiHrSEj8YPMB/U/X/9VSnKINHi7M4gPE4deGfhFXzzm489UryzpvGTlUtbOg
         i2oBaKs85viRHPxnjGLfYfWprkwjBCsmy/+LpiqQrZUxcVY8kD6mloyE05bl8CyFZA5e
         sVALG0xdRpefUwAWLiVl280f5DPghzI9UOeR8bI0eWfz0y6oii1hZjLpnLUHLw7dW4cJ
         FCBLH9ahiBzvU8mNvVRMKy1LP/MAii7OMci7RILtnw+CTbw82QViW0jTDaRfiUmmR/mG
         6DcmR4gqbqGAXMozbQoXzSONL6EWq/Af/E5KnpMVncmdMS9CPm+TFO8xHCwYPTGU2zoW
         fy3g==
X-Forwarded-Encrypted: i=1; AKwUvBxa+m+5FOlGZiT5LSxn7dICcwQk0/wX5PRvbVqZ2Vh6X8j/iI6U7S20Cjp/cbWQVWNthvo+9dx6bNU=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLMTx45OREgvLgk/BzaDRM5xwYeesPuqFVGgP87+nULNGKwhErY
	E39E0GlDch9gmL+p1FpnSdyA2DWnsYmDKBUlRaH7zLB2qsopRvPLb4j0Tmw057GXmQ==
X-Gm-Gg: AYBFou0pQ1TIS2zB3cjV/sMOPemd2cJiTI9LnOY0+LDiXrknba4wWZYBs9iXxQ4EyM3
	kRZE/2KKRFAC4IRwOWwDUzlermt27Jw96wS8S9pNN4exEvUBv+PTFyZKVsj7WWMEIQlWMPQ8Ed9
	/ZET9GydedqgG1izAZm6nqGkq8F9Ez3Atw6AbvF+T5KccJvqlVeQrQae4lmNqeGVT8APn7AZXIC
	2f3UCLM+kLX8rEwJnhMyfwZAa0cLPJgdE76q3Zu7qWmadalUfekUCgWFPj1CLNQdjrhEaGlkpuf
	8Hwnk3TvEuZ+XCNf8DeOCb/GuHJjSbjQkZ6lQ0PjTQUy+Q/6svxOeqsTBSyfaJnop2Wn5akLqhz
	Cy5v3cLjv/cRmwCOreVlv4nE2X5jAITu5Xdme+FtTTt8CTnZKo5TpbD5mT7Sto8g7BPZd8tk27g
	IfNMulkX+XQD9CCHrB3P8egeUn7UGljnZQCDN168Duw5qXEd7yJGwYldxfklPc+exLXW/jKTvg8
	zCmG0bexhmrrmVmkrDtWRBHBzUVHvL7OQDOW3YIaBO0CZ5FCAaTt6YSXMrqTfWX7jYLMQcAD1z8
	QSv6gfzKX35KzC3OdJPf3jLWZAc+w1TzXaFxlbW6aGs=
X-Received: by 2002:a05:600c:1c2a:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4a35ac3a7d9mr160303825e9.4.1793020459649;
        Mon, 26 Oct 2026 06:14:19 -0700 (PDT)
Message-ID: <67e298cd-3b84-4476-9dd3-607e505effe6@suse.com>
Date: Mon, 26 Oct 2026 14:14:18 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] misra: merge the two R14.3 invariant-condition
 deviations
To: Shuaidong Chen <shuaidong.chen@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 Penny Zheng <penny.zheng@amd.com>, Ray Huang <Ray.Huang@amd.com>,
 xen-devel@lists.xenproject.org
References: <20261026030309.2507461-1-shuaidong.chen@amd.com>
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
In-Reply-To: <20261026030309.2507461-1-shuaidong.chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1793020460-CE14687B-07ABDAF3/10/78276251493
X-purgate-type: spam
X-purgate-size: 1719
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26.10.2026 04:03, Shuaidong Chen wrote:
> MC3A2.R14.3 ("Controlling expressions shall not be invariant") is
> deviated by two separate entries.  One covers 'if' statements and
> conditional operators and places no restriction on where the invariant
> condition comes from.  The other covers 'switch' statements, but only
> when the controlling expression is a 'sizeof' operator.
> 
> The rationale recorded for the two is the same: the condition is
> deliberate.  Nothing about a 'switch' makes an invariant condition less
> deliberate than the same condition in an 'if', so the 'sizeof'
> restriction reads as an artefact of that entry having been added for
> read_atomic() and friends in arch/x86/include/asm/atomic.h rather than
> as a considered limit.

Well,

    if ( 1 )

can make sense, especially when 1 is the expansion of e.g. IS_ENABLED().
Otoh

    switch ( 1 )

doesn't make a lot of sense, even when it's as a result of the expanding
IS_ENABLED(). I agree that limiting to just sizeof() is unnecessarily
strict; alignof(), for example, should about always be usable where
sizeof() is. Yet making if() and switch() equal is imo going too far. I
realize though that it may be difficult to find a suitable boundary.
Stefano - do you possibly still have notes from the discussions long ago?

> Fold switch_stmt into the general entry and drop the 'sizeof'-restricted
> one, which the general predicate now subsumes.  Invariant 'switch'
> conditions that are not a 'sizeof' become deliberate as a result; that
> is the intent.
> 
> Signed-off-by: Shuaidong Chen <shuaidong.chen@amd.com>

What you don't say at all: Does this help with any remaining violations?

Jan

