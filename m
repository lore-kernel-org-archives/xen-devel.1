Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2948606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 10:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=X5iByLTn
Received: from list by lists.xenproject.org with outflank-mailman.1461060.1672001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLHon-0003qK-7Z; Mon, 26 Oct 2026 10:20:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461060.1672001; Mon, 26 Oct 2026 10:20:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLHon-0003qD-4i; Mon, 26 Oct 2026 10:20:41 +0000
Received: by outflank-mailman (input) for mailman id 1461060;
 Mon, 26 Oct 2026 10:20:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLHol-0003q7-Iq
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 10:20:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLHok-003yqv-QS
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 11:20:38 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf296f-e002-0a2a0a5209dd-0a2a450a8378-14
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 11:20:38 +0100
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf2973-f2d2-0a2a450a0019-d155dd2cf031-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 11:20:35 +0100
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-48e04773687so838556f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 03:20:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ecdfd8dsm14757039f8f.56.2026.10.26.03.20.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 03:20:34 -0700 (PDT)
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
        d=suse.com; s=google; t=1793010034; x=1793614834; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=npRG4y4emhj6KoE99osvHlRJ2HugQIzycJNLMCGEoAk=;
        b=X5iByLTngZgrP6dY57bpyP8ULiIp8bHBLp6BVmmSHny3nC+Tic2P+OJatAoLs7PC2X
         Oeh1v3+V0f9KlGYYKDPG1c+QZ0yzFv5D653BZPzi3fqKr3eSN+4vwJUwePvT7ULtZd3g
         CxxXUfvwnAb+jgsVd+avJkBjuNzwotoao3crDu8+xAj6QvU4LGkvZBDpoeI6mEHa7MpK
         Qi2SD/9r6ST3xgy1JzjXAm9qTcPSStJx1V+4gz7rm04JWf+IXvk1S3395/HEi4xzoDfR
         iX5H8VmY1le+c3hQMb5yqzk9l6hMAu6G5uG7u53vDhKAnMagbjmk/JWpKpLKQ0V1oDqe
         piPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010034; x=1793614834;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=npRG4y4emhj6KoE99osvHlRJ2HugQIzycJNLMCGEoAk=;
        b=mWdX6lZgG6Z8G+1+eG1zqFn7vkbwvBxgXl403WCGzqoribNyxriIoybfsVWxOFio97
         dzSPLMAhjuTeqzlGV2G3dnU2Q0DFBqqRPtQ4m3fn6NbgMzup9+9cLHRI47X0C+lK6RyZ
         4WPWgM+s6XIdiWvWSpC7wdXEZZFNBJffUGxw1+xjDT++tCSBdThJ3zKOD/VrNG6kyP2j
         tJ3uKKr+i8y1kwQ41GhIGJOeMfSACgvnkswgmSabM6bIGEldED/JTxvTljKSFYy0o/gp
         atSjhYc6Kk0uUmUcXPtG0AulYpEO8RWLgPBBVsrADqQycbJdGotV7TrbJ+ZMneW7zVch
         5HPw==
X-Forwarded-Encrypted: i=1; AKwUvBwXB2YftJY/d1NzP85Iab2YIMj4QDrg0/zmnJzw9DXctDRzUWep3WtEX8bnIyM9HGqe3TiFVyw/iHo=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKqwPIpIDIxKBSqDbD8mxMbEJZNcU8Wn3AawcP2wR9H4e6T47qY
	1mVO2nfW9Xqt5gQHYveQGiyjYGlbpObASJ9hjXhO3De0oaJkI/Vq2x0cn6pOWI3ePg==
X-Gm-Gg: AYBFou0lRIuKFV6F8MyXMJwkadNqqu/1EQSgxl5xlfuZL2YbKrTLT4U0fY9FO6ofZvc
	9VI31IPf7z5PUZaoaiIlKpXU4LL4fT37Z+AF4OP1h3+tkI0sLM8aar3ZyD8QDssS93mzWeaJhk+
	IlQCA9ocGblnC/ne+GgVOdSQ4581cpsm5mlWxRbmkxz7XUwbfGV5Q0GLSTjmTV14rzlNrlN0ps6
	60cvj9cBOBV/Dn996wFM0GF2hC5EaMUoMhYNxfMlGDmkHaEB/q/l4eYwc61jnJIPgrwSDWk7iDt
	7ygu5fSp7EsUD6O4mg3Kc348Z0aUZnq4EeJQ3UEzB1OdQJHSvvxbNvx74hMBXxYj6zHDngaSCJx
	YZtMB5kXXOurnvEfzCeprTpTqN7vep2ftOFNzyfnlH2FZl0b4aDSnotGMXjEie+a0jGjZXNjkcF
	DFsTwhtKoUBXXto2kkY/xukjejhceSK4vAiT806QMPhUYFYonqYl3J8YddIoLhhfIZqhNU09QOJ
	zaxHmpj3D1P0O9LZvg9lXQK33gpwXoR2DpC3GQXGeZ4q2y4/IGkwnq4ivjRcx5JVcgoN+1AKomm
	tpJRAl7vGSq4lLzCncZ4hpo64GgOmi5mGBymAORn+7f/
X-Received: by 2002:a05:600c:8b62:b0:4a2:150f:1610 with SMTP id 5b1f17b1804b1-4a35acd5f91mr100881745e9.23.1793010034559;
        Mon, 26 Oct 2026 03:20:34 -0700 (PDT)
Message-ID: <572b2fb5-1cee-442f-a81f-9a667adb5c4b@suse.com>
Date: Mon, 26 Oct 2026 11:20:33 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/nSVM: Ignore bits 11:0 of L1's MSRPM base address
To: Stephen Cheng <stephen.cheng@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20261026023821.301182-1-stephen.cheng@citrix.com>
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
In-Reply-To: <20261026023821.301182-1-stephen.cheng@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1793010035-538D5CFC-1CA41B4C/10/78276251493
X-purgate-type: spam
X-purgate-size: 383
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26.10.2026 03:38, Stephen Cheng wrote:
> VMRUN ignores bits 11:0 of MSRPM_BASE_PA (APM volume 2, 24593 Rev. 3.44,
> section 15.11),

As before - section titles please alongside (or in place or) section numbers.
I'm looking at 3.45, and it is mere luck that section numbers didn't change
there. Then, on top of Ross'es R-b:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

